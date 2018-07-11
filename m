From: anup@brainfault.org (Anup Patel)
Date: Wed, 11 Jul 2018 14:37:04 +0530
Subject: [RFC] Hypervisor extension emulation in QEMU or Spike
In-Reply-To: <20180710182028.GA1721@infradead.org>
References: <CAAhSdy3yMZWNWsX8+PaYWU0CCYkJdKv-b0Re6X4yanAnJBZeag@mail.gmail.com>
 <20180710182028.GA1721@infradead.org>
Message-ID: <CAAhSdy1vkAF+UybLW3sWuknhzD-HhK_KFig0Prz4ffi8me8E-w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Jul 10, 2018 at 11:50 PM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Jul 09, 2018 at 12:04:29PM +0530, Anup Patel wrote:
>> At this point, we have managed to get Xvisor booting on QEMU but we
>> now need an emulator (QEMU/Spike) which can emulate hypervisor
>> extensions.
>>
>> Is there any work-in-progress implementation of QEMU/Spike with RISC-V
>> hypervisor extensions?
>
> The hypervisor extensions aren't even fully speced yet, for example
> all the numerical CSR values are still missing.
>
> But implementing the extensions in qemu should be fairly trivial,
> with a prototype not taking more than a few weeks.

Thanks, for now we will wait for hypervisor extension spec to be
released. Meanwhile, we try to be code ready until QEMU with
hypervisor extension is available.

Regards,
Anup
