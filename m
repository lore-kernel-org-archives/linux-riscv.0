Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8935C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3VVP/4e7pvqjdeVp75TN23VE+xmouGXxd2OUqtZ99g=; b=nmA7r2a5htoX1+
	x5OrfTEgvOLjtlzt8XzHEPHCeKZYBhaSaP3O6kyvFyeTjQfoHJsXh4xyTebC1F23i9nKyn6ToaqRk
	cGvOe5DwtQwvZMwhQBjv9/u3A6NYVq0ZNY/4pIF37fBx0H41kYY3nvsAiEHdujsDpB/OY6XBZc5sR
	+VMNvtvcSdIYRRdX6lCXeNfaKvumwDMA7FZR7PH9vdt3NMQeEcq9obgSTLfN3y5Rt7xHw2ir+jbYY
	oQAa55zy3ll70mc3pLMiFJBCpT4GE+o9un1mgGvZqiaIjB9s6YiYK+ONwoLXazNcf9o72KDEyV3S/
	JOMwutzZnbHExFqLgVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWOi-0000000BbR2-3kly;
	Tue, 03 Jun 2025 18:30:04 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWOe-0000000BbNv-3EEs
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 18:30:03 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250603182958euoutp0143743a4579062b5f432dfefd1d771735~Fm9vQWC5_0203202032euoutp01V
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jun 2025 18:29:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250603182958euoutp0143743a4579062b5f432dfefd1d771735~Fm9vQWC5_0203202032euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748975398;
	bh=Q3UHhcvNg9ZUzuZPlUDNEg5b/5o+/vY1pkJ8HrgEMqE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Vkf4K+NnAWakwW+l5clmnHU0d5flDuEKOS1rfOm5nh5RXqFPGbAtb7sekDIYLLHQw
	 bkrYCcDsXavwkWoTKBsVdIEGo3+CTnzgOygn+1ftLlinfSyzhEVIkpMzsvmH/Yqg+p
	 mk047vU+F4qkth72Ngdq4HIWzByUVZJLwxWgZGwA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250603182958eucas1p2fcaf0880cbecd666386f03a525781254~Fm9usPXYJ2435224352eucas1p2F;
	Tue,  3 Jun 2025 18:29:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250603182957eusmtip1ac2a95b29e9017eb56f62c082e9dbfcc~Fm9tvR43j1164311643eusmtip1N;
	Tue,  3 Jun 2025 18:29:57 +0000 (GMT)
Message-ID: <00abf302-cc8c-47c7-8444-ea3791f70436@samsung.com>
Date: Tue, 3 Jun 2025 20:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
	Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
	Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAPDyKFqL9Xpau1BDnaa828s066zj=aVOAQOy1tCS=ztKN0ZsfA@mail.gmail.com>
X-CMS-MailID: 20250603182958eucas1p2fcaf0880cbecd666386f03a525781254
X-Msg-Generator: CA
X-RootMTR: 20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58
X-EPHeader: CA
X-CMS-RootMailID: 20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
	<20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<CAPDyKFqL9Xpau1BDnaa828s066zj=aVOAQOy1tCS=ztKN0ZsfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_113001_403441_F9FDE496 
X-CRM114-Status: GOOD (  20.76  )
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



On 6/3/25 14:25, Ulf Hansson wrote:
> On Fri, 30 May 2025 at 00:24, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> This patch series introduces support for the Imagination IMG BXM-4-64
>> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
>> managing the GPU's complex power-up and power-down sequence, which
>> involves multiple clocks and resets.
>>
>> The TH1520 GPU requires a specific sequence to be followed for its
>> clocks and resets to ensure correct operation. Initial discussions and
>> an earlier version of this series explored managing this via the generic
>> power domain (genpd) framework. However, following further discussions
>> with kernel maintainers [1], the approach has been reworked to utilize
>> the dedicated power sequencing (pwrseq) framework.
>>
>> This revised series now employs a new pwrseq provider driver
>> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
>> encapsulates the SoC specific power sequence details. The Imagination
>> GPU driver (pvr_device.c) is updated to act as a consumer of this power
>> sequencer, requesting the "gpu-power" target. The sequencer driver,
>> during its match phase with the GPU device, acquires the necessary clock
>> and reset handles from the GPU device node to perform the full sequence.
>>
>> This approach aligns with the goal of abstracting SoC specific power
>> management details away from generic device drivers and leverages the
>> pwrseq framework as recommended.
> 
> Just wanted to share my view. I have looked through the series and to
> me this seems like the correct approach, nice work!
> 
> Feel free to add my Reviewed-by tag for the series, even if I think
> there may be some comments to address from Bartosz etc.

Thanks for providing the direction and reviewing the code, the pwrseq
API seems to be perfect to achieve the goals of this series. Appreciate
your help !

> 
> [...]
> 
> Kind regards
> Uffe
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
