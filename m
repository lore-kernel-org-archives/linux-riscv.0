Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB2AC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbwccY5qNapEl9MD6hFIT/rOm6TuuTsgx79v67R4iRk=; b=fdnKISK0zT1L9b
	tFtMNOY2KCW9kOpg9mgXXCIE6vRI73Fa2xlvbr440Km8Py2s41WA/4Jiy8nmTa/0aEozPR2d/89bl
	rFv+NPCvJfPIUzrvkVYO1KGwyru2zf5A7ZmtbbKQJ2GviMMvG0O1sAV5qkjVoUfi/P3ktQE7iUBPv
	3vmlDQipcsnQwIqk5pCEyGwh7qRdzX5vHVPnqiHQRtk7jeA/KA5wIWZzb9Gcywq4BR96DhHw7O8jl
	0G/SJYXg2A8wa/vrzj/RXgnurBSPGIwye5QtRvh0Q644Gns5prk6OZMZwwSfMkZn6oweHNibmaSWq
	REFLQVljUAGlGljLhhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqh-0000000EJ4c-3zt0;
	Fri, 28 Mar 2025 21:02:43 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqd-0000000EJ3B-3Gtv
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:40 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso20382245ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195759; x=1743800559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+I4R8hFY8nbTjxThMP1fCn2I0A92HjRa+9lI35yvdA=;
        b=L8vi4sM+LmhFU91nAtBPArZvaP/FqBwNBj5KJFOOyljAUVtGfSBvPgSuQhszc54Zpb
         4TmOWWuY+n1ar04IS/j1DVcLgjwcceGMNudEoGJnlHk0lH6JsyypaEihhBtPdlwfE4Jk
         kr+FBrlxJqOYZSUBu2Hz0Mq7Ynn5AcFnzNzj7G+hwXj6ADC7jiuQf9NPWn+9Tbln0iXQ
         LIocY6wHs4Q79OmssbXRREtCbbuYYSUDAgcvk1nxWzsjd/DJ3fLIe3pkzD6fLOBgmLwl
         2rF7FhPAyQVQGqkWkHgoeGmUKAGTEinuq0EUiMYlrg4jBggu/C2l5DZ8Krs8OnFFvHHH
         x9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195759; x=1743800559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+I4R8hFY8nbTjxThMP1fCn2I0A92HjRa+9lI35yvdA=;
        b=VKBOEXUlbhYtO+7mpb0PjmARb7bO+YJozA2owbWisWZ5O8eAd5KxMwMHhrMIU7oh92
         rlRk/xNhwV5B6kvd+yLLAchQFx4UTSiDSb4qFs5SelL6xwd8pTGMSKtdFaF+sC2Abf/R
         rnpte79iLGPRUfiCAOuZi/yi3Ezyb3CWEiFVu0nnYRmSELBAWnFZDimZCCuatfcdyA7b
         NKYVATGd0gSDbld+N9tUfvkvJlXtjSMWqc8NsMepO/LZwQGnj+H6lbOvQ/g8QWql7qbw
         Qk8i2ndLucAeHAiVKOwY3UQ6WAWPoxHGsPA0OShxxoVJ2II2P5MB9Sjj5jIEw0aD6AaR
         DSqA==
X-Forwarded-Encrypted: i=1; AJvYcCVNyMFx9PRRlq0B9TNF2Gw7YLJ/YNve/KdyRCp4U57qUc3hwoeJ6UzdLKOKgvQ1R3Ren8W/QTxkglYwhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6DkkUjabLUsNZNJ+8Z95n3e/pbO63p1k8iU0AC9L9DLToIKq0
	jOn+N2wyf7GiUnJLKU3wTgxF/XnlvEQjn5BTGPAb51BYXTWAGOYCTnZ0wnLmoxw=
