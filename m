Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0723DE81DEC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opQV0ASeeHdHmwTyrGkXI7GJGg090DLZ6JXTarXA7y4=; b=xGSgjcb21CdoDP
	udBHaovtQAjkNH+r8n1rAFSpS5gdfct3yOgbPvhpSbVnXynBDV61t8vehck/kG7VlDir6wpvjjSoR
	v0y5CGeq/pNhPWMtQ6Qv+GZw5vN22iI5mkquEON/TXDV05fHMykqya32bcxDyso1bqiCpi9gmqiUP
	stLgf20rvUPN6mFCYNpP10w3F2F3F0kvB5rsUH2azA7osHvK7V5IvdSbaihtlMJW7W5VI/s+Kr1HZ
	kM+tgEZIJdcyMm5WQNz1249Dcae1xrRtC9I3V+JfEf13prN0Ah8d8GTc4gzVOYb/BI+8BvGltBWx9
	1WJwLKOhByMsbXlfwt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvL-005m8h-2j;
	Fri, 06 Oct 2023 12:27:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvH-005m6T-1r
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 292E5B82908;
	Fri,  6 Oct 2023 12:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3600EC116A7;
	Fri,  6 Oct 2023 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595233;
	bh=RtdMEoqo8nayEQ4k8BfxK/6NPIxdjeCli2iRVgA15Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9Zm4XpqcRXxtoKBJ04/OP2WV4jBlgdVOmS+pJWo0bE4lEilHOgidYWUHIXLM6bHS
	 IzwlrGHDYYQg4jsC7LSgmgWQ/WnB4i62BF9L8muVDrWTRqsURMvOM2oJvCnWRXJ18j
	 T/ukWIQtJ/2wYXWptjfh1DluHgU7a51xfTo6oyEbnLnE/zEYEi6MRcDtKKK3NU6Pmf
	 Smm4b938sKDqReI6BKx5sOe+bwcR6RHz30msy9DW9c0slSSSq1qgmYnBnqUT7Nk8SC
	 MLIr3hBjTtrQb3W8HSoLrwcKKDQIsYQoy7HzmeArK3UUxC5lKEeUuC7UVOky8jqkC7
	 /eCzsLbTMzZAA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH v2 5/5] riscv: dts: sophgo: add Milk-V Duo board device tree
Date: Fri,  6 Oct 2023 20:14:49 +0800
Message-Id: <20231006121449.721-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231006121449.721-1-jszhang@kernel.org>
References: <20231006121449.721-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_052715_744027_FDA812A3 
X-CRM114-Status: GOOD (  13.11  )
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

Milk-V Duo[1] board is an embedded development platform based on the
CV1800B chip. Add minimal device tree files for the development board.

Support basic uart drivers, so supports booting to a basic shell.

Link: https://milkv.io/duo [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  2 +-
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 5a471b19df22..3fb65512c631 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
-
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
new file mode 100644
index 000000000000..3af9e34b3bc7
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "cv1800b.dtsi"
+
+/ {
+	model = "Milk-V Duo";
+	compatible = "milkv,duo", "sophgo,cv1800b";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x3f40000>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
