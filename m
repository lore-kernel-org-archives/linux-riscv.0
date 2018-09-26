From: anup@brainfault.org (Anup Patel)
Date: Wed, 26 Sep 2018 09:46:40 +0530
Subject: [PATCH v2] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <a7c64e1a-405e-6a2c-cb42-211c4f89367d@wdc.com>
References: <20180923133737.22693-1-anup@brainfault.org>
 <a7c64e1a-405e-6a2c-cb42-211c4f89367d@wdc.com>
Message-ID: <CAAhSdy2ZOXk3fDt8W_G1=h_OrifFsXP3XwZ2xnXwt9ztzW4GEg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 25, 2018 at 11:29 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 9/23/18 6:37 AM, Anup Patel wrote:
> > Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
> > is in-correct. This patch shows CPU ID and Hart ID separately
> > in /proc/cpuinfo using cpuid_to_hardid_map().
> >
> I noticed it should be cpuid_to_hartid_map instead of
> cpuid_to_hardid_map. It was a typo in my smp cleanup patch series.
> Sorry for the inconvenience here.

Thanks for pointing.

>
> I can include this patch in into my series fixing the typo if you want.

Yes, please.

You can also include "RISC-V: Show IPI stats" patch in your series.
This patch was reviewed by Christoph.

Thanks,
Anup
