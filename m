Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47A8C00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51aZLH8KQmXNw9EjNJZyIsXpiBg9ddm59GChGnfKEYA=; b=UqcXOvCTjvRO4w
	llnxHyuSJ8uH1G27szVqvC3QhZ16z5989BuL2wP6LwwKOe9QApW42Ox0kzMeA1rxpAbjfdWDRLZNw
	scXMKnS6DDJvO/d0WrY3lKJJiSYCv0dRI1VB/qR7hMq/jhrz9tQKv5G1cLpvH+/7iqffeaYwiJVIQ
	Bxmp++LcFO6DJ4jvggWOBEqYnYYPccsRBtMH1quwNn7bLkJdFZFGNBSrBkja5bsL/PXLmebPMzunw
	NRGycf1vb2ir/xoRD2RETb23N7tsB8P2YaVTkN4H/zJOqZjusJkLDRlrjuxuGskpB1qNQp+Q6NLAq
	HHKTGRAndPTK452E47Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGg2-00000007KAl-3PTP;
	Mon, 15 Apr 2024 07:22:54 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGg0-00000007K9O-0f6U
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 07:22:53 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2330f85c2ebso2017238fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713165770; x=1713770570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auVFVf5TZOUclH6ERFg1awZazyADre7qdwcfKdlYJq8=;
        b=cPr/NI2qPzkDeFp90GatWUvmE5M+n2IMp95oY3ubXf5TKIi/v1p4foZtrvGbwLvEk7
         dwuGvTYNMHYsK6BSbsbLz218gls/19WabJELXAJ1TjA1vPZjdk46BlQpsW+DDXsPU0sl
         J35tdZHXm80fbncUaS2QpvC0xSORRKDxlKMWLpmqn7YcK4I8ykCbgps4FKv2a2CTa5sy
         GqTZu2b5FtbzjvhYOCiLaLo4Z6qXOOkPo/6xV9jHKeRf7E3cvSHU4b+g1Sp1Kjrt7IEJ
         uQpcCzdPxcHwWbl2YbUWV7hvIF8UjQ+aGLnL944X6Yjr4HDM0++OLV1BSPOZ45ze6Y1p
         jYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713165770; x=1713770570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auVFVf5TZOUclH6ERFg1awZazyADre7qdwcfKdlYJq8=;
        b=Q0cdBofqrL+VdkqUPS5CiUsEwcOOImsbfjOkuyVgL+7w0rHT2M4ObjopyEYxgBIwnh
         75zsVPxNcmuWqAXOke461dA4g5T3wsbsKibZt8Rb0Fnz628UGt7geKJdCWcoiNIm0QFH
         0VJ1WRjjXKOU3Pe0cszDXS7JGBwTM7lvuqypconqEDtCjhv8G57rv4B1yRKHHTzi/soe
         mZFGZtG2eJvgs+JWcYLVCYA/ECA50Ibqpq/GLtzlKFMd1pDb/vFLKDqDYeKpKevkDIZD
         FzIhBDYnDxVNi1P1D+YRi+rZwF6h3DYMNAOZ+pBjSaPq1CDV6/mkfLd/Bs+wsOXj7D9L
         zd4A==
X-Forwarded-Encrypted: i=1; AJvYcCVACfpYRxQn2nSrFzHWYsgGvyc2qNlqNwJrgAIa/FO4iMD80ULUBpzTBpJ4CrNXfkaFkc+wuZB9IMEf0DwU5dIlg3YKSZMUROloMLahXPjd
X-Gm-Message-State: AOJu0YwkCFyQiaE/T3tBYHXIrmVpBI5H3JeJI9i0tcENYigxHtctn0+E
	ajI/rC9uhYRsl8ws5wQVzuWJuNREKRfwWZZczFpF+7CP3UduLhot
