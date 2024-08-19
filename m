Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA9C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnaiGgdJVYapxZnFb/OrW4ilZmNOSqLbdSEf27wlGHA=; b=21Bp+vUVMIqOu2
	xHrc6dSp/V8FH1bg4woiLh8ZdkBEKizE5NxmARkKYiOFjYEscAIjqGy0L98leFr13+7s6tKNwilMC
	OamqpSjz4/kIP30vJfwehG7GpQ38jXpvD7Ru0C/zwAUhowPbnYo5KLrGfz8LK4a7uSQ0kaGAQSGWa
	G7XggFfWN8hm7V44jwi6Ws5gbCPNBvcaaMmjLpQ75dk4kLnq2txqu2xjTXDj1zafjSD2j3plgQOor
	RoF7NvEBL5jTWFTohOgdeaBkyI47R3ZdUHFeyTiTOMqWQJrr4uVkoP99NUpxb+lPg3IMnx+JaNPnY
	gelZMeBSR/oZAhCOcV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5qX-00000002K0n-2U62;
	Mon, 19 Aug 2024 17:07:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5mM-00000002Im3-0Xlx
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 17:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B3B860AB8;
	Mon, 19 Aug 2024 17:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22E0C4AF0F;
	Mon, 19 Aug 2024 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724086969;
	bh=RGK40pSJ+mTnHS9+OBK58y7DvTe2glyBYJ4BRXuqIwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEgHuXlsGs3Y2THjFX0UsWUvqz8RNz4i2l5/QsdilB0Cmf0LxdskL8oNJtm1f5Uh1
	 N2sIzHzwPiQ3w/MKKxwm6HX8dtVWXKew4clHBDvMMoNGWrn2jT5M3JdHjFlWTIfVca
	 lMEVApQxXHQwJ0IrJfsE3PmT3iLGGaHjj4RZh4ElapAktgDEdDcLUNqvgsPkRjU4K/
	 YEHRS75AN+9LOhQqGXpo7ZDEcMBRtkKMqySH+LbVMa39PGWR/UtcE4rlSPKiHxhFdY
	 QXV1JGzgtASdAwAYKZE1oWh1oNuC5LwqfhcH+GhMTiefco5fSJIE3zT7VA1fetC5an
	 rSp+Q2hu03o8Q==
From: Conor Dooley <conor@kernel.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	inochiama@outlook.com,
	guoren@kernel.org,
	emil.renner.berthing@canonical.com,
	apatel@ventanamicro.com,
	hal.feng@starfivetech.com,
	dfustini@baylibre.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH] riscv: defconfig: sophgo: enable clks for sg2042
Date: Mon, 19 Aug 2024 18:02:37 +0100
Message-ID: <20240819-calibrate-playpen-964bfa720a3b@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805023320.1287061-1-unicornxw@gmail.com>
References: <20240805023320.1287061-1-unicornxw@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=D2fSyEFOWYvuTTfY4ODEdjDu6s1u6kETK7bVHrUjoo4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmHq9Y4aew8sY2Rh/nHzd+dG6qdLFWnd+wRyf6q1Zm59 VjWzWXvO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRc5GMDIt/h+cWHE74xMck cOXGwo9fnjU/f1z8Plr99GPuV5pGyi4M/+wYjWadPG5yMVWwnI1tueyKsrnBn11OKla3Bb4+s2/ /fnYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_100250_256181_E8994D71 
X-CRM114-Status: UNSURE (   4.99  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 05 Aug 2024 10:33:20 +0800, Chen Wang wrote:
> Enable clk generators for sg2042 due to many peripherals rely on
> these clocks.
> 
> 

Applied to riscv-config-for-next, thanks!

[1/1] riscv: defconfig: sophgo: enable clks for sg2042
      https://git.kernel.org/conor/c/3ccedd259cc3

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
