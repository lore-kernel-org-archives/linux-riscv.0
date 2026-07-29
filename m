Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFFCC54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiSddsqsKhjeefzZgZ6JqqE2g/oxdLtRESrq86zY/HM=; b=L4PQxi+jBqm2wm
	fZod388bkgoZqxvwCZoEWk+DpZEL1git5HEEeGmeZD3fBCpxCLDUhUKkTpNMcjVegUsSHJ6ng1t2p
	idIM99rfKzPg9hXB+JnC66GcEH6XzbIsdr0CP4QnoB+yoI45YuHU6ALIIMZR/iiimrxITKowLKzXF
	FecP/zPSC6G55Gq0jwu8ZKdYwfePfVHE+ZaD7ZMNx2nR/mKDhaADxZXe/rTtkRbepsVtlfHQikODx
	8WvGIwIt3ZlP8NdfmNKjDqnzMOCdwkuM2173r7ULdE/7Df3lSqun+dpuL9SrvPUNt6s4meYr/MSQy
	Lzyexu5AUtYtZDYyeGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5sy-00000008LPz-2vk7;
	Wed, 29 Jul 2026 15:07:56 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5sw-00000008LPC-1q8z
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 15:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=VombVeVEGFL3LwEWi5uWJnDV/Y88u6pNgKzx+naWxCk=; b=RRH9y1FKHlID37WPVQWnY49VZy
	Ox8LFsOz0/7ex0L43EOH3FZOOK8UjJx6n/kV+yqPx6BQIIgIvjfrpl8CNU3pg8WJ8ugNPL9RzPM39
	8U46L8zIHcEmVrDZ5hHBTGlAMBMhieTc2HBT7ZUsmMZv1ivBh6yhLGldFUAFshRFVlI3xRd3XoOzg
	DZoAd+AvVOV6ZL/jprFX/8aUy2rb4LPHao9oeVcCBmVl8h1ZyD8lLNxd10u9z9KCBtV3ZXDaoj8nu
	Ac6uNvveSJeHiJda+SX2yP5fApcuVM7EN6mqTGtFADJyXQhWfH0m5s2aqRy+hPLA3hY9h1GQs+A1J
	A8NvgSlg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp5su-00000002eC8-1HXQ;
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
	Andre Heider <a.heider@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 4/6] riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
Date: Wed, 29 Jul 2026 17:02:21 +0200
Message-ID: <20260729150722.1598630-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_080754_478202_D2DCE5A2 
X-CRM114-Status: GOOD (  10.91  )
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

On the MusePi Pro board, the buck1 and buck2 voltage regulators, which
supply the CPU core voltage, are configured with a maximum output
voltage of 3.45V, while the highest operating point requires only
1.050V. This means that a kernel bug, OPP misconfiguration, or
privileged userspace could request a voltage above the safe operating
limit, causing possible permanent CPU damage.

Set the maximum regulator voltage to 1.050V instead.

Fixes: e2dac7c7a3a8 ("riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure")
Link: https://sashiko.dev/#/message/20260728211020.1248676-2-aurelien%40aurel32.net
Cc: stable@vger.kernel.org
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 3078ffb5cb878..246f8f2ab62b9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -180,14 +180,14 @@ pmic@41 {
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
