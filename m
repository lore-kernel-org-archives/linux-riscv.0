Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5E0C83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWXjZc4mIBpPsDw6nloO6q8INedPQdVPuwvwW72TQGk=; b=SynDkCuTszfZWq
	Uuoq+JLTMLjcqRE1hGKDO5s3KcuAWj8jsZFaHwP53b4U3hsa/eRRSO5VJe9Bnz1nLM/0BG7Tp2iyn
	8/04gH27/iv9y+vvtsSHq1C4F0lvQTgmgF6kx6ImSFWWEgitqbRPaA6jH5t51wDpV17RitgYVPAsO
	J2IOEt4wK9sG8qOwsALvxO/u65TiGbVMeOanDYwMSjiYg1z0lPk+qs1tznLFeQQTN1KYmDRyVM3bZ
	ZwLBcN4M71/eXRDwWkP7EOsbnRus96d+UnKMXmm92DoXPdgF3w91IIqLdVV3+1DYR+Ry+tVFSZcjR
	Clr0JMH2H+gGIeyULJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwV7-00000008IhT-0cmo;
	Wed, 02 Jul 2025 12:23:45 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvm8-000000089aG-1ldM
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:37:17 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6ecf99dd567so58818336d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456235; x=1752061035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJLcOqbX1M7XqlFxK7mA92KamIHaBxAn/nE4MeoSV/c=;
        b=ED4kslt+VPb5Yg5TF30SpR065xZHeOG5sor21UhAb5S9Zy6sFd9eNDY5HMZIjWoy6E
         rhF8jds6jWxrmb5sBnn0cY6DQA41jjbS5LlPZTLFsPyFszKYxWNvHROn95ALmjDfOlig
         s2PdEqFbrAQK+nOVH5RvJ3Ugn4ZL2OX7GWKu2kOuAmejUcLCa6Qr/6cgzZEStokyQq79
         a0MeiS/Kxb8c3enw0EBQEtpKAcNm5Q0QhUhdnvV5zYPBAma5v7UxOQDwfNjr3bMD1W/N
         RKS5R2SH8jmtkX0vfLuvDHlTi5nfE6uwDEryy7XWH1FHQ+6vg3d0YTQAqAPyo0KV6Zbd
         nNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456235; x=1752061035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJLcOqbX1M7XqlFxK7mA92KamIHaBxAn/nE4MeoSV/c=;
        b=nR3pYt0IoYHN0MDDZOnYW8wQcdOfDAlgJ5j4jXkKVSg2WvTlfI4NP4p1eTX5bsVCej
         Ib85x+GSWGwKUD+ydn9LnE/UtIWi1eYpRx3EOiNCoI/NhYRfVEQUMLsvVcBhUciIqSZE
         yDTGpPYFuRdLjr9QLH5LK1y74iYdTAfrG6t31LvmmlIN2YNCxPAZUW9ZNZFKZasNEnio
         9XncddzU2KEFND4O0jXbXxkAH966XfliazPJHMBDjaDCEcFQAN/5Gsa2/uKFHxGC8UXs
         kDLcNDwbsUEEjCRaHt7yJ7dsYQGMjwqUEgAZ4pVt9e2rkDroOLndbEMMvkrhb+VYZVA6
         BciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzH2qnx+uNViHijFM7rAxKUkBd5lGWWMx8FVKGMc3/BiWVkTc4dFv+ldoi4H4VXyRPJItl4Huo68JtIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyetBEwdiWjiQlp7M6py5kMdAIQmoPktXME7C3yYjcfpsFRhBgZ
	O+6CSuNWkjL3pHu737zLumYa14f60ToAh/sjW2/+hsuvXPnq8CEBu9Vx9lpjctdqU/g=
