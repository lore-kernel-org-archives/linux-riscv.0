Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714AC27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FkHbGppE2IKTenAlVJPDXW92boyqZiNK243ZPs5pUA=; b=Tpozl1yG1nPXb1
	sfmIvAeo72j2IIFJObp6SI+kKeEMFb23ShBIg/Y3zGKRMn08SYQA7HaSvGPEIdJPrtka2hO03JG+2
	iKrJQTRKP1Ht3LZmvfZaYgLvBPkFr3MY61qunYRZlH0v/P7CLNJn/Xn1dOah1HuKqj35kK6Kkz1bb
	J1iDaX/Gvk0JlXhKCWLDHhaPwOntII/IX01Xd9ZEVu1+tE+haagkQfUDrLAbiPFQ59Fr7zx1fNrns
	o9x+N0/piiLlxpTtWvjaBHbtMh9DCjUp92DAtMvgZce5mLkXini3IanK8t7kwJiW0LbMDJile7qif
	ZqzXyIVD/fMwJ6R+5XiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNwBa-00000000aBz-2t9U;
	Sun, 30 Jun 2024 15:09:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNwBO-00000000a8n-0jfQ;
	Sun, 30 Jun 2024 15:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3601960E2C;
	Sun, 30 Jun 2024 15:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C6CC32786;
	Sun, 30 Jun 2024 15:09:36 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6D2055FADF;
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
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@rivosinc.com>
In-Reply-To: <20221231233851.24923-11-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
 <20221231233851.24923-11-samuel@sholland.org>
Subject: Re: (subset) [PATCH v4 10/12] riscv: dts: allwinner: Add
 ClockworkPi and DevTerm devicetrees
Message-Id: <171976017441.1183261.11626776990169196800.b4-ty@csie.org>
Date: Sun, 30 Jun 2024 23:09:34 +0800
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_080938_329373_42ED33AF 
X-CRM114-Status: UNSURE (   6.10  )
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

On Sat, 31 Dec 2022 17:38:49 -0600, Samuel Holland wrote:
> Clockwork Tech manufactures several SoMs for their RasPi CM3-compatible
> "ClockworkPi" mainboard. Their R-01 SoM features the Allwinner D1 SoC.
> The R-01 contains only the CPU, DRAM, and always-on voltage regulation;
> it does not merit a separate devicetree.
> 
> The ClockworkPi mainboard features analog audio, a MIPI-DSI panel, USB
> host and peripheral ports, an Ampak AP6256 WiFi/Bluetooth module, and an
> X-Powers AXP228 PMIC for managing a Li-ion battery.
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
