From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 10 Jul 2018 11:20:28 -0700
Subject: [RFC] Hypervisor extension emulation in QEMU or Spike
In-Reply-To: <CAAhSdy3yMZWNWsX8+PaYWU0CCYkJdKv-b0Re6X4yanAnJBZeag@mail.gmail.com>
References: <CAAhSdy3yMZWNWsX8+PaYWU0CCYkJdKv-b0Re6X4yanAnJBZeag@mail.gmail.com>
Message-ID: <20180710182028.GA1721@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Jul 09, 2018 at 12:04:29PM +0530, Anup Patel wrote:
> At this point, we have managed to get Xvisor booting on QEMU but we
> now need an emulator (QEMU/Spike) which can emulate hypervisor
> extensions.
> 
> Is there any work-in-progress implementation of QEMU/Spike with RISC-V
> hypervisor extensions?

The hypervisor extensions aren't even fully speced yet, for example
all the numerical CSR values are still missing.

But implementing the extensions in qemu should be fairly trivial,
with a prototype not taking more than a few weeks.