X-Gm-Gg: ASbGncsarWM4pE89dhRKyBTarM79lMZw01MR3RXeZsdK8QjB7wki/KITH0UcMjQgPPR
	MnL0SF51tOowCfP9x0/hIBqwXYj4C1beC/uqwcTeBNtqMsB2rf1UqoqAG078EU6Az9t+94vwiEq
	ggdF73VnxGsS8X4zebG3egnA1O4cRVlRhy8kIRBKyWYTfWs4+pRU90XlJTcFnY8L6rGSGQ3dWmb
	FMwiIc/zgix2m96ib/CB10dsWl+OV42xFOn2O+8ryWkFqQDe7mPTf2K5y/6tItJvfTpGWJv9381
	mld7xpCfzAeHUSXfzzsVnGLFR6nGTGQ41MYtG87QvK62YzaJibMGP4IGzETSmSJyxe38gpmoOQz
	b7zkdpaaNv0MQklOHhr6O16meWuWXOEgfDYLLE2CVoUIjgQ==
X-Google-Smtp-Source: AGHT+IEcNGwa4EyflCaI/5VoYR6JO4vu4+SYgL4zrEJl1LhoNyjhxxY2wHsEGrp9KsD1oSCnhHVU3Q==
X-Received: by 2002:a05:6214:d64:b0:701:a0e:861f with SMTP id 6a1803df08f44-702b1a3e75bmr29890616d6.9.1751456235338;
        Wed, 02 Jul 2025 04:37:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v12 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Wed,  2 Jul 2025 06:37:03 -0500
Message-ID: <20250702113709.291748-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043716_465014_D1E637BC 
X-CRM114-Status: GOOD (  10.89  )
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

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will (initially) support only resets.  They do not
incorporate power domain functionality.

Previously the clock properties were required for all compatible nodes.
Make that requirement only apply to the three existing CCUs (APBC, APMU,
and MPMU), so that the new reset-only CCUs can go without specifying them.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v12: - Rename PCIe resets to align with their clock counterparts

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++++++++++++
 2 files changed, 163 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 30aaf49da03d3..133a391ee68cd 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -19,6 +19,9 @@ properties:
       - spacemit,k1-syscon-apbc
       - spacemit,k1-syscon-apmu
       - spacemit,k1-syscon-mpmu
+      - spacemit,k1-syscon-rcpu
+      - spacemit,k1-syscon-rcpu2
+      - spacemit,k1-syscon-apbc2
 
   reg:
     maxItems: 1
@@ -47,9 +50,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
-  - "#clock-cells"
   - "#reset-cells"
 
 allOf:
@@ -57,13 +57,28 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-syscon-apbc
+            enum:
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
     then:
-      properties:
-        "#power-domain-cells": false
-    else:
       required:
         - "#power-domain-cells"
