Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA6DC27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 08:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htT9vDwyb1XEQRxA8Sl3HrjvhkjZBi25LwlR0M0KGgc=; b=oKJEy9v4aemSEV
	owzk1sE7Wdy7KLLUxKykvqKDq0g5WQOXPnS1lsRHzWU+e6ABXj0TEzuMnOwpl+INN35IXDXhyWvlK
	9CQVn0Z2PVbDXG2FtTzAL0G4WQlBXvLg4d/Y2VZB1C/Vx/weNIflCqI1gI/4u33kGqXLS1gu10UAg
	O0FBk4EjPCCOHADVHrFooIkBGTFXZP2OSKFvHRrsVXMzddTz+VF925CWaqHmeL4lkw+qTo62PsVRD
	Buj/Z6P73NF3/FFJU3G3Wf/zr5+v4x5W1H3OXgWNm2kbfO99mGtCPNTwXfJLEKvVDHRwHOooxWi1E
	ckvzeQb0//VPyhOzT3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8cB-00000008rZG-3kum;
	Thu, 06 Jun 2024 08:36:55 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8c9-00000008rYJ-1s15
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 08:36:54 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5b9c7ae2c98so320434eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663013; x=1718267813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgmkF5ExFKBr8taCn+NKyhoAczSfK0mT7IU3apetrZA=;
        b=QmIiytSGbk1mvX79/siwzt2/vAipqwHReR/4RC4t50TNGmzhMkH66bHuUBMDxB2Ci+
         G9uF9fifEvDjMEuKVPMAt/cUoCXT8w0wHRQAj4WpwSFw2fFYYhliPN1D//kTQnrfVAiS
         YAecXBUjKPL6DPrTxX/Zrj5YaCeBzSmFsH3hNxWGYYLnd7uNvW7+uOXL1RwOMTT9se0L
         JzLt4BNCLhqD90atjPmV4V7AsLuMoz50uO2WIGmucL7vxf0EZ/Wmq31IJZyfdo59Fw8f
         ipmZ9d7QWt55Le8v+QQqToku1/JCu9ornpFKtqABnb2kBQqWw3xFP+reNxSTxS0ftCAS
         6SEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663013; x=1718267813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgmkF5ExFKBr8taCn+NKyhoAczSfK0mT7IU3apetrZA=;
        b=FltIuJM4LGFYQiAMQ4w+UDxmbg7oAVGMGPKy9S9AB2zJ6E/jzvZbFcSt/tZgxUTJ42
         YdPN6Xur5dc4+PmZfi7czgvH4gRNhkwpmcw2VebjYSn7ajmvMiktVb/bFBNTQ96hxVuU
         1rYBPCVUPVocUmKzHyC0oJAujbu4H45e940UeWDsnt0p9/nte1rGnRqBMp90ucIiKn+P
         n8nbFsELgD+xvS6Ep5Mg7qQxqX7ry6rHDD+E3Fe4J0HipB/Gf+S36OnS8Dl2Y5+bE+3d
         B1MClM0H2opXn1ylggVw0/d2taJIAsoopUa5lC/yBBWWmG/YhTuRpKCxkNfaa2tgLL1U
         lReg==
X-Forwarded-Encrypted: i=1; AJvYcCV+MJxYGsUb0Z3yI9rbbTQIBCAaqEKedjCL8GvnT1wrlL3tVrFv6Wt6hOaW6aFqehMhLbF3uVMzFefh5Ugj51jmD5ZBigJWkvWwR683/YKd
X-Gm-Message-State: AOJu0YxeadMtwmjsU6UCAtTOXYvDrR1doF+XrFtjl+cgzpZ4+0nuY+Fp
	IGu6BUXys/dHIJg/6BVWS4AJzEh5wt8maBvgk2HHnODnN7pDVXv6
X-Google-Smtp-Source: AGHT+IHallguT4PxyrQghFBfZ/+SXZtizB4Ap4bngp9OJIMgVqGsUq9nh+G5gQuGKEr1ALmSMhImPg==
X-Received: by 2002:a05:6820:1504:b0:5ba:3f33:d59d with SMTP id 006d021491bc7-5ba790f3770mr5185187eaf.9.1717663012529;
        Thu, 06 Jun 2024 01:36:52 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ba976b49a7sm178995eaf.18.2024.06.06.01.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:36:52 -0700 (PDT)
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
Subject: [PATCH v16 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Thu,  6 Jun 2024 16:36:44 +0800
Message-Id: <8f096a8a763605973719d7d194c00f919634ea2d.1717661798.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717661798.git.unicorn_wang@outlook.com>
References: <cover.1717661798.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_013653_528656_D5E6E2D0 
X-CRM114-Status: GOOD (  13.35  )
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
