Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DFCC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUtI1TzGN5khljBRv4eG14UwgaFKgLrmZfi/Eazq30k=; b=AFM5YJqjJQ0VCY
	+DTsYMuzUEAbVv2ylAX4pfdiWnBU7UPoCeaCOn8B+0LDGMUaiMYReGa2iBxz4w70JuWUwl/IBfW5L
	UXMrWD3uI7zKbxskYynGnic53Kf9GwwRPhgmbRkJmLLXi3WQKg8f2Y/+R3P+fz0bWm/f+ipJaekKD
	RJoC/0egIjYMNPSFsFlzemDIjFkKKtb1DoQilTdVK4s2agijKXlNZtG1vhbe8DNo6rtPxpkbz92DX
	ikRpVd8LJTvz6Pmn2VIl5zjCOjAT+ZKENCtDJE4ILkiV96z7ip8ITw1HXUujRWGtSwPmt8nFIOazq
	RTqIWnnhSBEPS8tpq8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3T-00000009Tkp-2KUa;
	Wed, 25 Jun 2025 17:37:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQVL-00000008rXG-1U6K
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 13:49:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250625134929euoutp02b349c9228afa2875b1b389e232217245~MTVHyKOJd0605806058euoutp024
	for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 13:49:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250625134929euoutp02b349c9228afa2875b1b389e232217245~MTVHyKOJd0605806058euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750859369;
	bh=jet5Z3oHYs+Jf13HfgUgZVZFfowNJyNZZd5QLwXLsCI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HQu6sHKvhjbMr5lVaeA2ReHrbImqud2jLsnzmbuml9ACbzaa475kFfb4bRZhxtkjP
	 wfTM9ksJ1g/EW7ECpOw0oD8J4CkvTPk35uwYRm2pD5qresCgjM2Ah9dhritgHugYhV
	 7hcnLuPtoyD8WqwSCzTGcorGSLk89uvlduamNDPk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250625134928eucas1p20116c6f28849c9efd79be3d1c9f83e6d~MTVG8cjqV2648326483eucas1p2s;
	Wed, 25 Jun 2025 13:49:28 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250625134927eusmtip15bc8d3e11211e663cc281314615c3b89~MTVF7n4xZ1371313713eusmtip1E;
	Wed, 25 Jun 2025 13:49:27 +0000 (GMT)
Message-ID: <4e2e770a-0b94-4c73-a98d-ce14c3e3c364@samsung.com>
Date: Wed, 25 Jun 2025 15:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
	Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
	Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <a265a20e-8908-40d8-b4e0-2c8b8f773742@imgtec.com>
X-CMS-MailID: 20250625134928eucas1p20116c6f28849c9efd79be3d1c9f83e6d
X-Msg-Generator: CA
X-RootMTR: 20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2
X-EPHeader: CA
X-CMS-RootMailID: 20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2@eucas1p1.samsung.com>
	<20250623-apr_14_for_sending-v6-4-6583ce0f6c25@samsung.com>
	<a265a20e-8908-40d8-b4e0-2c8b8f773742@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_064936_632304_A6F28328 
X-CRM114-Status: GOOD (  17.09  )
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



On 6/24/25 15:53, Matt Coster wrote:
> On 23/06/2025 12:42, Michal Wilczynski wrote:
>> Update the Imagination PVR DRM driver to leverage the pwrseq framework
>> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>>
>> To cleanly handle the TH1520's specific power requirements in the
>> generic driver, this patch implements the "driver match data" pattern.
>> The pvr_soc_data struct, associated with a compatible string in the
>> of_device_id table, now holds pointers to platform-specific power_on and
>> power_off functions.
>>
>> At probe time, the driver inspects the assigned power_on function
>> pointer. If it points to the pwrseq variant, the driver calls
>> devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
>> probe on failure. Otherwise, it falls back to its standard manual reset
>> initialization.
>>
>> The runtime PM callbacks, pvr_power_device_resume() and
>> pvr_power_device_suspend(), call the power_on and power_off function
>> pointers. Helper functions for both manual and pwrseq-based sequences
>> are introduced to support this.
> 
> Hi Michal,
> 
> My apologies for not responding to previous revisions of this series. In
> general, my main earlier complaints were already addressed by others and
> the series generally looks good to me.
> 
> Just a few notes from me in this and subsequent patches.
> 
>>

Thanks for the feedback.

I will send an updated revision based on the linux-next and skip patches
that have already been applied to Ulf's and Bartosz's trees.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
