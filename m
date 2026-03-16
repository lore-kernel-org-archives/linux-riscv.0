Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD90F30296
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aD7NWbhS+HMgRnzHGEfuIg5wQ/lEYdq9sGO6tgEaU3A=; b=ZzGKWwdD702D4I
	6d4G8fiYu45RQKHyiP4hz62EGfvqy7XwWEvm7OtL9g3jVzsFkQck4NSM50RrRJBd96vKZhV97Edc2
	kb1GunQOkqRpRAARpMgwUQEQ3K/E6gFiME2yBetGP5FGSXHuAO2y1ZGTrXwpGpjclf1srjDH6q+FR
	vnv1LTSiwt6oR0RyUy2w+d6OGzwQ8pwVZQBfXr2Ah7YPiTtUu9UZmXvkhJAEKY3ZokhRhxlJcZ9Vg
	VJ2/kIu/5YCnrAnmkXaOyeCz19RpTlafmJ2iQJAzKzRuD159wLfLRAmAxobsogBEL5E5VwzIswfk0
	enkGvvw7XYvGyxglNIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKS-000000033qN-1sVq;
	Mon, 16 Mar 2026 01:01:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKO-000000033p4-1N5a
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:06 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso1809782a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622862; x=1774227662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=;
        b=Fgp68Eydy6L8BiUfA0iReGfOfQkcZNxseW89wpa/lef70Ay8FjpOZ7nthH4Bz6gdMV
         U1QJrjEMW6yO1FevjWa0rcv86c4TX/Jxs5aWt3EF9PW3I+AvSKswDXfiFnxrzft1wpUH
         rENlG3I/4czNRDVx+beIsRvYc7+teMHsVVS2N+TWK0H/tYMEF2FeYIs/gI1lS5aKpLfn
         oMyZ73PqOSBQ/hmMoUm3yyQHC+jM5/lC38pKABuDuHiqHiXkIKGUtzj2FSfb4urMz/H1
         RW7I6uARYemSidjc4Dl+PDBaRwnuakieAwfn2Icy4SMlrqGhEpIAzX5rz57vrJ2qd6hD
         ZK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622862; x=1774227662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=;
        b=nx0MCH3VtW9B6Pz7smwv88aboTVmCMNlAioAm9z5cfSMQatmGQa+S3REHJGP1wOXAl
         8BRWRvwch1vdBV/960TAqOggn8yGejwKhhhCEdz8Vlb3BDZKgAXDBzQu57xSodGxv6uh
         UAbt6V89+9750bJzXZl8qYE39Wg91F4FYW550AiFl4bPq7IeqS7GEruELy3BCa5gZWwM
         y9DC6fYUFYGi7gol4xS99bySG/8wwXPiQ1xuXNHpCLVKQuCMLGAAVExFKhZrMXzwORur
         NWXkbLp9OruG5e+AZvFa4VTudv7iFkqFdq9vAzNu9mtyNjiPH3xL7ZsIeie3p0GKZvVy
         ckrg==
X-Forwarded-Encrypted: i=1; AJvYcCVzjey6LFTFbh99vimMUCy3bJT3A+Rgi0yWF15gTfVNsZA40ecQ0vOkKnBDcwTlQKSw0GLACH8TLwoCxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydxM0Ft1Hrm9kJdgfz6m4YdRV6WCQ//WJ7U7F6D892s42e7AXp
	J8pt2nshmdeHCt5YtTzcd5tafm6VhXAd2SVZ5XCD2QEaY+LWqzguJQdS
X-Gm-Gg: ATEYQzx/IxCygXoNLoi+ERGZln8kR2QOX5XFjmqmd92oIMcnxZQqlzSS+QwXAnVHFRP
	suxgSdxORnreiSq+8aRS9PGkpdQD+KgYcjZblX2+BRw01o6imM0TdpCkUHWyFrp/JPvSquhBw/k
	Y87zWu2KSiOqs8gyqGGAa7F9mtD4uwSVdwgRmpa/FY7WuFHIo1BnqZP7AELf+0XDuBKuH3CNrSB
	QVqnYjUT/bLgLygn7fs83XtFxY+YVqgA7VBlhoaFQGtOFBwfMNiaCIv54p5jmZZz+5bvkRfVjB4
	MZLyDPOQX1LkH+6qiEsmYx7MuuvPE7NnsSQFv0soLJNNt84ICCpCWbyE8XfGVPm+xZLglUWt4Em
	ndiojBTopJClrCITzzRIDCXaAQlQkkOQ06J4IqZM8fdCmZhTdtXYGIiiTGyWb8hHQbqISJWDtWW
	aO5SQKyVGcH4cLI1Tcvw9WWxg=
X-Received: by 2002:a05:6a20:4305:b0:398:c351:aa0e with SMTP id adf61e73a8af0-398ecab0dabmr9889114637.25.1773622860419;
        Sun, 15 Mar 2026 18:01:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74028eecd4sm1977320a12.26.2026.03.15.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:00:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 0/4] riscv: spacemit: Add ethernet support for K3
Date: Mon, 16 Mar 2026 09:00:36 +0800
Message-ID: <20260316010041.164360-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180105_157046_81A8ADF7 
X-CRM114-Status: GOOD (  13.98  )
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

Change from v9:
- https://lore.kernel.org/netdev/20260312012232.373713-1-inochiama@gmail.com
patch 3:
1. fix misaligned brace.

Change from v8:
- https://lore.kernel.org/netdev/20260309004305.315018-1-inochiama@gmail.com
patch 2:
1. Apply Russell's tag.
patch 3:
1. reverse the order of the local variable to make it "reverse christmas
   tree" for function spacemit_dwmac_update_irq_config() and function
   spacemit_set_phy_intf_sel()
2. Apply Russell's tag
patch 4:
1. Add MAINTAINERS entry

Change from v7:
- https://lore.kernel.org/netdev/20260304080721.1658224-1-inochiama@gmail.com
patch 3:
1. Remove unused parameter in spacemit_dwmac_fix_delay().

Change from v6:
- https://lore.kernel.org/netdev/20260303010630.567674-1-inochiama@gmail.com
patch 1:
1. Drop the extra blank line at the last

Change from v5:
- https://lore.kernel.org/netdev/20260227075718.2243818-1-inochiama@gmail.com
patch 3:
1. fix error from checkpatch

Change from v4:
- https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
patch 1:
1 Apply Rob's tag.
2 Adjust clock description according to Russell's suggestion.
patch 3:
1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.

Change from v3:
- https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
patch 1:
1. fix the uncorrect compatible string postion
patch 3:
1. add "CTRL_" prefix to all ctrl register definition
2. only use delay config 0 to calculate delay code.
3. fix typo in the comment

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

Inochi Amaoto (4):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC
  MAINTAINERS: add entry for SpacemiT DWMAC glue layer

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 7 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
