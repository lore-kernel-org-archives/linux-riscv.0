Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CFCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C4d8qpnlShn8zTIzTIbMqaIMrpRV7Ov14spDUhL0MXY=; b=MqCc8NTURQ3LZ8
	5gZVVd0ZUuIT46H5etB/ZwGqzXGy3+RyukyO4+wlVECHYfmmdxlUILPzT40FCJVMRzhxk1ivL7V4F
	oQIQu007zc91InwLHgK3iTUc3mQ2IW8r5G1j3vY+4eLj04cLGnt9+T/4uwMYx1OSLTMlxEVcxQlLJ
	wuuif7v+QkIt5LqOs2iu9qdQTHZge0Rsh7u2AKHFYgPZ5Xb1CqNAR+ReMokowoLyxyxrLN3vJes5Q
	ab2W5jjOA7Gz0M5EpzVsfGofgcSwnDMKEK69IQiyb3T3cvWZ5Aqu4GEAXDK/krAnbXPw8pq038A2i
	KYeemJKFQnLZbKJNSrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Hh-0000000GPmI-44W0;
	Mon, 17 Nov 2025 16:40:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Hh-0000000GPmA-1Ki0
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BA906023A;
	Mon, 17 Nov 2025 16:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D47C19421;
	Mon, 17 Nov 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763397656;
	bh=0u/fEso+kgrOQ7Z6mwNX61ZMy46Dsfj98uHXjWsMpcI=;
	h=From:To:Cc:Subject:Date:From;
	b=YqTKQsODxD5mu16b0gX2eCNqmjaieYGgZrGipXZsiLPR113mdl4oQvQOIthN0Nv5L
	 /zkR852Ya7xCttPoHljGzxbWm6xIvHMtbtvvpYougYDjGVflGSMqgNYL3O/VpuDpz6
	 UpWWTLRpR7YUrMmPILJDpmFz+CInnuqk0usQMGcFt0n9+WUpqVz6iymKYrNsjP1iI/
	 IL470I/jODMLXFndzWOThOIS+Omxo9y1jblsODxjzt09qfIKR+xKPUdJ+TPEbs8CGh
	 H8vOpbfwI5BVdQcJMkV+7/nsD1vu95r7GI/WQNKm28mzmvlTjpFR4nIDjjBtfz0cEw
	 Yj6NAqHM9wMIA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1] riscv: dts: microchip: can on mpfs requires resets to function correctly
Date: Mon, 17 Nov 2025 16:40:46 +0000
Message-ID: <20251117-reference-mangle-17721deeb79c@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eWRbRrZhKobb1L/Lydi0NVCS0F3M286Cohr8lQnFPWA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSAbwpRxhvvTEwX/q485/u+6NpJXkTZsQGqRwp+cd2c 23X6e/XOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRyJeMDA2XH9VccRcr3Cp/ 7t+jorfyKsw7LFfvntA6Ve/aot/LpdkY/udc2J1vZ7v5sKnXqa2PY34J5EU+LVvf+PrWHdGqaMu tEdwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

The can driver must use resets during normal driver operation, and will
not function correctly without them. Add them to the devicetree for
mpfs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org

linux-kernel@vger.kernel.org
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 0fb94581b6cb..015f1daf5f61 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -444,6 +444,7 @@ can0: can@2010c000 {
 			clocks = <&clkcfg CLK_CAN0>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <56>;
+			resets = <&mss_top_sysreg CLK_CAN0>;
 			status = "disabled";
 		};
 
@@ -453,6 +454,7 @@ can1: can@2010d000 {
 			clocks = <&clkcfg CLK_CAN1>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <57>;
+			resets = <&mss_top_sysreg CLK_CAN1>;
 			status = "disabled";
 		};
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
