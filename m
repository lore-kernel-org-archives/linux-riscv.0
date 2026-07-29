Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2196EC54F55
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFRUA4j779divMCh+/2crOJXLTN1gDhH4wPPHQ7HdoM=; b=JENADMSunn8Rq+
	gO9IGyNRzsJT/q0dRuzO8cXcfFGSF4nrKG+urf6IPH9U74pkFKtU0OiDuTazI78WeFYvtcfqptorQ
	GtaZa/fYvg3yYyIDC2X5tB1XpBtRWmY2tKMatI+/THY3EKUvbhIKStnfxzoxqR08ZjtTBio10Yu4N
	cH2RhXbG5Vi3l3A5P1NFUj0G+trtKKuBh2vIzBVGLWTzIbldQ6ThWoFWLmNk9pEI6Qwf8vMuv7baU
	cCg1QMZu0Xfr3bYZAB4DlcjI54NgVFU9Of59N17NIZ9XSbfKWJxJDWatw/zKBwu4W2IaoSi63GPFa
	DF5eviRWV3WTgBPy/rgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5tA-00000008LVI-3xlC;
	Wed, 29 Jul 2026 15:08:08 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5t7-00000008LSv-1uui
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 15:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=VmTyrzNOKLkXGmYONrNsdkwxFuwC/8LaXNMjyLzqq/c=; b=yUcLGA3SUSTau/EhHZZiKYcHdK
	6OE7LgvcyOPXGJbnLJff4GVh/+y3je2oTw/H5QoRo0Lt4cMSZq/0+rb2rlZZbZ5QW0kD2I0LFeETV
	FL54s5FohkmNnt8ij9hynUPhoJ+WwpUAtLVLxvZYKLStQ27sc3T1dc7U5YCxQ3Fms440b/FwoD/vL
	5JGwhRDr2yocime9rgPfwC/nXKvbg8uDjfL5ocSOq3kTBBX83bSNdUIB8XPdi9NzXBjoh/JGZpWgg
	hov9UV1jcFRqzD9jJNmZuJP5Nke1LKUBhB67iYRag2JjS1+3xNvhDlz924I35dUGaeJ7Hmybqsko6
	NC5Ie+ow==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5t5-00000002eCt-18o5;
	Wed, 29 Jul 2026 17:08:03 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 5/6] riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
Date: Wed, 29 Jul 2026 17:02:22 +0200
Message-ID: <20260729150722.1598630-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_080805_523758_1B14ED03 
X-CRM114-Status: GOOD (  10.80  )
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

On the OrangePi R2S board, the buck1 and buck2 voltage regulators, which
supply the CPU core voltage, are configured with a maximum output
voltage of 3.45V, while the highest operating point requires only
1.050V. This means that a kernel bug, OPP misconfiguration, or
privileged userspace could request a voltage above the safe operating
limit, causing possible permanent CPU damage.

Set the maximum regulator voltage to 1.050V instead.

Fixes: 793cc54475b4 ("riscv: dts: spacemit: enable PMIC on OrangePi R2S")
Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aurel32.net
Cc: stable@vger.kernel.org
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 24591f7c3d236..2d1ba34cb00e2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -134,14 +134,14 @@ pmic@41 {
 		regulators {
 			buck1 {
 				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
+				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
 				regulator-always-on;
 			};
 
 			buck2 {
 				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <3450000>;
+				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
 				regulator-always-on;
 			};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
