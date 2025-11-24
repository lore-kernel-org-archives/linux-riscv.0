Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99562CFD360
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4DnBszIxVgucVOY29krAUMbwUcKS0XdGobdPygGmp8=; b=1dx4Skg8rlGxN8
	dhQdPb3P1c3whOR0ILRMYb4IxI9QdWPwx2nQY5vcXusU9w9TukzZlysVCzZxcP5GD1FLM5pdtiuQg
	Wp+e81V7vkRnhLXVitdFqvU70e5nLTopG963HuCCpcKaIwUhydvAK/tQDrPodqyythuIDb8cUQ6vA
	Q5EHUcawIX/C3E7JKf1NqYQy0d74Kiodc28MW8iLV8shEoTzwlsdPC0dCziIlz7gEGIq0hyhrjI54
	S5biHUvwG9nyMFh5kP3V2pQuu5bT5T6QsB2bGXkbm/QYLGDCu++0B1U5ZWBWo1Ic5zRNywhqbyFdY
	QBs5ddX4TNAOIuq6VZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeaq-0000000CNP5-2Pz7;
	Mon, 24 Nov 2025 21:59:32 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNean-0000000CNOh-2ycb
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 21:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1764021550;
	bh=hA/ZGY6qxxf/8F0kJfLsWVi4AY9tMhPfGGSBzlI1JF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f1oBHbPT5U4wCG0QPZkAG80xrZ1G4Wzy2j694ZoyyAELsv+7imqYgvdFVH11YVjg5
	 NSSH1p3s0L0rvv+S1nOljGJWw3byzCEcqnAI5gfuNvVGqqYwwfaIkOTrOrnQHC0R7m
	 Z/gSOga64h3WG6PJfo53hyp8FIQW4JuhtxU96p+CO+z+pZEBSeq/wu8BzYm1K7SATT
	 tEFipsgmTp0V6V44ir+nALY+d3qSFVP+0xy1Osu3o/d/3v4gY9syuXeTQL3vEn2DO8
	 8l4EIX5QbgQ27ZRjwb11UeKj5H9zFihQnD8twDKsCRUzhf63Qu2zMLnxIt9z02ZFiy
	 9TslpPsgfONvA==
Received: from [192.168.2.54] (unknown [143.105.119.236])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 312D2B2211B2;
	Mon, 24 Nov 2025 22:59:07 +0100 (CET)
Message-ID: <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
Date: Mon, 24 Nov 2025 13:59:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
 <20251124-state-campsite-3e7788a495c1@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251124-state-campsite-3e7788a495c1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_135929_934386_17BAFDC3 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 11/24/25 05:22, Conor Dooley wrote:
> On Mon, Nov 24, 2025 at 08:28:10AM +0100, Krzysztof Kozlowski wrote:
>> On Sun, Nov 23, 2025 at 02:50:44PM -0800, E Shattow wrote:
>>> From: Icenowy Zheng <uwu@icenowy.me>
>>>
>>> Add "xunlong,orangepi-rv" as a StarFive JH7110 SoC-based board.
>>>
>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>> Signed-off-by: E Shattow <e@freeshell.de>
>>
>> <form letter>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
> 
> It's from me, don't resubmit just to add it since it'll be me applying
> anyway.
> 

Hi Conor,

Okay. Yes I'd dropped the tag since the commit message is appreciably
different, and you would be handling it again anyways. Thanks! And thank
you Krzysztof for the reminder -E

>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions of patchset, under or above your Signed-off-by tag, unless
>> patch changed significantly (e.g. new properties added to the DT
>> bindings). Tag is "received", when provided in a message replied to you
>> on the mailing list. Tools like b4 can help here. However, there's no
>> need to repost patches *only* to add the tags. The upstream maintainer
>> will do that for tags received on the version they apply.
>>
>> Please read:
>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>>
>> If a tag was not added on purpose, please state why and what changed.
>> </form letter>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
