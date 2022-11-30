Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157EC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzFdAaoDChbg5W4dlZrgCqSUyWQrWMqoVFIrFYF3aqU=; b=VPD/Dz+h+mgSwZ
	l3/QarfKQ59VwDHYUOHLU90g8o13VZNxOCVU0S7H+A64PzuG6H8s6WjyAcL88GBlW0D6Crum+2gCU
	hkH6WSERNr7cIyj2LguqlRSK75Es6Ez9I6HjKBi2yCYZoWW+vHTq/syQQ9H6K+PJAyCvAHerYp48V
	kDOXnyfuaEh94hYxNHeEgkh7js3bPTHCgSCGGjjk+vGEzcGYY+4+09y7kpHms2f5TOQDXERj4tu37
	bvdYaUhpOxEVBwrJqdAcf67nfmuqhTyRDhH0hKp1TSzlFLyZOkLAMVyGANL7uAuLZW37hILdGDnJQ
	rqw3xYydxj7QEzG96etQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HTO-00E7Gn-6Q; Wed, 30 Nov 2022 07:25:38 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HTK-00E7Ei-GE
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 07:25:35 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BF5F332008FE;
	Wed, 30 Nov 2022 02:25:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 30 Nov 2022 02:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669793132; x=
	1669879532; bh=7jCQGR0xy6Fkh672DFHxOw50RlZJiRPWysOecK1wOw8=; b=k
	aMSJfphW6+/085SOqXaR1v5j3gYqHdwXRO3UWXeqKm0sI22YTLVg1zZxu4q8Mian
	NBoZ/YmBEuYu2d4eisUFlVx0ZOmJXhhwaoYIsgp/99BwYb+Vor9m2Ffi7Hk/r4U9
	SxtngMe+h013xAkljyl+0ovCGZkZ42y9MCss/iUzxd1YRPpSM7XgIvbdUcuHwrOV
	r4f/Lr3ZWBDr+w8vTMU3H8z/islNut8v8E6jntzUqh403U4PDeF6Sxes74y4V9R+
	wFueQVLNh+sc7iZ58oQwE8mhNH1VMx54n8KzhYPV9s+bzaYWb2lTUf8TyS5Mg85x
	DUVu7mTp8vE0OYfXcNInw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669793132; x=
	1669879532; bh=7jCQGR0xy6Fkh672DFHxOw50RlZJiRPWysOecK1wOw8=; b=Z
	f7Fw9YpciDY0tKXZmMdllDr3lTxLjh1f3gANVehv7WIvTk0Oo7rcD0IfFVjOSodP
	1rgPCzcif5rQGPtDoP/ZDlLKUPQe0C19R/CM4SuLiQWLVeCu/dyI2lN0ebpJXYpZ
	Xd8JxtOd5yg8pDVin3Nc3SDlni8baJtffS0mRmLgJGXMicKfaZwyMjVFCUBGk65q
	gZH3guPITWL/0BY9nXmied32Yky3J4/l3AMsHerwCPcrsd4npfrUPrl8PqjxPSQg
	FmXMGn6A/GdXKAiMiFhSWsabm93o+YY6SsaKlwmMXi0q3LoWx4IEYn9n1+osL306
	L8g/SUdzpuLqgHDyR7pHg==
X-ME-Sender: <xms:awWHYwtXr7G608ybY4KEM1S8_Pp4UiYRiF89zHNbX-jVt9DE_qy8cA>
    <xme:awWHY9cN9j8EWtukGNQGjF-tiwVdR9x3q090LNeq8pGhqsuUjFYbzVn6kcI19G8WR
    8CvXHNtu9g5IlwEvA>
X-ME-Received: <xmr:awWHY7xmx3dP7lnpCvcaqk-hhIZN8MuwqaIDOKTzNmoaMNfG-51lsB36Ut1Sun3rLOG3VEDdcTEyHKWeElTfTtXiodkVDIU3EzTYaD1y6bzocP_lHVtD7auPxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddvgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:awWHYzMSZyjHp1FBAhPdwa80yMTvWE6Du6GfryRjoCm1WOsYavgIxg>
    <xmx:awWHYw9WhAsKWrDpe-CWa42Vjk4Yc7Sq9Y5CL4ykausET5npobLEFw>
    <xmx:awWHY7W6ZKVwOu7qM_AhZrj71OI2rt6It3KQKRwkhvA933xTLraHng>
    <xmx:bAWHY7WCfNQvf4xaRNoPuUVmmKkIR9MO97xIw9rQ_b1I7AJ-WSn9uA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 02:25:31 -0500 (EST)
Message-ID: <91d7eebd-7433-c06d-6d14-a01d11af9df9@sholland.org>
Date: Wed, 30 Nov 2022 01:25:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 7/9] riscv: dts: bouffalolab: add Sipeed M1s SoM and
 Dock devicetree
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-8-jszhang@kernel.org>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221127132448.4034-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_232534_601061_EEA2DD75 
X-CRM114-Status: GOOD (  18.53  )
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

On 11/27/22 07:24, Jisheng Zhang wrote:
> Sipeed manufactures a M1s system-on-module and dock board, add basic
> support for them.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
>  .../dts/bouffalolab/bl808-sipeed-m1s-dock.dts | 25 +++++++++++++++++++
>  .../dts/bouffalolab/bl808-sipeed-m1s.dtsi     | 21 ++++++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b525467152b2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += bouffalolab
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> new file mode 100644
> index 000000000000..5419964e892d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> new file mode 100644
> index 000000000000..c6b4894a7b88
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808-sipeed-m1s.dtsi"
> +
> +/ {
> +	model = "Sipeed M1s Dock";
> +	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bouffalolab,bl808";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:2000000n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> new file mode 100644
> index 000000000000..5026de768534
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808.dtsi"
> +
> +/ {
> +	compatible = "sipeed,m1s", "bouffalolab,bl808";
> +
> +	memory@50000000 {
> +		device_type = "memory";
> +		reg = <0x50000000 0x04000000>;
> +	};

The PSRAM is part of the BL808, so this should go in the SoC .dtsi file.
(Unless I'm missing something and there are BL808 variants with
different amounts of memory. The PSRAM init code in the SDK does size
detection, so I suppose it is possible.)

Regards,
Samuel

> +};
> +
> +&xtal {
> +	clock-frequency = <40000000>;
> +};


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
