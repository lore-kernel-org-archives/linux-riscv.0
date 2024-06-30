Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E1C3065A
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMNHMGTZn/Rl0ajrRq2gozXVCpZyIb0t2g0qCLmP9KQ=; b=H6SQ7khWbtoJY+
	4whcMxNGd3dSKH/CmeRBZBfRVpbMiS6lEH01g+SQ3njxLXR16EymM0z4TK5x7tXTfCjXcDy5XKEvl
	arYogbpt0+WKoUEt+ebDQviBvGyJ/gXhPG6Yco1TXHy8wstzxhfVji5/W19ZYNowbF4o942pjQU1b
	Sn3ulAsoVacTv92GX03YxM6v3syztDUCFTYVMliXC1+UtDooNjtL1sV6xoRVcYS+AuIuLcABdoc0d
	9ePLq261aT+IhIj1f8GA0tl4TgonSlGX/IU87IIUnMpuGmnQFiuJla1r5i5NcFQNvGIt44l3uCEuo
	oTJfxfuSoRS8UrBbdElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNwBh-00000000aEN-0gCN;
	Sun, 30 Jun 2024 15:09:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNwBP-00000000a90-3Kac;
	Sun, 30 Jun 2024 15:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 92848CE0B11;
	Sun, 30 Jun 2024 15:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF39C2BD10;
	Sun, 30 Jun 2024 15:09:36 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 840DD5FD47;
	Sun, 30 Jun 2024 23:09:34 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
Subject: Re: (subset) [PATCH v4 00/12] riscv: Allwinner D1/D1s platform
 support
Message-Id: <171976017453.1183261.1853381079950313116.b4-ty@csie.org>
Date: Sun, 30 Jun 2024 23:09:34 +0800
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_080940_047607_73AEEBC8 
X-CRM114-Status: UNSURE (   8.88  )
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

On Sat, 31 Dec 2022 17:38:39 -0600, Samuel Holland wrote:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
> 
> The devicetrees use bindings from the following series which have not
> yet been merged to linux-next:
>  - In-package LDO regulators:
>    https://lore.kernel.org/lkml/20221208084127.17443-1-samuel@sholland.org/
>  - Ethernet MAC binding fix (not a new issue with D1):
>    https://lore.kernel.org/lkml/20221231220546.1188-1-samuel@sholland.org/
> 
> [...]

Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!

[10/12] riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
        https://git.kernel.org/sunxi/linux/c/0ce1d34678e5

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
