Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8462C282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xboZw0BbNjUKU1oHOn4Kexkd2mz+Uf/iQAxqOChU8EM=; b=TuozvUODYzDuop
	k35cTtb6bKFCXa/ZQ4i1kT0jVPfW0zit7ItIwlAEqeMaG3GNv9iCK1ZXaMnPKyiWlo5Ac4WbLOYsx
	FAkiMLEvxRVda+bRmTGQiUyYnmGSWAfJUBDXNI/c2bLk/Jo+gR/ln31vaMKOiPAef9vTjNwSnfePC
	4ff5BbqGnlPY/S6IiQXiHA5Le6uep+j05X/NhNuwId8+5+eQOSRx8cQ5ihGtTw8ahO9kmI2Q+QlnQ
	mKkMx3hmdzirxjmXblMNVnr8GHV6pMfUA9a2FmTBlAQ4fS0ZehAxH3LF76AXVn/IQIbnzXINKq+gC
	LrrqWirhgPXEJC8daFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFVp-0000000Blm3-2f6m;
	Thu, 06 Mar 2025 18:00:01 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFVm-0000000BlkB-3UbM
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 18:00:00 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 44C43EC59F9;
	Thu, 06 Mar 2025 09:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741283998; bh=dgfOnH6vaz3LkYGcL/Dct4SIHTh2z+vvYg+nnzOSCU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PjXw0kq35mn3snnLe7pv3CntmmjT8Jz1N/4I2HEeVU8ufzlvWrgyXFDz3ew1uDTN7
	 hVZJWT7Zg7cAzeuI8CFIbrPfAFvAZgFcC/a1pup2QaXqbMuYqUms5XLRVGrR/ALbna
	 FKk4ezXoBuQmiSWlszBP2Bh9zrSfb57K+W6a2G/CY5jrkf8ZO+dici6bIxAfv/yqmt
	 7v+pIvDGTwv3hmr3zVAjvf0MN/5F80PGm/iE3oUZjvQRXNcur2J48uuGxzS4lFE5JJ
	 fPYxyHZXUdrOEPe3VjLBdeHXuUUtYk0vKIpkUfgWEBng9DatoWVqnHILYbWkZVsc0d
	 CAmtCiDjBzp2Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onNjsI1Wy5tz; Thu,  6 Mar 2025 09:59:56 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id CEF69EC59F2;
	Thu, 06 Mar 2025 09:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741283996; bh=dgfOnH6vaz3LkYGcL/Dct4SIHTh2z+vvYg+nnzOSCU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOI8oZDTz/pdDx/qJhqBY/ETwnfyGNorWVt9UHeIZgUqFTu3LCYzlofG62KbjBWyo
	 4K3rFAGozl2dhpnw20SbHrag2ood+I1luFSPe/F/xaFc/+FqUvo6t+5viBNvCpPueq
	 +vf/mTlOCYm0EQo8no++oiSCkk+8dKvSCS5taHCbmsfrDY4mE57djqaWqUopgC/pbA
	 7EOOzcaudTVL8QQkTk2u2wNNWRj9zJ9bQV+hyw4+a8rErCwcoPIwthlrSIrprC1PCx
	 9Nv7vdcmV2bLdE2qmTs6da7dA8jPBbu4o/vpFbtaKjcKFtekKIkUAMLDSSynsMZGw0
	 o3StRxU57Euag==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v5 2/5] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Date: Thu,  6 Mar 2025 17:57:48 +0000
Message-ID: <20250306175750.22480-4-heylenay@4d2.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306175750.22480-2-heylenay@4d2.org>
References: <20250306175750.22480-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_095958_922119_CA2B76BB 
X-CRM114-Status: GOOD (  13.02  )
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

Add definition for the PLL found on Spacemit K1 SoC, which takes the
external 24MHz oscillator as input and generates clocks in various
frequencies for the system.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 .../bindings/clock/spacemit,k1-pll.yaml       | 50 +++++++++++++++++++
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 37 ++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
new file mode 100644
index 000000000000..23d7aa1bc573
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K1 PLL
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+properties:
+  compatible:
+    const: spacemit,k1-pll
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: External 24MHz oscillator
+
+  spacemit,mpmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the "Main PMU (MPMU)" syscon. It is used to check PLL
+      lock status.
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/spacemit,k1-ccu.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - spacemit,mpmu
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@d4090000 {
+        compatible = "spacemit,k1-pll";
+        reg = <0xd4090000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        spacemit,mpmu = <&sysctl_mpmu>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
index 1f8b01db44ca..4a0c7163257e 100644
--- a/include/dt-bindings/clock/spacemit,k1-ccu.h
+++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
@@ -6,6 +6,43 @@
 #ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
 #define _DT_BINDINGS_SPACEMIT_CCU_H_
 
+/*	APBS (PLL) clocks	*/
+#define CLK_PLL1		0
+#define CLK_PLL2		1
+#define CLK_PLL3		2
+#define CLK_PLL1_D2		3
+#define CLK_PLL1_D3		4
+#define CLK_PLL1_D4		5
+#define CLK_PLL1_D5		6
+#define CLK_PLL1_D6		7
+#define CLK_PLL1_D7		8
+#define CLK_PLL1_D8		9
+#define CLK_PLL1_D11		10
+#define CLK_PLL1_D13		11
+#define CLK_PLL1_D23		12
+#define CLK_PLL1_D64		13
+#define CLK_PLL1_D10_AUD	14
+#define CLK_PLL1_D100_AUD	15
+#define CLK_PLL2_D1		16
+#define CLK_PLL2_D2		17
+#define CLK_PLL2_D3		18
+#define CLK_PLL2_D4		19
+#define CLK_PLL2_D5		20
+#define CLK_PLL2_D6		21
+#define CLK_PLL2_D7		22
+#define CLK_PLL2_D8		23
+#define CLK_PLL3_D1		24
+#define CLK_PLL3_D2		25
+#define CLK_PLL3_D3		26
+#define CLK_PLL3_D4		27
+#define CLK_PLL3_D5		28
+#define CLK_PLL3_D6		29
+#define CLK_PLL3_D7		30
+#define CLK_PLL3_D8		31
+#define CLK_PLL3_80		32
+#define CLK_PLL3_40		33
+#define CLK_PLL3_20		34
+
 /*	MPMU clocks	*/
 #define CLK_PLL1_307P2		0
 #define CLK_PLL1_76P8		1
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
