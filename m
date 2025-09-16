Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA42CAC59B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOwHoGV0A73tLDXm+RYHZYxXSp6yU/hwIgdCsAdXQC4=; b=kfd9hPZlrwO0tp
	GSIDMNgZEZdmQNgDwqMLFtju63qh6JLwDwTMMcwU7T9i0oyJLyfqfc5C8yvq2ZnKbT4OcEBfFvPuc
	i6JaueSKRa6tCX2Zr1wgQlERpJGXJl+y6GsWSJolYD+hp/HFb1ErC0UEpeaPRwNO2GSjMGtBrzgx5
	eavYfvKHU1P+e4oxVHgznw43FMNhMl2Y8a+GYBst1hkY/drgf912Q46Px/OhEBqhuczv9IAxM6eH+
	BUC8lUsAemGnIZX+xbpPcziqZbVIH4yX0NmGU0apTpoioYrilZHIRXu3aNgEwBgdZ9ZzUTIu7Xbmj
	2LIhg0n3OO8ol87eHJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybTD-00000008seR-3J9S;
	Tue, 16 Sep 2025 19:36:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybTC-00000008seE-0xrj
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 19:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A501E601B3;
	Tue, 16 Sep 2025 19:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08295C4CEEB;
	Tue, 16 Sep 2025 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758051365;
	bh=ghR7W+6OUpqFqZvySPtXRRnnWTRyswPrma1f/7NfxfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pf+xkC50Z8w4iBf8i4FVLF3nUB0UJUEQdWf/4ouPzp5iPOPJmQ8V2v8/3+Y7IuYeO
	 DWSsLPh1zYyuWBHoIMNsuqCOBgsVxJQieY/qdXr42pPNBNzLCbJiSiM2kJdtn9LKie
	 OX2/rNKyQyUfaY4IXH4k14gM0jHh5tsRRZNR2IhnG515xl74jO1xeJl+9usTADlKF8
	 FZ6PBCfXVx6y5enFbWzuP58bJ+Qe0bI1SI6VnKDx8HZ1xeppFpIqaHXOBVo/JjNHtq
	 XB7vNgIQUNr8/+sYMv2Nju/IwTa1CJa9ZZR1P17hgLSXSId13VXNiItS2qruv53nJm
	 xKibcABpOHQAA==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v3 0/5] riscv: dts: starfive: Add Milk-V Mars CM (Lite) SoM
Date: Tue, 16 Sep 2025 20:35:56 +0100
Message-ID: <20250916-evacuee-postbox-8b576a82e868@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905144011.928332-1-e@freeshell.de>
References: <20250905144011.928332-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jlPwUGixLoNmykuR6H7mnfwCfEkNvHVsl2XHNQnmeWE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBkn98jUzrz69YiyxrTMLXtOXtDxWOLScl7m/6tpqSETB Apf1/1/2lHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJdO1lZGhcxRnjWLt+J882 Nr97R+3f2a74fdv8gtBDmW+NRimb0+czMmxffeaU9ePLAgbc9w5l9eZeiyxhOn3Uhm3b7gQHx52 r+tkB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Fri, 05 Sep 2025 07:39:38 -0700, E Shattow wrote:
> Milk-V Mars CM and Mars CM Lite System-on-Module both are based on the
> StarFive JH7110 SoC and compatible with the Raspberry Pi CM4IO Classic IO
> Board carrier. Mars CM Lite is Mars CM without the eMMC storage component
> on mmc0 and the mmc0 interface configured instead for SD Card use. The
> optional WiFi+BT chipset is connected via SDIO on the mmc1 interface that
> would otherwise be connected to an SD Card slot on the StarFive
> VisionFive2 reference design.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/5] riscv: dts: starfive: add common board dtsi for Milk-V Mars CM variants
      https://git.kernel.org/conor/c/651b30c58775
[2/5] dt-bindings: riscv: starfive: add milkv,marscm-emmc
      https://git.kernel.org/conor/c/d1829e0b2f06
[3/5] riscv: dts: starfive: add Milk-V Mars CM system-on-module
      https://git.kernel.org/conor/c/8d193bc0aa2e
[4/5] dt-bindings: riscv: starfive: add milkv,marscm-lite
      https://git.kernel.org/conor/c/12a29108384c
[5/5] riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module
      https://git.kernel.org/conor/c/4cce8b2503ab

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
