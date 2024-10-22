Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A585AD1CDA1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 06:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BA7/H9hPUj2GdP0ahl7qd0JEXE7GcRBcwEnqTbYnzPY=; b=bfgo9KDTZ0cbDt
	RujWUcACcDXkZ6sUJcZ+YSvsqvPt8z0MvV5kXtFM2La4mTP1eG7huinz7Oi+pe61NNW9+IojtfMnI
	YXOZ7HarKw7krVX2mAKlcbHMaYUv81KZYXZmV/WwUdLGuDenmoxv4UX0MSDesINC+/w1MFV10lMLq
	vzmt3r98G+0UlIdz9hzlSiGjyINalZ9niwDMMf9B+yf0+i6g7qfNW0wMghQafVWPo8Mq7qeGaqZGY
	mEIUKNmGEW+F7LGnFkfHJrjAWFlp+mtJpZFfKoxxux6mS7+F6opBLNAFc/HKcpfF5YSA84nKK95IQ
	Yc/aEI7UpJP/wVRPHd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t386w-00000009lUe-2kK7;
	Tue, 22 Oct 2024 06:11:18 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t386K-00000009lMh-2FnC
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 06:10:42 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 19980B2C16B3;
	Tue, 22 Oct 2024 08:10:30 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Henry Bell <dmoo_dv@protonmail.com>
Cc: E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: starfive: Update ethernet phy0 delay parameter values for Star64
Date: Mon, 21 Oct 2024 23:09:51 -0700
Message-ID: <20241022061004.62812-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_231040_767465_40F8CC23 
X-CRM114-Status: UNSURE (   8.02  )
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

Improve function of Star64 bottom network port phy0 with updated delay values.
Initial upstream patches supporting Star64 use the same vendor board support
package parameters known to result in an unreliable bottom network port.

Success acquiring DHCP lease and no dropped packets to ping LAN address:
rx  900: tx 1500 1650 1800 1950
rx  750: tx      1650 1800 1950
rx  600: tx           1800 1950
rx 1050: tx      1650 1800 1950
rx 1200: tx 1500 1650 1800 1950
rx 1350: tx 1500 1650 1800 1950
rx 1500: tx 1500 1650 1800 1950
rx 1650: tx 1500 1650 1800 1950
rx 1800: tx 1500 1650 1800 1950
rx 1900: tx                1950
rx 1950: tx                1950

Failure acquiring DHCP lease or many dropped packets:
rx  450: tx                1500      1800 1950
rx  600: tx      1200 1350      1650
rx  750: tx           1350 1500
rx  900: tx      1200 1350
rx 1050: tx 1050 1200 1350 1500
rx 1200: tx           1350
rx 1350: tx           1350
rx 1500: tx      1200 1350
rx 1650: tx 1050 1200 1350
rx 1800: tx 1050 1200 1350
rx 1900: tx                1500 1650 1800
rx 1950: tx      1200 1350

Non-functional:
rx    0: tx 0  150  300  450  600  750  900 1050 1200 1350 1500 1650 1800 1950
rx  150: tx 0  150  300  450  600  750  900 1050 1200 1350 1500 1650 1800 1950
rx  300: tx 0  150  300  450  600  750  900 1050 1200 1350 1500 1650 1800 1950
rx  450: tx 0  150  300  450  600  750  900 1050 1200 1350      1650
rx  600: tx 0  150  300  450  600  750  900 1050
rx  750: tx 0  150  300  450  600  750  900 1050 1200
rx  900: tx 0  150  300  450  600  750  900 1050
rx 1050: tx 0  150  300  450  600  750  900
rx 1200: tx 0  150  300  450  600  750  900 1050 1200
rx 1350: tx 0  150  300  450  600  750  900 1050 1200
rx 1500: tx 0  150  300  450  600  750  900 1050
rx 1650: tx 0  150  300  450  600  750  900
rx 1800: tx 0  150  300  450  600  750  900
rx 1900: tx 0  150  300  450  600  750  900 1050 1200 1350
rx 1950: tx 0  150  300  450  600  750  900 1050

Selecting the median of all working rx delay values 1500 combined with tx delay
values 1500, 1650, 1800, and 1950 only the tx delay value of 1950 (default) is
reliable as tested in both Linux 6.11.2 and U-Boot v2024.10

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index b720cdd15ed6..8e39fdc73ecb 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -44,8 +44,7 @@ &pcie1 {
 };
 
 &phy0 {
-	rx-internal-delay-ps = <1900>;
-	tx-internal-delay-ps = <1500>;
+	rx-internal-delay-ps = <1500>;
 	motorcomm,rx-clk-drv-microamp = <2910>;
 	motorcomm,rx-data-drv-microamp = <2910>;
 	motorcomm,tx-clk-adj-enabled;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
