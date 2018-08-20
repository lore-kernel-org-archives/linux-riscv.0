From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 14:16:47 -0700 (PDT)
Subject: [PATCH 4/4] irq-riscv-plic: Update function name
In-Reply-To: <CAKmqyKPApyiQ=okc69eD4dG5PZzyW84540cduCPpGzqvWZupzA@mail.gmail.com>
Message-ID: <mhng-845b6ab2-ebd5-4395-9095-b45b75deb335@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 06 Aug 2018 16:30:43 PDT (-0700), alistair23 at gmail.com wrote:
> On Mon, Aug 6, 2018 at 3:10 PM, Alistair Francis
> <alistair.francis@wdc.com> wrote:
>> Update the function riscv_of_processor_hart() name to the new
>> riscv_of_processor_hartid() name.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> I am a little confused with how all these forks and branches work.
> This series is meant for this branch:
> https://github.com/riscv/riscv-linux/tree/riscv-all
>
> I'll also submit a GitHub PR.

These were all on a WIP branch, which means it might not work.  I've updated 
the branch but I'm not 100% ready to send it out, thanks for the fixes though!
