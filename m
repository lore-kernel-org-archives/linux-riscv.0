Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA1FD5307
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 07:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xiMAr7N1wQtkKs2TKqhV6NDoaG6IV5yi8f5YvyUuFPQ=; b=ye2oV2BryNDLh+
	Kr/G4T4I7XHGspQ/kIuaO4+zpKtdKGISZIXG8et/H7FchHd9257NPwgb07CFq01W9h640emX1U8qV
	RUZnSiAxXDcjBXuchXKrOLcG6OE7I3E8or5Zhxf30EBZQZWn1oTS+AGuGrtMnPnpPzx4TQcbpAHU6
	i9o/SypVfVQfvevE0mmjRDB03OARP0nZ6cWycO7CnZyIRbyBGdZm0sXuAoKDuz0U4MUSW9nZW5pZC
	joH2GFbVERGw2VQ8gOWw1MNTfEONCnj55Mn8+nLXaJGI2kqnndqbpeFeKiyWK7QHJ8rV6v4zJ3Wj9
	rTlwZlsXLRS2IQzF8zlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjN-00000007vOg-1aTh;
	Fri, 27 Feb 2026 07:57:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjJ-00000007vNe-3lRz
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 07:57:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ae239bd19eso4047805ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 23:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179065; x=1772783865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dClJOFMkUNppxkXbFtmk3M5XyyWUhWhukdTkp6L74rE=;
        b=SWhX/uDgJpDmHwoyc4FsM9u3biTLX5G82WFe2Dd1KrK3MUcpzS7zJdV/IR0yBOejmH
         R1Xsy+iQiJCRlqSHKsaUKjLEZXmdZyz2PqEQkAxTHwy4KLqm1IDQG01S6Ri5sBw2ATqK
         z2pwCmgNAQisvtlDX6mZesXJID/JtAALv85CMtmywaf95j16y1lPAzN5r2p/I+wX73gB
         N9kWdIBGZCOP6G37j0/LXpv8v+xlkcQfnMm2nXv2Q8RpVPQhCJX79tfxtba3bvYvzcHs
         nhEcdktrF6tNEsa2Mv9SV3kNmRWeHREXkohYqM8I6bvmYOJaicCiZk4+OBimKzmy4zeL
         tAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179065; x=1772783865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dClJOFMkUNppxkXbFtmk3M5XyyWUhWhukdTkp6L74rE=;
        b=A+K8TepgrjaAfROz8h/Pv9j6dApn12yzf6mIPf2VKfQhVOjfeiEt4B/zeNyA4RKVpJ
         FfT9bYcCbXckvSZZ4W2tV3U1j1sPGyWIfkFG25gvJJjdExmRoz3mMBTeA9iuJFDUAabz
         wkDCm0KhWVmtP3SYw2jzillx1xKeQL1K2UOotewnv4PmwGgmf41ooY7TMmKH9UBpjI7q
         GNDz51b8gq+3zJKpfnjaUvcsIHMkUVfZTKusaGbdRmNNDL31zwsNJW0+5+pTH3A9zo42
         +TcW1qmYvmEtKUFNFve1eM+0k8i9FsYeOFfx/PaQwISuek4cviBaiITRkXzlj+jtzx8s
         N7aw==
X-Forwarded-Encrypted: i=1; AJvYcCUSTp2CNj5k5GzkygJnv4PW85pPatBcY+Zo4zKlnQ1jcX8WiQ2jc1J+vvWviUcM2GUbtfi7LsD3GJuQ9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNBoIEzmfreJtMTJhUiBHMolBLQSneFpmQ7fqS+7yix8q5eTh7
	ZQG90UiPi2KTtQgy45Cph2zJv77hTWsqZWr9XX7z4Uv6taZXG/+z62TZ
X-Gm-Gg: ATEYQzycvV/xao8IKqDvIwuyjFhqVX1uaXJiMv8orDo70i3Wf6xnC6RcIl9qzuoU6PO
	+uqmTGhFpmWGsV2dXA9cMuaLI1FlTQGX+3tnI1RfI4cXzmILPfcyxLhKWymxj30zB5pGkpoI1nu
	O1OVuJWR6a+F7WXwVXqxwMQMXR8pXzMPjOOZIJo9H8IionBYj8SItuekAU7/qmR86HAQWoXxKBA
	okbmWz7vBRLMmEN/A2FUAIjUvbGBL+1gROymSj2AeTmmpqW07vdXLNmfSAthR/YXQdi3b4ao57y
	Ca2ZeBaXExgdpR9e975uQPT17zaa3fFYG2EIRtpIfXY3CHQc/GVNxaHkna4LJiHLcXSAapdT2/W
	5961eaLei7lNNvvCjocTKPYqbOTSiSNeD2fqVdQf9CbOT2TYcgR5NW/M7VUqRX25D6sGtrrDqK5
	nREytZxAPrrMTzKHQBQ4KyrA==
X-Received: by 2002:a17:902:c950:b0:2ae:1ce5:61a9 with SMTP id d9443c01a7336-2ae2e02ac6fmr18274345ad.0.1772179064707;
        Thu, 26 Feb 2026 23:57:44 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fb4dsm72024035ad.42.2026.02.26.23.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:44 -0800 (PST)
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support for K3
Date: Fri, 27 Feb 2026 15:57:14 +0800
Message-ID: <20260227075718.2243818-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_235745_930564_C86B18A5 
X-CRM114-Status: GOOD (  12.09  )
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 226 ++++++++++++++++++
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
