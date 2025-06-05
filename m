Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD6C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9j4+bwgELv2dPyFTas2pIl7oBr8/YZqUpyKqmeTiLg=; b=ikjWY646e5LGh5
	sCAQclJ1KfKBbz4TDlvtWYfq2WKHlkpVz7qfsYs7XQd2F9oErDx5Kp+PfLZWOnkRAVSuZEzOCwhqE
	SbWL4sJooXLt0y9QDzahkJP5F32fjqGC/w7XU0v/PVFUMaFzqW9nFA8IVKgpQZ23c4WORxnmO1FfR
	4WzdyfR+B1maBakDQMmA4/yUYzV2EsYfXEPS6Efmz8RxifTfiGkIGcKJCDr2A8hwVOe3W9QIHFJfY
	5gR93OxWsmxV0xu35jRgvpDbQ58aQX5NouBFHxj8cm7CaiSPBfWd9keCtldCT7HeZCq1XLWgTOAFk
	L6Tc6reqwNx61CzYwrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5Lb-0000000EzAp-2JsJ;
	Thu, 05 Jun 2025 07:49:11 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5KM-0000000EyyR-3Bmy
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 07:48:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250605074749euoutp024126adb8be9ab2c949e17a1c0ee1ff9a~GFfoqt52m2448224482euoutp02t
	for <linux-riscv@lists.infradead.org>; Thu,  5 Jun 2025 07:47:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250605074749euoutp024126adb8be9ab2c949e17a1c0ee1ff9a~GFfoqt52m2448224482euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749109669;
	bh=wQ4r2UrMO9HeWwWj73XcqSp64Ha0LrQiq2rssP1dDuU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Lx8H/eN4+gJmiZWwy0JVaKHPIMHJTrPUO9jU9LxlP6rl7YpKSjoSdg3AOmBatrTaN
	 29+ugSKoTZJxnInwOrCJA4utIS3IGCH2f2lKWmOskNCwRc87PI5Z+8xQI4t9MogBKP
	 txhvt3/SUEbSLW6vwZXDot4dqoHRHCRDGCmPAKuA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250605074748eucas1p28e67e82124190453f8cc77872b8ecbb1~GFfn7AmSH2541025410eucas1p2l;
	Thu,  5 Jun 2025 07:47:48 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250605074747eusmtip2b9d586a7c9f00d970573a42cf8dd1011~GFfm3yx930322103221eusmtip2A;
	Thu,  5 Jun 2025 07:47:47 +0000 (GMT)
Message-ID: <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
Date: Thu, 5 Jun 2025 09:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
	Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
	Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <cc4dbf7c-e023-403c-88be-4691f97a0ff0@kernel.org>
X-CMS-MailID: 20250605074748eucas1p28e67e82124190453f8cc77872b8ecbb1
X-Msg-Generator: CA
X-RootMTR: 20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1
X-EPHeader: CA
X-CMS-RootMailID: 20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
	<20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
	<20250603-whispering-jaybird-of-thunder-f87867@kuoka>
	<d42a8c49-7ad2-49ef-bd9c-1e3d9981b58e@samsung.com>
	<e5a0bee2-ff74-47cf-ad2c-0c78b57ae6cf@kernel.org>
	<a6a29e58-8613-47f0-9e5c-d125da7ddb49@samsung.com>
	<cc4dbf7c-e023-403c-88be-4691f97a0ff0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_004755_060845_C2308CB3 
X-CRM114-Status: GOOD (  28.89  )
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



On 6/4/25 14:07, Krzysztof Kozlowski wrote:
> On 04/06/2025 13:53, Michal Wilczynski wrote:
>>>>
>>>> The GPU node will depend on the AON node, which will be the sole
>>>> provider for the 'gpu-power' sequencer (based on the discussion in patch
>>>> 1).
>>>>
>>>> Therefore, if the AON/pwrseq driver has already completed its probe, and
>>>> devm_pwrseq_get() in the GPU driver subsequently returns -EPROBE_DEFER
>>>> (because pwrseq_get found 'no match' on the bus for 'gpu-power'), the
>>>> interpretation is that the AON driver did not register this optional
>>>> sequencer. Since AON is the only anticipated source, it implies the
>>>> sequencer won't become available later from its designated provider.
>>>
>>> I don't understand why you made this assumption. AON could be a module
>>> and this driver built-in. AON will likely probe later.
>>
>> You're absolutely right that AON could be a module and would generally
>> probe later in that scenario. However, the GPU device also has a
>> 'power-domains = <&aon TH1520_GPU_PD>' dependency. If the AON driver (as
>> the PM domain provider) were a late probing module, the GPU driver's
>> probe would hit -EPROBE_DEFER when its power domain is requested
>> which happens before attempting to get other resources like a power
>> sequencer.
> 
> Huh, so basically you imply certain hardware design and certain DTS
> description in your driver code. Well, that's clearly fragile design to
> me, because you should not rely how hardware properties are presented in
> DTS. Will work here on th1520 with this DTS, won't work with something else.
> 
> Especially that this looks like generic Imagination GPU code, common to
> multiple devices, not TH1520 only specific.
> 
>>
>> So, if the GPU driver's code does reach the devm_pwrseq_get(dev,
>> "gpu-power") call, it strongly implies the AON driver has already
>> successfully probed.
>>
>> This leads to the core challenge with the optional 'gpu-power'
>> sequencer: Even if the AON driver has already probed, if it then chooses
>> not to register the "gpu-power" sequence (because it's an optional
>> feature), pwrseq_get() will still find "no device matched" on the
>> pwrseq_bus and return EPROBE_DEFER.
>>
>> If the GPU driver defers here, as it normally should for -EPROBE_DEFER,
>> it could wait indefinitely for an optional sequence that its
>> already probed AON provider will not supply.
>>
>> Anyway I think you're right, that this is probably confusing and we
>> shouldn't rely on this behavior.
>>
>> To solve this, and to allow the GPU driver to correctly handle
>> -EPROBE_DEFER when a sequencer is genuinely expected, I propose using a
>> boolean property on the GPU's DT node, e.g.
>> img,gpu-expects-power-sequencer. If the GPU node provides this property
>> it means the pwrseq 'gpu-power' is required.
> 
> No, that would be driver design in DTS.
> 
> I think the main problem is the pwrseq API: you should get via phandle,
> not name of the pwrseq controller. That's how all producer-consumer
> relationships are done in OF platforms.

Bart,
Given Krzysztof's valid concerns about the current name based
lookup in pwrseq_get() and the benefits of phandle based resource
linking in OF platforms: Would you be open to a proposal for extending
the pwrseq API to allow consumers to obtain a sequencer (or a specific
target sequence) via a phandle defined in their Device Tree node? For
instance, a consumer device could specify power-sequencer =
<&aon> and a new API variant could resolve this.

> 
> It's also fragile to rely on names in case of systems with multiple
> similar devices. This does not affect your platform and this hardware in
> general, but shows issues with interface: imagine multiple gpus and
> multiple pwr sequence devices. Which one should be obtained?
> gpu-power-1? But if GPUs are the same class of devices (e.g. 2x TG1520
> GPU) this is just imprecise.
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
