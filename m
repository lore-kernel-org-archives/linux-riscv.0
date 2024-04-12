Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC8C04FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6J6qMMHocWdTyae+SG96k16B+dxi1kjplhY+DpRln4=; b=j+pKgcwBndjESD
	dPOOs+fytAiYVGHB+FJdwrMFtKwZMLiuVht4We3b2gNixgvxV+n1EtnROnaumGqCjT3YwSvw7/aMK
	4IiZk2za4jQUe+acpxSqS1pIYB4eZOS/vmJBbyIzUa5bQIQ1WsWqcwzcfi+xuzL3DjVpeo61xDkOz
	8MzjoeaxfZh0D8h8YCN+tLex6jrvg0OpZS8WvnMD/FGOdvuNeF0ZCf6VmvQIs0rSiI9URECuEDuex
	LNJ9UYpaFJYdORzUI6cnKpA0G/ovLIsLNoEWjI97FnCuHN2oqHrzmjPGctECLLRTqpN7pr1CQduzi
	5SsL1Ldav/eT/Pmccr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8If-0000000FCAz-1X3h;
	Fri, 12 Apr 2024 04:14:05 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GS-0000000FAH4-2NpZ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ee0642f718so698409b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895108; x=1713499908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smqSZCJ24Vp+hpH8xB7ogKvsAS68KCVdW0c3RLG+3UU=;
        b=xLSFjRMKtmObQI2zc9/TRf+rvF13gA+l/oVL1OcWRuzAkk5NgIdvfDmwGtrcS9t0/O
         vGh2AqEHK887n34hmgdUkXhWY7bcUfy+apdKQvGo4TvQYNMyFfEua9LRnbLTQpvTphJN
         q5/S2HzQA9yJfXUuUVC4UweoV02OQo8zUSU0in3XNjUgdOYT4ezVuLMkTEH1K7OhNHD0
         ATLMny/a0ss/os1QcgWtenp9MdRKWl4r9cyMe405sBpUQdsRFP7OZIEM9bHM3liSYxH0
         Hti6EQddNKjnp087GaMtlFbAyHSwi3RBilwr6K8HraWjdR6PglZoyTMsFU/agBg07bmR
         P1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895108; x=1713499908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smqSZCJ24Vp+hpH8xB7ogKvsAS68KCVdW0c3RLG+3UU=;
        b=P5Acw3O1rqfRkVJ7zq5gw6llcPf5njINpip8ugicy+Pe+YdwcsKjrUBKroF9z6FYY7
         /9bMjjXTVHycvkUxVPDSzZuObE3kiIMUCEw9xi4I1B2ybkxLDQ6J1XM5YS2bF3VX0B3o
         BT0BE3hlte/O47OQjs7sL4Yu6GL/pFTEfvjwimpLFQOfBS6mWM8lbH7QlpP5cgwWPdIN
         f1VBeUb2FZYMWMjGi9uvag8nUez7OucHhQNjrWdOhtoIlYsDwtWazF+nvPcl7Y8SzMVv
         SHRxemhnWZ8qj/1R6qhrGX/fwU7MFVMzsg2l/ZqCuqtfNEDCPemc/nyIaHaz/E6QU7iz
         msFw==
X-Gm-Message-State: AOJu0YyxecO8ZLzgbKNMBGybO0ijuWYTCo48T8D8E5QTUYTqv5UwjhB5
	Vi60s5/wTM64E7oZltWpvJCIOMJGt0sRdEQPQ477/DaFs03gu+gIW+OlMo9u2c0=
X-Google-Smtp-Source: AGHT+IFiZ0DGcHzQFItI5jBd5zIcxNTnX+sOt7qSHbY5wXcJWZGMtR6akgBptNx9TAu3tH5snZwG7w==
X-Received: by 2002:a05:6a21:788e:b0:1a7:48de:b2a4 with SMTP id bf14-20020a056a21788e00b001a748deb2a4mr2224771pzc.6.1712895107910;
        Thu, 11 Apr 2024 21:11:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:14 -0700
