Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FF1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLcreWZspmJWrio3CuBdNcQlxMiP+HaCad31B7o3pgc=; b=IfSZUZsoFL3IIT
	WtAz7A0xXxlEPGJ1u19j1ryd9Y3qULVUFWOxRvCh8lj0wa4zXO6nwFLFyqEfiAS+qzsLCJQXD5sw8
	xkYPydtob846AWrQAp7LjTxDZPd511i6VAkBISHQSANLXj91xFja5ltxO3ymg8JOqkd9Svv2upcqh
	hWM8rj8KaVCPbUQCwPGIn9nK8kJFaGz2G/PTApPlqyh0ey+fM0qZ9wjhKa1tWN2/3r4oGTpVXqArQ
	hWBwLVSsWx7AjUbPdIEjuZ1FcmudgGWuwCLgOE3QWLWzFHckmBllBI6jbLoy9RG07flxGOn93EDfJ
	ItynsWWKAl2DDwX3Zc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LSD-00Cy81-17;
	Mon, 13 Nov 2023 01:09:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LSA-00Cy6f-3B
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 967D9B80B25;
	Mon, 13 Nov 2023 01:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71F6C433CB;
	Mon, 13 Nov 2023 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837765;
	bh=eM8d9IMh9iQd7b2YIyNC18c8crry0l3aFLLjrqGpruk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6rb0rquzaUvuzBIP52vidXntbBi5DW5ejXnhTOUBEwOPsf8ZN5BMhV8fR34Lx5ip
	 5JkRoKxH41DzNnuB04HSXBupca8B9hDi3cuIWjczJ6JO9eqnJQjjOKE5KAzpzEwBuE
	 qdHLIdJgAiRr+fpy1YJIYi9/snJYD66jf17nwDh0zfWscpB/IrbuKSo0AqTX7GqCZT
	 mfPbCUYYhl+XKOfLGNeWMs4YC3IJh+ZPH27RTLGyIJ+H5rB9fan8N90hM5IGyKWU45
	 0DiSQnTobBsQZMU/NTDqwFFaG2iLFJdsVVA/szOWrjgG6Jx3PKHUTUWDkV7EpLP0Tu
	 epwC5wBII2xww==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Date: Mon, 13 Nov 2023 08:57:01 +0800
Message-Id: <20231113005702.2467-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231113005702.2467-1-jszhang@kernel.org>
References: <20231113005702.2467-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170927_168747_2399E376 
X-CRM114-Status: GOOD (  12.99  )
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

Add the reset device tree node to cv1800b SoC reusing the
pinctrl-single driver.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h

diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
new file mode 100644
index 000000000000..ed78b6fb3142
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides constants for pinctrl bindings for Sophgo CV* SoC.
+ *
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
+#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
+
+#define MUX_M0		0
+#define MUX_M1		1
+#define MUX_M2		2
+#define MUX_M3		3
+#define MUX_M4		4
+#define MUX_M5		5
+#define MUX_M6		6
+#define MUX_M7		7
+
+#endif
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index e04df04a91c0..7a44d8e8672b 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
 
+#include "cv-pinctrl.h"
+
 / {
 	compatible = "sophgo,cv1800b";
 	#address-cells = <1>;
@@ -55,6 +57,14 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		pinctrl0: pinctrl@3001000 {
+			compatible = "pinctrl-single";
+			reg = <0x3001000 0x130>;
+			#pinctrl-cells = <1>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0x00000007>;
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x03003000 0x1000>;
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
