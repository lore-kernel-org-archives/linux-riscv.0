Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F6C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDTCr6wCq05MShR0OIOHbmL5d3R/IA0b6chyR8NtgD4=; b=EqsUZ4u8uEXnKf
	JNIIka1nuAdgOFxFjJ3tG//p8Q8oR07UhEox/+4lAsNpoxGbRJLiZX0MvFMxgoy5vZqEnDcf3TCoW
	4lRhoytAsMqv5IocOgfJpYol1TztI4ApiY/vxaDYXFd8XqbxVjUf4um/c24BYADNl3mFg8rZr/1Ln
	e9hdtfXyle4LMny5c+Mtk09NPk2ylFgI8+zQoc5+uEo/ssRUIHP6IM4iot6u51C6Sx2ne7BZvctcl
	bUiccyZKpXlj1L6wAeqoaSfrUg9z5lFAzDQfCoVatbp/W9t/ryEZexN4PKZQDZY9hZfiSyQNDpOWn
	FTzPn8IrPdcHqZxTwd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdm0-00BCAh-30;
	Tue, 16 Jan 2024 07:22:12 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdly-00BC9Q-0L
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:22:11 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5986cb7bb61so4097873eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 23:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705389667; x=1705994467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VdJsBun9ralDbam6fQWSWiTkJ0QQ2v0VG1isrzEFbY=;
        b=mOS2ZFTFO0mwy0PrCGh2zDppv8l/8rnPLxQnrkrFvkU79EMfl5KYbfN9TOJftdRv5x
         JYUD6wcM6SXsgDID2hB7Kw81tcx8Z8482leVJI3vJdLiI2ru5PrjkbpwwRlWrYwfENt0
         wtofdonTFh5jaxQMHwXgnzfgLMUfRZPk9Lul1VsbWfienTwZSptlNhYiK7Ez4hpIdSaV
         7BnS5XL1N9kB0fV6EThZ3cGEIpzaGVbWMfiRKPr/AcL0xQs5f/2vnyt5HeVJ7AwnjC++
         Gao/NgAwwb2rhrv2vAOZNvVgb7GhPZKrRfv7d3yyyKP51Ef3n8u3DEsPudUr6yucMRa9
         f4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705389667; x=1705994467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VdJsBun9ralDbam6fQWSWiTkJ0QQ2v0VG1isrzEFbY=;
        b=wYcuVDrPXZaj/GHIoQFFTGRbNQN+MbiYz72wEZonlKy7yTbFs7Vhmgh5V+nFfysMJF
         Er2nZuUmQ2u0EROam5zkFzr/4f5w4razNHGexAwF6n6bcD2srDSVtUWFuEewIv8pDiyu
         tLQT3HPuRTN30Y5KZVv9PMjmob+0iGBsoOaweNOvjvDUZXllPYkuUNh0t7xael/7t6A8
         0gJs2goJy2VTPghBnOHxLfa0oBtgwavJd8P3KFu/o3FYwMIt8VRswNp1lZgdSV5jH2Qz
         xuhxSbE54f2B8dR1lyMfos413XxXa28hbwVC52DoWZ7t7fxMvIZooV1YXg0FprDi867O
         sbNg==
X-Gm-Message-State: AOJu0YztuyCiaqlVdna3rwb4JrSUcTQDHjMluW1CwE6GG1uwq+rxNznu
	bhhsNI/9PzXA7V5Cr1+26X8=
X-Google-Smtp-Source: AGHT+IEUtau+rn47qi3HRqmQHzDvJrSn/jj+5ECcfnyg4F9tUWikFZGdFUmHqWXTUP7JdYXo7Rm7fA==
X-Received: by 2002:a4a:6b48:0:b0:598:2d9d:db46 with SMTP id h8-20020a4a6b48000000b005982d9ddb46mr3444117oof.16.1705389666767;
        Mon, 15 Jan 2024 23:21:06 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id b22-20020a4ad896000000b005990885b67esm436338oov.34.2024.01.15.23.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 23:21:06 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v8 1/5] dt-bindings: clock: sophgo: add sysclk for SG2042
