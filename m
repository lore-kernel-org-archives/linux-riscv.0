Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD98C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJHyWoqY24TeSxbWqkkm3BhGd031hsrqwb8Az6FU9Tg=; b=XcnAKCy9ZvDa9m
	Vhkj9JQ+oC/8HrHRZSuW2T5/CrOXrOyCwaiMNuRGo5ef4QhWk1QRZudTZB1L522SXn/XqCwGLI7br
	dH07BDZnNGm6EQILCP38Owg17wlqJDDM2CLzqDKnBkidulKt9ydoF/MzELse9L4JlZz4sH26fGix3
	rJNhOoy4FHg9dsWzEXoYpBQ+4KNygonX45fGNyCmali5rT+OgHdGk7bMGfZ+mm2CdLf6Xwds7eLdx
	FhuoM2kVXMckpFyhPw4Iiwel5eC0/C32IYFSCtZF7JKnoBRG2/hjCbQf9yldXYht4mWHbghvG2szI
	LhvTa0tQpsle8ofuwe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxS-0000000F1bF-2GKI;
	Fri, 13 Jun 2025 01:11:50 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxP-0000000F1Z9-2FFZ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 01:11:48 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-736f9e352cbso939062a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777106; x=1750381906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIMzta2AftTuOCZk7on/aypnLuIwPcK53zSW3MHSvpg=;
        b=A+Ltomak5rgPtm4dncdhtjjKeXn6QKZz8IREo54ijjYGxKZAog2ANxTMEACUPNZDCt
         2sCElGMmqVQA3BYq1xdASUEJDXZPI3v1LD8lAy3QKAxYPyfWW/FTOCt9g1y94h30b9D/
         RWaXHustD26Gy5RAOJCemOmS1EneDSSZK1mxHY1Y6Wy9rEgMKJ0QS71AY2RaM7iMYw6l
         +RgOKTUJ+GpAswTpea2UrlswkvD9YsIKiRP+AVLxtK7hy+x0mXWhC15sP6Tw5tm3++4y
         ieB8Jh5DQTgLXUWB3S3tWJ42VqG9xA+lJ00AtDq6kKNtL3tvfENRNH2HHbFJi9lZvlp9
         JQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777106; x=1750381906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIMzta2AftTuOCZk7on/aypnLuIwPcK53zSW3MHSvpg=;
        b=XyX0y/6L9DhzMs0jnC50Tam5CjSimmr/EWwm+/eB/pY/lmjyKYFAhYBmdJWdDz3Lgw
         exDjL9s6vlPeUVTapqpPgUyUxmxBFVWj/8pd4b8zcyC7job3NTtuuwPgVNZJbjWJYzdt
         HoMTBJr0JrROTDhTnhXnp//8peeGl/BYFGBGuYfm7IZM0tblc8LZdauRgZZdWI+3jbOE
         sgrAtcWzbxMQBnK/ykm0z1Iv2BTqnjZlOk+Edw2zncGotM5QzF1NtthbnRafHT0N52oU
         eTQowENfjWsfVekK9EuSq1Y2iMaYz8qqocRGhwL64v4vJ9rtT0aYfSJrhEw0bQX/faTm
         eJow==
X-Forwarded-Encrypted: i=1; AJvYcCXzT8PBpvdLIFs6aiC0AN1MkSL0/uHv42cVXbg2b24ib2mo1GL3WkZFGJZrILIKVc+ku2sFZZLv6hCBNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOn18CPwa3OE51dOZsQsTmtwYbK9tn25JeStUvCz/sUu3N7Pfe
	gfITEYHmTVACq8KDFEPg65m1zrYQZY4xrX0LOpLplgkw0zKMDh9sVR6V0zapyxojivU=
X-Gm-Gg: ASbGncstf6IXYDz/nXdQYtcCTNREw2QlaSi6ltpqHByaQOANmyQtDCRilTbVSe71J6A
	0hPOuKBVAcYghdZW+2CEGEj73ZGZiFLGHRoRYGhMAltHWKtwFcJrYZ4/4FXuZUrDIRdqAr9eATa
	LeWjeL4+zTtIijNzztuQUpy90g1zu55auc1juTl0wBPs5T9EC5D4Y6N9aLKTOfDxACce9QFmYHE
	YMO0hQHjf2ITEq5XNU2DOV6R0gtIpKRpw9qKTgFzTPsELn/yICNdCDgZWADkbUICson8QeU0nEV
	DnCbklr13NAcij06VCf9I71cj0n7f8kTWjRKqxLiP2MiG7RjdnBOVAL92Sr22M7BUfIPfnk+9Fb
	cDfTTQJiFk7iCp/CYbTraKlV8VCENYWM=
X-Google-Smtp-Source: AGHT+IHGyKqIzZMGUS+0mLJ+XXdHKM3DYFea7kD1MLQTICc0wh8Dsy0iZHSyESayB407m7TuPOsAmw==
X-Received: by 2002:a05:6871:8011:b0:29e:65ed:5c70 with SMTP id 586e51a60fabf-2ead517c850mr729455fac.30.1749777106478;
        Thu, 12 Jun 2025 18:11:46 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:46 -0700 (PDT)
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
Subject: [PATCH v11 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Thu, 12 Jun 2025 20:11:33 -0500
Message-ID: <20250613011139.1201702-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_181147_572438_40969483 
X-CRM114-Status: GOOD (  10.20  )
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
v11: Expanded combined reset index values into individual ones,
     e.g. AUDIO (3 bits) is now AUDIO_SYS, AUDIO_MCU, AUDIO_APMU

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
index 35968ae982466..8142b1b4c5d7a 100644
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
+#define RESET_PCIE0_DBI		23
+#define RESET_PCIE0_SLV		24
+#define RESET_PCIE0_MSTR	25
+#define RESET_PCIE0_GLB		26
+#define RESET_PCIE1_DBI		27
+#define RESET_PCIE1_SLV		28
+#define RESET_PCIE1_MSTR	29
+#define RESET_PCIE1_GLB		30
+#define RESET_PCIE2_DBI		31
+#define RESET_PCIE2_SLV		32
+#define RESET_PCIE2_MSTR	33
+#define RESET_PCIE2_GLB		34
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