X-Google-Smtp-Source: AGHT+IEz/GjlH0fOEbVPYAut90pt8Z6EHpVsd6iBbQFqtTiWQCVdYrknq65JKWP4SvMRquSdV92kIQ==
X-Received: by 2002:a05:6871:5820:b0:22e:cd9f:4e55 with SMTP id oj32-20020a056871582000b0022ecd9f4e55mr10941942oac.50.1713165770177;
        Mon, 15 Apr 2024 00:22:50 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id vq4-20020a056871a08400b0022e9bd70567sm2159516oab.31.2024.04.15.00.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 00:22:48 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v14 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Mon, 15 Apr 2024 15:22:38 +0800
Message-Id: <9a6531d35b45ebd1f01e7ec205a1fdd68e771427.1713164546.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713164546.git.unicorn_wang@outlook.com>
References: <cover.1713164546.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_002252_229277_C69DD6C7 
X-CRM114-Status: GOOD (  13.46  )
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

Add bindings for the gate clocks of RP subsystem for Sophgo SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 43 ++++++++++++++
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
new file mode 100644
index 000000000000..9a58038b3182
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2042-rpgate.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Gate Clock Generator for RP(riscv processors) subsystem
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-rpgate
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Gate clock for RP subsystem
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-rpgate.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@20000000 {
+      compatible = "sophgo,sg2042-rpgate";
+      reg = <0x20000000 0x10000>;
+      clocks = <&clkgen 85>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2042-rpgate.h b/include/dt-bindings/clock/sophgo,sg2042-rpgate.h
new file mode 100644
index 000000000000..8b4522d5f559
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2042-rpgate.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_SOPHGO_SG2042_RPGATE_H__
+#define __DT_BINDINGS_SOPHGO_SG2042_RPGATE_H__
+
+#define GATE_CLK_RXU0			0
+#define GATE_CLK_RXU1			1
+#define GATE_CLK_RXU2			2
+#define GATE_CLK_RXU3			3
+#define GATE_CLK_RXU4			4
+#define GATE_CLK_RXU5			5
+#define GATE_CLK_RXU6			6
+#define GATE_CLK_RXU7			7
+#define GATE_CLK_RXU8			8
+#define GATE_CLK_RXU9			9
+#define GATE_CLK_RXU10			10
+#define GATE_CLK_RXU11			11
+#define GATE_CLK_RXU12			12
+#define GATE_CLK_RXU13			13
+#define GATE_CLK_RXU14			14
+#define GATE_CLK_RXU15			15
+#define GATE_CLK_RXU16			16
+#define GATE_CLK_RXU17			17
+#define GATE_CLK_RXU18			18
+#define GATE_CLK_RXU19			19
+#define GATE_CLK_RXU20			20
+#define GATE_CLK_RXU21			21
+#define GATE_CLK_RXU22			22
+#define GATE_CLK_RXU23			23
+#define GATE_CLK_RXU24			24
+#define GATE_CLK_RXU25			25
+#define GATE_CLK_RXU26			26
+#define GATE_CLK_RXU27			27
+#define GATE_CLK_RXU28			28
+#define GATE_CLK_RXU29			29
+#define GATE_CLK_RXU30			30
+#define GATE_CLK_RXU31			31
+#define GATE_CLK_MP0			32
+#define GATE_CLK_MP1			33
+#define GATE_CLK_MP2			34
+#define GATE_CLK_MP3			35
+#define GATE_CLK_MP4			36
+#define GATE_CLK_MP5			37
+#define GATE_CLK_MP6			38
+#define GATE_CLK_MP7			39
+#define GATE_CLK_MP8			40
+#define GATE_CLK_MP9			41
+#define GATE_CLK_MP10			42
+#define GATE_CLK_MP11			43
+#define GATE_CLK_MP12			44
+#define GATE_CLK_MP13			45
+#define GATE_CLK_MP14			46
+#define GATE_CLK_MP15			47
+
+#endif /* __DT_BINDINGS_SOPHGO_SG2042_RPGATE_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
