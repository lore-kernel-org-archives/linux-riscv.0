Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D41C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mWHSR16h0ueAra4iGbk+3HSmKjYcOR5Rokr3dF5nYI=; b=v0geF/Xy0xqcFe
	phbS9xI+T1/2NuYIrsL4cQcf+c6wDwizGDxPllz+I8mOh0r0kQbA+IGE6oNNU6cceegfiP3Q76YEO
	/B4uGBA7xekfBr819V+RUnU9w9vLKHg8gh7djwwU0bdfVVtADqjtuDaBNB4LouLr4NGScFW8oO4Jt
	83NXVz4COwhr867Q75sUJiLgMBOuKklsC1pJr9CsrLeesCv7w6Gn4RKvWY+bcTuxhxcGlDLIaRG0e
	BNaV98SL8RdWxCX8fA464jeOJm1bHoHkI7qrMKexvmrg1bvcST+nWBU7+A756XY2Q4BhnvSBCP/Wm
	a1RiU2RwDRJn63Uy4zAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNeL6-002gKm-Jk; Mon, 15 Aug 2022 17:57:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNdf8-0027BY-Oq
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 17:14:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNdf2-0005Ey-N0; Mon, 15 Aug 2022 19:13:56 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 05/12] riscv: Add the Allwinner SoC family Kconfig option
Date: Mon, 15 Aug 2022 19:13:55 +0200
Message-ID: <2195565.3ZeAukHxDK@diego>
In-Reply-To: <20220815050815.22340-6-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-6-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_101402_909663_51663A2C 
X-CRM114-Status: GOOD (  13.33  )
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

Am Montag, 15. August 2022, 07:08:08 CEST schrieb Samuel Holland:
> Allwinner manufactures the sunxi family of application processors. This
> includes the "sun8i" series of ARMv7 SoCs, the "sun50i" series of ARMv8
> SoCs, and now the "sun20i" series of 64-bit RISC-V SoCs.
> 
> The first SoC in the sun20i series is D1, containing a single T-HEAD
> C906 core. D1s is a low-pin-count variant of D1 with co-packaged DRAM.
> 
> Most peripherals are shared across the entire chip family. In fact, the
> ARMv7 T113 SoC is pin-compatible and almost entirely register-compatible
> with the D1s.
> 
> This means many existing device drivers can be reused. To facilitate
> this reuse, name the symbol ARCH_SUNXI, since that is what the existing
> drivers have as their dependency.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
