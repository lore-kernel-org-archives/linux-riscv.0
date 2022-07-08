Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3950BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9rcofnnVzcUR/VcPRCJiuHBNLaoYrELm/k7j/5gZEE=; b=ox31wniUW/x+GF
	R5AhLVsbSQ8hQRHGqM3bdHwZZQSUhpQfCqp8G/EftD2v25GwiQIjSu23SJck+O25gbndlNOpls6VD
	mN+9tL4oAG4bBl2xU8sw7ROO7uUncA3DjG/JWPKhq7Li6u4aPuyOKkpCfIVnv+UyVTgsK+AC+341P
	9PxaNgrtQ5r5PMtUE7TtvLw2daGhEqmi4GVdeA44lA5jwpmFh45/u9h0bs/DZEeJTJ86QO31BWSyA
	G9vnVD+KmKnron48Opj7prpNWsaCH06bywMpCsE5bHEr/MmRQkRp/3DMX7OVK6yCO5xAgK0BB+Eyv
	F2koyW7ZwjEHQzvpxnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kCA-002sF6-30; Fri, 08 Jul 2022 09:22:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kBo-002s1F-Gw; Fri, 08 Jul 2022 09:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2469D106F;
	Fri,  8 Jul 2022 02:22:18 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A44A93F66F;
	Fri,  8 Jul 2022 02:22:11 -0700 (PDT)
Date: Fri, 8 Jul 2022 10:21:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Daire.McNamara@microchip.com,
	niklas.cassel@wdc.com, damien.lemoal@opensource.wdc.com,
	geert@linux-m68k.org, zong.li@sifive.com, kernel@esmil.dk,
	hahnjo@hahnjo.de, guoren@kernel.org, anup@brainfault.org,
	atishp@atishpatra.org, changbin.du@intel.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, robh@kernel.org, maz@kernel.org,
	viresh.kumar@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Brice.Goglin@inria.fr
Subject: Re: [RFC 2/4] arch-topology: add a default implementation of
 store_cpu_topology()
Message-ID: <20220708092100.c6mgmnt7e2k7u634@bogus>
References: <20220707220436.4105443-1-mail@conchuod.ie>
 <20220707220436.4105443-3-mail@conchuod.ie>
 <20220708082443.azoqvuj7afrg7ox7@bogus>
 <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_022220_639107_FB4FAB2D 
X-CRM114-Status: GOOD (  21.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 08, 2022 at 08:35:57AM +0000, Conor.Dooley@microchip.com wrote:
> On 08/07/2022 09:24, Sudeep Holla wrote:
> > On Thu, Jul 07, 2022 at 11:04:35PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> RISC-V & arm64 both use an almost identical method of filling in
> >> default vales for arch topology. Create a weakly defined default
> >> implementation with the intent of migrating both archs to use it.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>   drivers/base/arch_topology.c  | 19 +++++++++++++++++++
> >>   include/linux/arch_topology.h |  1 +
> >>   2 files changed, 20 insertions(+)
> >>
> >> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> >> index 441e14ac33a4..07e84c6ac5c2 100644
> >> --- a/drivers/base/arch_topology.c
> >> +++ b/drivers/base/arch_topology.c
> >> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
> >>   	}
> >>   }
> >>   
> >> +void __weak store_cpu_topology(unsigned int cpuid)
> 
> Does using __weak here make sense to you?
>

I don't want any weak definition and arch to override as we know only
arm64 and RISC-V are the only users and they are aligned to have same
implementation. So weak definition doesn't make sense to me.

> > 
> > I prefer to have this as default implementation. So just get the risc-v
> > one pushed to upstream first(for v5.20) and get all the backports if required.
> > Next cycle(i.e. v5.21), you can move both RISC-V and arm64.
> > 
> 
> Yeah, that was my intention. I meant to label patch 1/4 as "PATCH"
> and (2,3,4)/4 as RFC but forgot. I talked with Palmer about doing
> the risc-v impl. and then migrate both on IRC & he seemed happy with
> it.
>

Ah OK, good.

> If you're okay with patch 1/4, I'll resubmit it as a standalone v2.
>

That would be great, thanks. You can most the code to move to generic from
both arm64 and risc-v once we have this in v5.20-rc1

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
