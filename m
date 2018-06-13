From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 13 Jun 2018 00:20:12 -0700
Subject: On Supporting no-FPU machines
In-Reply-To: <CAK8P3a1bC1PgkV6n=HkSB7EnbEWGZYUo8CsDWtUh-xoLWg+rpA@mail.gmail.com>
References: <20180613062653.GA14518@andestech.com>
 <20180613063217.GA12182@infradead.org>
 <CAK8P3a1bC1PgkV6n=HkSB7EnbEWGZYUo8CsDWtUh-xoLWg+rpA@mail.gmail.com>
Message-ID: <20180613072012.GA5293@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jun 13, 2018 at 08:47:00AM +0200, Arnd Bergmann wrote:
> > A separate CONFIG_FPU to not build the FPU code sounds fine to me
> > as long as it defaults to on.
> 
> If we do this, that option must also take care to disable the FPU hardware
> if it exists. Otherwise you might run into the situation of having a system
> intended to run without FPU access but a task uses FPU registers anyway
> (e.g. because the compiler decides it is faster that way on the
> microarchitecture it is optimizing for) and we fail to save/restore the FPU
> state between task switches.

I'm not sure we can force this.  It would require a write to misa,
which requires M-mode privileges.
