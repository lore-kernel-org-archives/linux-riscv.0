Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916F7D4662F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHpCcbFz3a76ov0WY4DEuTLxzIZl6GJFTbWT242tA6w=; b=4JB/1UXG2LmrLg
	o5u8ihfRwAnGVfqZVcBJf+ahtpxVJDS+sC2Xe4nHQNfhYnoq2Lj5j8R+He/WjsAu2EzUV5CvYV8mk
	Qxxe8+q13JjMhtEsWRlkhsp0YQ79iZvYK+e57hFwxQtkW8BNftjLHZhgr4SSLZojSJuP+Q42XY/nu
	Jw2jDUNQXcPTAeZ5jc3Dty5hb9ZDJ5KOpL0KZsiFTZJxTjCBZS3268iP7P/iDcFaPRxoArUv8GiZ7
	uKQsLqtNQjGlj8/HiU0nMbfxAHefXM+NiFph+XYML+c/uSCXX3CMNWeyxtCwLXhSr/MOIMpxODCEC
	CAboXkXTWXcwXkqzoGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzI-0000000DKHg-3jxL;
	Thu, 15 Jan 2026 23:42:48 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzG-0000000DKGm-1Z2p
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:47 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7927b3e5253so13386517b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520565; x=1769125365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+0cIAGDGMmJvU1Q3VxQyqOTGo8fl+3oX0TiLK3VJIY=;
        b=EKfAOq1mCAbW6YW3aD7E+vFj3FF2FYunbf3yhtEfJR5aoeZk6+IX7d6pquAirabrhs
         jQUP/Nf6vyqV/fgWVsWre+TzZL3uLZHxXxuPK7HGATc1zyYCr71aQA5hLtNYP8whgXMJ
         qGvIT2di4rnt1rWj7TLM9sHgcgCnJsXB6SjNqdDRPEszugVdTuO/7TbIb62DpyCukaFp
         UcbEho0sxZjARCjtVlAuVZ4GlZ9RanTGJP0lDYvmSch0mB6HQ3RrL7zA8nfrGwiuxth/
         ci79fROScCPuTBb5910a5m/xlgVwLLIATm89NOVW8SJSo4jnNDUWclFBGLWM2byiUwDA
         PCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520565; x=1769125365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o+0cIAGDGMmJvU1Q3VxQyqOTGo8fl+3oX0TiLK3VJIY=;
        b=LbOMSyxPm7GrGz0l8X1ZJ51MpStkjynURmRHJdV9RoQYvUkNQSN6vVA04RCc6KtcR3
         gVaw7ASAtnBMKJt9JJvl2mmNiEjYlzttDJzMfA65hH/cf7pY3JUv1uKrMAk5JLUdMK6e
         RxhTL793GiEUJ5P/JwXTWlNtz9UAjY+QBo1hmtN/8g83pPzjji8NiWGDeD1uzYc+49Iv
         tSsNCMT3ft7kXdWuTRXj+mmLwNo7oSv8eShhkxAZ1widFMwnOVhByq3LXm5xyeTi04XY
         SWyW/c4ciO9rxAJiAnlek0mfnWLrom8R79XnICIyhEWdgxGJnMrVSl6d2YfS2z3OEALF
         PEGQ==
X-Gm-Message-State: AOJu0YxT+Ux3dkoIHCDoNVhA8vaVBzvhREUkdwAE5yL6PcNYsOG1uoQ7
	vJxBXBn81aqqsAL8YdVQ4wa0biSglKBJEFdD8O8z4sjtcs54JSVF71aq3NKa0Ll/aZo=
X-Gm-Gg: AY/fxX7foxd4FMR8XNUhtPH3RZ8+HuWNXlR5i9/8G5IpVLYU7q7lO1s29YJ1aysIc0V
	4d2upC9O/XImqu8d+6ZiaQ+f2aY+6etMF4GpUfNAGuZiT32WSczZV8BitSNZMreXinZTO78HvDG
	9jiLdnmYue+qqGxko6KRtd1lKM745m43RDgjHDcYeGY8VAIE7QDoKHIlkpf26M1O3lGcHSX2LcV
	rgJ2ZjRjcL/3JG+2S8T1SgpKIsCtS3tktFLDQi177Lxu5mmC/7AEr0EN/w24vF/5IC9XNRU+pL7
	TSP6JR8fEdudHpiYwv4VrFKqVLlKKI/kjwpwJVr8YG5Rd8T7hsjKnEiq9BNdS9gH06b09Nm4qWD
	qRBcaOVSWUAifLTKI9olX4vpQYfNut1gG8fL1ijoEpDgGtXfzIeg2fdfhwr3gb0c8sb3LRyFnFC
	sFd/CG22BISMCXh6YPmJBqgyOYF3cyjGXPOpVIHNkKNOKOSJ4tS3WbK1rAdcRLtk+qO4FCG/0=
