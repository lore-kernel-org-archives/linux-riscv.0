From: hch@infradead.org (hch at infradead.org)
Date: Thu, 5 Jul 2018 15:22:11 -0700
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <f75795ac-9f13-83b1-b67d-248155e94bb6@arm.com>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
 <1530295283-191270-3-git-send-email-atish.patra@wdc.com>
 <56682a4c-c83f-c10b-0979-330f92cb3ccf@arm.com>
 <028fb362-0f4e-25b5-b707-7cc3653cbc05@wdc.com>
 <5c65bc1b-a64c-e93c-84e6-5a576617f64f@arm.com>
 <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
 <3ed55348-214c-e50b-f6b0-b425aa3e4706@arm.com>
 <20180705154235.GA31766@infradead.org>
 <f75795ac-9f13-83b1-b67d-248155e94bb6@arm.com>
Message-ID: <20180705222211.GA24936@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jul 05, 2018 at 04:58:59PM +0100, Marc Zyngier wrote:
> Then this is no different from what we have on ARM with GICv1/v2, where
> private interrupts are strictly private, and cannot be accessed from
> another CPU.

Ok.

> > I'm not an irqchip expert, but sometimes I really wonder if the irqchip
> > framework really is the right abstraction for this.
> Well, it served us pretty well so far. Seems like RISC-V has decided to
> describe the HW in a subtly (and maybe pointlessly?) different way,
> rather than reusing the existing abstraction. It is not necessarily bad,
> but it just makes things more difficult.

As said I'm no expert by any means.  The use for the plic controller
looks fine to me, but writing a driver around a few instructions to
manage a tiny amount of per-core interrupt state just looks like
overkill to me.
