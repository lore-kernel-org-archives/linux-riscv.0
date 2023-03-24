Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41FFC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OXC0MN5tskEjGzA5G5gPbL5l6Hqhr9KMY28+zxzqbo=; b=rU1Ftfmgrt9Vqy
	EMPefvgq+dm09w8wB9amzWL2pPYGM5jxae6Z+qY6YZ2Sw57JfhWeLG7SPlD4gBDEjOs+cm91UcNl8
	N3t74Oyu9yjbmIHUO59qQcOAU53nml9fXItFEv3hdLatFPSn3uh3OxQCU5l2jABVXFH7S5ViKFgyx
	Y2V3WQEf/VY6rs0JATuhz3TKbsUJedVEEbe6xkTa3A2DLk2lUVztg2oeAJwyC+9yXzHXsATXjjtgh
	U1uqstK1WM8Ep26sn0fJv3vVeIUL12lLSjoXzcot58dDjVfJdkc1ygyvZ9Zavvkavn71RBCGxQX2x
	YX2HAl9SFCeukPih1EUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeJm-0046ld-1m;
	Fri, 24 Mar 2023 10:06:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeJg-0046jU-1t
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 10:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679652397; x=1711188397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HIMWJexj4WLJBJERrpVARQc+HGNG7OWGHifKIwHmW0=;
  b=YxnkLKaqUe25lwNpDhS7mfA6XahVfNumG5TKYPbH9JNP7vxS9mYJuuWb
   YPF82VIUtxrOHRDFE2mvwmpWEFL2k8eluiCch7axlU2ruxWp3N5bwT++T
   +oZY7DBy3vaWaPpXKiDLKzBO5KFGEMmAiUWiYHiXa1F1Capd6QVe9GMe+
   VEZSAVOWK1QXr7OccfzM5vtcNyzTut9i4dOIudTg+drASo56h1M9WryN+
   T4nw3P2p37hzZ+49nL7z661bbaarl5wJgyzJBtqL6xpsm4e5hTbrryNih
   u5Ll9iNspSJ+50JL6IcHUlZWNDEJgc58hJBx9XttW5CkazYuHmMHzVK46
   g==;
X-IronPort-AV: E=Sophos;i="5.98,287,1673938800"; 
   d="scan'208";a="206553556"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2023 03:06:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 03:06:32 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 24 Mar 2023 03:06:30 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, "Andrew
 Jones" <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] RISC-V: add non-alternative fallback for riscv_has_extension_[un]likely()
Date: Fri, 24 Mar 2023 10:05:38 +0000
Message-ID: <20230324100538.3514663-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324100538.3514663-1-conor.dooley@microchip.com>
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3128; i=conor.dooley@microchip.com; h=from:subject; bh=5HIMWJexj4WLJBJERrpVARQc+HGNG7OWGHifKIwHmW0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmypS82zLn4u6GUZffmTWHbL3WdueFeeU7x5cYpAUYctxmO BHcmdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi75gY/off0GP2LgwUc7wToJDjOM vj6tMIBzFR3Y0zw6cmhBcfLWNk+JtnpMVjlST+Z8vUu/GNcctczkpstOyZxz3vRbW0XLcYPwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_030636_637163_0AB2B34C 
X-CRM114-Status: GOOD (  10.19  )
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

The has_fpu() check, which in turn calls riscv_has_extension_likely(),
relies on alternatives to figure out whether the system has an FPU.
As a result, it will malfunction on XIP kernels, as they do not support
the alternatives mechanism.

When alternatives support is not present, fall back to using
__riscv_isa_extension_available() in riscv_has_extension_[un]likely()
instead stead, which handily takes the same argument, so that kernels
that do not support alternatives can accurately report the presence of
FPU support.

Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
Link: https://lore.kernel.org/all/ad445951-3d13-4644-94d9-e0989cda39c3@spud/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 50 ++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3021b2590de..6263a0de1c6a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,18 +57,31 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
 
+unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+
+#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
+
+bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
+#define riscv_isa_extension_available(isa_bitmap, ext)	\
+	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
+
 static __always_inline bool
 riscv_has_extension_likely(const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
 			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	asm_volatile_goto(
-	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-	:
-	: [ext] "i" (ext)
-	:
-	: l_no);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_no);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, ext))
+			goto l_no;
+	}
 
 	return true;
 l_no:
@@ -81,26 +94,23 @@ riscv_has_extension_unlikely(const unsigned long ext)
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
 			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	asm_volatile_goto(
-	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-	:
-	: [ext] "i" (ext)
-	:
-	: l_yes);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_yes);
+	} else {
+		if (__riscv_isa_extension_available(NULL, ext))
+			goto l_yes;
+	}
 
 	return false;
 l_yes:
 	return true;
 }
 
-unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
-
-#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
-
-bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
-#define riscv_isa_extension_available(isa_bitmap, ext)	\
-	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
-
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
