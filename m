Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA2C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRX6MiQqEBZUK4sTNyV8ZuoBQkiOW+7GUIPo6kOFLQQ=; b=rONG6kMIqFc8VU
	ZBlDEm71w3ypK5pLGq/ErjIrlSSpiYT2YmQy39nnRAxgOPQZEybnOmCf8fV7oemkdMI0nkePLhEdI
	Vtcb1fRwK/MOVXZjxuPRfWcc+2Mqet8Dsr9XafrUZDkWc6HZZieo6E7hjdwgEQSKNjKqEJRwsNmJp
	1y5mYZVQOerf/sTMNxoqIBx6QiAR0bXFGVSQiOwlfgEdBnZI02buA9o8bGB7C1qNlpGFB2/oToXcw
	pFCTTB07SdNwRPA7A9SD5eEKCPtyhDtNwihhsLP/ne5Cp7pldEpKinftvjGTYJRGnmLBwXrbVOZeP
	+Jm1jS/o11Dj0lB6Wdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWLG-0000000Baj0-01Ho;
	Tue, 03 Jun 2025 18:26:30 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMWLD-0000000Bahp-3PmV
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 18:26:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250603182623euoutp013ca7d39a1cbd666985d203e1b102308d~Fm6m9RMN30062600626euoutp01S
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jun 2025 18:26:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250603182623euoutp013ca7d39a1cbd666985d203e1b102308d~Fm6m9RMN30062600626euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748975183;
	bh=HsAkslRZ/mz8R7VriYKhtD3qm8Kb4EqG51Yi+AM4RuA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=X9e2hQffXHlcBs3dfvPvkQrLggEYJTsmAe+8+QAKfAamU06ubnEV3bIyL+D4ltPox
	 G4DGPvC1TvwssjozwyIWtxDrvwoOZnLmXqA2zBrImFqWErLhwCm1c8+tlnMXkSp8Jl
	 dK/QZHYAI/ksP+kLCq2xD1j916KCBl/QXiJHhxe4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250603182622eucas1p20957d890c72a4bb63dc75d022c0ff0a5~Fm6mRz4zH1760017600eucas1p2B;
	Tue,  3 Jun 2025 18:26:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250603182621eusmtip2f45e802a2c7fce8fbe1d6462a0bb7a75~Fm6lQK_r50715807158eusmtip2Q;
	Tue,  3 Jun 2025 18:26:21 +0000 (GMT)
Message-ID: <a9233f51-6f2d-42a2-ad70-20e3f2890683@samsung.com>
Date: Tue, 3 Jun 2025 20:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] riscv: dts: thead: th1520: Add missing reset
 controller header include
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
In-Reply-To: <20250603-tactful-valiant-mackerel-bfb6be@kuoka>
X-CMS-MailID: 20250603182622eucas1p20957d890c72a4bb63dc75d022c0ff0a5
X-Msg-Generator: CA
X-RootMTR: 20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265
X-EPHeader: CA
X-CMS-RootMailID: 20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<CGME20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265@eucas1p2.samsung.com>
	<20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
	<20250603-tactful-valiant-mackerel-bfb6be@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_112627_981085_FEDE886F 
X-CRM114-Status: GOOD (  11.89  )
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



On 6/3/25 15:20, Krzysztof Kozlowski wrote:
> On Fri, May 30, 2025 at 12:23:52AM GMT, Michal Wilczynski wrote:
>> TH1520_RESET_ID_GPU_CLKGEN and TH1520_RESET_ID_GPU are required for GPU
>> power sequencing to work.  To make these symbols available, add the
>> necessary include for the T-HEAD TH1520 reset controller bindings.
> 
> How would it compile/build without it? If there are no users, then do
> not add unused header just to add it.

The patch 7 in the series need it, so I've added the header.

> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
