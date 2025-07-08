Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C336C83F09
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tV7vgAulUN7Rag/jWasYAw+Ezi1dDcPnRNq7zYvML/k=; b=aLPBHwgBoialRQ
	VPP8cXMJcdBF7PeW98otiCK1LMP8BA9iXvfiX+mUvmsIkk589CFYSRqhBb3OcMp/bSgMZ5XxGiqVl
	Yih60A96CLlGnaDTPZINVfxOTcA3fiLib/ZiLy5XbfJ7OQN7UalBpPxIki1tvTpsiccjJSeXdaIJx
	bWxeRayM2nfR9/4FYrkjGuZt6OCfBfUtJl//f0zkozOMlffj00NhWRUr+opnEU9AE74jn8JbhFcUa
	n2Rq6MmTA3nuJx3ro+Yq0EgWm++n8QKrATuU9R/xsaoycv4dOytTBsvVSFvEn1ntAi+n7tiHkHWsB
	6R4EsCU7MWeDFtDuWr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Ok-00000005c0A-19IY;
	Tue, 08 Jul 2025 14:34:18 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Oh-00000005bzJ-1ew0
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 14:34:16 +0000
Received: from ofsar (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3A6FC340FFC;
	Tue, 08 Jul 2025 14:34:03 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com,
	Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Date: Tue,  8 Jul 2025 22:33:55 +0800
Message-ID: <175198458423.86859.5882458274157023095.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_073415_480745_68DDA37F 
X-CRM114-Status: GOOD (  11.45  )
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


On Tue, 29 Apr 2025 16:50:42 +0800, Guodong Xu wrote:
> This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
> and updates related device tree bindings. The changes enable PWM
> functionality on the K1 platform through driver enhancements,
> configuration updates, and device tree additions.
> 
> Functionality has been verified on the Banana Pi BPI-F3 board using PWM14,
> configured as a pwm-backlight. Per community feedback, the actual
> pwm-backlight node is not included in this patchset but can be found in
> patch 7 of the v1 series, with modification of pwms property to 4-cell
> format to match updated binding (#pwm-cells = <3>) since v3.
> 
> [...]

Applied, thanks!

[3/6] riscv: dts: spacemit: add PWM support for K1 SoC
      https://github.com/spacemit-com/linux/commit/9aebdfc21f755e0d2766683aa251435fb656ea47
[4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
      https://github.com/spacemit-com/linux/commit/8709d51024068d4c81dc785d63169d283d147cf3

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
