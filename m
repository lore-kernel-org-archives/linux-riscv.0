Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BBDC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 03:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htT9vDwyb1XEQRxA8Sl3HrjvhkjZBi25LwlR0M0KGgc=; b=HSDSUaVmLp1bEi
	iB0F7s+jPL0n6v9cucrpT9KF7blnSpRQozqp+Aze7bdsYdnek/8K6RvjKare2uf/aNaaSiUdurRhV
	KgOABJrm8JCUwf8lSFKcJHBpgVYIKCmyZtLpoh1LbJ7mPO1Hq7xDrxbQfa07t9jxlana/mYYtzyUn
	vcjXz6RVIcB0Fd4G74ecRA51/7ePxGjOari9HSdx7Lvs2Q0kF4aExRJxLBx371tNIwKPPw8cajKUf
	7YSz2UCOZ8JfynEe77S8Akq0aHjI/PKHiOXPYpCIuEMhlKlLSipSBNQXqHcovpm1qZ/WlKvU7hd/6
	G3XdsNbJbtOUC3GQRZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0CMQ-0000000Ayq9-3Etd;
	Fri, 26 Apr 2024 03:34:54 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0CMN-0000000AypY-3oYb
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 03:34:53 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5ad21f3e5dcso1135415eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 20:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714102490; x=1714707290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgmkF5ExFKBr8taCn+NKyhoAczSfK0mT7IU3apetrZA=;
        b=cIVn9ybc2MspMeRcv8KPd84HYDzEfQcuMNbSYWdRHmaKljdyVVdUIZ6yl5ShTQGfgc
         QHxFDwVvt+1kZDIu7bCgNrqy/CkbvqJFISEmeIA8Vznp+m30B2BFk9Y5ysjnulMLMzyS
         /nRYreb+5NF0o54Cm6DARiDppJxJUwy1ONOa412QjdJzGVnEVKS6jvFkekcaxe6OemCM
         aaliLdm4MBECzrI8+naN37ZPOZBWIGcQR9mg9wWvyGz1n+R5Yhb7PaIu/ztvS5GFucf3
         /6R6bY5OyB9bq/tavK1lugM2IxZB2jhFmIyV7wGAqXrGXE+nh/Iy/0l0jdSc6rOPU1Jj
         zeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714102490; x=1714707290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgmkF5ExFKBr8taCn+NKyhoAczSfK0mT7IU3apetrZA=;
        b=eWm+U8Escjy+3h5x/rTn6vKaP9V+zfkdHS4zZcMJdhPlIKejwQ/ppGX28I5KgHgoPd
         xs/Yg/+8/olAUZ7VV3vpVl/yiaxHS4EW8+RvCx1iXeyK0gCWRDM5PKErZFIsuhpLffeO
         wfbLsiMCQEmIsAu8QquP+5Fh+0gwnX7dZvms3pM9n1rfgvgOhDuRU5LO1EssR8Ap1kKz
         /vbP8rGfjR1C2s1Ce7fUW95BDN6rdgtXK00OB0rQ97D6y+s3JHR9CrglchC0gQ9mzPXH
         3VcLzv5B7MtfM8Z2dMH4JuNA7ueLABnPTxx5ZM371uP5kdJEcMmKvx3M3PRECLTOig+9
         OvNg==
X-Forwarded-Encrypted: i=1; AJvYcCVJdmPe5GZJQDYXKETztXZT8q/ihERU4yGQKYsDInmUhmYelFMTs8cOghWcTpgbncixlks/VtOJvkhVizkUwB3KoZxFOHADQpyzIaFYg5y2
X-Gm-Message-State: AOJu0YyP0umR3n6fuZd3sXTOxMbsodYnSQaL4ymg53KIrnP3WI/1/9tX
	1dCJHzdJxqQQaJw0icEaMUZuAu2sIgQ/YOsn0k9W9Zzu4Q+PFd5w
X-Google-Smtp-Source: AGHT+IHkZJwOYVP92ODunaOaPGEtbDE0Xt0KO2mq5AjBnvBEr81zsuQKiTyqUEeSBhqpLn/TcwAZ0Q==
X-Received: by 2002:a4a:abc5:0:b0:5ac:4372:1d6a with SMTP id o5-20020a4aabc5000000b005ac43721d6amr2045385oon.3.1714102490446;
        Thu, 25 Apr 2024 20:34:50 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 187-20020a4a09c4000000b005a4b2172e48sm3669260ooa.41.2024.04.25.20.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 20:34:50 -0700 (PDT)
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
Subject: [PATCH v15 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Fri, 26 Apr 2024 11:34:43 +0800
Message-Id: <937fcaccc1472406638c9231e6f961899abcca9d.1714101547.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714101547.git.unicorn_wang@outlook.com>
References: <cover.1714101547.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_203452_064123_F63AAC92 
X-CRM114-Status: GOOD (  13.18  )
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
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 49 ++++++++++++++++
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
new file mode 100644
index 000000000000..1491fb8ef6a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
@@ -0,0 +1,49 @@
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
+  clock-names:
+    items:
+      - const: rpgate
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
+  - clock-names
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
+      clock-names = "rpgate";
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
