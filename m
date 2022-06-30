Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92B7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bko5zVvBYYpKZeb7JedTkWeQSznaPuHUqOHaqNPxhQc=; b=Z0ylal22OWJtpV
	oYGWpA9t7mLf4EWol3LkN0+1ys+un5oeL6Nj40tGu6EaoDXb7Q0mmqkd1WAlQcCoYYabCWP70H0og
	Fo7nWpGdcG7Fi63O614LQYFFJ50zls3DDiVnyfB28UbYO9nMHAketP65L2WbwFq5XvI2BlholxKgL
	IsFza908OKytJpQMIfiZuzVwLSlj9ccGc1cKAHYbYRydfd3r7oSCpdlNe1gQSVmJYwkr97YKfR9MR
	oPoOuO274i221N+F+fakL0hF7T+dchPz4ZTVF/qoUa0v1BejVkp12mRluRU5mzcYP+aFK3d6Tuxjk
	ZcHPH7CP55VfPeyrFzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o70T0-001LWz-DN; Thu, 30 Jun 2022 20:08:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o70So-001LVq-Cy; Thu, 30 Jun 2022 20:08:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 998032B;
	Thu, 30 Jun 2022 13:08:31 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C9753F5A1;
	Thu, 30 Jun 2022 13:08:27 -0700 (PDT)
Date: Thu, 30 Jun 2022 21:07:17 +0100
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
Message-ID: <20220630200717.zlc6z6zcqbsw7euk@bogus>
References: <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
 <20220630173513.dyrrmjbpxzi3e6fe@bogus>
 <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_130834_570382_B964404C 
X-CRM114-Status: GOOD (  30.64  )
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

On Thu, Jun 30, 2022 at 07:20:04PM +0000, Conor.Dooley@microchip.com wrote:
> 
> 
> On 30/06/2022 18:35, Sudeep Holla wrote:
> > On Thu, Jun 30, 2022 at 04:37:50PM +0000, Conor.Dooley@microchip.com wrote:
> >> On 30/06/2022 11:39, Sudeep Holla wrote:
> >>>
> >>> I can't think of any reason for that to happen unless detect_cache_attributes
> >>> is failing from init_cpu_topology and we are ignoring that.
> >>>
> >>> Are all RISC-V platforms failing on -next or is it just this platform ?
> >>
> >> I don't know. I only have SoCs with this core complex & one that does not
> >> work with upstream. I can try my other board with this SoC - but I am on
> >> leave at the moment w/ a computer or internet during the day so it may be
> >> a few days before I can try it.
> >>
> > 
> > Sure, no worries.
> > 
> >> However, Niklas Cassel has tried to use the Canaan K210 on next-20220630
> >> but had issues with RCU stalling:
> >> https://lore.kernel.org/linux-riscv/Yr3PKR0Uj1bE5Y6O@x1-carbon/T/#m52016996fcf5fa0501066d73352ed8e806803e06
> >> Not going to claim any relation, but that's minus 1 to the platforms that
> >> can be used to test this on upstream RISC-V.
> >>
> > 
> > Ah OK, will check and ask full logs to see if there is any relation.
> > 
> >>> We may have to try with some logs in detect_cache_attributes,
> >>> last_level_cache_is_valid and last_level_cache_is_shared to check where it
> >>> is going wrong.
> >>>
> >>> It must be crashing in smp_callin->update_siblings_masks->last_level_cache_is_shared
> 
> 
> So, looks like there's a problem in cache_leaves_are_shared() which is hit
> by the above path. Both of the if clauses are false, and the function falls
> through to return sib_leaf->fw_token == this_leaf->fw_token;

Both if() failing is expected and that statement
	return sib_leaf->fw_token == this_leaf->fw_token;
execution is correct.

> Both sib_leaf & this_leaf seem to be null.
>

But this is wrong as last_level_cache_is_shared checks for
last_level_cache_is_valid which must return false if the fw_token = NULL
So we must not hit the above return statement with NULL fw_token.

> static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
> 					   struct cacheinfo *sib_leaf)
> {
> 	/*
> 	 * For non DT/ACPI systems, assume unique level 1 caches,
> 	 * system-wide shared caches for all other levels. This will be used
> 	 * only if arch specific code has not populated shared_cpu_map
> 	 */
> 	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
> 		return !(this_leaf->level == 1);
> 
> 	if ((sib_leaf->attributes & CACHE_ID) &&
> 	    (this_leaf->attributes & CACHE_ID))
> 		return sib_leaf->id == this_leaf->id;
> 
> 	return sib_leaf->fw_token == this_leaf->fw_token;
> }
> 
> Any ideas what to look at next?

I wonder how did we not get last_level_cache_is_valid as false if the
fw_node is NULL. But it should not be NULL at the first place.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
