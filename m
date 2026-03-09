Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E30EA854A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 00:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zjyLmJS5dJG8g1C75u6IYszhVCALK6aYVDeLAByTAHE=; b=DrjCIrWz4RWIO7
	mNFAMXgI/KQkDBZTN8EE3ZZtD++RNSTKzY6ci1cVqxGoNAUSogkcRIjRLP7Iw6IYQ4Z58mO1InvXH
	cRtgzJxvl7kyUzI+4wFbcseqq4LXxEESchJNilOMzozjqe7AhOBk0N2ZUB5qneS81vzEphbEzfR0w
	FZcRks4cyMndrDYka2DflCNpSlpOmmwyxUCEoRPpWNH/s0WV5NIopG4NPINIp5AtwxTUM397k9wam
	VkhbWH8bCOtzXP1/O8jsqAVb9WXk0Dr49R9sZTT8LS9PRWCJBSU/KwzBkiJfSLRBu69yG9LXMGzED
	fNb8Ek3YR/vSw6DGEaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOin-00000006TpY-1tYb;
	Mon, 09 Mar 2026 00:43:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOik-00000006ToJ-2oNr
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 00:43:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-829a9c03780so2170662b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Mar 2026 17:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017021; x=1773621821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=;
        b=JzKY148Bs4n5aeqLCGUH8QSBO6Yte8YdG82QwFr+wGNV38Gm9APisyMsdYy8mgr1wr
         28pjGsdZMH8PuAgEo1+5iH7tMMj44qu/f3DwruUTwAzFPj56JKy9IcXJ+WaTUluXr9+z
         cFTS9Te+l2W3OD+fURs4qP+qgyyIfDZ+9q9++uTLmHx84gWxwTg94t1mCaTrPMoj0dxJ
         B942DYofve9OaXe5Qt+zav9RvYy5CdbLUtk3PytxfQsVc9uZQiGUFnYM0nLV0BxJhzfV
         U/X3/BpyZsuCEzzBSajHY5Gm5Gowd531f7KxRdUVjY0QGkvRKsrXDCzn6Ae8vpukzU84
         iEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017021; x=1773621821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=;
        b=LmEDKKn7nn6ZuxKRRd5cENO6qQktBzwXf/y9/Mib4Xx/+tWLoj3eXAHyKGZTLNrYMD
         wFaPKew6gw01N+jKBbRNOtLGW5ldHcgzf1rcZ9Vq1N0eEZHW2b+Xc99VNHt6GdVC4zTU
         u2ZGtcM5jJsvcNEja5ZjfO0lEDzyRaq2tD4Ar/9GvqLL9/LDB/UUtJAFHOjo/erewfPw
         faD9Lo+tjukkTEVAjsRjhNnhKX71Tpzik8BVEdYsnX4JvJ7ijKCScyR6/B4aDPiu7YCJ
         BEB4WZcUSj5fZu0rlhavx77h5XmNMY5gxd6gw3s6sp25Y6KgiE32Zr5rZEGzGad9ZKBs
         9RbA==
X-Forwarded-Encrypted: i=1; AJvYcCWFUcJ5AMX5m8sV1pZbID613mLQegqivRYYQQZbeZLLRCjxktN0wscE3G62rmI6wQcc4/NFjw4YZhc1kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVS/NbgYEcpJAisOzaFHlDW5+FnMP8SB0oR+FjhwjC4UHIDa5g
	6Rv0A99N4Di6QCD51V+owXqQ/0uguAYoPEzBvmmMO86BRpI9Ltx0Mfgr
X-Gm-Gg: ATEYQzy2MFB66eYXZvdPgDUx69AIuGEESLoFkoMx/VdzcushFLg0CdBZTiKDUogQtDO
	gpUJBHqFnwey0m3bNPmJfGUvtnbYuXfGIrNt8cNvMUQr1RvSw+smr7z3P9Yg2h5rWbilUmRVIpn
	N9vQuYe/AswuJPOlJQTJhXi0qIf7Ijfy6c9ZzFa2JI3cFroj7Hr/iZXZiqmPjWNO0pdt/c/LD7H
	Euo0VTrYXkGKdhp5HsRZEuxLkBzTBqoOA5sXrxfapjOPppVGDh++q+9IsHweIq79Ym7UnLGbZKK
	Wx+r8q6Jl1pVsBEfF9zh+ouuI9LsQUVVwSgMzafH1B7c2yT+QuWN4VgPS/fdCJTtcYIcajFaukz
	TAtefKx6nFsUOYnpmqFCIPLIP1b36gPeM+8vgyghTmI5wnF1PYQcsxyJB2SNldzPJtodt6clzQR
	xvhl+ZC0ULpLI/dowfoqfgSyF9jJTdbRAY9A==
X-Received: by 2002:a05:6a00:1a8c:b0:829:810e:8af8 with SMTP id d2e1a72fcca58-829a2dc4f99mr8946097b3a.22.1773017021121;
        Sun, 08 Mar 2026 17:43:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46369d3sm8200195b3a.2.2026.03.08.17.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v8 0/3] riscv: spacemit: Add ethernet support for K3
Date: Mon,  9 Mar 2026 08:42:41 +0800
Message-ID: <20260309004305.315018-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_174342_720041_6092E56F 
X-CRM114-Status: GOOD (  12.72  )
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
