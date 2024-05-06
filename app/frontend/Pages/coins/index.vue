<template>
  <v-container>
    <p> Coins page </p>
    <v-row>
      <v-col v-for="coin in props.coins" :key="coin.id">
        <v-card>
          <v-card-title>{{ coin.name }}</v-card-title>
          <v-card-text>{{ coin.weight }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup>
  console.log('Hello from the coins page');
  import { defineProps } from 'vue';

  const props = defineProps({
    coins: {
      type: Array,
      required: true
    }
  });

  console.log('Coins prop:', props.coins);
</script>
