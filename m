Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01843C5B559
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbDfNCkp/WigFbreHeobjDfdomb/4N8HfaP5v+gZ+uk=; b=kCeNkWmtR0bXsL
	eiWgrKtNpXqGgzXilD7eqdESC2VDcLoLkiciSMGPtlO0eHBoOTF939IjsCHgFhwW1E5cwcFy75kWW
	5thVRPUXOp+VpLQa1qKJmULjJ1Tzo/zjEram13XyoHKSNNbRcrll9i3AnHidIRLhq+lbIppO3qpfs
	/q3z8WgdmPmg+OGX56i1aBF3fK3gQ0Z/eCjHap+ypQawb0cUisabDSGT4xdhlBHbZjj1g2DHsaSop
	EZRVYUxVPm1kl4v6YS5NLZ09LIwfpYiCKav2cybB1VwZoXtVE0mNN/CqpI+mFdslw6J0UaVffDLHN
	aklLTrCmgu1HZvF7FK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmzX-0000000DI8G-0lts;
	Wed, 04 Jun 2025 12:13:11 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmgu-0000000DFom-3l6q
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 11:53:59 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250604115351euoutp02f96375e6db815dcfcf8888bdb60abe12~F1NK2CkZl2789927899euoutp02X
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jun 2025 11:53:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250604115351euoutp02f96375e6db815dcfcf8888bdb60abe12~F1NK2CkZl2789927899euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749038031;
	bh=s/0qhETp0/O5tfeuPDSpC29l+QS4DsX1qeaGhsBy0I4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VUQivGpuXwfTvpBVWD1oWFdPgrlPaqvo8usOtfrEEyMhn3X9zaHLn/ZJvzMCOaNVm
	 tThqy1WUXxJeweaD4C6PA2Tr6afc9y6mcEVGtHV1cW7xjKehfa9S0SRk67bkRDLdcy
	 4vmdhCVu7nbznSCVPy1xyUByvCZtPorTzTysaG3M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250604115351eucas1p2029645aec0becbaea4623fed73756400~F1NKR_He42239722397eucas1p2f;
	Wed,  4 Jun 2025 11:53:51 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250604115349eusmtip2988a156336ef42213eda6e883df452af~F1NJJo9GR1421814218eusmtip2Y;
	Wed,  4 Jun 2025 11:53:49 +0000 (GMT)
Message-ID: <a6a29e58-8613-47f0-9e5c-d125da7ddb49@samsung.com>
Date: Wed, 4 Jun 2025 13:53:49 +0200
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
In-Reply-To: <e5a0bee2-ff74-47cf-ad2c-0c78b57ae6cf@kernel.org>
X-CMS-MailID: 20250604115351eucas1p2029645aec0becbaea4623fed73756400
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_045357_534514_0D7B483C 
X-CRM114-Status: GOOD (  20.84  )
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



On 6/4/25 08:36, Krzysztof Kozlowski wrote:
> On 03/06/2025 21:43, Michal Wilczynski wrote:
>>>> +	 * and resets. Otherwise, we fall back to managing them ourselves.
>>>> +	 */
>>>> +	pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
>>>> +	if (IS_ERR(pvr_dev->pwrseq)) {
>>>> +		int pwrseq_err = PTR_ERR(pvr_dev->pwrseq);
>>>> +
>>>> +		/*
>>>> +		 * If the error is -EPROBE_DEFER, it's because the
>>>> +		 * optional sequencer provider is not present
>>>> +		 * and it's safe to fall back on manual power-up.
>>>
>>> It is safe but why it is desirable? The rule is rather to defer the
>>> probe, assuming this is probe path.
>>
>> Yeah this is probe path.
>>
>> The GPU node will depend on the AON node, which will be the sole
>> provider for the 'gpu-power' sequencer (based on the discussion in patch
>> 1).
>>
>> Therefore, if the AON/pwrseq driver has already completed its probe, and
>> devm_pwrseq_get() in the GPU driver subsequently returns -EPROBE_DEFER
>> (because pwrseq_get found 'no match' on the bus for 'gpu-power'), the
>> interpretation is that the AON driver did not register this optional
>> sequencer. Since AON is the only anticipated source, it implies the
>> sequencer won't become available later from its designated provider.
> 
> I don't understand why you made this assumption. AON could be a module
> and this driver built-in. AON will likely probe later.

You're absolutely right that AON could be a module and would generally
probe later in that scenario. However, the GPU device also has a
'power-domains = <&aon TH1520_GPU_PD>' dependency. If the AON driver (as
the PM domain provider) were a late probing module, the GPU driver's
probe would hit -EPROBE_DEFER when its power domain is requested
which happens before attempting to get other resources like a power
sequencer.

So, if the GPU driver's code does reach the devm_pwrseq_get(dev,
"gpu-power") call, it strongly implies the AON driver has already
successfully probed.

This leads to the core challenge with the optional 'gpu-power'
sequencer: Even if the AON driver has already probed, if it then chooses
not to register the "gpu-power" sequence (because it's an optional
feature), pwrseq_get() will still find "no device matched" on the
pwrseq_bus and return EPROBE_DEFER.

If the GPU driver defers here, as it normally should for -EPROBE_DEFER,
it could wait indefinitely for an optional sequence that its
already probed AON provider will not supply.

Anyway I think you're right, that this is probably confusing and we
shouldn't rely on this behavior.

To solve this, and to allow the GPU driver to correctly handle
-EPROBE_DEFER when a sequencer is genuinely expected, I propose using a
boolean property on the GPU's DT node, e.g.
img,gpu-expects-power-sequencer. If the GPU node provides this property
it means the pwrseq 'gpu-power' is required.

I didn't want to use this approach at first, as it seemed to me like the
pwrseq API had a hands-off approach for the DT with its matching logic,
but it seems unavoidable at this point.

> 
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