X-Gm-Gg: ASbGncv6xYMOQhELAOPlVBMc3783s6Zwu2yKBbOMo7Smkf2k85Ye5C/P9+lmSOX1996
	StuY+32HZIb5uDpXBNTGne8qob1hLd3/nKHuLl4kP5VlPYfa8nfA9xdEEMDZg4Q8HVxT4EjjwzN
	FOug8WkLWyDDvRCBZZsG2kuvEfuC2+wqDbo1O4xlEcSnnZAAxdRMSEqyxBA35LpM76wNf6yeqxG
	tzBBBabQngbnMooGE7jUG6nhpXv5VOoiDZvD3p/WXmJhvpAJS+5aIfq2wINwUTDMrSAOSU+aqIj
	ve27rZtuN8v5AUGdn/nNI0jUVVDkIC5++gbPXdciooxhfGvzTYIBijptpGmqZ+cBnalB9YqS3+u
	MBqZpf8OxNRLP04anV6vX1XmmhIMJ
X-Google-Smtp-Source: AGHT+IGrCkE4ALBvVvYXuJ5uIYIbMnM60Ht0P6jdptpmfqvQjmweZFQXjhwRhsQczTG2B1yYskoZYw==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:f7ed:c907 with SMTP id e9e14a558f8ab-3d5e09e4ad6mr11092245ab.15.1743195758716;
        Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Fri, 28 Mar 2025 16:02:26 -0500
Message-ID: <20250328210233.1077035-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140239_817996_D4EBB379 
X-CRM114-Status: GOOD (  10.62  )
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
previously, these will initially support only resets.  They do not
incorporate power domain functionality.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: - Names are now RESET_* rather than RST_*
    - Added Rob's Reviewed-by tag

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 128 ++++++++++++++++++
 2 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 07a6728e6f864..333c28e075b6c 100644
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
@@ -57,13 +60,15 @@ allOf:
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
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
index 4a0c7163257e3..a4f68cba44d1b 100644
--- a/include/dt-bindings/clock/spacemit,k1-ccu.h
+++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/*	MPMU resets	*/
+#define RESET_WDT		0
+
 /*	APBC clocks	*/
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -180,6 +183,59 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/*	APBC resets	*/
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
 /*	APMU clocks	*/
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +300,76 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/*	APMU resets	*/
+#define RESET_CCIC_4X		0
+#define RESET_CCIC1_PHY		1
+#define RESET_SDH_AXI		2
+#define RESET_SDH0		3
+#define RESET_SDH1		4
+#define RESET_SDH2		5
+#define RESET_USBP1_AXI		6
+#define RESET_USB_AXI		7
+#define RESET_USB3_0		8
+#define RESET_QSPI		9
+#define RESET_QSPI_BUS		10
+#define RESET_DMA		11
+#define RESET_AES		12
+#define RESET_VPU		13
+#define RESET_GPU		14
+#define RESET_EMMC		15
+#define RESET_EMMC_X		16
+#define RESET_AUDIO		17
+#define RESET_HDMI		18
+#define RESET_PCIE0		19
+#define RESET_PCIE1		20
+#define RESET_PCIE2		21
+#define RESET_EMAC0		22
+#define RESET_EMAC1		23
+#define RESET_JPG		24
+#define RESET_CCIC2PHY		25
+#define RESET_CCIC3PHY		26
+#define RESET_CSI		27
+#define RESET_ISP_CPP		28
+#define RESET_ISP_BUS		29
+#define RESET_ISP		30
+#define RESET_ISP_CI		31
+#define RESET_DPU_MCLK		32
+#define RESET_DPU_ESC		33
+#define RESET_DPU_HCLK		34
+#define RESET_DPU_SPIBUS	35
+#define RESET_DPU_SPI_HBUS	36
+#define RESET_V2D		37
+#define RESET_MIPI		38
+#define RESET_MC		39
+
+/*	RCPU resets	*/
+#define RESET_RCPU_SSP0		0
+#define RESET_RCPU_I2C0		1
+#define RESET_RCPU_UART1		2
+#define RESET_RCPU_IR		3
+#define RESET_RCPU_CAN		4
+#define RESET_RCPU_UART0		5
+#define RESET_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+#define RESET_RCPU2_PWM0		0
+#define RESET_RCPU2_PWM1		1
+#define RESET_RCPU2_PWM2		2
+#define RESET_RCPU2_PWM3		3
+#define RESET_RCPU2_PWM4		4
+#define RESET_RCPU2_PWM5		5
+#define RESET_RCPU2_PWM6		6
+#define RESET_RCPU2_PWM7		7
+#define RESET_RCPU2_PWM8		8
+#define RESET_RCPU2_PWM9		9
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
