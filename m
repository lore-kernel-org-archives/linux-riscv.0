Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83786C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 06:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mg2TAk1nhi1m5hwZ23cFGANQLYyLxSf2FLb91rFFQLo=; b=LWWQmhCPlaLA3l
	+zJBtlYIXDVuwDMoQca2rYoVdn6LaVP+7nHgPVT09M0opo8OC30iJa5C5ULHi0hn9j2uT151gMXtM
	z74u8cZsNQHeX05wOffi6AAJvOV27UiwevYQR+d7eLpLZpH77/2QV5qimaCyMDu3evqs73nJVQ7Ky
	+ZXL1n9esJTcX5fc3x0Me3QY2KQTx40LuKGf3IEqiQhkWCBQfi2hTU9uNfdXTXPGsXhBgVkqIGnzM
	oMeFqS6RYFZu68ScXGPZOmoM69rg9nV+GARrSV74NEQsnQ2hL8velti5AzlPmiOzy5Icv1+IPiF90
	MtTFOTTdLF4YX+DkiSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnFc-0000000ASRl-36EC;
	Fri, 02 Feb 2024 06:42:12 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnFZ-0000000ASQA-3e1Q
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 06:42:11 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-216f774c827so928669fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 22:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706856129; x=1707460929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JELyAKQ1T6IEJZGUW3XWSPZsx7DTHSSDfTD0aj2gLgE=;
        b=VQ6Xv4mt6LJKTaZt8DD8jJn95B92UlTEOtUGaoyMpyCwLtIp4ImKQucDY2kXApLCj1
         vRv6V5IG99HmWaOG/+BOQTvbHQXM1FVewUihgdDCGx+SI3r/jR65PuVJI0tlQjiAvtYR
         Z+Na8rA1AS9bSwuhE588mAqIIh31tt48j+9DP0nVwzyKxhD/u/x+4nmkGx6sfRBZf+Cs
         ygFaMjAArUW7aPz+2868IBHQfZbpiHTFaiitnHPZ1vvZW0CP7Ufqk4Lrqn2ZrA2KNIOT
         uEyrh1HAjIvzw2hD0jiLZvHJWy89rZK6j8V94QmwIebmzTM4RxCp7l+5XvTw2VDyqKW9
         KgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706856129; x=1707460929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JELyAKQ1T6IEJZGUW3XWSPZsx7DTHSSDfTD0aj2gLgE=;
        b=hi+UZvhiPNPWR7EZxIofjC/OkMrrhBLN/4s9dSN+VfScq4pepotBo2h5FRxSe5f8qz
         TzKfIUggL35Gb3/gwOBXIFOhxKAEy8z3Q/Fi1kDQ1bP2TCqOR1UFuwojlPdd5k2ZxGGI
         XfI/AZEcs6GyVzRbs8e9xryoJO59ql2ECBYyYdmOXExFVrQgTgPNuCJIUJjWwvtLutxm
         e0ud+3zYEjb0jjpVf4/OyQECt8+ijUkmTf67nS+QfgpB5xV7m+I0kfxRCKnhyKsE+gq2
         RgW+/Co0vXKiK5uLzqw1FQ5SwmEsYrk7eGrREq9NICPXeZMkumtEHGyyZFaCkOIQWBnM
         4t4w==
X-Gm-Message-State: AOJu0YwjfGb+gr4vCtx3dN6e0U7GMLGd/b7Q0QvFIfhc6v8fKo+a/vcN
	zQj/GT7lBAwQqte7oEJc5/au2JDm3hXc9NjY1nHNF2D6R/1ifUGd
X-Google-Smtp-Source: AGHT+IE/5mOvGH5pTAcH2qVjRrKDAL20GcPlCBgvs4FtVvidSzrX9acAdfuzBp4cg3qXoTG9JoIoog==
X-Received: by 2002:a05:6870:2387:b0:214:909b:7cb1 with SMTP id e7-20020a056870238700b00214909b7cb1mr1208102oap.16.1706856128966;
        Thu, 01 Feb 2024 22:42:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPkRKLB4qnE+z0c2/4Ek7EJrgZX8srQHblddhG3jldRz3i6qa1Docy6KTzLLDZenEp7mo7egouVDxJXpYGWLIg/3PwxNrJ1mvaLBUVAvzoqcf6CpsH3rWDdlm7RU+i+Qc6RvZHDc514oT7xRe9f4UiBHYumhzfXwOPVNnevjXFJqJKBCZTL/52vEvTG5SzL365P7nR/imO3YNObtvBwq7EGTGPN6n/9CC0C2ppLtiQg9K4WynBwNGDpOpsTRE0RLnp5kZbU/oLJyOlsxi5SDRuh4XeA3EoW6h8/5nQNwAhKiERqgam1B1lMeigZTD2ekUQ0ozpk2hlYC2DlDG9FhBpsK5T/XNbSCHkNZ9N+wU0a+IY3LUUgmf+MyG/pXVquf9orN4Vpm54Q3U2+5WVRtDIWq3ObYWAI8HKESS2VBVnMprgT58ukJOi6//qzTTRAv0F5vTn6+Qu6swBvJ+vld2kfEVM8GpzKU9AGxuggO8a7OFmOeoIB6AehdGlZe2mUHymFmYOzULyDMdktpcGXnEm/jxJ2efS+uowsMQ48yEt2rCbzyzWvQH/eg4Jmbzau48TL4DEfY1rKYuK4LBz+iuZqp4cEm9hJPtrD3c96ORWkdEs1AOAFldqxpc446cpOgi9fsvOqFNM6V84y00cR8yrEte+ewVa0/rRDKTg/5huMA0=
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id lf7-20020a0568700c4700b00218f6d86bc0sm338684oab.22.2024.02.01.22.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:42:08 -0800 (PST)
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
Subject: [PATCH v9 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
Date: Fri,  2 Feb 2024 14:42:02 +0800
Message-Id: <fcdd83addcd9af159a0bebf2a14543168bd59a07.1706854074.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706854074.git.unicorn_wang@outlook.com>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_224209_936378_36A6FB2B 
X-CRM114-Status: GOOD (  13.41  )
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
 .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 37 ++++++++++++
 .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
new file mode 100644
index 000000000000..69ce3a64f66c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
@@ -0,0 +1,37 @@
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
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-rpgate.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10000000 {
+      compatible = "sophgo,sg2042-rpgate";
+      reg = <0x10000000 0x10000>;
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
