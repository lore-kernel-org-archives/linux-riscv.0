Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38420C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 03:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9akAqD9tnt8Tk+4x6ce8fFPbvgf9tJja+MIxsSxO18=; b=VHEG0+pW6UmkL6
	LMgoaNXsWMybncFGquSff59lw4+Z1NGilqZG5rDPZDF8uX3Tdw0krqyL3m4BxzFwBjQKbYYn2Rlno
	CZWhvT8evr8wcFQBZD/v1ikLXBQmy4q6xKoykF88CHAZibwRaL1APAeRfi57IrZxffgV8KehmIjlb
	nQbzj1l2ntGk7sXfAG7cJ4d3BdzdRwQDKsgXSA7qaW01Tu1Pfrlytfvjs5a7QtsUgJG6jsPrrmPsO
	BqmmkKpsVYocPiVdSgtN2S0UNlyIOJxDHl7Op7G4Smcov0vD8qIvhw/0WjP0vgrPw9jfRTP4gjWQK
	arbvYWYt33DQxDk2J8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzrDE-00EzrR-1L;
	Fri, 19 May 2023 03:55:28 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzrDB-00EzqU-34
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 03:55:27 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 89A183200939;
	Thu, 18 May 2023 23:55:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 18 May 2023 23:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1684468523; x=1684554923; bh=byztbFA48B3KxHPg1sNTP78K/kX6ebZPCxC
	FL17BNsI=; b=VeubOW9IoaUT+cfDj52XkwOHqR2mMFzs3B5FSpvVha0jhVxP975
	Sc4ypiXOaoz2JlTDehwz3nWv7jfbNU2K6j2I98yAHzZs6S0AO4+eB9MSL8oWWahi
	IwQgDJRNcaspN5I2E15Psm0DBHK/pJeHMGQlhUk2Y5YFxbU1/rZuZuh8qSLXTE5A
	yEWLy2f7l50VOVWQt2/1Kwt36c34Z2lwgbMswOQlVo9sUoBdsfEym+YlYDr2nu+O
	/gi8z98ex0mVDbh30y3M47FU0F/uejT4G4VK/J/L9mHVzEH/SmjcxOplfi3HqvFu
	/uywWlqUB19P9TkkMwJDlU8qekPc6nIpW9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684468523; x=1684554923; bh=byztbFA48B3KxHPg1sNTP78K/kX6ebZPCxC
	FL17BNsI=; b=OsGunvFkz89A3yayg/F6UZXWa7cZffMH9zAs4O+3UB/cGhaVo6t
	f8y1uwFmWUdbgUDj06+P6EjYnHLOE51FSaL5wBrxBSkSrEoMX2k3EPfOVvMzZZzQ
	CEYA53qW8Y3lEPFupEZ/DgDsqmKcUpB2KsLqRwJxmOfNIQHYfpCA4/DpRbN1mN3G
	AbK8DKcfMqY7G+Cbg4g0UxNCk7A1YjOA8jzpyrsYPvhb85wKfQTDrNZHvmYJ0Blw
	kQaF8Z1cM2TmVDR4wMddlvvA+KIHjUuCceQ+YFsTvVWBqy5Iydna3pXEHLFCG69r
	1SZ5GUOHblDe0Qc0QBhMpvwJ46Y9jz0RxoQ==
X-ME-Sender: <xms:KvNmZAFcYMHe6CHXlxP1f_tEJNKvoSyWQoES9cJBT5Fl1dm8ztIO8g>
    <xme:KvNmZJUukt-K07EMi5APzmOLOtC_INf4bkdRlG_vg9hrQip8I-MjlE1ExZ_o2QhA4
    Xy2Q-zK7CARx5SoHw>
X-ME-Received: <xmr:KvNmZKIL1KWEOGvW1ky3Tae8ruTdfp6h4BYwwafQMpJXc0ebOS1G9H41snbhSrhqRojATz4fQAw21BqwxagXIWTgjUOIoGStJdxvTPNqOBtgEFvq4e4m0AzICA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:KvNmZCHs95dhuqt0_oAbHXu74cPxXtHRZL9yhOqC4sy6eb8Cco0jJQ>
    <xmx:KvNmZGX0ZPsLDmtYhQ-_ENDuRj3mhEE2N4QVvoXuaBjRBi9uVGclmg>
    <xmx:KvNmZFNpkSFSaOymGQn6O956MtZ3T7nsY5zgIJt2qD9pygVJp-8TTg>
    <xmx:K_NmZHvZU-94xKXJVSPZ5rcSoeaxN0JqgIHKGFLJ3JrVLkwSqWihgg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 May 2023 23:55:21 -0400 (EDT)
Message-ID: <dfa99943-3bca-ec6d-7152-fc6465181a08@sholland.org>
Date: Thu, 18 May 2023 22:55:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 08/10] riscv: dts: bouffalolab: add Sipeed M1s SoM and
 Dock devicetree
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-9-jszhang@kernel.org>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230518152244.2178-9-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_205526_189690_F238B2CF 
X-CRM114-Status: GOOD (  18.30  )
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

Hi Jisheng,

On 5/18/23 10:22, Jisheng Zhang wrote:
> Sipeed manufactures a M1s system-on-module and dock board, add basic
> support for them.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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
> index f0d9f89054f8..133e6c38c9b0 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += allwinner
> +subdir-y += bouffalolab
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-y += canaan
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
> index 000000000000..aa6cf909cd4d
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
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial3:2000000n8";
> +	};
> +};
> +
> +&uart3 {
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

Especially since the SoC contains three heterogeneous CPUs, the firmware
may want to divide the PSRAM among them, so I do not think it is a good
idea to define this statically. (Or would all of the DTs contain this
same node, and then use reserved-memory nodes to cover the other CPUs'
allocations?)

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
