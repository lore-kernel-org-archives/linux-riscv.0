Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8511AD35696
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VBZswlUMi/9TH776vrajtSNyNvCfV46WOkcdZUL1tlk=; b=dZU6Ln7QXVCwqi
	c8FhaXTfbMrQigus+ne+5WKJzQYOnqkT9WGswx+9BXBPOZZ35AzdwP/ati10S3uO0gIXNSDC1v+Fs
	/JKxjvhD7YsHTRidg9udqBQznNFubGSEJvq3SoGBmjbmiD/clUdmUgdH06f3e8uj4oHTbGhMd6y7S
	YT8MzqzcPpBRjZHHqZC5kNGMEFzWaRN8cqReVjDB5SenmLlKnAjbP0NWoEQsnewPIPJfoQaMvYCjM
	UndrTDqvxCcBTCfcuaYkk1IHr/O5x3Z/bTR1q7yq8cmRvpV92tzmAtnDBjbQpX0oPFRSt9HIqbfzO
	3ncptMbN7OKnRkIe3KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1cX-0000000Fj50-3CMT;
	Wed, 28 Jan 2026 09:13:53 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1cU-0000000Fj4b-3pMr
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 09:13:52 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-124a95e592fso38360c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769591630; x=1770196430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=;
        b=eQHx5ZvoYFCnm1N3BXdcpoU0SGrCT4JDlXCbYvJG1eLMhbGoFF0wHLxsLrFKSPLcEw
         MIhayvlYDnipmzmqHyB1d8V051Fzq7oEEpm26nWw+nqVH32roSR8xufvqdG3OfTghBYY
         CD4wvV8nnKPKvkLYYleoaHYftSVoLomtIkVZ43WFE0YuOmc3ijPzwnQI97G5pBS+x9ZL
         k/RYBkPx1L62c3xCiK4VM17s8zhCUIf4TJs3DURpsxjH+8hp7rqkqrRZ6Lmj5irKYGtE
         IfbwBf77gIq8+0qGVqwnpwvxc0gbw9iIdKDfgFcyuFdNfXN1amTx8COe3jtxMkVi4Btq
         eMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591630; x=1770196430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=;
        b=T+xQjbvNDmyDzHpBcY6fqQp+CJt/92gUORrXwEynlmfdseP+rFDYur8vnwRunZAdSX
         Y85VoJ7pv+vCH64crYHZlbuCfgJcDU9/58bOa/91HsCuiYpERf3AjXn5zyVDuUF0/zDW
         RvaT49riM0J4f7Fw+exElRXiyy4PiJ8DWlpg6R/NIt2Hq04CsSi1OH9NgEWpByk4Jgcy
         ctAhU6agXy1yisNCc/hC/nS9t0jJzY0Y0y6Okih585EJ/XyGAESG6CRzm4+yMLzOt9YP
         CPcvgo/1AoAs9cRdDeT/MDm2DD0g6Rz6uNlI3nsHBo9rQ1+uGXrvzy8vM4VZ0ygySAN1
         ++QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoufrSrAddZPdzIHKteu5Vw6r+RS4v2KxS04fyQu6NaQjECmYHoukNujlmN01vmwB14BeuN9wGj3bo1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDEE0cU2v+RAbhpKBhvlKr9hVTR/Rj0jViSIJ71GL9Dm3dfgNT
	oOC31N5zB/85Q+2UWC0KpXhkc+9b2jwiSLZesyzBrGCtEeO3GAXPkCVYBuuQcw==
X-Gm-Gg: AZuq6aKr4d2g+j56Z5d3keijm4sFf6iEqXQPyhgsr/2PapLOaQ18fXXniokuOFfy8j9
	oDBmpg8zLkcpli+PwvJihuJynRT2JR/47wHpMJMlxHJ57CDhplWwq2YGg5mFwzi2nBHVjlqUCra
	GpxnKz7p56ZWJbLAwKWoqjy/tcioEAWxXUioalpRaUPt3Fv3AQDBuPU5vyHpNPenwuu1HClay/s
	lbRnOi6ZW7csBTS8fgr563Bw2yAaTG7i7yvkWlyAxmuWMJ46573W+YmDsn6VrfmNsCkkqETJBQ2
	sMewK51ne2eIGL6wVzlPbu2Z7p568ZCZF5DonKfgGQANMy/cO8O/yWtF5rxp1LrPt2rYjQeMT5i
	Ok7Rpys6TirRYCc7OmI1TT2jE8URiXf09byq3IdoMjEdOJZS9g5jtyUlUG5RVtTcCvtGEnw4cON
	nAeN0NW1DEBg==
X-Received: by 2002:a05:7300:6d08:b0:2b7:2664:aeae with SMTP id 5a478bee46e88-2b78da0b4a8mr2419091eec.37.1769585393102;
        Tue, 27 Jan 2026 23:29:53 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b658sm1374769c88.3.2026.01.27.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:52 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed, 28 Jan 2026 15:29:26 +0800
Message-ID: <20260128072931.875041-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011350_954699_8BB3D9E3 
X-CRM114-Status: GOOD (  10.90  )
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

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
