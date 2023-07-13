Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5858CEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3/VxJlAbSydrYBGCsqvgLpX2nX5mFjMkMbcC5YQqnI=; b=i8LdKDY64JKGQq
	4eTh/88ZJyNY3okMiLxd14XwRmcO5aiOjANadgUWPxWSuhjr3b+wKE4iewGBmgnD01APbYgcfYFPo
	L/Fu+SQLmANZNdtOkFsrwqVG1dOPX/8Bc4Hv7DDNKf41Js/5D0NAK/UPbglaUhzgiZ5lpPg7N8dn/
	A2luZ3IeABPMLUIdpGUo8/jQI2mxR/RYTZhWycw+K10vWED0nFL66ojJK/cfJcX8x38NXJard80PN
	2HRufj1aJqIRyutXiMAzZA3eyKKU9s8LKgJMBV/nXI3c20VR7wJYwb0v3UCEieJyLFK4yVtdVCaNt
	Z4tUJWiWmcF7TsFDMBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBj-003Bk4-1n;
	Thu, 13 Jul 2023 12:12:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBg-003BiB-15
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689250368; x=1720786368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+gmfGrxcQqjXfZd/zTckfTRTww6zd62gI4c22r/Xm8=;
  b=eatfqLCZdoDkp3LoVyP1zCJwqBBRDrEcP1xGq1Uem+ochCflRkQGXBl7
   EBwCwDTZB46Br7sGOVRB74ph73E61XJM84k83cBoxKvg6hOL7p4WFD0Gh
   Mss2m4t5FcSzoNOE5V6c15VchkAmr4hj6p5gOH0QN4ikBw+IxOnjxmcQS
   KeFMSX50j4aXvdjuZ/QAv68lBZGhtI1hOBmaafMkCUvQ85P66KHqlR2c4
   pheQ0wWIDtf4L0ImzrQMz57Hyl2zTjuLL2E9Pmlg6sahbFokrOO/jc7HX
   TXKNpS9FGvu7qye5AtAGcZyf/uFirfdxd49bJPmVP3IS39N/h6J2ztbFT
   A==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="235310992"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 05:12:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 05:12:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 05:12:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v5 06/11] RISC-V: add missing single letter extension definitions
Date: Thu, 13 Jul 2023 13:11:04 +0100
Message-ID: <20230713-train-feisty-93de38250f98@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713-target-much-8ac624e90df8@wendy>
References: <20230713-target-much-8ac624e90df8@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=f+gmfGrxcQqjXfZd/zTckfTRTww6zd62gI4c22r/Xm8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrX17bI3rjyOnwwzrWLC0GMSG3z2w8vanr5aRqx39+l64K hSXbdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiu6cwMmxLVZkYrfh/+u+YuieTj9 5e0/hzo9mWmzunui3xb2wzudPE8N+La9K6q9sSFBe5ZZYdCv9u+8taTf6wjd9VgwnJ534xCHADAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051248_380004_7773236D 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To facilitate adding single letter extensions to riscv_isa_ext, add
definitions for the extensions present in base_riscv_exts that do not
already have them.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 2460ac2fc7ed..a20e4ade1b53 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -14,12 +14,17 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
+#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
 #define RISCV_ISA_EXT_h		('h' - 'a')
 #define RISCV_ISA_EXT_i		('i' - 'a')
+#define RISCV_ISA_EXT_j		('j' - 'a')
+#define RISCV_ISA_EXT_k		('k' - 'a')
 #define RISCV_ISA_EXT_m		('m' - 'a')
+#define RISCV_ISA_EXT_p		('p' - 'a')
+#define RISCV_ISA_EXT_q		('q' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
 #define RISCV_ISA_EXT_v		('v' - 'a')
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
