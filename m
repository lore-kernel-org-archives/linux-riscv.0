Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98633C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/m88NixBnrIyRy4jwD7SzFOvrHqijfHhPlTr7jr/Ok=; b=zB6+AP3+rjJGXi
	ZiXZwnrKVKPaReMr1J9ut5CuWUS21LGAdApACImOzi5lGGB9zVLXSHDcQfUHPoejydQwY5ZoNixwR
	YTYZitrQXKm0YeaXPka5q3bPAAp5X40fkanvUAP+z1/yR76qakrRAP99fA7J9J054nCKupT6RYhN3
	+5gsRUmnh13v4+GMiq+kPmBdkhV/y9gkr8Lt5YKtFwnyZWIll+mR+sc1PY7m6WWJjJBtouywnHlBI
	SmxtvLBFg8VZsm2cTzh5nAaKozqANUNHg96MX2PEVXDSOpDFzUuRWMm4TZVj94uSod+dbKI8QXkCR
	nFBtpffvEajLkI0syAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rkr-00GfZm-AD; Thu, 30 Jun 2022 10:50:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rbr-00GbOQ-Ub; Thu, 30 Jun 2022 10:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DA01042;
	Thu, 30 Jun 2022 03:41:13 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C89463F5A1;
	Thu, 30 Jun 2022 03:41:09 -0700 (PDT)
Date: Thu, 30 Jun 2022 11:39:58 +0100
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
Message-ID: <20220630103958.tcear5oz3orsqwg6@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_034120_096552_3936553C 
X-CRM114-Status: GOOD (  16.88  )
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

On Wed, Jun 29, 2022 at 11:25:41PM +0000, Conor.Dooley@microchip.com wrote:
> On 29/06/2022 21:32, Conor.Dooley@microchip.com wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 29/06/2022 20:54, Sudeep Holla wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On Wed, Jun 29, 2022 at 07:39:43PM +0000, Conor.Dooley@microchip.com wrote:
> >>> On 29/06/2022 19:42, Sudeep Holla wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>
> >>>> On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
> >>>>>
> >>>>> No, no it doesn't. Not sure what I was thinking there.
> >>>>> Prob tested that on the the last commit that bisect tested
> >>>>> rather than the one it pointed out the problem was with.
> >>>>>
> >>>>> Either way, boot is broken in -next.
> >>>>>
> >>>>
> >>>> Can you check if the below fixes the issue?
> >>>
> >>> Unfortunately, no joy.
> >>> Applied to a HEAD of 3b23bb2573e6 ("arch_topology: Use the
> >>> last level cache information from the cacheinfo").
> >>
> >> That's bad. Does the system boot with
> >> Commit 2f7b757eb69d ("arch_topology: Add support to parse and detect cache
> >> attributes") ?
> > 
> > It does.
> 

I can't think of any reason for that to happen unless detect_cache_attributes
is failing from init_cpu_topology and we are ignoring that.

Are all RISC-V platforms failing on -next or is it just this platform ?
We may have to try with some logs in detect_cache_attributes,
last_level_cache_is_valid and last_level_cache_is_shared to check where it
is going wrong.

It must be crashing in smp_callin->update_siblings_masks->last_level_cache_is_shared

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
