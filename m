Return-Path: <SRS0=kGhb=SS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C104C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 13:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D41520870
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 13:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k3HTQcQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D41520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIBsob7zp5xDUtnHPdei8Yx0JJfTniWX+EXZRNcrO4s=; b=k3HTQcQCMeWFIK
	8TcDezxRUP0NLt9FEVpLFu0+TR5dndxjiFHf7Qvxyg7lcuCbBPWN52EVnKljeEeLtnb7L2R+Drkdv
	Afc4xlumv0eiaM0TjbBxOoTQfNmzKeHfsXxfMRXcweeetV/MYEs7hjt0uNyT8xOt+4z7WMoJ8UZux
	wUUKGBi52JAaytiBE6tGgU2mkTJ6WGA6Tnc0g0ASw4SFCcH1csmgNuOYHgqNsNv4V4Fjigi5lEo/o
	2d1vndRrvXjxgV/kEn/fyewbs8wdwXo/wyz8cp/818hhm06TA5V17UCpVkrlFXgReXbsVis40XkiZ
	7JGL0CoRyk+XMQsmZUEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGO3h-0004fF-9I; Tue, 16 Apr 2019 13:23:33 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGO3f-0004ei-15
 for linux-riscv@lists.infradead.org; Tue, 16 Apr 2019 13:23:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84D25EBD;
 Tue, 16 Apr 2019 06:23:30 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B05E23F557;
 Tue, 16 Apr 2019 06:23:26 -0700 (PDT)
Date: Tue, 16 Apr 2019 14:23:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT/RFC PATCH v3 3/5] cpu-topology: Move cpu topology code to
 common code.
Message-ID: <20190416132324.GB24669@e107155-lin>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-4-atish.patra@wdc.com>
 <20190415152741.GA28623@e107155-lin>
 <5c5b720f-414a-706c-3415-642c27baef1f@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c5b720f-414a-706c-3415-642c27baef1f@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_062331_077958_4503E243 
X-CRM114-Status: GOOD (  24.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
 Anup Patel <anup@brainfault.org>, Morten Rasmussen <morten.rasmussen@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 03:08:45PM -0700, Atish Patra wrote:
> On 4/15/19 8:27 AM, Sudeep Holla wrote:
> > Hi Atish,
> >
> > Thanks again for doing this. Overall changes look good except a couple
> > of minor nit, see below.
> >
> > On Wed, Mar 20, 2019 at 04:48:04PM -0700, Atish Patra wrote:
> > > Both RISC-V & ARM64 are using cpu-map device tree to describe
> > > their cpu topology. It's better to move the relevant code to
> > > a common place instead of duplicate code.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > ---
> > >   arch/arm64/include/asm/topology.h |  23 ---
> > >   arch/arm64/kernel/topology.c      | 303 +-----------------------------
> > >   drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
> > >   drivers/base/topology.c           |   1 +
> > >   include/linux/arch_topology.h     |  28 +++
> > >   5 files changed, 330 insertions(+), 323 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > > index edfcf8d9..6cc6a860 100644
> > > --- a/drivers/base/arch_topology.c
> > > +++ b/drivers/base/arch_topology.c
> > > @@ -6,8 +6,8 @@
> > >    * Written by: Juri Lelli, ARM Ltd.
> > >    */
> > > -#include <linux/acpi.h>
> > >   #include <linux/arch_topology.h>
> > > +#include <linux/acpi.h>
> > >   #include <linux/cpu.h>
> > >   #include <linux/cpufreq.h>
> > >   #include <linux/device.h>
> > > @@ -16,6 +16,11 @@
> > >   #include <linux/string.h>
> > >   #include <linux/sched/topology.h>
> > >   #include <linux/cpuset.h>
> > > +#include <linux/cpumask.h>
> > > +#include <linux/init.h>
> > > +#include <linux/percpu.h>
> > > +#include <linux/sched.h>
> > > +#include <linux/smp.h>
> > >   DEFINE_PER_CPU(unsigned long, freq_scale) = SCHED_CAPACITY_SCALE;
> > > @@ -278,3 +283,294 @@ static void parsing_done_workfn(struct work_struct *work)
> > >   #else
> > >   core_initcall(free_raw_capacity);
> > >   #endif
> > > +
> > > +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> >
> > Why can't the above one be just GENERIC_ARCH_TOPOLOGY ?
> > I may be missing to find it myself, but would like to know.
> >
> GENERIC_ARCH_TOPOLOGY is now used for both RISCV, ARM & ARM64.
> The below functions under this #ifdef have different implementation for ARM
> and ARM64.
>
> parse_dt_topology
> cpu_coregroup_mask
> update_siblings_masks
>
> While we can combine the later two functions and move them to common code as
> well, parse_dt_topology is significantly different.
>

Sure, had a quick glance and indeed they may look different, but won't
it defeat the purpose of this binding consolidation ?

> That's why we need some kind of #ifdef or renaming of parse_dt_topology for
> ARM32 code.
>

I am fine if we want to take this up later to keep the impact minimum.
But cpu_coregroup_mask and update_siblings_masks can and must be unified.
In fact the existing generic version must work on ARM32 too.

> Thanks for the review!!
>

You are welcome.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
