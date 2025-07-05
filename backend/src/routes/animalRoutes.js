import express from 'express';
import { getAllAnimals, getAnimalCount } from '../controllers/animalController.js';

const router = express.Router();

router.get('/', getAllAnimals);
router.get('/count', getAnimalCount);

export default router;
