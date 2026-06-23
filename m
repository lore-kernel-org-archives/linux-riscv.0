Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E063CCDB481
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oIAo6CDeulGI+QbLZCVGruvjs9VXhVa9Z8FgC22waX8=; b=on7ssSoSMG8dT1
	CAnw/hpvfyPj4N5xhmtFj/FoXUUrNjHy/QE/n+zk2OytKB4d2BC7GLC4NgQaNSDPtl4xssysuJhK2
	VMtT8WF2dvkCLvg45np9x11VFNMG6+co/A5K/F4BQRUzmlNed6b7VDBmFbxNpEq8VDD4iRg3PBGbG
	IJ8/ax7tl4aj1qlY9XudK+Rs+s+w9wf1f3W3Gejgoeu1iGSjKXOKunnWf71PXctCnHrgZfiiz93a8
	Sy9JPQwDn4XCBptO0OHfrnlZPFa1z642cvJa6lyBQmf3r2eKa7ZxmGXAqpDZeYOjX9lPXrEoJbw+Q
	wwsEoBYWDsCWznlrQklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7z7-00000006rZY-1s64;
	Tue, 23 Jun 2026 20:44:41 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7z5-00000006rY3-0dTL
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 20:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=sPfOqSYyMVD1TmzxQ73e7MiEPFlzK+Ib0h5frVxP2Dw=; b=uOKtkpL/8A5MfofAaozYgH6Nwf
	mEcCVrLnQmyMzYD+xKEDNG/x+ZKeNN/nxK0zT2SF0SDJjm8nMLQUBvqMlW1bGPxGa4uI/sHVaR9aC
	JR4XMY6JleIlKSbkg36OgSMgcdWwmPc43+niCrpdMRbQqMTcTLJ0vziahQdFtvC0Dfwbp2o3JqjqL
	qZRrNAaVE4i6bYOXB18fwLddVGmVjWYOXm3p1VlAOwXzZbwDx2c07kF+LiyTTg1TFGVcQoFcH9k/s
	t4ljDcn6Ae4hT0pbHlNCJEUaXMoecR0wvzEI0VfMCqN2D6/Qan1IEVlVM2m2GKqGk5sH9PRV3h8zr
	GZ5txDyA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wc7z2-00000004gOQ-2amK;
	Tue, 23 Jun 2026 22:44:36 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH v2 0/5] riscv: dts: spacemit: serial/i2c/ethernet improvements for the K3 Pico-ITX board
Date: Tue, 23 Jun 2026 22:43:44 +0200
Message-ID: <20260623204431.498700-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134439_213124_2D6891D3 
X-CRM114-Status: UNSURE (   6.91  )
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

This patch series tries to improve the K3 Pico-ITX board DTS by configuring the
default baud rate for the serial port, enabling the 24c02 eeprom on i2c2,
adding aliases for i2c2 and i2c8 ports, and enabling power saving features on
the RTL8211F PHY.

Changes in v2:
- Collect Reviewed-by tag
- Fix issues reported by Sashiko AI in patch 2
- Link to v1: https://lore.kernel.org/linux-riscv/20260620062238.3199108-1-aurelien@aurel32.net


Aurelien Jarno (5):
  riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
  riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
  riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
  riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
  riscv: dts: spacemit: improve RTL8211F PHY configuration on K3
    Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 42 +++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++
 2 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
