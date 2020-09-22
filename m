Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C7FC2D0E2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 11:31:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000B2221EB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 11:31:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwBfDenI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 000B2221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qnl0Yvyb3aj5rX7CcFeW7ghheLeAdyL0nvz/EmLAZfk=; b=iwBfDenI6mk7iQenvLGs1uDEz
	cu6qQcNzPYyQEgB0IWMOhgV7eWSkqenDEbYxgrlpd1LS+w4wd+gdwfvSOn+qEeYmhJLCN6Z4nE5ri
	slMtnI1L0TMCfuundPX/YUl5+JaqmEEWvQgQ/UGnW0KiBIiNW3+/Gdr+4GrUED0BRtTKWSIs1Hq8v
	2L3Ol+VfVSP3EzMLWIILYeznebU9PgaGBKjzvlTlq1uBahbZaSeyU2/seqqh2wbrFcZSa2AJ+7iF+
	9c1tOfZfx58LMteEr5SmiOsg1s5ZwupwVC7n47M424HGVWBwdSR5gR1JjJuO+kc84MjGFu260eMT7
	rpipDVsCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgVj-0005fN-53; Tue, 22 Sep 2020 11:31:03 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgVe-0005dV-KF; Tue, 22 Sep 2020 11:30:59 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id E76C7428A485CBA319EF;
 Tue, 22 Sep 2020 12:30:52 +0100 (IST)
Received: from localhost (10.52.121.155) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Tue, 22 Sep
 2020 12:30:52 +0100
Date: Tue, 22 Sep 2020 12:29:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [RFT PATCH v3 0/5] Unify NUMA implementation between ARM64 &
 RISC-V
Message-ID: <20200922122912.00004bcb@Huawei.com>
In-Reply-To: <CAOnJCU+mg13P609kut2cK9igmyepOvDc4kU-EzXsdjde7D_RpQ@mail.gmail.com>
References: <20200918201140.3172284-1-atish.patra@wdc.com>
 <20200921164947.000048e1@Huawei.com>
 <CAOnJCU+mg13P609kut2cK9igmyepOvDc4kU-EzXsdjde7D_RpQ@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.121.155]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_073058_775934_451A7E2A 
