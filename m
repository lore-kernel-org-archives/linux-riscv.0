From: anup@brainfault.org (Anup Patel)
Date: Mon, 2 Jul 2018 17:42:01 +0530
Subject: [RFC] Cache flush via SBI
Message-ID: <CAAhSdy3=k52BYjiC+2S0RHk-hnPQXP0da-04aL-tb_O_XuvUEg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi All,

I have gone through various discussions around cache flush/invalidate
operation not being part of RISC-V spec. Although, CPU designers can
still provide these operations in an implementation specific way.
Right?

My suggestion is to have SBI calls for cache flush/invalidate so that
platform specific firmware can
provide cache flush/invalidate in a more generic way. Thoughts??

I have one important use-case of why cache flush will be required for
virtualization (based on my previous experience in ARM
virtualization). The Guest/VM RAM will be mapped as normal (i.e.
cacheable memory) by QEMU+KVM but Guest OS will start with MMU
disabled. To ensure that Guest images loaded by QEMU are visible to
Guest at boot-time, the KVM kernel module will have to do cache flush.

Regards,
Anup
