Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7919D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TY+8CZw6C61gvRi5drznvuWQ4ifCJSP/yRQmWF7GmDY=; b=4VYLiv+J6k4iZy
	HbzHFb95AUjvfMBeZPejVP8wskUTW1pfc9OjzckjQSka2kcBPobdUOyct2bZxjFMoODTU5Xj05+VQ
	QPrEgDjwi5tL884+bhHQZjB0xYIE9p0NfOZBjcz72cimwE6GH6nbDNcbnLxELWxUOHoqZlXVhLQaj
	MWlgilgadzknzVm2lBVD3R0KZbnD1VpkysPUlitjYDC82ElJOTnUABRZK4fFNXAVM1A9Mv8nzAHqq
	lL2+OcH34nEaGkoTHML7SUznISJav5bRDw2fPkk+hrLX1dhDXkWqy22FoSmmmlsJNJdOHjJ8mjxjD
	e+q6k1Adn4/aTLghtBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9dn-00000003g5m-0f5I;
	Tue, 20 Jan 2026 11:11:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9dj-00000003g52-2NHZ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 11:11:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-81f3c14027cso2891028b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907474; x=1769512274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsbrvqDNdVqP2JJq0dpRdT3fxKgznPJspd7iKuP2Rhc=;
        b=h8V4/2gH7yM4rCT/V4M/TwVDECd+zUoYzmBbKCtBrKJJXr+JiEspCXnTjZKauKXLTA
         jGQM4z4ePL+mxkRLS3wssKOCUCy2cXxD4F76P/NGx5yhc19y+Yt6DSOJPlG0qIQQ9wm5
         +g5m29ZRFEHOlnYE+YLZ/UbzaS+WFdzaParQehlOoHGUmWeeZ5xtbZ62BZ8Z7QShfQgG
         hSsHDpQReWUNR+Np+ZVP+zYRL+wFZGD0RwtDnfnL5tbx+Ww73TnhIGoPGoTaT/z1ygMe
         i1ytNWlKeVqTPBbWXfZOPoICl4sZJzeqLJVE1cgD0yaKJXsg/SeZB5MJX4euuVPUa4T6
         /n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907474; x=1769512274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tsbrvqDNdVqP2JJq0dpRdT3fxKgznPJspd7iKuP2Rhc=;
        b=qv+KeZHrYGrLSEcnZIOS03ooEx7NUwSxfWqirXUn0JoXQpO4owvWXMHytqU88dfIvx
         6I52+R7Ez422lJPy6J25brP1WUjRTCPORbSQ5uwZ0ijjeKN7iiLqNE5Q+656kaXn00Wx
         ANX42D+WHl+sNQbJIZjzSwCkg46z9G1Yi1VySuv6nOtqUKepqrYSkXtReQB27DdjGENG
         emUaW9zHHOlYhFfLX3OyawTVUtv5pJEOY1mR9+Ro+EHlq5Bbk+h0VC2bkYeFAAHPtA7U
         7SOQALJdeS98Y1+KopGHUSA/FJXpQEDlJcWu4SR9h50//ddHkIWF3AM9Pcr11ToiK1q8
         /0uw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ea3kvcXyNCE8+NOmnbK4cB3uYJl26xOlLwImc5w9f88r0H0QrQ6BIFlZoe81tK8kcPsdBiHTRf+qHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe41iHMQpRq0yj/NTrdgDPOSL7waoduLuXb46GzK1YmrG+VuHG
	Lh2lgylY9QaHDq2Xbi9o5sPakyFlWj2Kf1qbj4A7x+VF7dPNPsg3P9jJbS80AWMYFFE=
X-Gm-Gg: AZuq6aI27f8fCiP593TMmpvqSf4QaVUBoZOkJrOqkeeJWn7IxmyS0jeyZoTvMYjj2qg
	BDPE3tu/vNHLDBO4JAV66aRqOJpGgRn4a9A2nEESk0FLnkKY55gJdD5Fw/M0JzUObcut4vUSzNh
	fG6HuNdJgskwYCW2Njh6P+uPDE6zDhcTqHJGtFAVqBqaSEi3x5i38qhI9GDRDUC0G21hch8jghh
	l1LU/0cD/7YkXUbRLuXGFJi6hlZ1LuG2f3rkl18jJXdqMJx4eDg6A/DrzHI+XByhw8wxoRSFBM0
	+nC3rEUYewQCABbrLu6rHZMEEjoeR5i3iDsGWJhSKXOvYCaN5cu0ey8YvtU0RfIALcRURSjMbzw
	YpTfyR4FA1hXvZO6kmMtZdAf6AWNjD1SMwmhqmeH1Gbm9Vl7t5sDHcstvTqNPRxCWFOKmyNQ/H2
	Ck3VqEcBq4yYY1qproBF1YklbdAxb+hzw=
X-Received: by 2002:a05:6a00:1814:b0:81e:7734:9e85 with SMTP id d2e1a72fcca58-81f8f11e6d8mr14799245b3a.20.1768907474533;
        Tue, 20 Jan 2026 03:11:14 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 19:10:49 +0800
