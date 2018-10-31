From: logang@deltatee.com (Logan Gunthorpe)
Date: Wed, 31 Oct 2018 12:12:21 -0600
Subject: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
In-Reply-To: <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
References: <20181031064709.30981-1-olof@lixom.net>
 <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
 <CAOesGMgWDM+Etng3bNU-Yem6+WRJEu+TfddzKoN-htno1Az3=w@mail.gmail.com>
Message-ID: <861817b9-c5f3-e995-2e18-9526d89d6561@deltatee.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org


On 2018-10-31 11:52 a.m., Olof Johansson wrote:
> I've migrated machines to a new system and that CI is up and running.
> Right now the emails don't go anywhere but me, but let me know where
> you want them sent and I'll be happy to do so (probably not
> linux-riscv due to volume/noise). They're also uploaded to
> http://arm-soc.lixom.net/buildlogs/riscv/.
> 
> Since you keep single-patch branches in your tree, and I compile
> everything for every branch, I've restricted what branches I poll and
> build. Right now it's "for*" and "riscv*".

I think it would also be very nice to get the existing kbuild test robot
to start compile testing a few riscv configs. It already does most of
the other arches. This would help us catch these kinds of issues even
earlier seeing that test robot tests patches on mailing lists and many
other repos before Palmer would even pull them into his branch.
(Including a repo I routinely push branches to before sending out patches.)

I'm not sure who's currently responsible for the robot but I've copied
Fenguang who, I believe, set it up originally as well as the kbuild
lists. Hopefully he can point us in the right direction to help get this
set up.

Thanks,

Logan
