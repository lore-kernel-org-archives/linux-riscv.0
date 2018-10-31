From: olof@lixom.net (Olof Johansson)
Date: Wed, 31 Oct 2018 10:52:51 -0700
Subject: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
In-Reply-To: <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
Message-ID: <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

On Wed, Oct 31, 2018 at 10:09 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 30 Oct 2018 23:47:06 PDT (-0700), Olof Johansson wrote:
> > A couple of fixes for build breakage or warnings, and a small whitespace/asm
> > cleanup. The non-cleanups would be good to see in 4.20 to keep builds green.
>
> I'm happy to just keep them all together, since the cleanups are non-functional
> changes.  Patch 1/3 appears to have disappeared from my inbox and I can't get
> to the infradead archives, do you mind re-sending it?

Sure, check inbox in a few minutes.

> This also brings up a bigger issue: I need to stop breaking the build,
> particularly as we now support a bunch of configurations.  Is your CI stuff
> still running?  It'd be great to have it run against some of our integration
> branches so I can catch these before they make it upstream.  I haven't been
> getting any emails.

I've migrated machines to a new system and that CI is up and running.
Right now the emails don't go anywhere but me, but let me know where
you want them sent and I'll be happy to do so (probably not
linux-riscv due to volume/noise). They're also uploaded to
http://arm-soc.lixom.net/buildlogs/riscv/.

Since you keep single-patch branches in your tree, and I compile
everything for every branch, I've restricted what branches I poll and
build. Right now it's "for*" and "riscv*".


-Olof
