Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA6DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfDU/zo+EcPzQEBn9Om/fhnJ+kKGOncR2wCG/Ah/FGg=; b=H5uHjZMy/yMi6T
	kM98KvAzNr2W0NfgQHMqn21MJSoHKNiDjeDrZoe9I6IKhnYudZ8bUHG1LV4Z3ybDFE/6HGTYF+Kby
	5/qYTiB1SFCy7gqL7lUDtBRVqOTAf+u5wOMQLCTLTyb9OM2/8+cCNd4SEjtlUhJ5+BWq8ZZLVicyJ
	bwMu+00wHD5TvpsC+zCAiwHVWDN2rImzWAcn35abC4mJFQJ+KDeupLGYA3KVPdvmBBiLYM1qcz6jY
	TTbkqnqdEHhPyU0Yv7gkmDiIPXnqkTkxG8KB+e/hgLTWoXKqtQmQ2NVHtbquHF5coNztviMFzIoZZ
	eJ0lmyK3z1brZMsCjuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kq2-0000000F2Rf-2KOw;
	Fri, 03 May 2024 04:48:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kp3-0000000F1XO-3FhG
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso7044412b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711621; x=1715316421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBAtK6yz0tN7qnDVCrHDFDflditCb34tqrZg7A4OIKI=;
        b=p6UjRanJXlo4rtMTt57UFoJY08k0qJ9VV5pcSW2fDSQR7JLh4e3xDWJdSXO+pcPVEr
         dFpvwagBLqeSBvTC3erx1wYfUEw9HE+VDuxyZOuGuHItAFnWL+S5grRFau909ZY4m5Lm
         H3czY4v+v4V7LX4UiiUkD598+cOmIyPgKVN1VQ3IHYYsBJW7QK7aoVhyGctmUsXPUYkM
         Z8FDrUgTneIsXAEH/ZyFdjLbza3hXGLyy/gu2BREZ9tkH959NvqKe6K+afdTXTpd/Alz
         HgzCL+2TF1SEuH3QSifrcgqG/17ca+/Krq7h0DhWasJ/eYZFQAuFZr6jwvriLjQmTpy+
         5pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711621; x=1715316421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBAtK6yz0tN7qnDVCrHDFDflditCb34tqrZg7A4OIKI=;
        b=AcYIcr+oT00LJWcbXaA8aXROlMODXZPFQzja3cPdJk6jwbfJqh3jjhB7nM+l47eCcm
         Umn+tluRdGQ8Kqtf92GvuGY15miVcnMO7/KjfgeV5tvqngy1ZgJCT1MWKr6XmOAieiDG
         Pbxpj8PnfOolngpNTxd1xr7s44us74sBK0yhWx1XcspUZJaVq4MDYNEC7AZ2I/RyfAsw
         zGcPOCY10y0s763oGhrZufobKRpLQRJ30KP2pAmPEHYHZOcVwkPFsxJPC6ipN+/xO4lc
         jqds7vg+NgemtPhuAGe6pW8ujXcqZVuJQdtJKQwVJL7JBqCWv975J0ZG3kXRhBxmq9Zf
         htOg==
X-Gm-Message-State: AOJu0YwF2j8Cb3WQJhjJIo4Yb/7BGAPDhEhOA4Xz5MKh7XNmoMiz2pM4
	2uC8NL8ePrekoSPmO3NUccyIUJanjlZwa4ENLWAZ+omvMEcblcSm86VmJjV+meg=
X-Google-Smtp-Source: AGHT+IF06THjz5G9qZKmeRTr1gAvHdFeHK50QwVhMpmQmsh4TwbRlEVHFDctwj8AEiO9jRfEFBYmZw==
X-Received: by 2002:a05:6a20:a122:b0:1af:6a37:3cfd with SMTP id q34-20020a056a20a12200b001af6a373cfdmr2118253pzk.24.1714711620917;
        Thu, 02 May 2024 21:47:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:43 -0700
Subject: [PATCH v5 08/17] riscv: cpufeature: Extract common elements from
 extension checking
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-8-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=7158;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2AJiZIKU/txIzz8lcRnB5tCco7QN7//SJU1vx5ohkb8=;
 b=YOIghtsf7HC7GWmj4P7wyDakVJLWJTC5OsydPCk6VdnIqyCKpImm9cXdMtYbcFm9oDMyUx2It
 1Je3ehTENzUA3Yjtec9EJKC48M+XxXGidUnbtL8A2DpwHXJ5Z/qdhYK
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_214702_095702_A916AE34 
X-CRM114-Status: GOOD (  14.65  )
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

The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
functions from the vendor_extensions.h can be used to simplify the
standard extension checking code as well. Migrate those functions to
cpufeature.h and reorganize the code in the file to use the functions.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------------
 arch/riscv/include/asm/vendor_extensions.h | 28 -----------
 arch/riscv/kernel/vendor_extensions.c      | 16 +++---
 3 files changed, 51 insertions(+), 71 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fedd479ccfd1..88723ac2d26e 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
+#define STANDARD_EXT		0
+
 bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned int bit);
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
-static __always_inline bool
-riscv_has_extension_likely(const unsigned long ext)
+static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
+							 const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_no);
-	} else {
-		if (!__riscv_isa_extension_available(NULL, ext))
-			goto l_no;
-	}
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_no);
 
 	return true;
 l_no:
 	return false;
 }
 
-static __always_inline bool
-riscv_has_extension_unlikely(const unsigned long ext)
+static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
+							   const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_yes);
-	} else {
-		if (__riscv_isa_extension_available(NULL, ext))
-			goto l_yes;
-	}
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_yes);
 
 	return false;
 l_yes:
 	return true;
 }
 
+static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
+
+	return __riscv_isa_extension_available(NULL, ext);
+}
+
+static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely(STANDARD_EXT, ext);
+
+	return __riscv_isa_extension_available(NULL, ext);
+}
+
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely(STANDARD_EXT, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
@@ -158,7 +165,10 @@ static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsign
 
 static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely(STANDARD_EXT, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index a6959836f895..d21e411d7338 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -47,34 +47,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
 					       RISCV_ISA_VENDOR_EXT_##ext)
 
-static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
-							 const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_no);
-
-	return true;
-l_no:
-	return false;
-}
-
-static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
-							   const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
 static __always_inline bool riscv_has_vendor_extension_likely(const unsigned long vendor,
 							      const unsigned long ext)
 {
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index e4ef574b7d08..7910890c17de 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -31,16 +31,14 @@ const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_li
  */
 bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
 {
-	unsigned long *bmap;
-	struct riscv_isainfo *cpu_bmap;
-	size_t bmap_size;
+	struct riscv_isavendorinfo *bmap;
+	struct riscv_isavendorinfo *cpu_bmap;
 
 	switch (vendor) {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	case THEAD_VENDOR_ID:
-		bmap = riscv_isa_vendor_ext_list_thead.vendor_bitmap;
-		cpu_bmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
-		bmap_size = riscv_isa_vendor_ext_list_thead.bitmap_size;
+		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
+		cpu_bmap = &riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap[cpu];
 		break;
 #endif
 	default:
@@ -48,11 +46,11 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	}
 
 	if (cpu != -1)
-		bmap = cpu_bmap[cpu].isa;
+		bmap = &cpu_bmap[cpu];
 
-	if (bit >= bmap_size)
+	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
 		return false;
 
-	return test_bit(bit, bmap) ? true : false;
+	return test_bit(bit, bmap->isa) ? true : false;
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
