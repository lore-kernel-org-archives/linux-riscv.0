Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A09ACD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 06:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51aZLH8KQmXNw9EjNJZyIsXpiBg9ddm59GChGnfKEYA=; b=qFMmB/e/gZGqrP
	yRECtNwE5Xxh/GxIICbQiptYuzqtvQ/FkmmEgtMckx+AqR9ZeiSBBV6qkuV0F3oxmAKs8zrBh6Sgq
	bg064whmlKQtHXAllSBtcvj6ajO5PH7g+aCaDcMZ5WThyngsuM8h+yDlv2Arsf5KBJ5jQ4RgPcwsm
	E3gkp5SIRdVaCMj6NTZMLnY/DswOF6uhDKMnepJRLlWBWr5XBAju/lZBDeLcy+zjBi+dV9m92OywV
	0jiZtA2m7FdFtZ8jkX9X59abJpCpKxgRB/8Z2fPiRYsrX6d3lkH5hKivnKqumDlyq94KWF0UK7ti0
	aDq+E/ToSgZYLnbA5VgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5bx-0000000H1TI-0A5o;
	Fri, 29 Mar 2024 06:21:09 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5bt-0000000H1RK-2WX8
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 06:21:07 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5a522ae3747so756801eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711693261; x=1712298061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auVFVf5TZOUclH6ERFg1awZazyADre7qdwcfKdlYJq8=;
        b=C3UiRSxFQtvcG94wxuiCtubi80BDPopdP/I94uBJ1TPHEcvfjyyEu8vUaxvPwschsg
         YA5PJsJtDfAbSCndcD8WsdCKa3HSLlMdBTDw2KJZAz4wdhPdTarDkyzcmIq5z4viUQNV
         Vf2R41Ig4WJClglRvj9Wu/YXgbYuSF5bW+9QJFPmv0uc7+cth8mMes6xo+iVnsfdDKzC
         0cxI1rhQid1r9KyIBupwMf3H2ASHK2F+5UqFFOIgBZzQnA1xl+tFhFiN/Kxe/seVr4ZJ
         USz4BCTzSCTFM/40Vmy0LXXSvyxjPevtFqT5sVUDVksycutGuhcXy4VEx6ZueoN5x8n9
         69MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711693262; x=1712298062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auVFVf5TZOUclH6ERFg1awZazyADre7qdwcfKdlYJq8=;
        b=jPuCYA+z7Gc6YLXVydUHzS8Zhxa6lAAHlzJNBbIoP/jsIKt7FPL5d61iYDASsyPWRd
         MeZ+ziIeYiAu3S6xryAbUhCYQfslbk21yRd9IIop5X86pnsrc6CQBGl+XASYnCQyASH+
         mHgzw9yjE7ZnTVc6jhOju3hcja11/+uIOV2PcSartkH6UVoDWw+9SacXM2VrmQSmas8h
         F2m8T+t3D7x3TX+ni5INMCZAKvRd7tRqDfc89ZdStngGUYRYG1dMskFEyENjPlXZaTqP
         eYiVTCCyZvANULApBF0pJLd0l+qNrunpYR3Ztukxlab7HWeFD5FHEF+dmcIpbKnJkbwD
         jTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuO21o7EMTCn5tnt42o9j4tMGNzm5eeRBpvqvMq9i5GFQwXbMs7GUyKdwCwKiDmBmHM22M8gF+DrNw7IVdN+SjluVhdMuLd6+90nByrSzD
X-Gm-Message-State: AOJu0Yz38xV6TwYDcdj65cDrSoep3a3VyJ5rK5OOlLspo8ZdKKkWFfpo
	A+mf5P4tT+8nf9R/4sJ8mA4RlUCPXwv1aG9+FWK3LiLz7eFnt4l6
X-Google-Smtp-Source: AGHT+IGrHT6esJkZupM+ldls/6v1YasvdCT9bxxVC5lyyFhVElo5RZXPRkjIlzujjWeJZ50t8IQMyw==
X-Received: by 2002:a05:6820:1e0a:b0:5a4:78d3:e8d5 with SMTP id dh10-20020a0568201e0a00b005a478d3e8d5mr608928oob.4.1711693261669;
        Thu, 28 Mar 2024 23:21:01 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id q1-20020a4aec41000000b005a554ac27d0sm634849ooj.6.2024.03.28.23.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:21:01 -0700 (PDT)
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
Subject: [PATCH v13 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Fri, 29 Mar 2024 14:20:54 +0800
Message-Id: <78ddd5b127860e110f4c782de90025153cdba083.1711692169.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711692169.git.unicorn_wang@outlook.com>
References: <cover.1711692169.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_232105_657437_112161AB 
X-CRM114-Status: GOOD (  13.53  )
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
