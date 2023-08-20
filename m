Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D5EE49A6
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Aug 2023 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dBSsNbY6sQRtZmKgnuSQVVav9vKWpfUTvbf280F8AYU=; b=NWPAwIpf27e22f
	89I0IxgY2nOGwAhvkCnCV8z3PuwRKvPkVF+0k1AI2kEulU4f8vx5djuXIFXV3zVQv3ZNkhhI9FLTl
	twKNNW6PCPoCj+ogLaP/ble39pB9ON+1b/dao/ztayomTWKAjBREpE86JGWvczkeb7mwNXUjxdN+v
	Qwyf7J97yo+3X6cX02uW0wZELby6U2RQPML5jGvIf2iOqyej8AW/ddBgXMBLK/+0VmuJmO8K5miJ/
	OIMCip8pZH+3N+UpyBuOFtwOxPBBZQe1BuZwfjfMxpTz/fM/o+aP08qSx2N/UXp3M5fd7VF712Rvs
	lmxPxmSi3i4n1fMzqItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhJt-00BsZ1-1L;
	Sun, 20 Aug 2023 12:14:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhJm-00BsXA-0F;
	Sun, 20 Aug 2023 12:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 826AA60DBC;
	Sun, 20 Aug 2023 12:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7B3C433C7;
	Sun, 20 Aug 2023 12:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692533643;
	bh=IC8w578EAIZuY+94RdibA09oC+PtDBo0QtdFqUh+Eoc=;
	h=From:To:Cc:Subject:Date:From;
	b=e9ZZcIuUApBk3/DB9NX5MF3p32ExThYZkvRMnbluFlAdY1aeeaEuz1pLo9GSKmVDh
	 UUqiuVscsmqZqCwmK3KTZ9GEaZJ3/Pz7iepdYs0MoEjyq/ffILkkYcke7fdf2/tMDO
	 FZ/Xfw5h8SOsIoLRXITYJQ1kjR4fwy8GQLT8ce1BfZwuvMOOPG6kjn1T+Scz9gVSPJ
	 xjDzHwGnEqmYnPqAoe8D0O+5g04ZF977wMRCp+zLL7J6hthruWXb1wOlh5AmeeI46D
	 oeaHTaHfYc9qmcMAF8VPkQ16Ahm1qyNNgGvS4KBnIj30ev7qILkdeshYhyOm+TqmqL
	 hbWS/d9APZiyw==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/3] add the dwmac driver for T-HEAD TH1520 SoC
Date: Sun, 20 Aug 2023 20:02:10 +0800
Message-Id: <20230820120213.2054-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_051406_186697_B7C3171E 
X-CRM114-Status: GOOD (  10.25  )
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

Add the dwmac driver support for T-HEAD TH1520 SoC.

Since the clk part isn't mainlined, so SoC dts(i) changes are not
included in this series. However, it can be tested by using fixed-clock.

Jisheng Zhang (3):
  dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
  dt-bindings: net: add T-HEAD dwmac support
  net: stmmac: add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../devicetree/bindings/net/thead,dwmac.yaml  |  87 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 304 ++++++++++++++++++
 5 files changed, 405 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
