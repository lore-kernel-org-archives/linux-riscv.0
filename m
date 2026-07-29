Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6937C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onq6rtco7THEoi5w0oKpd6yJR/BOtUQKB6QR8saAgzQ=; b=YULCGF5szKFi/Z
	ZbNSAzG7Jyzrw9vsv5brwCDN1qiBm5b0wpNkj1HZQPt4frRf3RBPOieVMrwBN9/uq8KKk/q8xEd07
	CE2yIqBJXo9b+PZnt9Ga/tnBV2BK3vbjHUL/uPqxbgbUN7P0lPZw95t9n73KRcC+oFkUkKr7nmlnp
	htpe+oc1k8zYo//Ym1hb5Fz2FUF6zHWxrFoaNr4vey2vO49BmdegbM8Leu3YsVjRh6qpLgL4y1Eba
	G/eRrsC5J/QJMsbKa0nQz5we6qLm6W5t/CsHneCBqXulxjE/zs4LAocdNVLLeTMsBNbVHju/SMZ6Y
	v1dx425E9l5t3L7RmV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5tD-00000008LXE-0V3g;
	Wed, 29 Jul 2026 15:08:11 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5tB-00000008LUu-0B3P
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 15:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=/mUnazbboWkLqdv3LvZi2qvz+fGeF1rBdtXR4iXRUGk=; b=yZZeeyTTiM1cTtjjn0q/DfCnPg
	QTbWvuE5tmRrrY2sT+Ca0VZ6PH41nsub2Cen/8hg8eM6bZ978X8RZxIPb0OZe0GaeLNPiNGh5s3jX
	xgM6KfuBcfj2wmtb2xb+cSn2vnfxvpex+F8zBzq75OP6tMiW9VpiOYGfvtUC+Su8FJpujhq7h5FiX
	Ck1hU4sH2Kt40ZmC5zLmCJaqigofYHyOhGh133N6uZ5prTAmsotjq+cyL+KiQkBWGbdpeZenzmsyc
	lkL5eav3UFsPtVUa4JD3lTouT9LJtfJe4BFB6lV2FPye69F+bG+3cXoz/IOMFpb4aV0Tetbc4g5Lj
	5T64du+A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5t6-00000002eDD-0cGW;
	Wed, 29 Jul 2026 17:08:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 6/6] riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
Date: Wed, 29 Jul 2026 17:02:23 +0200
Message-ID: <20260729150722.1598630-7-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_080809_106963_652EB9C2 
X-CRM114-Status: GOOD (  10.78  )
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

On the Banana Pi BPI-CM6 module, the buck1 and buck2 voltage regulators,
which supply the CPU core voltage, are configured with a maximum output
voltage of 3.45V, while the highest operating point requires only
1.050V. This means that a kernel bug, OPP misconfiguration, or
privileged userspace could request a voltage above the safe operating
limit, causing possible permanent CPU damage.

Set the maximum regulator voltage to 1.050V instead.

Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board")
Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aurel32.net
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index bf502c87040a3..81c40df2a3663 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -114,14 +114,14 @@ pmic@41 {
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
