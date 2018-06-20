From: palmer@dabbelt.com (Palmer Dabbelt)
Date: Wed, 20 Jun 2018 10:59:59 -0700 (PDT)
Subject: an initial RISC-V Linux 4.18 tree
In-Reply-To: <20180619171444.GA10395@infradead.org>
Message-ID: <mhng-5d12a1e7-6a25-4918-b086-41adda73d00b@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 19 Jun 2018 10:14:44 PDT (-0700), Christoph Hellwig wrote:
> Hi all,
>
> there had been some requests for a more updated working RISC-V
> tree.  Based on that I decided that instead of a private working
> tree for 4.18 I'd start a public tree:
>
>     git://git.infradead.org/users/hch/riscv.git riscv-linux-4.18
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-linux-4.18
>
> For now this just contains core patches, that is whatever I want/need
> on Qemu, or what looks like it.  I've also done all the usual cleanups
> to get the code submission ready, the only exception is the
> documentation of the PLIC register map as pointed out by Jonathan last
> time around - I'll need someone more familiar with the hardware and
> driver to fix that up.
>
> Except for that the patches should be good to be submitted, I can
> help a bit with that, but in general having the original authors submit
> it would be preferred.
>
> The tree is going to get rebased as needed.

Thanks.  Unfortunately I think some of these aren't actually ready to go, which 
is why they've been blocked for a bit:

* d0789843f663 (irqchip: RISC-V Local Interrupt Controller Driver): This still 
  calls riscv_*_interrupt(), which we need to refactor to live behind a more 
  generic interface.
* 8f9146865931 ("irqchip: New RISC-V PLIC Driver"): Aside from the memory map 
  questions you mentioned, there's also some question as to what IRQ handling 
  flow we should use and how to properly register interrupts for harts that are 
  not yet alive.
* 5b6b2ec0ed9c ("clocksource: new RISC-V SBI timer driver"): This still uses 
  riscv_timebase, which isn't a sane interface.
* 3aa32277ef89 ("base: fix order of OF initialization"): IIRC this was supposed 
  to be solved in some other way, but I've managed to forget exactly what the 
  comments were.

It's possible I'm too worried about decoupling the drivers from the arch code.  
If that's the case then I don't mind submitting these patches now, as at least 
we'll be able to have everything in master.
