From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 31 Oct 2018 10:09:07 -0700 (PDT)
Subject: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
Message-ID: <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 30 Oct 2018 23:47:06 PDT (-0700), Olof Johansson wrote:
> A couple of fixes for build breakage or warnings, and a small whitespace/asm
> cleanup. The non-cleanups would be good to see in 4.20 to keep builds green.

I'm happy to just keep them all together, since the cleanups are non-functional 
changes.  Patch 1/3 appears to have disappeared from my inbox and I can't get 
to the infradead archives, do you mind re-sending it?

This also brings up a bigger issue: I need to stop breaking the build, 
particularly as we now support a bunch of configurations.  Is your CI stuff 
still running?  It'd be great to have it run against some of our integration 
branches so I can catch these before they make it upstream.  I haven't been 
getting any emails.