Subject: [PATCH v3 1/4] dt-bindings: soc: spacemit: Add K3 reset support
 and IDs
MIME-Version: 1.0
Message-Id: <20260120-k3-reset-v3-1-effe87f4bdbe@riscstar.com>
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031116_736121_75BAF5E2 
X-CRM114-Status: GOOD (  14.10  )
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

Update the spacemit,k1-syscon.yaml binding to document K3 SoC reset
support.

K3 reset devices are registered at runtime as auxiliary devices by the
K3 CCU driver. Since K3 reuses the K1 syscon binding, there is no separate
YAML binding file for K3 resets.

Update #reset-cells description to document where reset IDs are defined.

Acked-by: Alex Elder <elder@riscstar.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add Acked-by from Krzysztof and Alex.
v2: Update spacemit,k1-syscon binding to clarify K3 reset is supported.
    Update the commit message to add backgrounds of this patch why,
      instead of what.
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 66e6683a3ccb..1a28af22cac1 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Haylen Chu <heylenay@4d2.org>
 
 description:
-  System controllers found on SpacemiT K1 SoC, which are capable of
+  System controllers found on SpacemiT K1/K3 SoC, which are capable of
   clock, reset and power-management functions.
 
 properties:
@@ -50,6 +50,12 @@ properties:
 
   "#reset-cells":
     const: 1
+    description: |
+      ID of the reset controller line. Valid IDs are defined in corresponding
+      files:
+
+      For SpacemiT K1, see include/dt-bindings/clock/spacemit,k1-syscon.h
+      For SpacemiT K3, see include/dt-bindings/reset/spacemit,k3-resets.h
 
 required:
   - compatible
diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
new file mode 100644
index 000000000000..79ac1c22b7b5
--- /dev/null
+++ b/include/dt-bindings/reset/spacemit,k3-resets.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 SpacemiT Technology Co. Ltd
+ */
+
+#ifndef _DT_BINDINGS_RESET_SPACEMIT_K3_RESETS_H_
+#define _DT_BINDINGS_RESET_SPACEMIT_K3_RESETS_H_
+
+/* MPMU resets */
+#define RESET_MPMU_WDT           0
+#define RESET_MPMU_RIPC          1
+
+/* APBC resets */
+#define RESET_APBC_UART0         0
+#define RESET_APBC_UART2         1
+#define RESET_APBC_UART3         2
+#define RESET_APBC_UART4         3
+#define RESET_APBC_UART5         4
+#define RESET_APBC_UART6         5
+#define RESET_APBC_UART7         6
+#define RESET_APBC_UART8         7
+#define RESET_APBC_UART9         8
+#define RESET_APBC_UART10        9
+#define RESET_APBC_GPIO          10
+#define RESET_APBC_PWM0          11
+#define RESET_APBC_PWM1          12
+#define RESET_APBC_PWM2          13
+#define RESET_APBC_PWM3          14
+#define RESET_APBC_PWM4          15
+#define RESET_APBC_PWM5          16
+#define RESET_APBC_PWM6          17
+#define RESET_APBC_PWM7          18
+#define RESET_APBC_PWM8          19
+#define RESET_APBC_PWM9          20
+#define RESET_APBC_PWM10         21
+#define RESET_APBC_PWM11         22
+#define RESET_APBC_PWM12         23
+#define RESET_APBC_PWM13         24
+#define RESET_APBC_PWM14         25
+#define RESET_APBC_PWM15         26
+#define RESET_APBC_PWM16         27
+#define RESET_APBC_PWM17         28
+#define RESET_APBC_PWM18         29
+#define RESET_APBC_PWM19         30
+#define RESET_APBC_SPI0          31
+#define RESET_APBC_SPI1          32
+#define RESET_APBC_SPI3          33
+#define RESET_APBC_RTC           34
+#define RESET_APBC_TWSI0         35
+#define RESET_APBC_TWSI1         36
+#define RESET_APBC_TWSI2         37
+#define RESET_APBC_TWSI4         38
+#define RESET_APBC_TWSI5         39
+#define RESET_APBC_TWSI6         40
+#define RESET_APBC_TWSI8         41
+#define RESET_APBC_TIMERS0       42
+#define RESET_APBC_TIMERS1       43
+#define RESET_APBC_TIMERS2       44
+#define RESET_APBC_TIMERS3       45
+#define RESET_APBC_TIMERS4       46
+#define RESET_APBC_TIMERS5       47
+#define RESET_APBC_TIMERS6       48
+#define RESET_APBC_TIMERS7       49
+#define RESET_APBC_AIB           50
+#define RESET_APBC_ONEWIRE       51
+#define RESET_APBC_I2S0          52
+#define RESET_APBC_I2S1          53
+#define RESET_APBC_I2S2          54
+#define RESET_APBC_I2S3          55
+#define RESET_APBC_I2S4          56
+#define RESET_APBC_I2S5          57
+#define RESET_APBC_DRO           58
+#define RESET_APBC_IR0           59
+#define RESET_APBC_IR1           60
+#define RESET_APBC_TSEN          61
+#define RESET_IPC_AP2AUD         62
+#define RESET_APBC_CAN0          63
+#define RESET_APBC_CAN1          64
+#define RESET_APBC_CAN2          65
+#define RESET_APBC_CAN3          66
+#define RESET_APBC_CAN4          67
+
+/* APMU resets */
+#define RESET_APMU_CSI           0
+#define RESET_APMU_CCIC2PHY      1
+#define RESET_APMU_CCIC3PHY      2
+#define RESET_APMU_ISP_CIBUS     3
+#define RESET_APMU_DSI_ESC       4
+#define RESET_APMU_LCD           5
+#define RESET_APMU_V2D           6
+#define RESET_APMU_LCD_MCLK      7
+#define RESET_APMU_LCD_DSCCLK    8
+#define RESET_APMU_SC2_HCLK      9
+#define RESET_APMU_CCIC_4X       10
+#define RESET_APMU_CCIC1_PHY     11
+#define RESET_APMU_SDH_AXI       12
+#define RESET_APMU_SDH0          13
+#define RESET_APMU_SDH1          14
+#define RESET_APMU_SDH2          15
+#define RESET_APMU_USB2          16
+#define RESET_APMU_USB3_PORTA    17
+#define RESET_APMU_USB3_PORTB    18
+#define RESET_APMU_USB3_PORTC    19
+#define RESET_APMU_USB3_PORTD    20
+#define RESET_APMU_QSPI          21
+#define RESET_APMU_QSPI_BUS      22
+#define RESET_APMU_DMA           23
+#define RESET_APMU_AES_WTM       24
+#define RESET_APMU_MCB_DCLK      25
+#define RESET_APMU_MCB_ACLK      26
+#define RESET_APMU_VPU           27
+#define RESET_APMU_DTC           28
+#define RESET_APMU_GPU           29
+#define RESET_APMU_ALZO          30
+#define RESET_APMU_MC            31
+#define RESET_APMU_CPU0_POP      32
+#define RESET_APMU_CPU0_SW       33
+#define RESET_APMU_CPU1_POP      34
+#define RESET_APMU_CPU1_SW       35
+#define RESET_APMU_CPU2_POP      36
+#define RESET_APMU_CPU2_SW       37
+#define RESET_APMU_CPU3_POP      38
+#define RESET_APMU_CPU3_SW       39
+#define RESET_APMU_C0_MPSUB_SW   40
+#define RESET_APMU_CPU4_POP      41
+#define RESET_APMU_CPU4_SW       42
+#define RESET_APMU_CPU5_POP      43
+#define RESET_APMU_CPU5_SW       44
+#define RESET_APMU_CPU6_POP      45
+#define RESET_APMU_CPU6_SW       46
+#define RESET_APMU_CPU7_POP      47
+#define RESET_APMU_CPU7_SW       48
+#define RESET_APMU_C1_MPSUB_SW   49
+#define RESET_APMU_MPSUB_DBG     50
+#define RESET_APMU_UCIE          51
+#define RESET_APMU_RCPU          52
+#define RESET_APMU_DSI4LN2_ESCCLK     53
+#define RESET_APMU_DSI4LN2_LCD_SW     54
+#define RESET_APMU_DSI4LN2_LCD_MCLK   55
+#define RESET_APMU_DSI4LN2_LCD_DSCCLK 56
+#define RESET_APMU_DSI4LN2_DPU_ACLK   57
+#define RESET_APMU_DPU_ACLK      58
+#define RESET_APMU_UFS_ACLK      59
+#define RESET_APMU_EDP0          60
+#define RESET_APMU_EDP1          61
+#define RESET_APMU_PCIE_PORTA    62
+#define RESET_APMU_PCIE_PORTB    63
+#define RESET_APMU_PCIE_PORTC    64
+#define RESET_APMU_PCIE_PORTD    65
+#define RESET_APMU_PCIE_PORTE    66
+#define RESET_APMU_EMAC0         67
+#define RESET_APMU_EMAC1         68
+#define RESET_APMU_EMAC2         69
+#define RESET_APMU_ESPI_MCLK     70
+#define RESET_APMU_ESPI_SCLK     71
+
+/* DCIU resets*/
+#define RESET_DCIU_HDMA          0
+#define RESET_DCIU_DMA350        1
+#define RESET_DCIU_DMA350_0      2
+#define RESET_DCIU_DMA350_1      3
+#define RESET_DCIU_AXIDMA0       4
+#define RESET_DCIU_AXIDMA1       5
+#define RESET_DCIU_AXIDMA2       6
+#define RESET_DCIU_AXIDMA3       7
+#define RESET_DCIU_AXIDMA4       8
+#define RESET_DCIU_AXIDMA5       9
+#define RESET_DCIU_AXIDMA6       10
+#define RESET_DCIU_AXIDMA7       11
+
+#endif /* _DT_BINDINGS_RESET_SPACEMIT_K3_H_ */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
