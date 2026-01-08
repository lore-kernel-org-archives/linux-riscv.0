Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE8DD148A1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbQIVLRQGgqEGuPwESytUX2/0ZvYjCIwQNiRgO4VHJM=; b=zO4wNY/SZRSMBW
	UH4f9+2iyWd4cBLAj9DIKQCSkp4Al02YhAtJ0HiO47pJ7CM4HwzKaW1W9vO8LPiO4IViElTRWjD6P
	JwpwL2or3Hy/lTtdEjB7cFfwc8YWD1xKALTm+BsVaaBwLIQbSrCtH2154odzf1s3zWEnfIvx7gnGT
	xCj0dbTiA6qVIRd6svZV2iQ5Xrvc1OP4mzIJxRt5iGU0pYGzQIaAjzAxefAbXd8BnwtldhKx7iu3A
	5iYKmhjzX+Iv5FKI9BTtT99HDBH5A8DQYdFpD27FKtemeU0HOPXFbf802uNADt7DaChfbKEMtrz6S
	sfN70cqm3FTpcd7bdlkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqum-0000000HKW4-0eFm;
	Thu, 08 Jan 2026 14:23:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdquj-0000000HKUN-3jzX
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 14:23:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so2075781b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767882181; x=1768486981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42RRts4LKhj3HDLLS6q2Q6/55pZsEWKtlgxyH9/r35A=;
        b=pAcSMOkOINcVhj5nF6vEijeAjaZRT54wHSQOPEvD5TqNOpebvC9OVg/EXRgmtYtVRp
         9woGFNiavoR+CedbmhtTwNA3MILxaOg6X2AaIKE9h51HveYtKwKFLE/qSbn66PSYUfnH
         uBrIwyM+/e7RE2CWnf+ureHbC3tPrBZE6yWop+wtUx11vZ31LLASNAED4JNHHpQehHNU
         YxqdDtATDkMJl2yzPYX+6cmtMqVFmKLTpSYL8CfyJ5kF8PrRsz05TreUQmZa9MgSDUTa
         ROkPMXBVOs4fHkvMTzmRWDj/OvIvkpWxtg/uaECHayChQMmihni6oAtV/FsoZlEa5cBj
         2soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882181; x=1768486981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42RRts4LKhj3HDLLS6q2Q6/55pZsEWKtlgxyH9/r35A=;
        b=Nni3apDJ85xza8MAPhHTypeLVDOaAH8838cOcxXYPZxFYvXJpNoi23wBZjoncyBoyc
         RoQfHYO+tXMxb4b8psJ9CSVmrTLog7hEs2FV76+9TjVpPpxsDbouPlRhES85+u9JsK7I
         CCyFLsjuHmiRYXamz8ITLcBAq+/uzhnE/7flDyjfYLufiaWQxqnyUqHS0Nd6eiwNIfVE
         kIdThrQhYH2apYzUcUsYGFe4cWl8mEpvGEF4x0HblSEz7hl0aqJvX/CIeMj4foU8VXrX
         qjkAhoMpjinryyGr0f5arXNLCb0oiPRx5tDKiJd+ZxbNjKcdpDeIWLu/S9t7mXW0hU7B
         SSDg==
X-Forwarded-Encrypted: i=1; AJvYcCURepCZYlUcejW88AxDS8clKXfelQxM/nTZlSUCx7or3aD63h81KNaR9xCFcje/l6QriF3znhSie1e5Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7A57DnXATSoz1pMz7zO/Z6+Vxd2z27WY3kzjZiJKHelUPTtCD
	y4lCpYStB4M/IZ+L9z+iXpQUo0N4zQd9fZs7wJ9zIx6hb/vabpUMioY8xWjXkcIwKog=
X-Gm-Gg: AY/fxX7VO+6ts0IYxANKxQAXMHhgdFtd3tE0ajtGxeTKIW7fXkiJcYwdiixylUN+BUi
	j8eRHnTf69bbv33E3HL53Y8lkpv71VvZRLTCMZlj65eMxWRxd3qVUzgHMHrqPtFjY17XOiHt+70
	AUspWO7pSyUamE8We9DMz6Vm5Qsl+E17XZEcrJAia44Q7cUuN6gPTNuOWCia+7p4KWszLiQFEAo
	5DzdNE86xXAH5B/0uxMSXROmGl98PBWjVdozLfUX+cNGwvMWBbBebpyJ2z+Nx376AtkyG0iZvPU
	kkv0kPIjBZ7f3wDZeCxL5RAqv84j7vKFL+8ubQ9dQ3i+XeX8EszB2PS1eS0VeYrVj1R7ABcTRwx
	OwGvQf1YW/KeRfKwBsDGLDmXFrKiSIukUTlNoNGYvnS5d+1HU4RYSMhhT8ri3JjtKNIlUtx9SRw
	eQh1She+KEUI9FxjADvgQ2knzzWJ7KjZA=
X-Google-Smtp-Source: AGHT+IGDWUheq7bAmRQ/NpjxeOypmK1lVdB1YhIS7WdpVwU8NQHESVsoWAVdR6HW92z4sPCMNa2D3w==
X-Received: by 2002:a05:6a00:f93:b0:7b2:2d85:ae59 with SMTP id d2e1a72fcca58-81b7eb28141mr6124949b3a.11.1767882180860;
        Thu, 08 Jan 2026 06:23:00 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm7927906b3a.53.2026.01.08.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:23:00 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 22:22:14 +0800
Subject: [PATCH v2 1/4] dt-bindings: soc: spacemit: Add K3 reset support
 and IDs
MIME-Version: 1.0
Message-Id: <20260108-k3-reset-v2-1-457df235efe9@riscstar.com>
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_062302_036438_598D77C4 
X-CRM114-Status: GOOD (  13.63  )
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
K3 CCU driveri. Since K3 reuses the K1 syscon binding, there is no separate
YAML binding file for K3 resets.

Update #reset-cells description to document where reset IDs are defined.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Update spacemit,k1-syscon binding to clarify K3 reset is supported.
    Update the commit message to add backgrounds of this patch why,
      instead of what.
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 66e6683a3ccb94af2ddf71bf443424adcb7a0d72..1a28af22cac1d474fec8af3b6c7dc674a75ee734 100644
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
index 0000000000000000000000000000000000000000..79ac1c22b7b5447af1596edcb67a5dfa981e9ee7
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
