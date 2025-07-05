import countAnimals from '../services/countAnimals.js';

export async function getAllAnimals(_req, res) {
  try {
    const result = await countAnimals();
    res.json(result);
  } catch (error) {
    console.error('Erro ao buscar todos os animais:', error);
    res.status(500).json({ error: 'Erro interno do servidor' });
  }
}

export async function getAnimalCount(req, res) {
  const { specie } = req.query;

  if (!specie) {
    return res.status(400).json({ error: 'specie is required' });
  }

  try {
    const result = await countAnimals({ specie });
    res.json({ [specie]: result });
  } catch (error) {
    console.error(`Erro ao contar animais da espécie ${specie}:`, error);
    res.status(500).json({ error: 'Erro interno do servidor' });
  }
}
