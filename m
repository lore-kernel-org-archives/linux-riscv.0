Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B72C83F09
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJHlE5mMXmuXGmiP5xdg7UVOXaIsWqN3uJ3yVxl9aSA=; b=lQWQmS1c8PSUTX
	mUep0G7dxplxwMEvwq2s/C5yCO1sxiM8uT4UMohCTfou0NzezAp3O8JQmI9/FkJT9NYM/Mdlws1EN
	9m9TVe+XAtM639Wak/ilkuJjNs5rOEjYxqBt4rx3SZ8FIEOdQINkqJ9PGnVtnL+6+Ow7PJ7kqSd3P
	uBrtZsEm1Of+b0pzPgWA2zGxOOyOICDo8blNm1rOht/N9+EQI+2O3bMSEzO0qYYuI5ueRDLArrCeK
	7QKTrpKNXDPJz6yfNQ1hLYfek2Qv9jHPbPNvjMscclno5SxC0Q1HflfmOGRScqnEzECMsRNRpLPJD
	6nySa0COUKRysVwLc0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ99C-00000005ZAK-3TRg;
	Tue, 08 Jul 2025 14:18:14 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ99A-00000005Z9m-41sg
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 14:18:14 +0000
Received: from ofsar (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 624E1340ED3;
	Tue, 08 Jul 2025 14:18:04 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v12 0/6] reset: spacemit: add K1 reset support
Date: Tue,  8 Jul 2025 22:17:56 +0800
Message-ID: <175198407740.45243.8546777031638869570.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_071813_020358_A8BA6E03 
X-CRM114-Status: UNSURE (   9.47  )
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


On Wed, 02 Jul 2025 06:37:02 -0500, Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> A SpacemiT reset controller is implemented as an auxiliary device
> associated with a clock controller (CCU).  A new header file
> holds definitions used by both the clock and reset drivers.
> 
> The only change in this version is that three of the the four resets
> associated with each PCIe port have been renamed, to align better
> with their corresponding clocks.  This affects patches 1 and 5.
> For example, for PCIe port 0:
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
      https://github.com/spacemit-com/linux/commit/25a59e813cd2ca728047f657d64f9b29480be393
[2/6] soc: spacemit: create a header for clock/reset registers
      https://github.com/spacemit-com/linux/commit/bf6239ddaa6a73a44cd8ea3afec5fc82ed900038
[3/6] clk: spacemit: set up reset auxiliary devices
      https://github.com/spacemit-com/linux/commit/988543522ebd6a9af53c288833503f0501e401b0
[4/6] clk: spacemit: define three reset-only CCUs
      https://github.com/spacemit-com/linux/commit/024b84f661674dcfa1341c90ce654c485c4ab756
[5/6] reset: spacemit: add support for SpacemiT CCU resets
      https://github.com/spacemit-com/linux/commit/c479d7cf06c3d65532442fa368b058e05dbba1a2

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
