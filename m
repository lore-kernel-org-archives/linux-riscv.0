Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DEC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 03:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKlfeKYlI6ak94jOifPdj75GvCsjYAAVRrYmAtEmdCA=; b=n5mI3p8RxCnNjS
	k6Fotkt3ozxPeP/6iMyWLhJRMkAuI/ZH/+wT0Qrtu2JKz3S1fXDgJ5/KK8K7EjTZ1BwgzCfcfV5NW
	wIgHhgY9BubSCSR763JKbZgwxFUwEhXtIpQM+4tJ+7Mg350ixgIYUGnP4ipy6KBLgK9GveIsge5L5
	lBRMeHc0e+WUcwBRjXpXvRR6chfNLi6HFCtmeuPpXo3jM21vnPKun4t8VmtzERHf3N5IN1q8OuTjS
	V5+5dqWh3WyEwZVd+AejgTeupMoG60xc42ohybJFhzVsmWw9jBtgRXBmRXFmgDlURZR8Yf3VrmDk/
	9Gl4AKg+L0COLd3mgP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGVL-0000000CwWk-2vWs;
	Tue, 20 Feb 2024 03:09:11 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGVI-0000000CwW1-2rRf
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 03:09:10 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3bbc649c275so2757812b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 19:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708398547; x=1709003347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkgZ0brSHMcJ6vLWoNuANGTzYAm5g8JP8scMBBfVgfg=;
        b=kY1XMa7khz7uhkquFOrTfy/vdnp35nEuj15PCDL/HXPQgSEjvKQvPEBd0JwkaCLnwJ
         x0/TSkY5A0DJtIHeFYbsSxjhl/vje48q1s8/9c9ZzBipCxvEwloukVIdwczrxOMxho4o
         Dazos3p/3VbjwcNX1pxfjKsuzE8dKwi7ocG6Wrr+dhoabi3FxqH10jhcdAp7CMXL4OWx
         tHS2y8y/dv0swkOczomqjWxeMe8fXnb9fKxXJsOP0nj45xCoIaqpaFgCxsTgM9biEMrj
         5M4aj+/yOPplWqkm41KlbWKJhInQ3qqpgjPf1hz66HzAkeVZzlvWLiSrJkyWnw1ZfZsY
         eR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708398547; x=1709003347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkgZ0brSHMcJ6vLWoNuANGTzYAm5g8JP8scMBBfVgfg=;
        b=PjxXWkyYDjWevQutXvfwpPRFgppQSe/iR0yCrHNDxiZiZokFhbED0/YSVUqzsagc1C
         AWgEFvGHlQe8EwzUN/oMju2j/wo4Ws6BhjI91iQrosllPxtLMCKxd9wDyF4Rw1pbRsdY
         XcoaDE3RtSOXnosAQ5gR6V9S3ew4Gkr8eUhDLHfrIA8mBEMNNSbwRlDpZqQGYnr85M5x
         +Z/jMyJndaSEYxIKhwI7iXc0Y+aw/mCLXkrdqnPS/WllQduoebQjkMxGD25cHYrJjNfs
         iJjy+9H0pNikZwFx3WqW03fWMP0if0QdLsRBZAhkjxlsI+aIY6/69tqGJ/yG4lDr10r2
         eHkw==
X-Forwarded-Encrypted: i=1; AJvYcCUGGlzFI87q2Rkh/iJXssrVMETxZPfjMENuGJipS+sEGrplDyCKTb3T+dd0YjgYZQXeDBsseyZ4naCuSBaF1s6wQkGB/PlaG/CWWABNgtm6
X-Gm-Message-State: AOJu0Yy1zCDVb5i3ki6SVCYOk4UOh9CVhqRoM0jl2BRFo50jwK47gmf8
	cHFN1dLWfLRyQOFNP7hUtm5j3ot85q0K9YfBkJTtBMCAmlqR4voL
X-Google-Smtp-Source: AGHT+IF/5/Qao1ubBVUJqn7zPUt32ZBx86tloI6CxK0c4cOMuM6NlgnTRnOp4KPXJ4JSjWe/pvWQOA==
X-Received: by 2002:a05:6870:1656:b0:21e:5fe2:2143 with SMTP id c22-20020a056870165600b0021e5fe22143mr9914011oae.58.1708398547247;
        Mon, 19 Feb 2024 19:09:07 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pf7-20020a0568717b0700b0021eb31be7b6sm1149713oac.14.2024.02.19.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 19:09:07 -0800 (PST)
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
Subject: [PATCH v11 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Tue, 20 Feb 2024 11:08:59 +0800
Message-Id: <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_190908_745806_5B32060F 
X-CRM114-Status: GOOD (  14.13  )
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
---
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 43 ++++++++++++++
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
new file mode 100644
index 000000000000..9d4b55e2b12f
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
+    clock-controller@10000000 {
+      compatible = "sophgo,sg2042-rpgate";
+      reg = <0x10000000 0x10000>;
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
