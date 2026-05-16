Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D36BCD4F3C
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiCsB82qk2t0cyxu6gRbkKq8oqb9/n8dyGYD1sIp1yg=; b=dHf36lw88pF7QF
	WiEkDuTHGF47jHOgWa8RP5K10srtqS70gmMHhF1jDm3omzmKQ7M9okq8sbOpppYAJe6MyLPxneojJ
	7+UbrIARBJbCguYlLYIKxBlhuBI4LLU1SGXicfOf6q0DGMcVlV5aTtkzdO0Vj2J1Xb7EVeXqGqwpr
	TblyxM6wKdy8aO2C7wQCqIzyysNH5oP7Y3bJ0YpkOkcza59UsLaBnBaebzaGoxxYHNSuwVM8MSorD
	7f1VVft4o4TuXTRjwhLZ4NGEnSuibUEmTobuhgX7hCQ4SPpMjr1Q1H4A0S4QU4ZG2v00/06rRmsig
	2NiadKueeId9SdiqDvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEfC-0000000AlBe-3GgP;
	Sat, 16 May 2026 13:02:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEfA-0000000AlBS-3ccC
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 13:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AE9860138;
	Sat, 16 May 2026 13:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E40C19425;
	Sat, 16 May 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936559;
	bh=77WaUoBwjMQHCX2qPHR6NX2pZr51q4lprREyCHkAjTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwCfYiyDrpFAVnKVDalO3HQMB6WE5lq7yBA+YnGphpY3dJ5xCQqaHYSaHBolIqRK2
	 oDp0x/bC0xqWZyFyoAyQtkMcwlz14zHPkzoXUnSqenKhVF/Wi8wZSXDnvL8SMHxy4G
	 SXXztuti4dS+YHV7AQeTezGVYVXCK+IbrdaEGAudFh39kTZ1vIo5s9Z2t6vLv4wXpX
	 3BDt1My+XJ0t013Fayjw3oZsUBJslXUax6MnONM0RV+7nL8UAOnfNY+ItFgjpL/p9i
	 sD45/A2IKuw8KYzweJYU6Cj11yWKBaDw+X8Lk2AFtM/gppJSphvnMfM43I2WfOYtlF
	 AAjHjzFgpHQyA==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andre Heider <a.heider@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Sat, 16 May 2026 13:02:31 +0000
Message-ID: <177893645572.2456461.14638110391927688410.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
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


On Wed, 13 May 2026 09:19:48 +0200, Andre Heider wrote:
> Add the missing devices with their required regulators. The regulators are named after
> their label in the vendor schematics[0].
> 
> v3:
> - drop reg_usb_vbus, non-controllable and served only as vin-supply
> - fixed regulator-vcc-4v0 typo
> - fold addition of pmic regulator labels into the pmic patch
> - eeprom is a GT24C02B, fixed commit message
> - added reg_qspi_vcc1v833
> - fixed uboot nor name offset
> - add missing "reg_" prefix for reg_pcie_vcc_3v3
> - drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports
> 
> [...]

Applied, thanks!

[1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
      https://github.com/spacemit-com/linux/commit/e2dac7c7a3a8970feeeb758f782ce86b89625ebd
[2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
      https://github.com/spacemit-com/linux/commit/6bc75cfa56e885c2eab80e215f0a610075505846
[3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
      https://github.com/spacemit-com/linux/commit/735b1b205d07bf7bfa55b1f50f5485b9cc42a251
[4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
      https://github.com/spacemit-com/linux/commit/83c658c7a82304a2bc944cdd4a5b4f98d19322f0
[5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
      https://github.com/spacemit-com/linux/commit/d9ab0a855ba13f1db3ae16539348714c74010a22
[6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
      https://github.com/spacemit-com/linux/commit/f125c6085fd775f09a316f61cc89a0ae86826895

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
