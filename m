Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A312C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Hc/A+JnrY59DQ06/QKQdprVhb6pKgZaz3uKmDpgC1s=; b=zjYm7Lpkj/cQHM
	KOzqZrUTc83lh+VthzojZJ3kZF6BxQJmcW3ORhTqg3OGYA9HAs+3MZCq2PmoJB/xSFJfOejudD3Zt
	LS7R7bWgOe7O55uCpA5/KkP5GWdw3cacKT/QHNHKK1IQJbP4BMqw5koSJ+YWRBSs7DyrDNtkbAzIZ
	8Ci8Ynyu5sb2SD7hNGk07S3uxy1OyFmr6JecVAvFiJXHoxv2ZF6THzNxaVG2ulyPwa22M30/BlQe7
	FGkA6+F8JbHdsgguvMsRvOxv/2XeXqFY0eiqciOO+8inuA7ZydZOH2e5EF3voSSfENDcYc0W7sG09
	zbXa7SBLGqCZ5H5ZQ3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6y60-000rju-DY; Thu, 30 Jun 2022 17:36:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6y5e-000rcK-EG; Thu, 30 Jun 2022 17:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B62B01063;
	Thu, 30 Jun 2022 10:36:27 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADF4D3F792;
	Thu, 30 Jun 2022 10:36:24 -0700 (PDT)
Date: Thu, 30 Jun 2022 18:35:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	atishp@atishpatra.org, atishp@rivosinc.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	wangqing@vivo.com, robh+dt@kernel.org, rafael@kernel.org,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, gshan@redhat.com,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220630173513.dyrrmjbpxzi3e6fe@bogus>
References: <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_103630_574963_A481E993 
X-CRM114-Status: GOOD (  27.02  )
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

On Thu, Jun 30, 2022 at 04:37:50PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/06/2022 11:39, Sudeep Holla wrote:
> >
> > I can't think of any reason for that to happen unless detect_cache_attributes
> > is failing from init_cpu_topology and we are ignoring that.
> >
> > Are all RISC-V platforms failing on -next or is it just this platform ?
>
> I don't know. I only have SoCs with this core complex & one that does not
> work with upstream. I can try my other board with this SoC - but I am on
> leave at the moment w/ a computer or internet during the day so it may be
> a few days before I can try it.
>

Sure, no worries.

> However, Niklas Cassel has tried to use the Canaan K210 on next-20220630
> but had issues with RCU stalling:
> https://lore.kernel.org/linux-riscv/Yr3PKR0Uj1bE5Y6O@x1-carbon/T/#m52016996fcf5fa0501066d73352ed8e806803e06
> Not going to claim any relation, but that's minus 1 to the platforms that
> can be used to test this on upstream RISC-V.
>

Ah OK, will check and ask full logs to see if there is any relation.

> > We may have to try with some logs in detect_cache_attributes,
> > last_level_cache_is_valid and last_level_cache_is_shared to check where it
> > is going wrong.
> >
> > It must be crashing in smp_callin->update_siblings_masks->last_level_cache_is_shared
>
> Yeah, I was playing around last night for a while but didn't figure out the
> root cause. I'll try again tonight.
>

OK, thanks for that. I tried qemu, but doesn't have any cache info in DT
provided by qemu itself. The other sifive_u machine didn't work on qemu,
only virt booted with mainline as well.

> In the meantime, would you mind taking the patches out of -next?

I don't want to take out as we will loose all the test coverage.
I would like to know if any other RISC-V platform is affected or not
before removing it.

> FWIW I repro'd the failure on next-20220630.

Yes, nothing has changed yet.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
