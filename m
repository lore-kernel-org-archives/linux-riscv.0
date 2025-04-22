Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C49BC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skuxkYiMjXQMTPy1qH9NLpEWZw1BmvTJ38UZccdPyDo=; b=w948yQ56I9vEfI
	GKvr2oFZBi6zzJ1JoSFwTkFdlnTfj0S17bTbSG0KF8SO03v5t11/vFf6dXNdRVXONA0t2MwvgWWCP
	k1oF5r/4PV63POwXKUhkvPtDVj9pdHjQhCx7qhHzCjfUNO5GCnVVxmK2yHUx45fmfJpYhPthF4jpD
	tvY99Fmo97J58FHKYXUNCPgai8Xk4pb3VcGIf4zqrtuh6/AVwfVrLd7hFmfHSL0OMhNu0z9ndTAOF
	WO24SthTMy0f9pHVQtm6fo5g41UJ/O8rEj2HH1pAGaHgIdngMiERMNI1SeksBeJMZuasUsv/Q3BDF
	mGlL3MQMC5UTjC/sGJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GYk-00000007vJw-2y7Q;
	Tue, 22 Apr 2025 16:33:22 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7F0z-00000007a2O-3c90
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 14:54:29 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250422145422euoutp02a7735923ffdbf9cc6208e624e82b674a~4q7gXhdHo2439124391euoutp02P
	for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 14:54:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250422145422euoutp02a7735923ffdbf9cc6208e624e82b674a~4q7gXhdHo2439124391euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745333662;
	bh=YRW1ozB27p7LSQVL82m2hy5NmybGDZRAWQakTtaYo28=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tSS+p85rHu3lbGT3RxhlyqXghoDTFhaQ3ytGDY2bGXFV2bi0ybgFqObv6NMmvQExj
	 ztg+k/ZjPDQOuvE9Sp9Ya2lxc5EcSHeZdHPbcejTXZhWRj99HzeV8hQ5irPU91+g5g
	 3x4bQLbR/JgX81GV8ayof1BHgyHIbmS1GErj+UzE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250422145422eucas1p2f987a8c414cd947de26e8e6df5c94756~4q7f5urFv0361703617eucas1p2n;
	Tue, 22 Apr 2025 14:54:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 04.BB.00837.E9DA7086; Tue, 22
	Apr 2025 15:54:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250422145421eucas1p2f01bb5cadb9836b26cc5b9bfd5197bef~4q7feyoxh0578205782eucas1p2Y;
	Tue, 22 Apr 2025 14:54:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250422145421eusmtrp2a29928f65b73f47fe7e1ca7f999a9a66~4q7fdxjPT0501605016eusmtrp2H;
	Tue, 22 Apr 2025 14:54:21 +0000 (GMT)
X-AuditID: cbfec7f2-32fff70000000345-20-6807ad9ee550
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id FF.54.19920.D9DA7086; Tue, 22
	Apr 2025 15:54:21 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250422145420eusmtip224b1553af434b83ad7a84489799c4da9~4q7eg8VVw1574315743eusmtip2U;
	Tue, 22 Apr 2025 14:54:20 +0000 (GMT)
Message-ID: <50da445f-d6f9-407d-b25d-5b9c7ccf867c@samsung.com>
Date: Tue, 22 Apr 2025 16:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Add T-HEAD TH1520 VO clock support for LicheePi
 4A GPU enablement
