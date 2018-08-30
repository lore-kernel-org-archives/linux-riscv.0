From: anup@brainfault.org (Anup Patel)
Date: Thu, 30 Aug 2018 09:53:50 -0400
Subject: [PATCH v2 0/3] RISC-V: Add new smp features
In-Reply-To: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
Message-ID: <CAAhSdy0=ROMqkbgqcKLSdM11TBOeD65GR42s0j_HOYd+y-=jmg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 28, 2018 at 4:36 AM, Atish Patra <atish.patra@wdc.com> wrote:
> This patch series implements following smp related features.
> Some of the work has been inspired from ARM64.
>
> 1. Decouple linux logical cpu ids from hardware cpu id
> 2. Support cpu hotplug.
>
> Tested on QEMU & HighFive Unleashed board with/without SMP enabled.
>
> v1->v2:
>
> 1. Dropped cpu_ops patch.
> 2. Moved back IRQ cause definiations to irq.h
> 3. Keep boot cpu hart id and assign zero as the cpu id for boot cpu.
> 4. Renamed cpu id and hart id correctly.
>
> Atish Patra (3):
>   RISC-V: Add logical CPU indexing for RISC-V
>   RISC-V: Use Linux logical cpu number instead of hartid
>   RISC-V: Support cpu hotplug.
>

This series looks good to me.

FWIW,
Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
