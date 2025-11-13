Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F067CCD6E71
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBg5qfAvxNzcdCigo49fXdTv46FdF+89E3MXn/nF60Q=; b=Gz3SSuA89+SVu/
	hvEEuWSH4gjU4ILePCuXuvUKYIVnU1qHuDBm0vw8qFtnxjszocqcUtZOjqMAb49u8/i56gM+xAAgd
	c6SnKxKQQsJtoSCJwWCwrX7L2MWWD5PfL9VhGrKLe2LfajzLvUgcmkNfLZEaymsXsbtWuiw/xpKN0
	ltOTw1N5rYuEo+W6wDVNZqzYngrl81SScGHn3MiqzJygQsefmPec8ud6f5ie6qLBHsOeQSaNzU6Np
	bur1TO7k8A6GC1NF8gLHBgm3Iah0CfWD30nZV8lFsTYZxxqLefPMUjlPiLHYlAQJwNDrPgl2EH8+J
	B3H8xHPZjLRvEZhMV/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYm1-0000000AeOK-1GKV;
	Thu, 13 Nov 2025 14:58:09 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYlw-0000000AeMx-3Fo1;
	Thu, 13 Nov 2025 14:58:07 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251113145759euoutp01fef0a97a0ebaf8bd2c8d8fa9cc795730~3mOLljyiZ1322713227euoutp012;
	Thu, 13 Nov 2025 14:57:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251113145759euoutp01fef0a97a0ebaf8bd2c8d8fa9cc795730~3mOLljyiZ1322713227euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763045879;
	bh=ogp7tQuY4ykhbwHIKUJTRYSar7oRQokZNx6TlxIJ+5c=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=T8vElxvmkwwSu1Wl5s0VXj6iVdl2A5s7iYFjmFeFPouxsJm1ZPkAuL/pj3v38TcxU
	 /xoPUpVOskKRLjECmF0grhpoxv/PVum1bvXNYzG6n+Owrs/cxRuPbe4zkZQdEvAzaI
	 PFjnHtKU80hgiAFcv2hYlDM5zIbRHGRMVNt0srsQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251113145758eucas1p1bca3e4e91b329de9c52de40c7d86d093~3mOLC8LIJ0576905769eucas1p1J;
	Thu, 13 Nov 2025 14:57:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251113145757eusmtip2959d20c844dc6203e206300997e642d0~3mOJlt2ga3124231242eusmtip2e;
	Thu, 13 Nov 2025 14:57:57 +0000 (GMT)
Message-ID: <e1696331-1271-46a8-adb6-9fed4521f22b@samsung.com>
Date: Thu, 13 Nov 2025 15:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display
 subsystem
To: Conor Dooley <conor@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251111-matriarch-diocese-b314e7bdaf81@spud>
X-CMS-MailID: 20251113145758eucas1p1bca3e4e91b329de9c52de40c7d86d093
X-Msg-Generator: CA
X-RootMTR: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
X-EPHeader: CA
X-CMS-RootMailID: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
	<20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	<20251110-clang-baking-b8b27730356e@spud>
	<00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
	<20251111-footing-eclair-332f5f0769f2@spud>
	<20251111-matriarch-diocese-b314e7bdaf81@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_065805_425724_A5076E1B 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Lee Jones <lee@kernel.org>, Andy Yan <andyshrk@163.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Maud Spierings <maudspierings@gocontroll.com>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/11/25 19:37, Conor Dooley wrote:
> On Tue, Nov 11, 2025 at 06:14:48PM +0000, Conor Dooley wrote:
>> On Tue, Nov 11, 2025 at 04:33:28PM +0100, Michal Wilczynski wrote:
>>>
>>>
>>> On 11/10/25 20:35, Conor Dooley wrote:
>>>> On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
>>>>> This series enables the display subsystem on the StarFive JH7110 SoC.
>>>>> This hardware has a complex set of dependencies that this series aims to
>>>>> solve.
>>>>>
>>>>> I believe this is a PHY tuning issue that can be fixed in the new
>>>>> phy-jh7110-inno-hdmi.c driver without changing the overall architecture.
>>>>> I plan to continue debugging these modes and will submit follow up fixes
>>>>> as needed.
>>>>>
>>>>> The core architectural plumbing is sound and ready for review.
>>>>>
>>>>> Notes:
>>>>> - The JH7110 does not have a centralized MAINTAINERS entry like the
>>>>>   TH1520, and driver maintainership seems fragmented. I have therefore
>>>>>   added a MAINTAINERS entry for the display subsystem and am willing to
>>>>>   help with its maintenance.
>>>>
>>>> Yeah, bunch of different folks wrote the drivers, so lots of entries.
>>>> Pretty much all as you've done here, authors are responsible for the
>>>> individual components and Emil is the platform maintainer but
>>>> responsible for most drivers.
>>>>
>>>> Do you need any feedback dt wise on the RFC, or is it too likely that
>>>> we'll both waste our breath if the DRM folks don't approve of your
>>>> approach for the rest of this series?
>>>
>>> Hi Conor,
>>>
>>> Thank you for your response.
>>>
>>> That's a fair point about the risk of the DRM approach being rejected.
>>> While I can't be certain, I'm hopeful that part is relatively
>>> straightforward, as it primarily integrates other recently reviewed
>>> (though not yet merged) components like the inno-hdmi bridge and dc8200
>>> drivers.
>>>
>>> To be honest, I was more concerned that the DT part of the series would
>>> be more problematic. Given that, I would find it very helpful to get
>>> your feedback on the DT aspects now, if you have the time.
>>
>> Right. You'll definitely want some actual DRM people to weigh in though
>> before making changes, I am really not familiar enough with this type of
>> hardware to know if the breakdown is correct.
> 
> It looks generally sane to me chief, but as I said I am not really
> familiar enough with this sort of hardware to have a real take on it.
> Sorry, you'll need to get your affirmation about how you've laid stuff
> out elsewhere :/

Thanks for the look, Conor.

I appreciate the sanity check on the DT side. I'll focus on getting the
necessary feedback from the DRM maintainers regarding the architectural
breakdown before spinning a v2.

[Adding Dmitry Baryshkov and highlighting Maxime, Heiko, and Robert]

Could you folks take a brief look at the driver split in this series?

Conor has reviewed the DT bindings and they look sane to him, but we
need to verify that the architectural split between the
phy-jh7110-inno-hdmi and the DRM bridge driver is acceptable for this
Innosilicon IP.

I am particularly interested if the current handling of the PHY tuning
parameters (as described in the cover letter) fits the modern DRM
bridge/PHY paradigm, or if this should be modeled differently given the
similarities to Rockchip implementations.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
