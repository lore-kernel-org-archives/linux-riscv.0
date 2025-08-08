Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A344C87FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a//gjCpjigiLSgyz+En+guLIclsVv5gofS/SCufdrGw=; b=ahtdDD67SKkQK1
	b19PENpzZDCTGceCX+Yx7mU5BA8c9wFe+zuOBrYVnowkWUBgolRy8mnp4JVSu2+yq9VOy9jQv9W9f
	jfpH6o1ErH+tttr0fHxnvgn9H+166TWaPWkJ/bSLm/ZEqPTV8Lp9nqPZOg9bAHDUgmwkCuz97JT33
	7czQ31B+jZdYb8SdMXWeI1L9Vbdmc21yXCHN8NFTtdeyyC6ts2XHZJ5hbKYSLNcvEz9s3KQgApBun
	0+LcAKPW1EjwsoAR6g9nNIBS0zATWsxGyLvnAblIf9aTCLcBCTKgBhRu8rPzJuwY042NwcSmKu0u6
	CdOgk3t3MvamkEvc0aSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJe9-00000002Tdt-2tqL;
	Fri, 08 Aug 2025 09:44:21 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJe6-00000002TbQ-48O3
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 09:44:20 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DCCE225B19;
	Fri,  8 Aug 2025 11:44:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-OBsePsy6H5; Fri,  8 Aug 2025 11:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754646253; bh=6F4MMCjDeOJQTOBiI/kQboYeE8sVAqRfvejXM0WLAGY=;
	h=From:To:Cc:Subject:Date;
	b=lQkxiJ7GL8amk1iNsM0f1VFSXFUbtqeVC9w+I4T/U8Z+AFfrKQQje2rzWNzNiYEah
	 nxgYnsfL6EiaBivK4JdDs0FiOeboMG2FDp6t86MwxqsovXsJje+BJuMKUugHhvLBfl
	 0d41UVPpYU5Cgk5+P7H/0DYtCwUYXwUvhvg4WycX1uCqWT5SR9mYv5uhA/uDM6J05Q
	 vkcMbk/7CxLjkn1A/GE71bEunM9BGStgv70g6R+Slb6uEVuTZDUe5WFQTdfg22YnBk
	 Oj4YEgEAZ+0tbkLaChdnB8q8IvAPHei2yHp3glhPAS91hBxC3VLTZwl1OOUSrqjOpn
	 tRyYcegkOWIbw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH net v3 0/3] Fix broken link with TH1520 GMAC when linkspeed changes
Date: Fri,  8 Aug 2025 09:36:53 +0000
Message-ID: <20250808093655.48074-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_024419_425247_3894B751 
X-CRM114-Status: GOOD (  10.70  )
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

It's noted that on TH1520 SoC, the GMAC's link becomes broken after
the link speed is changed (for example, running ethtool -s eth0 speed
100 on the peer when negotiated to 1Gbps), but the GMAC could function
normally if the speed is brought back to the initial.

Just like many other SoCs utilizing STMMAC IP, we need to adjust the TX
clock supplying TH1520's GMAC through some SoC-specific glue registers
when linkspeed changes. But it's found that after the full kernel
startup, reading from them results in garbage and writing to them makes
no effect, which is the cause of broken link.

Further testing shows perisys-apb4-hclk must be ungated for normal
access to Th1520 GMAC APB glue registers, which is neither described in
dt-binding nor acquired by the driver.

This series expands the dt-binding of TH1520's GMAC to allow an extra
"APB glue registers interface clock", instructs the driver to acquire
and enable the clock, and finally supplies CLK_PERISYS_APB4_HCLK for
TH1520's GMACs in SoC devicetree.

Changed from v2
- dt-binding: Drop the Tested-by tag
- driver
  - Improve the commit message to mention the dt-compatibility problem
  - Add a comment about the dt-compatibility problem
  - Emit a warning when failed to get APB clock
  - Stop using the optional clock-getting API since it doesn't help much
    when we need to handle the missing case.
- Collect review tags
- Link to v2: https://lore.kernel.org/netdev/20250801091240.46114-1-ziyao@disroot.org/

Changed from v1
- Make apb clock essential in dt-binding
- Collect review tags
- Link to v1: https://lore.kernel.org/all/20250729093734.40132-1-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: net: thead,th1520-gmac: Describe APB interface clock
  net: stmmac: thead: Get and enable APB clock on initialization
  riscv: dts: thead: Add APB clocks for TH1520 GMACs

 .../devicetree/bindings/net/thead,th1520-gmac.yaml |  6 ++++--
 arch/riscv/boot/dts/thead/th1520.dtsi              | 10 ++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 6 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
