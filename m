Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ABFD73EB7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 04:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4qw1iWNf1hC+rXkWg7lEM6gPt0wE+i6gkemuIiGiJ48=; b=cWbcWQqvPRPJSL
	RgTsmWQCGOGaf1/t7lK1+uld+cj7uUQghH+yHFqJlU16RJuylSn10HzJX5/R8XMnojIkC2crvXHOZ
	gBl+12wZENmG1eUnAM2u4CBMHAmOFBLjIeRaaC7kefqRkh9u9vEUifnM7QadTqTnRu3WQcTvryv1Q
	5+gUVszNP6sdA8wlwNtlAxUR7liIp0MBqH80ngbC1bmma8nmZNo6DwP0b/AfzhVblN2IcaAcUNazD
	PHkR6uBK/9hC6ZOxJjzSonHPBc153VLcrQQbBVfnUTJcEw1YZC+Jq8aSJqu5WBCu9M8DHo+fXvgDJ
	vzjXWX5sZfHFLe6+0Jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlg3Y-000000010bO-2b61;
	Fri, 30 Jan 2026 04:24:28 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlg3V-000000010az-1euv
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 04:24:26 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5eea9f9c29bso1021267137.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 20:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769747064; x=1770351864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
        b=h7fVR+J/HSX1lemXv+6F3wwcC+OCLnlVYtvOvz6GlvtWB1NMRoHzCkzdRgwbl2LwCp
         UYHmKN9dYICkiq1eOdZnIBTo7aVRar9H2EjSwE3dydLEmK/ajUQuzo0AAAgpN2BVeJN0
         jd/s1sIFI72okJBZDF+wnmlwXex3Z0b1A4IVZnLe7qpchL0dB3P+KtQqEkA6+1SFtV6l
         V8ixvNDV+REelHMGSEf43hL3mujswuLJ9Sq+Dq3x/r0etRfV4Mk6NE3Uczipyp+eybpw
         JFETtKH9bWPFDPfQP+GUsRraghH7eui1gVDTr98qWdBuzclU8NAuAXHz4qmOd3B5ya4T
         LwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769747064; x=1770351864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
        b=E1qrw0Z2W27z3QWnST1rfGo88bc0TV6W2gqe7BIUF/dhCebDDPB9GDVEFNUb4wEvpr
         xPAorxScooaxoY65Y909diiXHd9wN6ra71kXI+2swWNw9qveTWwGKkfwGEFRzySFaj0o
         ugQoxsa5NEIQR3ONkc/T1YnqqajFERYoMkjtO+yQjmfxT/PwEXuisFFiVMG4LZcDLaQ+
         xRjvUmATMFhr9Qy9vUc+csW1t+dJvUR87io4/1w4+UZ00p2GaQnGC4K+EbuQ+UCEBUSV
         wz+Gqw8oa4ibqeC3qn31TqzjF6pprw2Moh6rO8ssNEnWqrj9mZx3lTVCyDySMTQyAUoj
         m4PA==
X-Forwarded-Encrypted: i=1; AJvYcCVFwp0+lfF3xTfqQKZccK3UOAVl1B9BQvUE6MC9q+6spk570SHd4DEmIWUKsp2makmtlz7+PYcGcAgZYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tuX8ENiPmdptw9BLyow6YbfYDJ7Uvw1gwv6Mk5y2kd44Lx+g
	a1wEZlAdQ6sIJBVPvgVyirC26GCuA/QNOAJGrn1wa9kfB6tEX7sNbSxF5s1PWKvc
X-Gm-Gg: AZuq6aK/oBEqYLdaTJjzgTSR860+R7+75Lc/QTXdJLqJ4zSqI08FBgTrvnLoriVB5Mg
	RpXuyztSpBiCONdj6ls6OAnuLpClcIuN58sTErTxocQ34B6Qw5T5intCAPlZ718hXv++CIPtZ+s
	QXOFjFDPJgahXbPmnE0Bpm69izYl48xEGL/Sd67khXQroVpZvsMv8vSDGM2TTpks15IB0AYgS2w
	yuEFlT98CwLcv6GejhtkDWxNf3/YeI4HVZ7S6WsiMfdA9nOVB7sLudRHpLbqQ3M7BXqmUTAS8Uk
	17ewfAcT6fgJmTi3P9qXGIM7fQwLhdbvQmW1dprn9yh/jcDWc+MkkTKxMEjDSN95ZK7xcKEsEq1
	6OrTg1uqn4ee2oHjsd3lHunk2WuhrouWM26SK4lnINjZv5IlCliYqQn4myi72f3JGut3HyZakpm
	WltS5bBT+5GA==
X-Received: by 2002:a05:693c:228a:b0:2b0:4ae1:b4ae with SMTP id 5a478bee46e88-2b7c88d6423mr747779eec.24.1769740046251;
        Thu, 29 Jan 2026 18:27:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe938sm9799883eec.16.2026.01.29.18.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:25 -0800 (PST)
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
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support for K3
Date: Fri, 30 Jan 2026 10:27:01 +0800
Message-ID: <20260130022705.1059214-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_202425_458316_8BD79376 
X-CRM114-Status: GOOD (  11.52  )
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 194 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
