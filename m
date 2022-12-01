Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E026BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 06:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXj8H6/9iOPpdLiIzFqDWv/MskFsct9igxKnzHjM9p4=; b=UR4oyGye4sw5Uz
	yuDqxeBe9WOGluM1YaYwQVn7gg86/upBB25CsZVr+5it7NJUxVLICM0DDv1bOBzKPZUd0z2KsBBKd
	xGEztAdvsPkgDt/u2sMUkv5YJpua1cvbtbKjBk1ZNWN7OLmLClrJRuSDEvvZtqJUgzt4ZAJAFjbOs
	BSFGemksjJZ5tNz4p05/Ct0zB5BJJ/0WEb66G58mneu09DqmEK5J4X2FJTNOsqq4DGffOyL/iHHsR
	Z331vwabIyQ3rP5rvMXXyEERIaoXu+DsMSIn6PMmXznS+E5YuB1oKUSx34kTEzZE+BEaN3hI04IsA
	0nqNBAjyFHGFFDUkFw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cww-005C9x-Gw; Thu, 01 Dec 2022 06:21:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cwt-005C7f-4s
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 06:21:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6122261E9C;
	Thu,  1 Dec 2022 06:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4F8C433D6;
	Thu,  1 Dec 2022 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669875689;
	bh=1TShYY6JkDucSJo1cjYSsWtnGpEz8gTWzbxvY/gsAVc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Nmr6EadOg/rHV11uZ4icZPKLjWkG9u5exEWuXjcet49ziPi6lKPVIKjGUOYp6CcWx
	 Y12Z/NwkhsvhLIEHSbtm15Y2RB65kw6eZsRUaz2Phq9LxaG7FxUh1g9l8+F7qBS+HD
	 CGeOtlLQauyAR3MBwsA3p8GfaCD9Z9dbk/yh4BUovT3UVpuVYIqfDFshlSc0Qsgaat
	 xX1b8CE466ljiqmJHjjcrMiKQTkwBAH9gx4pQ3hDXQLOp5daBTG65U9wqGD+K0uJkf
	 MbDMzGCSBHmedPkE/bR2v0ikovVSHk5K7DiOGBkIqQXcHADL1iSgVygFDQE1SThq5o
	 Rv80Q+9vzjyTA==
Date: Thu, 01 Dec 2022 06:21:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>
CC: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] soc: starfive: Add StarFive JH71XX pmu driver
User-Agent: K-9 Mail for Android
In-Reply-To: <e0cf51d3-ba58-36a7-5c70-1d070e5fb12a@starfivetech.com>
References: <20221118133216.17037-1-walker.chen@starfivetech.com> <20221118133216.17037-4-walker.chen@starfivetech.com> <Y3giSQ0YccyY2tVk@spud> <95b05ac3-31a9-50dc-8eeb-eb3a9f883a6b@starfivetech.com> <Y4CkVnmdEhCsyckH@wendy> <e0cf51d3-ba58-36a7-5c70-1d070e5fb12a@starfivetech.com>
Message-ID: <42D09618-DB39-4A8B-9327-4C6CC9DA2000@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_222131_317262_D13A29B0 
X-CRM114-Status: GOOD (  18.52  )
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

Hey Walker,

Apologies for my formatting here. 

On 1 December 2022 03:56:27 GMT, Walker Chen <walker.chen@starfivetech.com> wrote:
>On 2022/11/25 19:17, Conor Dooley wrote:
>> On Fri, Nov 25, 2022 at 06:04:59PM +0800, Walker Chen wrote:
>>> On 2022/11/19 8:24, Conor Dooley wrote:
>>> > On Fri, Nov 18, 2022 at 09:32:15PM +0800, Walker Chen wrote:
>> 
>>> >> +void starfive_pmu_hw_event_turn_off(u32 mask)
>>> >> +{
>>> >> +	pmu_writel(mask, HW_EVENT_TURN_OFF_MASK);
>>> >> +}
>>> >> +EXPORT_SYMBOL(starfive_pmu_hw_event_turn_off);
>>> > 
>>> > Where are the users for these exports? Also, should they be exported as
>>> > GPL?
>>> > 
>>> > Either way, what is the point of the extra layer of abstraction here
>>> > around the writel()?
>>> 
>>> The two export functions are only prepared for GPU module. But accordint to
>>>  the latest information, it seems that there is no open source plan for GPU. 
>>> So the two functions will be drop in next version of patch.
>> 
>> That's a shame!
>
>Need to comply with certain commercial terms.
>
>> 
>>> >> +static int starfive_pmu_get_state(struct starfive_power_dev *pmd, bool *is_on)
>>> >> +{
>>> >> +	struct starfive_pmu *pmu = pmd->power;
>>> >> +
>>> >> +	if (!pmd->mask) {
>>> >> +		*is_on = false;
>>> >> +		return -EINVAL;
>>> >> +	}
>>> >> +
>>> >> +	*is_on = __raw_readl(pmu->base + CURR_POWER_MODE) & pmd->mask;
>>> > 
>>> > Is there a specific reason that you are using the __raw variants here
>>> > (and elsewhere) in the driver?
>>> 
>>> Will use unified function '__raw_readl' and '__raw_writel'
>> 
>> No no, I want to know *why* you are using the __raw accessors here. My
>> understanding was that __raw variants are unbarriered & unordered with
>> respect to other io accesses.
>> 
>> I do notice that the bcm driver you mentioned uses the __raw variants,
>> but only __raw variants - whereas you use readl() which is ordered and
>> barriered & __raw_readl().
>> 
>> Is there a reason why you would not use readl() or readl_relaxed()?
>
>Your question led me to deeply understand the usage of these io accessors.
>__raw_readl / __raw_writel denotes native byte order, no memory barrier.
>readl / writel do guarantee the byte order with barrier, ensure that previous writes are done.
>Seem that non-raw accessors are more safe.

Yeah, if there's no good reason to use these "raw"  versions then please use readl/readl_relaxed.


>> No worries, looking forward to getting my board :)
>> 
>Have you purchased a VisionFive 2 board online?  

I have :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
