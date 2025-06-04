Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A7FC5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMLuSJGsGxHxidvsVrChCKvhYPS2uj6NOPdeiR3JYuc=; b=DWxzI46aHQHekU
	Bzi09Y1Zh5kctwSgjRMvgRT0l9VSqo6PmBDccwuxULfMQkeLnMRwuliob/9t9HTt4yHyxqDaxzVvc
	mnxcyzrH0/MKwAFLnKTDCOV7OuuYmORPSPx+e/R378Gk69ORFlaZktSiQlkDSDnLZkakjgyw6j881
	UuXNsYIBbXj5PkGKLNDkrPvx/f2dohj8pqmIDyyuMkqOEoKfDD1i5lheqrMDQx5+wBg76x0Y4m9Dg
	syzMwVDnb/Y6GjzNrx6mRutUHI3MJWqfv5va5AxYasKpbCjuERWgGXHVomgAzIVNOdJj6TJz/4p3W
	/MjQvDpbP3bU/OyFIQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnQL-0000000DMYT-055G;
	Wed, 04 Jun 2025 12:40:53 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnQH-0000000DMWZ-1XaD
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 12:40:51 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250604124043euoutp01e613986c57db4ff552a34b9b273e55e1~F12FYVVc-1443914439euoutp01n
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jun 2025 12:40:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250604124043euoutp01e613986c57db4ff552a34b9b273e55e1~F12FYVVc-1443914439euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749040843;
	bh=kAukIWR6u4Jom32Pa8uBS4iyUUF+BImaglA4PV9oEzQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=a4gbI2uKh9qSnXTOnisyHBycy4qQuffoUBlkfZVmQG43tehnzN4fdakk6Y0isqje/
	 tqqU+P3e1u06PJ0Qzx2wVKoxUwR9kowkZGrAOL+XMoBDH2Qq7UffB8MS3ZIZBPjRpy
	 olmcUWBNOqbeovuk1A1whOHyaiVBG+9DqWHXci+E=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250604124042eucas1p18959bb4cf78c93c05cdaad2ee125c276~F12Eqw0oR1319513195eucas1p1z;
	Wed,  4 Jun 2025 12:40:42 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250604124041eusmtip29c8ca08943a9ca4c8ebeb77dd5466bfd~F12DrZDyv0267302673eusmtip2e;
	Wed,  4 Jun 2025 12:40:41 +0000 (GMT)
Message-ID: <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
Date: Wed, 4 Jun 2025 14:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
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
In-Reply-To: <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
X-CMS-MailID: 20250604124042eucas1p18959bb4cf78c93c05cdaad2ee125c276
X-Msg-Generator: CA
X-RootMTR: 20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944
X-EPHeader: CA
X-CMS-RootMailID: 20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
	<20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
	<CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_054050_012640_4227D76C 
X-CRM114-Status: GOOD (  18.92  )
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



On 6/3/25 14:27, Ulf Hansson wrote:
> On Fri, 30 May 2025 at 00:24, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
>> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
>> the GPU using the drm/imagination driver.
>>
>> By adding this node, the kernel can recognize and initialize the GPU,
>> providing graphics acceleration capabilities on the Lichee Pi 4A and
>> other boards based on the TH1520 SoC.
>>
>> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
>> controlled programatically.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
>> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>>                 #clock-cells = <0>;
>>         };
>>
>> +       gpu_mem_clk: mem-clk {
>> +               compatible = "fixed-clock";
>> +               clock-frequency = <0>;
>> +               clock-output-names = "gpu_mem_clk";
>> +               #clock-cells = <0>;
>> +       };
>> +
>>         stmmac_axi_config: stmmac-axi-config {
>>                 snps,wr_osr_lmt = <15>;
>>                 snps,rd_osr_lmt = <15>;
>> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
>>                         #clock-cells = <1>;
>>                 };
>>
>> +               gpu: gpu@ffef400000 {
>> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
>> +                                    "img,img-rogue";
>> +                       reg = <0xff 0xef400000 0x0 0x100000>;
>> +                       interrupt-parent = <&plic>;
>> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&clk_vo CLK_GPU_CORE>,
>> +                                <&gpu_mem_clk>,
>> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
>> +                       clock-names = "core", "mem", "sys";
>> +                       power-domains = <&aon TH1520_GPU_PD>;
>> +                       power-domain-names = "a";
> 
> If the power-domain-names are really needed, please pick a
> useful/descriptive name.

Yeah they are required. Even though this convention doesn't seem to be
enforced by the dt-binding it seems like it's hard-coded into the driver
330e76d31697 ("drm/imagination: Add power domain control"). So I don't
think I have any choice here.

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
