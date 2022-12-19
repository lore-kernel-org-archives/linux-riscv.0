Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jNq3MxNEfNwp5srMaylTNuoYp4FdHxFIOKpHdFhQeU=; b=Rl1hn/8C/Rzhsi
	2q46PWvVtRMGS3L1CYKoybkFTAXb04YSdJfd+B8aN4euiah39UbMLLdsnzrNspGXtVTPUqvtzXwpH
	OWggEOmpoG89GbSlvx3y6gWc0/UYQ715HXdyOAec8kftiKMUBnGiXYdtgz1RdNdkqf1KURLHE9z38
	z4S61clN3tpHG1STWm0x0nq8yffGNW1jctsmwky+pKzpwhtdFTXhRQQ/ERgqx1Zh0mzgs4P8iqsdE
	7MrEp7mY136IIhtToRJmb5aMwcmGaKLjUppctvnvbc5XLZwi4t9IgbWbx8z6pDTwOQ0WF8+zxaEPr
	LXrxG9gt32se3f70NhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Do8-00CDpa-24; Mon, 19 Dec 2022 10:55:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Do3-00CDj6-R9; Mon, 19 Dec 2022 10:55:42 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p7Dnp-0004jl-4H; Mon, 19 Dec 2022 11:55:25 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 12/12] riscv: defconfig: Enable the Allwinner D1 platform and drivers
Date: Mon, 19 Dec 2022 11:55:24 +0100
Message-ID: <8374887.T7Z3S40VBb@diego>
In-Reply-To: <20221208090237.20572-13-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org> <20221208090237.20572-13-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_025539_929738_A5A9249B 
X-CRM114-Status: GOOD (  10.49  )
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

Am Donnerstag, 8. Dezember 2022, 10:02:37 CET schrieb Samuel Holland:
> Now that several D1-based boards are supported, enable the platform in
> our defconfig. Build in the drivers which are necessary to boot, such as
> the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
> and watchdog (which may be left enabled by the bootloader). Other common
> onboard peripherals are enabled as modules.
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
