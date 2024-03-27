Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BACC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51aZLH8KQmXNw9EjNJZyIsXpiBg9ddm59GChGnfKEYA=; b=t1U7JaQceGFqJV
	PEwj6vCYURzMD2vMd9b98zjtbu5FWX5qIoM/hVWW+7iNHo1WQ2DZSFom6lJcKoQFjds/9pOQ+Qmbe
	WxTP0V1nHD23VWsELU6Sc3ZKVs1N/7stFZVD788FonyVn1O6st/VGrf0aw4g6sgcrF8BVa0KmyT9k
	XoBxTY62FMYq2grvJ4Sv+YvDyZMXIdflmS/9OJDfXQwsSuEgdcv+uBtOvvbUF2oAL1WoVLJz+0E3n
	0R7pKvD69hAINk6hwe9h+aYlLpPUgBnCK0SznG5KSx9U4o8nUBSQ0I3EQLJCh+CuWtKquRWqxlOzQ
	QacY4zZBolYEMfdApLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOfp-000000083Gc-3VvG;
	Wed, 27 Mar 2024 08:30:17 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOfk-000000083DX-2tvF
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 08:30:15 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-22a353217c3so1543343fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711528210; x=1712133010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auVFVf5TZOUclH6ERFg1awZazyADre7qdwcfKdlYJq8=;
        b=aMy7S7TXFu0H3DC+VvR9u+4nOt4WgOJQ4CieDxyb2sJMEOWo0JarQ7B90ScAS5jAuM
         sPiu92Fq06Eea+0rYAmgOyfnPvP4d9NQNpRaxuChDD4tFfyCrVCqcascPtSdVkd9PAE5
         omJPBvIK+UhJED2a+ft4nXkLxSoWmg6rWAkpTUOLIZzMSNOoFEJijrx8LgPzhLHWU8sM
         GdXIV1sCWtN5jqk1AFKQOiZwZzc0LDhA8Ly6OSb1Nxv+xZCVohaf59TDopaUCf7B/tw9
         1J5l546FEqRPypFxhgF+H+eSlCfvbtIqqZddO0dqsh3V2YZhnNzJ2qMYFFTYK4hUzF0m
         pn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528210; x=1712133010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auVFVf5TZOUclH6ERFg1awZazyADre7qdwcfKdlYJq8=;
        b=Hwo023+zFvCrlxGZqRhvBtiyYlWxY/ivII8SfGig1zHkeD6xayXGgWkjzjyhJsaAJh
         MYveLFf5iC/r71J9kGIK34AUrMqqITM6gF5HJ5+UacH1DNZGB/Jq0rYo6FQKD77ZmCFC
         ANmud8Hy3d8JFPdhlLTBgxrLrjqu9k/HryWUUsZUE7gY5H4vJ6vQArrO9ojz/qp4qcQu
         K2CX13U9jlRlzvpW8HxSojqmokWZvanwKe0xD9V4hSlWNWZXhpLWmexTnKr2fAmHPaLO
         uoBcSyhzddIbj03G46M75w31tn+CV0Z49fL0Ni7RLSTsCb6SAnWDrAvAVLwElMFpzdq4
         g0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVQDpnZeNdf1308zA7Qx4SWCHbESjHSenA4m/ZB6Da2psKp2auZvIGLluFjlaNSvpLVwWurUuC1NRdnfumIRZ10ibBHullyCV2DlNPeyXgv
X-Gm-Message-State: AOJu0Yyy+aEL66UA+pd2L7zEnCgoV+Kkm1qjQZTjXCa0OFVa40+l+trq
	jvn9fK/aWH+/KNWDwh3aOKJzNKd2GhoIb/5cIjBoeKefnlPvm4/f
X-Google-Smtp-Source: AGHT+IGJDU1xid2QssySH1k1Hs1N7muilac+ajQkwpr9hmbgzkFBd+g+QqlCC0idks1XRDqEixq8KQ==
X-Received: by 2002:a05:6870:91d6:b0:22a:1038:39e6 with SMTP id c22-20020a05687091d600b0022a103839e6mr2243406oaf.0.1711528210500;
        Wed, 27 Mar 2024 01:30:10 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id xa10-20020a0568707f0a00b00229f553239esm2752241oab.36.2024.03.27.01.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:30:10 -0700 (PDT)
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
Subject: [PATCH v12 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Wed, 27 Mar 2024 16:30:03 +0800
Message-Id: <78ddd5b127860e110f4c782de90025153cdba083.1711527932.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711527932.git.unicorn_wang@outlook.com>
References: <cover.1711527932.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_013012_787853_63610355 
X-CRM114-Status: GOOD (  13.24  )
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