X-Received: by 2002:a05:690c:7206:b0:78c:2d5c:1988 with SMTP id 00721157ae682-793c52ab10bmr12877617b3.15.1768520565147;
        Thu, 15 Jan 2026 15:42:45 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:44 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:00 -0600
Subject: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_154246_431645_1965002B 
X-CRM114-Status: GOOD (  12.46  )
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

Document bindings for Tenstorrent Atlantis syscon that manages clocks
and resets. This syscon block is instantiated 4 times in the SoC.
This commit documents the clocks from the RCPU syscon block.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 +++++++++++++++++++
 MAINTAINERS                                        |  2 +
 .../clock/tenstorrent,atlantis-syscon.h            | 67 ++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
new file mode 100644
index 000000000000..3915d78dfeda
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tenstorrent Atlantis SoC System Controller
+
+maintainers:
+  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
+
+description:
+  System controller found in Tenstorrent Atlantis SoC, which is capable of
+  clock and reset functions.
+
+  RCPU syscon controls clocks and resets for low speed IO interfaces on chip
+
+properties:
+  compatible:
+    enum:
+      - tenstorrent,atlantis-syscon-rcpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clocks {
+      osc_24m: clock-24m {
+        compatible = "fixed-clock";
+        clock-frequency = <24000000>;
+        clock-output-names = "osc_24m";
+        #clock-cells = <0>;
+      };
+    };
+
+    syscon_rcpu: system-controller@a8000000 {
+      compatible = "tenstorrent,atlantis-sycon-rcpu";
+      reg = <0x0 0xa8000000 0x0 0x10000>;
+      clocks = <&osc_24m>;
+      #clock-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..19a98b1fa456 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22535,7 +22535,9 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
new file mode 100644
index 000000000000..a8518319642a
--- /dev/null
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#ifndef _DT_BINDINGS_ATLANTIS_SYSCON_H
+#define _DT_BINDINGS_ATLANTIS_SYSCON_H
+
+/*
+ * RCPU Domain Clock IDs
+ */
+#define CLK_RCPU_PLL 0
+#define CLK_RCPU_ROOT 1
+#define CLK_RCPU_DIV2 2
+#define CLK_RCPU_DIV4 3
+#define CLK_RCPU_RTC 4
+#define CLK_SMNDMA0_ACLK 5
+#define CLK_SMNDMA1_ACLK 6
+#define CLK_WDT0_PCLK 7
+#define CLK_WDT1_PCLK 8
+#define CLK_TIMER_PCLK 9
+#define CLK_PVTC_PCLK 10
+#define CLK_PMU_PCLK 11
+#define CLK_MAILBOX_HCLK 12
+#define CLK_SEC_SPACC_HCLK 13
+#define CLK_SEC_OTP_HCLK 14
+#define CLK_TRNG_PCLK 15
+#define CLK_SEC_CRC_HCLK 16
+#define CLK_SMN_HCLK 17
+#define CLK_AHB0_HCLK 18
+#define CLK_SMN_PCLK 19
+#define CLK_SMN_CLK 20
+#define CLK_SCRATCHPAD_CLK 21
+#define CLK_RCPU_CORE_CLK 22
+#define CLK_RCPU_ROM_CLK 23
+#define CLK_OTP_LOAD_CLK 24
+#define CLK_NOC_PLL 25
+#define CLK_NOCC_CLK 26
+#define CLK_NOCC_DIV2 27
+#define CLK_NOCC_DIV4 28
+#define CLK_NOCC_RTC 29
+#define CLK_NOCC_CAN 30
+#define CLK_QSPI_SCLK 31
+#define CLK_QSPI_HCLK 32
+#define CLK_I2C0_PCLK 33
+#define CLK_I2C1_PCLK 34
+#define CLK_I2C2_PCLK 35
+#define CLK_I2C3_PCLK 36
+#define CLK_I2C4_PCLK 37
+#define CLK_UART0_PCLK 38
+#define CLK_UART1_PCLK 39
+#define CLK_UART2_PCLK 40
+#define CLK_UART3_PCLK 41
+#define CLK_UART4_PCLK 42
+#define CLK_SPI0_PCLK 43
+#define CLK_SPI1_PCLK 44
+#define CLK_SPI2_PCLK 45
+#define CLK_SPI3_PCLK 46
+#define CLK_GPIO_PCLK 47
+#define CLK_CAN0_HCLK 48
+#define CLK_CAN0_CLK 49
+#define CLK_CAN1_HCLK 50
+#define CLK_CAN1_CLK 51
+#define CLK_CAN0_TIMER_CLK 52
+#define CLK_CAN1_TIMER_CLK 53
+
+#endif /* _DT_BINDINGS_ATLANTIS_SYSCON_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