X-CRM114-Status: GOOD (  39.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven
 Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 21 Sep 2020 17:08:32 -0700
Atish Patra <atishp@atishpatra.org> wrote:

> On Mon, Sep 21, 2020 at 8:51 AM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Fri, 18 Sep 2020 13:11:35 -0700
> > Atish Patra <atish.patra@wdc.com> wrote:
> >  
> > > This series attempts to move the ARM64 numa implementation to common
> > > code so that RISC-V can leverage that as well instead of reimplementing
> > > it again.
> > >
> > > RISC-V specific bits are based on initial work done by Greentime Hu [1] but
> > > modified to reuse the common implementation to avoid duplication.
> > >
> > > [1] https://lkml.org/lkml/2020/1/10/233
> > >
> > > This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
> > > It would be great if somebody can test it on numa capable ARM64 hardware platforms.
> > > This patch series doesn't modify the maintainers list for the common code (arch_numa)
> > > as I am not sure if somebody from ARM64 community or Greg should take up the
> > > maintainership. Ganapatrao was the original author of the arm64 version.
> > > I would be happy to update that in the next revision once it is decided.  
> >  
> 
> Any thoughts on the maintenanership of this code ?

Currently it is a trivial enough bit of code, I'd not be too worried
as long as it doesn't fall through the cracks.  Changes that directory are going
to need a GregKH Ack so unlikely anything will get missed.

If you feel a specific entry is needed in MAINTAINERS go for it.
Feel free to stick me down as a reviewer and I'll keep an eye on
it from ARM64 side of things.

Thanks,

Jonathan


> 
> > Was fairly sure this set was a noop on arm64 ACPI systems, but ran a quick
> > sanity check on a 2 socket kunpeng920 and everything came up as normal
> > (4 nodes, around 250G a node)
> >
> > Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > For patches 1 and 2.  Doesn't seem relevant to the rest :)
> >  
> 
> Thanks a lot!
> 
> > >
> > > # numactl --hardware
> > > available: 2 nodes (0-1)
> > > node 0 cpus: 0 1 2 3
> > > node 0 size: 486 MB
> > > node 0 free: 470 MB
> > > node 1 cpus: 4 5 6 7
> > > node 1 size: 424 MB
> > > node 1 free: 408 MB
> > > node distances:
> > > node   0   1
> > >   0:  10  20
> > >   1:  20  10
> > > # numactl -show
> > > policy: default
> > > preferred node: current
> > > physcpubind: 0 1 2 3 4 5 6 7
> > > cpubind: 0 1
> > > nodebind: 0 1
> > > membind: 0 1
> > >
> > > For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
> > > to test the patches in Qemu and 2 socket OmniXtend FPGA.
> > >
> > > https://patchwork.kernel.org/project/qemu-devel/list/?series=303313
> > >
> > > The patches are also available at
> > >
> > > https://github.com/atishp04/linux/tree/5.10_numa_unified_v3
> > >
> > > There may be some minor conflicts with Mike's cleanup series [2] depending on the
> > > order in which these two series are being accepted. I can rebase on top his series
> > > if required.
> > >
> > > [2] https://lkml.org/lkml/2020/8/18/754
> > >
> > > Changes from v2->v3:
> > > 1. Added Acked-by/Reviewed-by tags.
> > > 2. Replaced asm/acpi.h with linux/acpi.h
> > > 3. Defined arch_acpi_numa_init as static.
> > >
> > > Changes from v1->v2:
> > > 1. Replaced ARM64 specific compile time protection with ACPI specific ones.
> > > 2. Dropped common pcibus_to_node changes. Added required changes in RISC-V.
> > > 3. Fixed few typos.
> > >
> > > Atish Patra (4):
> > > numa: Move numa implementation to common code
> > > arm64, numa: Change the numa init functions name to be generic
> > > riscv: Separate memory init from paging init
> > > riscv: Add numa support for riscv64 platform
> > >
> > > Greentime Hu (1):
> > > riscv: Add support pte_protnone and pmd_protnone if
> > > CONFIG_NUMA_BALANCING
> > >
> > > arch/arm64/Kconfig                            |  1 +
> > > arch/arm64/include/asm/numa.h                 | 45 +----------------
> > > arch/arm64/kernel/acpi_numa.c                 | 13 -----
> > > arch/arm64/mm/Makefile                        |  1 -
> > > arch/arm64/mm/init.c                          |  4 +-
> > > arch/riscv/Kconfig                            | 31 +++++++++++-
> > > arch/riscv/include/asm/mmzone.h               | 13 +++++
> > > arch/riscv/include/asm/numa.h                 |  8 +++
> > > arch/riscv/include/asm/pci.h                  | 14 ++++++
> > > arch/riscv/include/asm/pgtable.h              | 21 ++++++++
> > > arch/riscv/kernel/setup.c                     | 11 ++++-
> > > arch/riscv/kernel/smpboot.c                   | 12 ++++-
> > > arch/riscv/mm/init.c                          | 10 +++-
> > > drivers/base/Kconfig                          |  6 +++
> > > drivers/base/Makefile                         |  1 +
> > > .../mm/numa.c => drivers/base/arch_numa.c     | 31 ++++++++++--
> > > include/asm-generic/numa.h                    | 49 +++++++++++++++++++
> > > 17 files changed, 201 insertions(+), 70 deletions(-)
> > > create mode 100644 arch/riscv/include/asm/mmzone.h
> > > create mode 100644 arch/riscv/include/asm/numa.h
> > > rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
> > > create mode 100644 include/asm-generic/numa.h
> > >
> > > --
> > > 2.25.1
> > >  
> >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
