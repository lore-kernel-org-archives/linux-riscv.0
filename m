From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 13 Jun 2018 08:47:00 +0200
Subject: On Supporting no-FPU machines
In-Reply-To: <20180613063217.GA12182@infradead.org>
References: <20180613062653.GA14518@andestech.com>
 <20180613063217.GA12182@infradead.org>
Message-ID: <CAK8P3a1bC1PgkV6n=HkSB7EnbEWGZYUo8CsDWtUh-xoLWg+rpA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jun 13, 2018 at 8:32 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Jun 13, 2018 at 02:26:53PM +0800, Alan Kao wrote:
>> A quick work-around is something like this:
>
> I think we need to detect this at run time, to support a single
> kernel image on systems with or without FPU.

Right.

>> in fstate_restore will never be taken.
>> Actually, we don't even need those floating-point routines for no-FPU boards.
>> We would need a larger patch to make those FP code inside some __riscv_flen
>> pre-processor sections.
>
> A separate CONFIG_FPU to not build the FPU code sounds fine to me
> as long as it defaults to on.

If we do this, that option must also take care to disable the FPU hardware
if it exists. Otherwise you might run into the situation of having a system
intended to run without FPU access but a task uses FPU registers anyway
(e.g. because the compiler decides it is faster that way on the
microarchitecture it is optimizing for) and we fail to save/restore the FPU
state between task switches.

        Arnd
