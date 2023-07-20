Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEAFEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 16:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVRa/VDzj0j5Dn20GrDIGlqETdiZwuyj/IjGSfn3L48=; b=WIZ0NfokNpPCYL
	DztXFU82ramDAYQ638ahkCnBkT21VHBeDlF7HvE0lbL8a1ogrhnJDD+ukYWQe1ibJYW/ngRvXOnJW
	B63se6r0d2xlb9KqToSx8TZcHCs6eztnNHfB7zQacUu8imbRvbB22MRqoziof6emPeHCWotJHwb8O
	VKBg2p0bvfQvzmGeApBwrRyJ3X5/tfZrZLQp98WTrp1PUaUiQj0qck3ufKiUUvmVoxNgI55AZ1yJU
	iEWtDrOgi/ACVZ4v5lBtVFulVzasAqvK0U903LMp10eBT+1BqOeLzRjVo39AmzbLJia/iBEs4lztl
	u4RZqWyXT0Y95bupNj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWXZ-00Bflj-2o;
	Thu, 20 Jul 2023 16:30:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWXW-00Bfk5-2u
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 16:30:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EAA261B77;
	Thu, 20 Jul 2023 16:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAFAC433CA;
	Thu, 20 Jul 2023 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689870605;
	bh=03iwHF4QsJwEWxnPmziWUq9TV1KY8wz/mguv4Sk1LE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZdtSogxhUY53FziUIZlXATBwD6poKHBE31eXZep/5b2ApRgl8ITwZDChvBUi08fA1
	 ij03rmSV62MOqlR8WwjXPJsbyNsQ8Xt07FvRj2N6rVcRilU8XrkZUf3IeX/ucjDe6j
	 bQAzlYc4oiPcTg2pGGWBJNtfZwg4J6JMXnl2oWJO3E+QmrpIvCXokf7BjZiZ8lNNGl
	 yivi7Qe+n1P+Tsc2mxu1+cSR4muP2BPvpWskHQhUP004cB4k4lkbexbVp2Ol/J/Me3
	 G863G6mFN/yqtEkcRkc4MsGXdNo40mN7Y9NGktM87kus5F3Cz8nA0pvoy4OQCbUsT4
	 fBoRsNQ6pdKtA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	William Qiu <william.qiu@starfivetech.com>,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/7] Add PLL clocks driver and syscon for StarFive JH7110 SoC
Date: Thu, 20 Jul 2023 17:29:50 +0100
Message-Id: <20230720-deck-accent-0dffdaf52958@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nYxKzaQU0UYMnEXg5rTWbgwmIu2gNPam4O84iGUPsLU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCk7E/6cPN4pvklSYW5lokS+pZTwj47I00LOW/vmdVz7Z brE50JfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACayypiRYUMhb2lrm6Lrj623 H2tFTuEN8V/XGO99R2Dm38xJTPNrcxj+cFuI/T+9gOFVahhju8yawrsPdUWSZfKTNl1zvyLzbNp 3NgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_093006_986076_145B126C 
X-CRM114-Status: GOOD (  10.11  )
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

On Mon, 17 Jul 2023 10:30:33 +0800, Xingyu Wu wrote:
> This patch serises are to add PLL clocks driver and providers by writing
> and reading syscon registers for the StarFive JH7110 RISC-V SoC. And add
> documentation and nodes to describe StarFive System Controller(syscon)
> Registers. This patch serises are based on Linux 6.4.
> 
> PLLs are high speed, low jitter frequency synthesizers in JH7110.
> Each PLL clock works in integer mode or fraction mode by some dividers,
> and the dividers are set in several syscon registers.
> The formula for calculating frequency is:
> Fvco = Fref * (NI + NF) / M / Q1
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[6/7] riscv: dts: starfive: jh7110: Add syscon nodes
      https://git.kernel.org/conor/c/3fcbcfc496f0
[7/7] riscv: dts: starfive: jh7110: Add PLL clocks source in SYSCRG node
      https://git.kernel.org/conor/c/3e6670a28b00

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