+    else:
+      properties:
+        "#power-domain-cells": false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - spacemit,k1-syscon-apbc
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
+    then:
+      required:
+        - clocks
+        - clock-names
+        - "#clock-cells"
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae982466..2714c3fe66cd5 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/* MPMU resets */
+#define RESET_WDT		0
+
 /* APBC clocks */
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -180,6 +183,59 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/* APBC resets */
+#define RESET_UART0		0
+#define RESET_UART2		1
+#define RESET_UART3		2
+#define RESET_UART4		3
+#define RESET_UART5		4
+#define RESET_UART6		5
+#define RESET_UART7		6
+#define RESET_UART8		7
+#define RESET_UART9		8
+#define RESET_GPIO		9
+#define RESET_PWM0		10
+#define RESET_PWM1		11
+#define RESET_PWM2		12
+#define RESET_PWM3		13
+#define RESET_PWM4		14
+#define RESET_PWM5		15
+#define RESET_PWM6		16
+#define RESET_PWM7		17
+#define RESET_PWM8		18
+#define RESET_PWM9		19
+#define RESET_PWM10		20
+#define RESET_PWM11		21
+#define RESET_PWM12		22
+#define RESET_PWM13		23
+#define RESET_PWM14		24
+#define RESET_PWM15		25
+#define RESET_PWM16		26
+#define RESET_PWM17		27
+#define RESET_PWM18		28
+#define RESET_PWM19		29
+#define RESET_SSP3		30
+#define RESET_RTC		31
+#define RESET_TWSI0		32
+#define RESET_TWSI1		33
+#define RESET_TWSI2		34
+#define RESET_TWSI4		35
+#define RESET_TWSI5		36
+#define RESET_TWSI6		37
+#define RESET_TWSI7		38
+#define RESET_TWSI8		39
+#define RESET_TIMERS1		40
+#define RESET_TIMERS2		41
+#define RESET_AIB		42
+#define RESET_ONEWIRE		43
+#define RESET_SSPA0		44
+#define RESET_SSPA1		45
+#define RESET_DRO		46
+#define RESET_IR		47
+#define RESET_TSEN		48
+#define RESET_IPC_AP2AUD	49
+#define RESET_CAN0		50
+
 /* APMU clocks */
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +300,89 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/* APMU resets */
+#define RESET_CCIC_4X		0
+#define RESET_CCIC1_PHY		1
+#define RESET_SDH_AXI		2
+#define RESET_SDH0		3
+#define RESET_SDH1		4
+#define RESET_SDH2		5
+#define RESET_USBP1_AXI		6
+#define RESET_USB_AXI		7
+#define RESET_USB30_AHB		8
+#define RESET_USB30_VCC		9
+#define RESET_USB30_PHY		10
+#define RESET_QSPI		11
+#define RESET_QSPI_BUS		12
+#define RESET_DMA		13
+#define RESET_AES		14
+#define RESET_VPU		15
+#define RESET_GPU		16
+#define RESET_EMMC		17
+#define RESET_EMMC_X		18
+#define RESET_AUDIO_SYS		19
+#define RESET_AUDIO_MCU		20
+#define RESET_AUDIO_APMU	21
+#define RESET_HDMI		22
+#define RESET_PCIE0_MASTER	23
+#define RESET_PCIE0_SLAVE	24
+#define RESET_PCIE0_DBI		25
+#define RESET_PCIE0_GLOBAL	26
+#define RESET_PCIE1_MASTER	27
+#define RESET_PCIE1_SLAVE	28
+#define RESET_PCIE1_DBI		29
+#define RESET_PCIE1_GLOBAL	30
+#define RESET_PCIE2_MASTER	31
+#define RESET_PCIE2_SLAVE	32
+#define RESET_PCIE2_DBI		33
+#define RESET_PCIE2_GLOBAL	34
+#define RESET_EMAC0		35
+#define RESET_EMAC1		36
+#define RESET_JPG		37
+#define RESET_CCIC2PHY		38
+#define RESET_CCIC3PHY		39
+#define RESET_CSI		40
+#define RESET_ISP_CPP		41
+#define RESET_ISP_BUS		42
+#define RESET_ISP		43
+#define RESET_ISP_CI		44
+#define RESET_DPU_MCLK		45
+#define RESET_DPU_ESC		46
+#define RESET_DPU_HCLK		47
+#define RESET_DPU_SPIBUS	48
+#define RESET_DPU_SPI_HBUS	49
+#define RESET_V2D		50
+#define RESET_MIPI		51
+#define RESET_MC		52
+
+/*	RCPU resets	*/
+#define RESET_RCPU_SSP0		0
+#define RESET_RCPU_I2C0		1
+#define RESET_RCPU_UART1	2
+#define RESET_RCPU_IR		3
+#define RESET_RCPU_CAN		4
+#define RESET_RCPU_UART0	5
+#define RESET_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+#define RESET_RCPU2_PWM0	0
+#define RESET_RCPU2_PWM1	1
+#define RESET_RCPU2_PWM2	2
+#define RESET_RCPU2_PWM3	3
+#define RESET_RCPU2_PWM4	4
+#define RESET_RCPU2_PWM5	5
+#define RESET_RCPU2_PWM6	6
+#define RESET_RCPU2_PWM7	7
+#define RESET_RCPU2_PWM8	8
+#define RESET_RCPU2_PWM9	9
+
+/*	APBC2 resets	*/
+#define RESET_APBC2_UART1	0
+#define RESET_APBC2_SSP2	1
+#define RESET_APBC2_TWSI3	2
+#define RESET_APBC2_RTC		3
+#define RESET_APBC2_TIMERS0	4
+#define RESET_APBC2_KPC		5
+#define RESET_APBC2_GPIO	6
+
 #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
