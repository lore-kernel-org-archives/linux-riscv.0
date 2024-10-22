Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D6D17157
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i96ZrBbL2l3AnIKUOE/L4tq4mIx5GbHwRRgQ3zQ00kM=; b=z2impER4z3OAV1
	LE2oTNGukVYs7Ku6b9dGjYZFAPrbSaCDH/iZc3hKCZ1iscNZFTZlDBrqIAu73tmqPG+9ux81amsP7
	vW8CCpOwBmsNH1OUeAKuDpsVeYUpAiLOIfJnNNq/hibZySQMSWppBKwqbxvPEKe7clgOQdRUqNq7B
	7Bogk9uAxfn7+pJEjY9qQR5avPTpdVyhJ0Np7QPNu9DjsriHWCWkjvMdc02X6T/chsowzMQmtkunF
	qUXSzEudF3RovzhDBFrElVJTNZKoMK4SYp+9FFoT7wLfDjfaIA8deZY5QWrT0EHWlJ87fATVDNcz1
	1nyuVZ4EI+Inw/RU17XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34ES-00000009GwE-0P3C;
	Tue, 22 Oct 2024 02:02:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34B7-00000009Fll-07iM
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71ec997ad06so1150476b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562360; x=1730167160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Af9tK0JLBBTeDXRGuA1c/z94Xn/abI+OOOquUfcf3I8=;
        b=DqwkLSwxMIblcwfWpRPw5WwCNEG+IbfUq1ikaezry4wC05ecdGHM6DcTVYNfuMFKOJ
         r/LTQh/cqxiuYpa/xgixv0uDf+U8acSkCp6OcgDHJ80Z0DpRsSFxIJoc61Yt8PvaAabA
         H4P6rqn/qPnZpsE79y1XXxdAw/Czib2kxJb92qOkLNgwGCja80K+I72iQTkNb4i23ftS
         K8+weE06u8Lu/lzNyiXg3vft2VgySxdY5ASzEftLwYBdM4EO0cmBKkyOmR9BSek3rgpi
         5/mTPX36FOa41l3DDd6RvPJT9+GUipC0DNrezzVpwSQ68EpSqmTmu+dp5G96Ry6nM27b
         GDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562360; x=1730167160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af9tK0JLBBTeDXRGuA1c/z94Xn/abI+OOOquUfcf3I8=;
        b=uVrH4O5vpGdhHSYJV7WNPY9Fv25qSpOEZXq6JagkeBZ6B0zhd9of+/X+t9ixKq3g5k
         WTPtlNCm/dENDOI+snrc5mgDU5IS/NVaG+qURY/vxKt3e2zdKOhCt6Nt+WGYZ8TBIDGE
         oOlGYMKEBjApSy19imxMUlOIcvpfWOGtwui0ETTKnxJzDZBI6nv7b91PTVhkUqThqlhI
         HpY6Lyvcus7vjHgyIpnmldrtNwhButYrfErpqlI/ix4Qy4cn3BKHIE8qP3rtsVC1DRJ1
         ZumV2XZPJV97RdMehS6YazbRN/ENjJN4YIPFML4usfn2g4OLEsNslafBAmiaDd7cKq/5
         wpTg==
X-Forwarded-Encrypted: i=1; AJvYcCUXFiG1Z1cs7gEPdUjCIiq2WXyVoxmZHn3aEeL+fX3ByEQZSXAWC4a36JolcXFbgcDf15XZWXpZmJNb3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQ5IhVE91f+kuxUXgb/ThklMXpEEYj7ZnESSAGxZ85jL8i31a
	PwOZzSXvLwvpvFBu+vEm4/Kyps2YtWx8FXKzJG82SLf0lOHgx7Qkp1o2g5nMhF7SOGI3ZykWU8a
	p
X-Google-Smtp-Source: AGHT+IH5wPAzHdVfv0MMInx9ySs4Jc9bkPSFs6F+LS8CNw/7mEjClw2+t/2vEVp2yPC3jOJm28L3Qw==
X-Received: by 2002:a05:6a00:4610:b0:71e:6489:d06 with SMTP id d2e1a72fcca58-71edb972451mr3011651b3a.0.1729562359943;
        Mon, 21 Oct 2024 18:59:19 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:19 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 2/9] kasan: sw_tags: Check kasan_flag_enabled at runtime
Date: Mon, 21 Oct 2024 18:57:10 -0700
Message-ID: <20241022015913.3524425-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185921_261839_77211230 
X-CRM114-Status: GOOD (  14.49  )
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

On RISC-V, the ISA extension required to dereference tagged pointers is
optional, and the interface to enable pointer masking requires firmware
support. Therefore, we must detect at runtime if sw_tags is usable on a
given machine. Reuse the logic from hw_tags to dynamically enable KASAN.

This commit makes no functional change to the KASAN_HW_TAGS code path.

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/linux/kasan-enabled.h | 15 +++++----------
 mm/kasan/hw_tags.c            | 10 ----------
 mm/kasan/tags.c               | 10 ++++++++++
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0c..648bda9495b7 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,7 +4,7 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
+#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
 
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
 
@@ -13,23 +13,18 @@ static __always_inline bool kasan_enabled(void)
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
-{
-	return kasan_enabled();
-}
-
-#else /* CONFIG_KASAN_HW_TAGS */
+#else /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
 
 static inline bool kasan_enabled(void)
 {
 	return IS_ENABLED(CONFIG_KASAN);
 }
 
+#endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
+
 static inline bool kasan_hw_tags_enabled(void)
 {
-	return false;
+	return IS_ENABLED(CONFIG_KASAN_HW_TAGS) && kasan_enabled();
 }
 
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #endif /* LINUX_KASAN_ENABLED_H */
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9958ebc15d38..c3beeb94efa5 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -43,13 +43,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
 
-/*
- * Whether KASAN is enabled at all.
- * The value remains false until KASAN is initialized by kasan_init_hw_tags().
- */
-DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
-EXPORT_SYMBOL(kasan_flag_enabled);
-
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
  * Defaults to KASAN_MODE_SYNC.
@@ -257,9 +250,6 @@ void __init kasan_init_hw_tags(void)
 
 	kasan_init_tags();
 
-	/* KASAN is now initialized, enable it. */
-	static_branch_enable(&kasan_flag_enabled);
-
 	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s)\n",
 		kasan_mode_info(),
 		kasan_vmalloc_enabled() ? "on" : "off",
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index d65d48b85f90..c111d98961ed 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -32,6 +32,13 @@ enum kasan_arg_stacktrace {
 
 static enum kasan_arg_stacktrace kasan_arg_stacktrace __initdata;
 
+/*
+ * Whether KASAN is enabled at all.
+ * The value remains false until KASAN is initialized by kasan_init_tags().
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+
 /* Whether to collect alloc/free stack traces. */
 DEFINE_STATIC_KEY_TRUE(kasan_flag_stacktrace);
 
@@ -92,6 +99,9 @@ void __init kasan_init_tags(void)
 		if (WARN_ON(!stack_ring.entries))
 			static_branch_disable(&kasan_flag_stacktrace);
 	}
+
+	/* KASAN is now initialized, enable it. */
+	static_branch_enable(&kasan_flag_enabled);
 }
 
 static void save_stack_info(struct kmem_cache *cache, void *object,
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