Date: Tue, 16 Jan 2024 15:20:59 +0800
Message-Id: <7071845b8d1ff6aa91112c91feb62bc875066d9e.1705388518.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705388518.git.unicorn_wang@outlook.com>
References: <cover.1705388518.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_232210_144560_EF631E3F 
X-CRM114-Status: GOOD (  14.37  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add bindings for the clocks of which configuration registers are in the
range of SYS_CTRL in the memory-map.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

.
---
 .../bindings/clock/sophgo,sg2042-sysclk.yaml  | 44 +++++++++++++
 .../dt-bindings/clock/sophgo,sg2042-sysclk.h  | 63 +++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-sysclk.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-sysclk.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-sysclk.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-sysclk.yaml
new file mode 100644
index 000000000000..93b0631dcd0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-sysclk.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2042-sysclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Clock Generator in System-Control
+
+description:
+  These clocks have configuration registers in the SYS_CTRL range of memory-map.
+  So the node should be a child of system-control node.
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-sysclk
+
+  clocks:
+    items:
+      - description: Oscillator(Clock Generation IC) for Main/Fixed PLL (25 MHz)
+      - description: Oscillator(Clock Generation IC) for DDR PLL 0 (25 MHz)
+      - description: Oscillator(Clock Generation IC) for DDR PLL 1 (25 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-sysclk.h> for valid indices.
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+      compatible = "sophgo,sg2042-sysclk";
+      clocks = <&cgi_main>, <&cgi_dpll0>, <&cgi_dpll1>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2042-sysclk.h b/include/dt-bindings/clock/sophgo,sg2042-sysclk.h
new file mode 100644
index 000000000000..f7a9fbce16f8
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2042-sysclk.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_SOPHGO_SG2042_SYSCLK_H__
+#define __DT_BINDINGS_SOPHGO_SG2042_SYSCLK_H__
+
+#define MPLL_CLK			0
+#define FPLL_CLK			1
+#define DPLL0_CLK			2
+#define DPLL1_CLK			3
+
+#define GATE_CLK_RXU0			4
+#define GATE_CLK_RXU1			5
+#define GATE_CLK_RXU2			6
+#define GATE_CLK_RXU3			7
+#define GATE_CLK_RXU4			8
+#define GATE_CLK_RXU5			9
+#define GATE_CLK_RXU6			10
+#define GATE_CLK_RXU7			11
+#define GATE_CLK_RXU8			12
+#define GATE_CLK_RXU9			13
+#define GATE_CLK_RXU10			14
+#define GATE_CLK_RXU11			15
+#define GATE_CLK_RXU12			16
+#define GATE_CLK_RXU13			17
+#define GATE_CLK_RXU14			18
+#define GATE_CLK_RXU15			19
+#define GATE_CLK_RXU16			20
+#define GATE_CLK_RXU17			21
+#define GATE_CLK_RXU18			22
+#define GATE_CLK_RXU19			23
+#define GATE_CLK_RXU20			24
+#define GATE_CLK_RXU21			25
+#define GATE_CLK_RXU22			26
+#define GATE_CLK_RXU23			27
+#define GATE_CLK_RXU24			28
+#define GATE_CLK_RXU25			29
+#define GATE_CLK_RXU26			30
+#define GATE_CLK_RXU27			31
+#define GATE_CLK_RXU28			32
+#define GATE_CLK_RXU29			33
+#define GATE_CLK_RXU30			34
+#define GATE_CLK_RXU31			35
+#define GATE_CLK_MP0			36
+#define GATE_CLK_MP1			37
+#define GATE_CLK_MP2			38
+#define GATE_CLK_MP3			39
+#define GATE_CLK_MP4			40
+#define GATE_CLK_MP5			41
+#define GATE_CLK_MP6			42
+#define GATE_CLK_MP7			43
+#define GATE_CLK_MP8			44
+#define GATE_CLK_MP9			45
+#define GATE_CLK_MP10			46
+#define GATE_CLK_MP11			47
+#define GATE_CLK_MP12			48
+#define GATE_CLK_MP13			49
+#define GATE_CLK_MP14			50
+#define GATE_CLK_MP15			51
+
+#endif /* __DT_BINDINGS_SOPHGO_SG2042_SYSCLK_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
