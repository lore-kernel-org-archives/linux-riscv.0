Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4A7E6F085
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfwgOpXPZsDUrH+9szfwHpIr0IE/T2BjYPNYuBrIJdU=; b=VJSvqp9rD7c1vB
	JYHopiLJoyPtTLYruANnem5ZcLLyjORqK1YDSCu2zdyPYoqzOuvx9KLlrA7vQlLQVs6RM4PjcTj2+
	uiKYYzY8asZVeDyfLN5PWtMF2Th5y0yDGWL4LwhidFkfKh1VtEYwra0Q7o9OYNkCGyX6TR2OFR9D9
	AP1BBKhWFFIjtQB3T4OtueNBlHHQ6ZGhqw6id7DPOn11znV63ftR+7QC8VLKFzFwyL5kfCfe9cRHZ
	ymdwZRLfde5hdCv9+hWIVnf39bPaeRPyYSIBu83JWDm6jdkvRCjQEamW62ap/dSzTe8lnZQEcfBuQ
	3rgpgb4Cujg7/uWUIaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6RH-0000000Fr03-2GT4;
	Tue, 23 Dec 2025 17:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6RE-0000000Fqx9-0pZQ;
	Tue, 23 Dec 2025 17:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C36AE43913;
	Tue, 23 Dec 2025 17:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FFEC116D0;
	Tue, 23 Dec 2025 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511887;
	bh=u9s4C03Sf2XKogwbD7mhFLbiulZJk9l/PuE/DfgTUVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nqI2BwH0sU7SrGT8Feun1SdQnIrOMtoS82VK5TGHE+bHyxzvzGJevsNDBj6Iz//5T
	 XjzpQ/FuDQchSCnvEX4XjhZQlJwr1xK3SXGKs3CIAN0KoRs0nIoALL9h4l7+xCDrAx
	 VQzTZ4TeBPhAFGTbaOJ7UIehh/xbaPEVx3aJJ1bvUI6smkVzZ8uHK1tbE1/+zvx13+
	 HPbQavT1kqbYXV6/A/T0Ot/Zw9XdulPBQuSOHlnDa6ASCDcZhagK0tEU9p5c5ehWyl
	 xaJ1pSTo+2L9mYNGAEkkAzft9RjRwOXV/EIe23CTIwRf6fmC/JDKPgrw50RRxmcU27
	 CDh3MO16zqAug==
From: Vinod Koul <vkoul@kernel.org>
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, kishon@kernel.org, Alex Elder <elder@riscstar.com>
Cc: ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com, 
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 p.zabel@pengutronix.de, guodong@riscstar.com, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Message-Id: <176651188218.759340.4259216266995514459.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:42 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_094448_285875_2BD9BF91 
X-CRM114-Status: UNSURE (   6.80  )
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


On Thu, 18 Dec 2025 09:12:26 -0600, Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
      commit: f6194de7df023ecfd5156caf8e2762487be07ef7
[2/5] dt-bindings: phy: spacemit: Introduce PCIe PHY
      commit: 326a278a3682d390269699f68e597b5ef5a57d26
[3/5] phy: spacemit: Introduce PCIe/combo PHY
      commit: 57e920b92724dd568526990c04e79ed54241c5fc

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