To: sboyd@kernel.org, Drew Fustini <drew@pdp7.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Fu
	Wei <wefu@redhat.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, alex@ghiti.fr,
	"jszhang@kernel.org" <jszhang@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250403094425.876981-1-m.wilczynski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7djPc7rz1rJnGGzYzG3x7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZfOy5x2pxedccNottn1vYLNYeuctu
	cfGUq8XdeydYLF5e7mG2aJvFb/F/zw52i3/XNrJYtOyfwuIg7PH+Riu7x5uXL1k8Dnd8Yfe4
	d2Iaq8emVZ1sHpuX1Hu0rD3G5NH/18Dj/b6rbB59W1Yxelxqvs7u8XmTXABPFJdNSmpOZllq
	kb5dAldGz7k/bAVrZSsu9S9mb2DcLt7FyMkhIWAisX7bebYuRi4OIYEVjBLfJr1hgXC+MErM
	u/6DHcL5zChx/tkdZpiWjp4bUFXLGSUaZ7xlhHDeMkqsaXnGBFLFK2AnMa/xDxuIzSKgKrGp
	fSsbRFxQ4uTMJywgtqiAvMT9WzPYQWxhgXiJH9fns4LYIgJGEo8XPWYCGcos0M8qsXjyQrCh
	zALiEreezAez2YCKHiyHaOAUsJfYMOUxI0SNvMT2t3OYQZolBF5xSpy9O5kR4m4Xic9T7jBB
	2MISr45vYYewZST+75wPFc+XeLD1E9SfNRI7e45D2dYSd879AvqAA2iBpsT6XfoQYUeJsxf6
	GEHCEgJ8EjfeCkKcwCcxadt0Zogwr0RHmxBEtZrE1J5euKXnVmxjmsCoNAspVGYheXIWkmdm
	IexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzB1nv53/NMOxrmvPuodYmTiYDzE
	KMHBrCTC+8uNPUOINyWxsiq1KD++qDQntfgQozQHi5I476L9relCAumJJanZqakFqUUwWSYO
	TqkGJqWSna3FC2apWpX8ODTP1Ku4ZUrL6XzTBYfuc/TEquc76K6MLJqw6oD9gnCNjcZ9T34d
	/bNc9WR3r9Lmy1JT6nyjFgRFPOUxPvRuYd4/Vud7TgWFUllz6/gXiu1xCWIzPHvReMqGMxnb
	Hr877btcQe2G8NJALZvTOVJMl+zuFxj1MMSZhFlfWno7RrjcpMmKuae/38htxq+VP/sv/Taw
	ZPH7soQ7n2nzlsrwsxPyFz1OWLWRSVd70zrdpfePy+3PN743R9j0P+uT6SK3BfQ/hrk4Poy3
	PKwvUro26ahZtMfulxtcjO7xb/O5uXS3Il9Bc5Ff+aGGkoe82u6GS+NmHz7rbflPefm3eQse
	GPfMV2Ipzkg01GIuKk4EABNDGbEMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42I5/e/4Pd25a9kzDB49UrN4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	uHjK1eLuvRMsFi8v9zBbtM3it/i/Zwe7xb9rG1ksWvZPYXEQ9nh/o5Xd483Llywehzu+sHvc
	OzGN1WPTqk42j81L6j1a1h5j8uj/a+Dxft9VNo++LasYPS41X2f3+LxJLoAnSs+mKL+0JFUh
	I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS+j59wftoK1shWX+hez
	NzBuF+9i5OSQEDCR6Oi5wdLFyMUhJLCUUWLfpDZWiISMxLXulywQtrDEn2tdbCC2kMBrRol/
	v0JBbF4BO4l5jX/A4iwCqhKb2reyQcQFJU7OfALWKyogL3H/1gz2LkYODmGBeIm7p0tBwiIC
	RhKPFz1mAtnLLDCRVeLkj5uMEEdMYpR4uWcq2BHMAuISt57MZwKx2YA6HiyfDxbnFLCX2DDl
	MSPIUGYBdYn184QgyuUltr+dwzyBUWgWkjNmIZk0C6FjFpKOBYwsqxhFUkuLc9Nziw31ihNz
	i0vz0vWS83M3MQLTxLZjPzfvYJz36qPeIUYmDsZDjBIczEoivL/c2DOEeFMSK6tSi/Lji0pz
	UosPMZoCg2Iis5Rocj4wUeWVxBuaGZgamphZGphamhkrifO6XT6fJiSQnliSmp2aWpBaBNPH
	xMEp1cDE2LFAb8Hvu9P33F3xoHI797yC6jRVUZ5vJw09jeYbSaZN22yfU9d8mLf5u+Bl1kv/
	lU9eOuawuWzfttPpJxZJ2Nh19mT+fnuCybGeic2SWTrl26zg6Fq1ZKFPSv/uqrref6HIYPXw
	X81H89uSUcJFf/QkGdY9S19ymOv5/4kdVor6/ddlePlP3OBwMY5IU2vO/f+RNevfhisvdnRJ
	G0ekxBZdXntTtt6v7YB4lbKR2wn3ipRlvLu2abEqPmoPiVZpLZmv+f5govThcF75P1c7+R/a
	L7Vl+eN6pj1lgVy56i4BLl/5/61B9y75/Xx96jeXqNj2Tz93KSnPnpy0TOyNa4/k3t/+SkKT
	BFK/tSuxFGckGmoxFxUnAgBtar/ZnAMAAA==
