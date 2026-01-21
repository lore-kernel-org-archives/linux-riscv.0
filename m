Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC68C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VgzLX9k2ZHEs4iVYsMHSVtb8r0aS6ysQ33SbMAM1SDE=; b=eQLC7Oeqzpn0u4
	wGxS5Yb6P84hmWFPpN8zZLg8J5zDzw5RwBdMvYVmWB3wwlwdkM/NSAWYpNw1ZoZ5DUah4ysfrN25V
	6KkfAQZp30u/yiBXDfsv+uPf84Dq+fUHcNNT6ioOsGdSq3ByqdL/CsXAjzcKh4AVLyxiamuh2OYR6
	hiTKRdSbHwGP3R2B846yn6IAAEIilGwl6wEysQaxW8RSWSdCy/e95VIOJ29u8vbGrTE3AiDkuy84Z
	cL12KwZbHqkJRHy8KMX/WHbhqsTcgK57KCiJYTuqh5gyhXhtGWo3reocIHqAdEV1O59TFVqFPfSnv
	IXzVTIznDmDhDSqTDZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUAJ-000000059kx-3p25;
	Wed, 21 Jan 2026 09:06:15 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUAI-000000059kb-0PNu
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 09:06:15 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5014b671367so76376031cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768986373; x=1769591173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
        b=StK+47qpNYr6yCj2NPY+Ve/KFOSViWDmU6utgG56oQAcTUzPwKd4jPv7QQe7b7V29s
         lYSlfjkiXfw/+MOUeyyzw44r7t//KlEsnuU+pbFUeOlz6mzBTd7/lue24l2PIdYB+2Nt
         92vu6ki9lZkhGSB8gkyk/cIk/oZnxiwI//OTAU1ON+sAbNwiQF7UeA55x88g2kaMvGdj
         asu5nmrGpfOBNpidcY99Oiki5/AW9jKpz0iZbRf05WdNYQGRwo6loohnkhkFVdlnM09Y
         oe7y2F1lV/QnIiFnz9Nyt67be0QndFoK1VHs649pqHih4DvKH2RYI2rqLtMBmPdt6cnA
         0KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986373; x=1769591173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
        b=pyK0ahYPnaZayyHeEPOce5AHojIKzAhulYUSEQXFwnTXx5nxv+k5ik8Uutz23aRZ4O
         azDR657y37Wn5lapfcJ11WXE1gJ/eicLoOwyTI3nQMxQLXgBLHzwIubq4LCLJO+xkw4w
         e6S263Ip5nPxIBI2f+5lAp2sNd3giiK520AmWt4QZtEUtJ7NaxfEpFE3NnFJj4g0AG/v
         d+qpIFlvCgP4COlJTWV45YLpRPbCHL++/1e4NRkUvTXdXWAX8qBQJ23UJbSzl30ho0X9
         G5GbdxDlRhGolClB8iRP6DcW0eqQcYRpQVgrs1sZxSTFnB5IdWV+bRx7yDl4DASpCxBi
         SonQ==
X-Forwarded-Encrypted: i=1; AJvYcCUycDDqDQ1nbkcKzjXe4JSHn2w5JUX0DGxlfuz/tXabd898PHtR05Jh8yDYS1y5pFhz/TO37d027B6l5A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4WcBZHzmUSHS8yUXVtzmy0rrvraWJMecD6Dnwu8blZSMP2F47
	KUzKb0KTduVEeFk93hShE6+O+sRwPDpRKcHAyB+mmGLOnCG5vH+x6azV
X-Gm-Gg: AZuq6aIKHXqZ1rmPhfudUplJBfSym1Xlo7IdLm52wknJGIbZWeLOkpYPWBOsj1uJshq
	Yj1AtEM4a+bY4ZPHrQ3T8+RtZb6Ni0xSdCn1ZNjOy9Rb1MPFiuSWBkO+zfJrms/Ipv3eP1lHN8t
	uBI/YIt4FgjAcV3UEkz8GxftdfLFdyt5+6OewZiKt3oSB+wYeEo+jCIttxyAkZCUwMu3Qs6l2r3
	36T0cJD9c3JPF7dqni/GutVhdnHRpaBfv8sjcabOy8sS9wdeN5ME7QrmbDuy98tJSWuJHMwGQpd
	xFUrYEC8IkW28VRY9F+khUz7TM5RaHWecb1EDHMRETXa2xnSPvYXL520IRjX0bC5ZblK9uaIR/g
	o0z+osuZ8jdx3P7TWeyvDDrF0TZoZRhhDAoAZ+Pnku1qnzswy6jR9F0rhn9b9Ja6ctyv8fTjdhG
	uBYkAISdBSJA==
X-Received: by 2002:a05:7022:6b86:b0:11b:923d:773f with SMTP id a92af1059eb24-1244b3081a4mr12334928c88.5.1768979609488;
        Tue, 20 Jan 2026 23:13:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm24056346c88.7.2026.01.20.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:29 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed, 21 Jan 2026 15:13:08 +0800
Message-ID: <20260121071315.940130-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_010614_148884_57D9C2FD 
X-CRM114-Status: GOOD (  11.04  )
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

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 221 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
