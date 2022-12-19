Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF36C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 11:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77EU04YJrOGtgpDdIAsZUKvD4ad1RcPFqE+4kY4sFWs=; b=PudA5eB5fGp308
	FZ0KZ2FRJoTrMqkSsI1Pi04DWqkZDawRwYNVNihoubBhEPRJtL1l2Q7bQ5p4nEzPdpkujMP9bHfDd
	IEPAyLzQf6vCYSHcZvgjQG5KCOsviDfv2w5TlFz+4AH3J78uDb6rvxTx51byiTkUnKleK35c0nxPx
	3+MlJBgEonUP+mSvF8atCIsIALiSAHUG4QzbyPnS33D0KUne+8SYC3KVvX1PjvXwDZoHGKddDschp
	fnd611mUrjKKeIIqNfbf/ji2LrpMAqJz2YNzLrzR3GIdcSRuQiXRQV6GzySYhCR8AwJXaTYAkFAtD
	pXnl2ix5308qaRSDFQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7E5F-00CQ4P-M7; Mon, 19 Dec 2022 11:13:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7E5C-00CQ0x-GN; Mon, 19 Dec 2022 11:13:24 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p7E53-0004q6-7Z; Mon, 19 Dec 2022 12:13:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 00/12] riscv: Allwinner D1/D1s platform support
Date: Mon, 19 Dec 2022 12:13:12 +0100
Message-ID: <7683309.EvYhyI6sBW@diego>
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_031322_613328_101FA081 
X-CRM114-Status: GOOD (  17.99  )
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

Am Donnerstag, 8. Dezember 2022, 10:02:25 CET schrieb Samuel Holland:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
> 
> The devicetrees use bindings from the following series which have not
> yet been merged to linux-next:
>  - In-package LDO regulators:
>    https://lore.kernel.org/lkml/20221208084127.17443-1-samuel@sholland.org/
>  - Ethernet MAC binding fix (not a new issue with D1):
>    https://lore.kernel.org/lkml/20221208061616.7806-1-samuel@sholland.org/
>  - TI ADC101C ADC (accepted, not yet in linux-next):
>    https://lore.kernel.org/lkml/20221125220903.8632-1-samuel@sholland.org/
> 
> The only remaining DT validation issue is that gpio-fan is missing a
> YAML conversion, although one is on the list here:
> https://lore.kernel.org/lkml/20220126200350.3633576-1-clabbe@baylibre.com/
> 
> $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-musl- dtbs_check
>   SYNC    include/config/auto.conf.cmd
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb
> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb:0:0: /fan: failed to match any schema with compatible: ['gpio-fan']
> 
> Note that validation requires dt-schema v2022.12 or newer.
> 
> I tested this series (DMIC, Ethernet, LEDs, MMC, PMIC, touch, and USB,
> all where available) on the following boards:
>  - sun20i-d1-devterm-v3.14
>  - sun20i-d1-dongshan-nezha-stu
>  - sun20i-d1-lichee-rv-86-panel-480p
>  - sun20i-d1-mangopi-mq-pro
>  - sun20i-d1-nezha
>  - sun20i-d1s-mangopi-mq

I've re-tested this series again with the current merge-window state
(riscv pull already in) and everything still works nicely.

So all tags still hold :-)

Thanks
Heiko






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
