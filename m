Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F33CC87FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UaiAY5l6XOgr+H27m0TM0+fhoDS7KgQwrp6aavmmipQ=; b=HTjupUeXEutfFz
	8ZKalDkds2ovSOklyY2pSED2/adz3zVdEzDziVHY+UXNxMACjPQMNK1MkKLfbRKZbubHSV87cNjvO
	ISid9F8ECNN/Bpf2SuEY31gONtqR4JzWpkFcfjXUr565jOQ1XLyPselltcp8v8jMOWfutYWVyRCyZ
	jL9Q5RfBJvwBetaD8APBVzjMyci/I04Qd4fosJWf056DVD/Bwkze/8dfkSb8CNxGhGO+IlfI058vK
	jfFm/5ZSjkAUvyngmWwsuNj7zuknp09MAOkzv0BEz+i22mIkh0OC3aaDp6tQEgxdHrj00KlJkSvgD
	J+RmlqhQhZ6JG+LQ6Abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlpB-00000005KOJ-3TtK;
	Fri, 01 Aug 2025 09:13:13 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlp7-00000005KMu-3wUp
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 09:13:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 864F925DDA;
	Fri,  1 Aug 2025 11:13:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zh-OSYwXA6vo; Fri,  1 Aug 2025 11:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754039584; bh=xPvJxuK/PBmyVvnt/ErP5uEKdZ5kX2qWNjIgNy0PW0E=;
	h=From:To:Cc:Subject:Date;
	b=LqSjgKsOjo4AMSSRXfragXwK70JyXgtsFbKFcJQhbLaKQR993L2JPqYOdNntEEX5G
	 dd5tmYAMtqbzd3H7pfUsuut80Zpq5rh0slJ1xNGd9ikw3hqBNIhac335qog7LI7385
	 KyiNA/0PEN7QJuhHzungsu5HeN+8nqh77nXdV3aBPT4Y4M0mWsZ9G8y1VJ/UViQ2G5
	 PAct65VfEAPQ8eqt4xf9LTfl8dOygzP/Z64hY2NtSs3vjHVCm6TgdCSG8XnZ8U3KTZ
	 ni0gJC6G9jlLSMHdh7LzZIveL7ChzAGu9UDo9TibbFsqpZZnOVksVEDG1oohv8Egzh
	 +EWMYjEL5lCVg==
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
Subject: [PATCH net v2 0/3] Fix broken link with TH1520 GMAC when linkspeed changes
Date: Fri,  1 Aug 2025 09:12:37 +0000
Message-ID: <20250801091240.46114-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_021310_394085_56C1F05A 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

Changed from v1
- Make apb clock essential in dt-binding
- Collect review tags
- Link to v1: https://lore.kernel.org/all/20250729093734.40132-1-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: net: thead,th1520-gmac: Describe APB interface clock
  net: stmmac: thead: Get and enable APB clock on initialization
  riscv: dts: thead: Add APB clocks for TH1520 GMACs

 .../devicetree/bindings/net/thead,th1520-gmac.yaml     |  6 ++++--
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 10 ++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c      |  6 ++++++
 3 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