Subject: [PATCH 08/19] riscv: Introduce vendor variants of extension
 helpers
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=5326;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=64pk6E37QO5S3SRwN9eh9ZrF4BX2yhz4FRK88BWUVBY=;
 b=0XVt5QcwQKZb4xwhtLtda13ze969xaPxAmgG19AutCd4xCrSMhG8krDjHDYDpwgueJgcP0bBS
 g/h42ue5pTND4eLMRWrDk1/LSB4akM+FRwGR3iG8RgqZCiWv+mbA2pp
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211148_807146_93F669C9 
X-CRM114-Status: GOOD (  14.69  )
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

Create vendor variants of the existing extension helpers. If the
existing functions were instead modified to support vendor extensions, a
branch based on the ext value being greater than
RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This additional
branch would have an unnecessary performance impact.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 54 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c      | 34 ++++++++++++++++++++---
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index db2ab037843a..8f19e3681b4f 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -89,6 +89,10 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
+bool __riscv_isa_vendor_extension_available(const unsigned long *vendor_isa_bitmap, unsigned int bit);
+#define riscv_isa_vendor_extension_available(isa_bitmap, ext)	\
+	__riscv_isa_vendor_extension_available(isa_bitmap, RISCV_ISA_VENDOR_EXT_##ext)
+
 static __always_inline bool
 __riscv_has_extension_likely_alternatives(const unsigned long ext)
 {
@@ -117,6 +121,8 @@ __riscv_has_extension_unlikely_alternatives(const unsigned long ext)
 	return true;
 }
 
+/* Standard extension helpers */
+
 static __always_inline bool
 riscv_has_extension_likely(const unsigned long ext)
 {
@@ -163,4 +169,52 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+/* Vendor extension helpers */
+
+static __always_inline bool
+riscv_has_vendor_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(ext);
+	else
+		return __riscv_isa_vendor_extension_available(NULL, ext);
+}
+
+static __always_inline bool
+riscv_has_vendor_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(ext);
+	else
+		return __riscv_isa_vendor_extension_available(NULL, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_likely(int cpu, const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(ext);
+	else
+		return __riscv_isa_vendor_extension_available(hart_isa_vendor[cpu].isa, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(int cpu, const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(ext);
+	else
+		return __riscv_isa_vendor_extension_available(hart_isa_vendor[cpu].isa, ext);
+}
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f72fbdd0d7f5..41a4d2028428 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -78,6 +78,29 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * __riscv_isa_vendor_extension_available() - Check whether given vendor
+ * extension is available or not
+ *
+ * @isa_bitmap: ISA bitmap to use
+ * @bit: bit position of the desired extension
+ * Return: true or false
+ *
+ * NOTE: If isa_bitmap is NULL then Host ISA bitmap will be used.
+ */
+bool __riscv_isa_vendor_extension_available(const unsigned long *isa_bitmap, unsigned int bit)
+{
+	const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa_vendor;
+
+	bit -= RISCV_ISA_VENDOR_EXT_BASE;
+
+	if (bit < 0 || bit >= RISCV_ISA_VENDOR_EXT_MAX)
+		return false;
+
+	return test_bit(bit, bmap) ? true : false;
+}
+EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
+
 static bool riscv_isa_extension_check(int id)
 {
 	switch (id) {
@@ -930,14 +953,17 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 
 		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
 
-		if (id >= RISCV_ISA_EXT_MAX) {
+		if (id >= RISCV_ISA_VENDOR_EXT_BASE) {
+			if (!__riscv_isa_vendor_extension_available(NULL, id))
+				continue;
+		} else if (id < RISCV_ISA_EXT_MAX) {
+			if (!__riscv_isa_extension_available(NULL, id))
+				continue;
+		} else {
 			WARN(1, "This extension id:%d is not in ISA extension list", id);
 			continue;
 		}
 
-		if (!__riscv_isa_extension_available(NULL, id))
-			continue;
-
 		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
 		if (!riscv_cpufeature_patch_check(id, value))
 			continue;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
