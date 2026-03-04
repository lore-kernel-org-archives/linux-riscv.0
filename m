Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A11AEDA69A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u7LlYq3qpkhQnikUjwW6K7QKxYuYBJq7m0Qk+nF3EUY=; b=wfupCsd6Q1Dh6S
	Up/8Aw+1KjpsRKnZNKmw/BQZtdAFiLXvSjzDNeF23+bWdvNGEJcDft6KTIVBBXLRaELgdvKXWPKq7
	u9BqnlL01kS9hqAOT+sffzOmVuws91uJEpREm4okPtx36ECh8JvxBe0moqLgiAQvJ7yuUNpMA4nW5
	zV/UMoS8Ls5BnIzxCMdjwMeVKYke2oB4o10nHGWjruf2kjbVv9QSoRQm+tPrF/tbMNZZln68Dc1yk
	bPKKzs89n3pLnFW5qwLWt5oluAtSxc4R0+yDRu2s+IYwAeYASLe8jMgkqE5oYtIU46MC8zx0vCBPo
	UyQgxzP1WbLsKHRf930A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGv-0000000Ggrd-1dY5;
	Wed, 04 Mar 2026 08:07:57 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGs-0000000Ggpq-2YIf
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:07:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ae50a33ff8so24818025ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611673; x=1773216473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=;
        b=Hx1tm/fOCgKnWvFG9+cAjZ4bvtTMwGB3hM58EkzUD8MAM7JNVst/aDCltUTTwzH/qR
         AevlS8KRqTgN7MXsuEO5Ph8qQXgRR3s+C4roFOrDufex15p0ItAXA1jaxwgRkdojmZ9D
         MuvpYntQiOPL2cG7djVMR4phF4dZRVfHiqdexEi+aSho66kw48Yidw2yC1XmNll4SSLz
         XH41ee5E1m4kiZlRSPGGdsL/7l1E0HinAgoLB7XqYsK5yGJhAfsci3GRLFCIwRRLhhcH
         mIjnX5WKvSAszES2tHqDFmTI1ZsdWm3yWUJAYbVleGUkaRUPn7yP5mE5UH7eLmpGrh3N
         o2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611673; x=1773216473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=;
        b=efPsyr+cI24CRG+cdchB3nVREIyBuwkt3mCPxp6Me9fmtZDfO/34arBAPTN/e8mMJR
         91uueqqH2pXd83udxUzNheRSNmfMTJTRSonswA2xBl+uDAU96eROhZBSgDee03DWuZxy
         WzScYqXGH9qhTnx7QR7PhN9C1jxZ2TQSbsCGJLZt5DIx6Zj5UoMaIuBfXOCAC7jtbbsl
         y7d4Tv/8Sgvb6GJuNrZFCV8UKhtJq1jKmM5OUqgAzphB48b6nsJPdSdVfP0JR1cFY6an
         xPnog87RolIsVomXOzj2rsjKIVAorpCMPlCD0CA2J0fv61ivngP8SMUMk3yWX96+eiQ+
         EGgw==
X-Forwarded-Encrypted: i=1; AJvYcCV9qFnVoPuooUISpuwWEplhXGMnd9EOOqdXwJf333YyZN12zqaGsOSyNpjO9jrJtpgCr9ja7iy8R1SPOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnixOCNEYpTQvEK2CYSMkbJkfBKDu0rWCTrul/yftsorYEs3zn
	s2UEc087mUazx+eFFwlNyJfrkas3M12FqsW8Tl4N5Sx2GQQci7aDBVZO
X-Gm-Gg: ATEYQzx/d6utFVlmDFUrSfYI0gKIFpVdUvIUedER9YIlUF35+xe5b0KnY5EHgWjSNVL
	4ajDk0uSbjqEOUT0QaC+F2XYA48wPLS9zbJLmfbTYIdH5GraiN0ID2r5WpXvQI2ZaSUEk5FDSTm
	fUKk3W2LykFl+O7sYG/usaX0V4siJyVvRE7+l7BaMnHuwI1j7q3dJs2UzUyR0nFovBcjHBfPep4
	gvrejfHz5MBBECdZf08wNZ4a5dg1tUGcYT03FVgOJFRgTplsOvBboH7FeF2WX3mu8cvO77UuNLJ
	LJmUcjd9R9+cEMYUca3KK4mBRUVq2CQvrE+JIrCqGNiAAQHblAYaCDUruLwkxjwITCz7ys9ZFYu
	qCu+yx4T24xskSOQR00RllM1Nn3mUObhj0NqpspPtvU0LmDYb1YVpTwFR8NI/Cifrml5aSIJ5Kk
	U44We2hui2njLoD0P6XMypbaD2llPse0oLEQ==
X-Received: by 2002:a17:902:cecf:b0:2ae:665c:8b16 with SMTP id d9443c01a7336-2ae6ab5ac69mr13854625ad.53.1772611673352;
        Wed, 04 Mar 2026 00:07:53 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae489c3626sm94364275ad.8.2026.03.04.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:52 -0800 (PST)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v7 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed,  4 Mar 2026 16:07:17 +0800
Message-ID: <20260304080721.1658224-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000754_648792_D0E8D84F 
X-CRM114-Status: GOOD (  13.10  )
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
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 228 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
