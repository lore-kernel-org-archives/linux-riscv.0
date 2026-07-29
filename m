Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70944C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK9bfqJNHtBG1H1gWZUOSKj1N4U/h/+QoXcSqVStGRU=; b=GJrWGSJWsFoFSo
	eC2b7SqWq5JMtBNe78ZY/22EJjF073SLA/RlWxQle201cFOokP0/oqBW7/chwnHAevp5tCRcCSuh9
	d9aMC/FUNCDaNt9xpaFbaBXAmkZsuTB0wGi209OHQZLTXmgY+dhzPgHMGTzKh8TTe0bY8dgm+OWNC
	PzXSopcvqaFAj1hwfHZg2tNXdLOxUS3xF/krpceUvep6WHX2eUX3/xswIUsi2/PbOTwIXVb1Jixl9
	8U+xcQNpA8G3GZMNgrQVhVJ2kuJDsL3R3VIYvQmzTMc7YA8lgeiTwGXm+ZvYji8AL2kUs4GI6VXCW
	ZFN1ajRxlIaleipmr6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5t7-00000008LTc-3OG1;
	Wed, 29 Jul 2026 15:08:05 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5t5-00000008LSI-1nnp
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 15:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9GCHA7xIhaJsYc9K/gElGpvzs0h61VGIvTXBIIzT2QY=; b=bRZ/f3dulCdpILjEGzoCG4+VTe
	/Em5J0+JlBtudmbldAHNgxiIEPvUu10pIbGwkAaNea6V4ZmN36zoE9Gi+9OmUCMy+jVtpOXh/1ZnB
	gdhwj5tslbjsk82fRYaoZ1nvfolc1PieR8mlb84xaSkq5bZ0+kkWcWekGeC9oa5RK1SAFOZvNvySO
	8EhPLcVuvX72VepmP193BjG6bEwHyTSRQpZi/XCD8EF6vu0o4GaUuICkDrKJgmfZMF5meH2Dpyoeh
	XhH3ErAZJO+b9+tCOefK6fOeF2Gk/VBbPZILawjVF0EbwVt+5XlSjaXO5IlHUGEQaXUDt9WIp4iay
	xl6GjJQQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5su-00000002eC4-1KJw;
	Wed, 29 Jul 2026 17:07:52 +0200
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
	Han Gao <gaohan@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/6] riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
Date: Wed, 29 Jul 2026 17:02:20 +0200
Message-ID: <20260729150722.1598630-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_080803_479749_1C313BF4 
X-CRM114-Status: GOOD (  10.82  )
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

On the OrangePi RV2 board, the buck1 and buck2 voltage regulators, which
supply the CPU core voltage, are configured with a maximum output
voltage of 3.45V, while the highest operating point requires only
1.050V. This means that a kernel bug, OPP misconfiguration, or
privileged userspace could request a voltage above the safe operating
limit, causing possible permanent CPU damage.

Set the maximum regulator voltage to 1.050V instead.

Fixes: c02c047b925c ("riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2")
Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aurel32.net
Cc: stable@vger.kernel.org
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f30..b907a1396b21f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -164,14 +164,14 @@ pmic@41 {
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
