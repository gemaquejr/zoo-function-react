import express from 'express';
import cors from 'cors';
import animalRoutes from './src/routes/animalRoutes.js';

const app = express();

app.use(cors());
app.use(express.json());

app.use('/animals', animalRoutes);

export default app;
