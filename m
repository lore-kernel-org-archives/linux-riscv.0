From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 12 Nov 2018 07:29:13 +0100
Subject: [PATCH] riscv: add S and U modes to ISA string
In-Reply-To: <mhng-58f419dd-47a6-4540-91b6-08be173d4216@palmer-si-x1c4>
References: <7958aa50-8808-e909-753c-e232b3d1f84e@packi.ch>
 <mhng-58f419dd-47a6-4540-91b6-08be173d4216@palmer-si-x1c4>
Message-ID: <CAEn-LTqd3+t+zhmbbZ3CjPMnFOsUxy0pVNUkgvU5T7yQU_DkcQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun, Nov 11, 2018 at 11:14 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sat, 10 Nov 2018 00:35:15 PST (-0800), me at packi.ch wrote:
> > On 10.11.18 07:45, David Abdurachmanov wrote:
> >>
> >> The patch adds the missing S and U modes.
> >
> > This is the same patch I submitted earlier (see v2 here [1], based on
> > Palmer's feedback). Palmer stated that the "S" extension should not be
> > exposed to usermode.
> >
> > Since two people arrived at the same solution, I wonder if the
> > supervisor mode should really be hidden from userspace, as it's about
> > the CPU information, not about the environment the calling code is
> > running as.
> >
> > [1] https://lkml.org/lkml/2018/11/10/96
>
> I still think S should be hidden from applications.  This patch was fairly
> mechanical, so it probably just wasn't though about twice -- that's the problem
> with user ABI stuff, lots of times the obvious answer isn't the correct one :).
>
True. It was mechanical based on warnings I noticed while booting Fedora
with latest kernel and BBL.

Also true, that /proc/cpuinfo doesn't need to reveal all things to user space
(especially if you don't want various programs to depend on it as some
tend to parse /proc/cpuinfo).

Note, that on server systems which probably would implement SMBIOS
(based on the current proposal for RISC-V) the administrator could
check for S mode.
