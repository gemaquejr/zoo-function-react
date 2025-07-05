import connection from '../database/connection.js';

export default async function countAnimals(animal) {
  if (!animal) {
    const [species] = await connection.query('SELECT id, name FROM species');
    const result = {};

    for (const specie of species) {
      const [rows] = await connection.query(
        'SELECT COUNT(*) as count FROM residents WHERE species_id = ?',
        [specie.id]
      );
      result[specie.name] = rows[0].count;
    }

    return result;
  }

  const [rows] = await connection.query(
    'SELECT id FROM species WHERE name = ?',
    [animal.specie]
  );

  if (!rows.length) return 0;

  const speciesId = rows[0].id;

  if (!animal.sex) {
    const [residents] = await connection.query(
      'SELECT COUNT(*) as count FROM residents WHERE species_id = ?',
      [speciesId]
    );
    return residents[0].count;
  }

  const [residents] = await connection.query(
    'SELECT COUNT(*) as count FROM residents WHERE species_id = ? AND sex = ?',
    [speciesId, animal.sex]
  );

  return residents[0].count;
}