X-CMS-MailID: 20250422145421eucas1p2f01bb5cadb9836b26cc5b9bfd5197bef
X-Msg-Generator: CA
X-RootMTR: 20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa
References: <CGME20250403094430eucas1p21515d7f693708fc2ad0cd399cb0b81aa@eucas1p2.samsung.com>
	<20250403094425.876981-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_075426_169429_0F586943 
X-CRM114-Status: GOOD (  30.98  )
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



On 4/3/25 11:44, Michal Wilczynski wrote:
> This is a subset of a larger patch series enabling the Imagination BXM-4-64 GPU
> on the LicheePi 4A board, which is powered by the T-HEAD TH1520 SoC. While the
> full series includes power-domain, reset, and firmware changes, this part
> focuses solely on the clock subsystem needed for the GPU and other VO (video
> output) blocks. By merging these clock patches independently, we prepare the
> groundwork for future GPU integration via the `drm/imagination` driver.
> 
> The T-HEAD TH1520 SoC features multiple clock controllers. Initially, only the
> AP clock controller was supported upstream. The patches below add support for
> the VO (video output) clock controller, which manages GPU-related gates, HDMI,
> and other multimedia clocks.
> 
> Bigger series cover letter:
> https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> 
> v7:
> - remove commits 3,4 from the patch series, those would handle empty MEM clock
>   stub, and reset management. It's not necessary anymore, as this would be
>   implemented in power-domain driver
> - added the device tree patch at the end for the SoC maintainers to take after
>   the other patches get OK-ed
> - added Acked-by, from Connor for the dt-binding patch
> - re-added Reviewed-by from Krzysztof, as the dt-binding patch is the same as
>   for the v5
> 
> v6:
> - squashed the "dt-bindings: clock: thead: Add GPU clkgen reset property"
>   with the "dt-bindings: clock: thead: Add TH1520 VO clock controller". As
>   a result, also removed the Reviewed-by from Krzysztof, since the new
>   resets property has been introduced, which is mandatory in the VO
>   case
> 
> v5:
> - introduced a new macro CCU_GATE_CLK_OPS, which allows providing custom clk_ops.
>   In the case of the 'MEM' clock, it provides empty clk_nops. Later, this clock
>   is provided to the GPU node, thereby avoiding any ABI breakage
> - used the CCU_GATE_CLK_OPS macro to implement a workaround for de-asserting
>   the clkgen reset only after both core and sys clocks are enabled. This
>   sequence is required to properly initialize the GPU
> 
> v4:
>  - enhanced documentation for new Video Output (VO) clock inputs in device tree
>    bindings
> 
> v3:
>  - reworked driver to support multiple clock controllers through .compatible
>    and .data instead of using multiple address spaces in dt-binding. This change
>    allows to re-use the driver code for multiple clock controllers
> 
> v2:
>  - removed AP_SUBSYS clock refactoring commits (1-6):
>  - instead of refactoring, I opted to extend the current driver and its
>    associated device tree node to include support for a second address space.
>  - resolved all checkpatch issues using --strict, except for the call to
>    devm_clk_hw_register_gate_parent_data().  The current implementation remains
>    preferable in this context, and clang-format aligns with this choice
> 
> Michal Wilczynski (3):
>   dt-bindings: clock: thead: Add TH1520 VO clock controller
>   clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC
>   riscv: dts: thead: Add device tree VO clock controller
> 
>  .../bindings/clock/thead,th1520-clk-ap.yaml   |  17 +-
>  arch/riscv/boot/dts/thead/th1520.dtsi         |   7 +
>  drivers/clk/thead/clk-th1520-ap.c             | 196 +++++++++++++++---
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   |  34 +++
>  4 files changed, 223 insertions(+), 31 deletions(-)
> 

Hi Stephen, I think Drew is already collecting DT commits for the next
merge window. Do you think the patches 1-2 will make it for the 6.16
release ?

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
