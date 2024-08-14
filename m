Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD61C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdAnNVAUAEaEPuFhw1CMjMNZ6O/Ts3mi5Ts4A59hquI=; b=npCJPAMBn+D2sG
	wBKGWr3W+Pli4Yqb/H+BcP/wz4gHTTuUQ2MEnXdh9BRX3+yGxdfcJdGWwRCwxbPJjwXOiEb/VVJLV
	Zh2iP/z1BU9kn9izsCBn5mv2yEimmB/AeDmIT4uBFTcbI3HpRQzWlmKwDxQzEf5va9y2QlqQRKgkk
	EcdzG333QwuKTWjFg9ojnDX7P6sQov4J+PsJHM07PjxFfOOkoBE2T7JPkv55Y3qxtlpsvpFvaUdxn
	t0dGg8gou37Z1Uho5O3fo+JGpDhTrCTftlrC2+cRczLtnkyP5IAMzhHgNcq8eQw26TI/MPDocGzJC
	YmWxyAkGq5AQuYE3W8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9pn-00000006Iwa-2ZbM;
	Wed, 14 Aug 2024 08:58:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9nz-00000006IC1-3dFk
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FOU7P9jn4wor6Rdt5JEa4HOxmny7NogNXhx9YRYE+tY=; b=UZgGkGl8P543Z/ah/97iq6ugIc
	HrpmZ0bkcMh2W8dCTYD046OMai7wAVe7aJD7pOgCm5frGWYU0irWvhhL/1++DWniTl+Y0vr4j/8O6
	JJ/lUTDOPPC9bKuiB+wq52ZS7en9K/KF1eRXKxBXi4ki0IWjBbRKaqjl4Zl5lMOdYEayofqkHy77U
	6fgH46h+8XGyx88nO+iVfyrrl3FEj3OHsVHPztXCB6qgS2xGdJFh+fhcv9pp120wk+LdD5u/tE3Ap
	zSYI6dn0WLWTGcYNJXhTMPi9FHWig2ALYjon2IZgSUb1UKb5y7jgM+KFQj3BXpVAn4KFSP2255sMB
	jozGrHig==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9nv-00000007zAG-123P
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:56:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fd65aaac27so4530095ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625784; x=1724230584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOU7P9jn4wor6Rdt5JEa4HOxmny7NogNXhx9YRYE+tY=;
        b=kt5xOkVkE27hap23SerKmwx8Libw7g19aEGHTXujuxLPKmPqzcKfN5eWEEgcnMP2Sx
         hRsYhGGfa790ay2ijEr7ye/vdEd0uEDnh5ycxEO3Uarj2PMFoDbOOHcDC8UfdSspfM3/
         QRNdfH8ZhwLdg10Lv37QxPegrtmkBh/wZE1vl5C9AleDLCW1qlgTOqulZAF2F1YGU9TP
         lw/5WtnKfe6MRfR8ES4nGbWiRsjuSnrJ7sFKVL3Jow0EEwCMoTXvSZU/FezBdp1tr0Hq
         R4PRUDFQp8FJbA3U1hVGf/lEudtoFJ/zatso7rYNqC9Ev/OsBONZhGuh46eBpPZrnUQN
         1/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625784; x=1724230584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOU7P9jn4wor6Rdt5JEa4HOxmny7NogNXhx9YRYE+tY=;
        b=Ex6qI7SnIm4zkrPpx9ccLRoUaCCbZzyWMKo3oDWm66UcG4RZZNZ+Rusi6W+E5LlrLs
         Kc/KnGi7+VxO7zRUbNXs3SmQLg0wUPDqGBBWgAxlE8Mj2PKQZCGvy0Sg1kX+49fQ8vtw
         DYBTXAyvC9Ah1VlIseBqDmTfmr6iq7r9lFr3UdCesYaQuEKcMy21wmE6VPD31YWyonZR
         64ewPp+xV/85v85XhLw0hv0TFNRORAdZH9U2dBB66RGxui7lYvUGzVjcfyJcungnRCCb
         yTDaCtjzU46MnrT15YOeCs8uhs1WjyefUnBmf8bzBQpKXc9EtqaJ29XW5oLDZZWOmbD/
         TAsg==
X-Forwarded-Encrypted: i=1; AJvYcCWODpF8RERQORV05aVzVfA7O/3Vk9861qodUX2Wxupp0n9ieFMkq+VywAfBv+r1TN+sE2EwlVDDqo8JFVmbRtzdxsEZ3dGBrCZX5Uok8/IX
X-Gm-Message-State: AOJu0YztDBumi15gddlgbg4gI+nQNMnAhsIvdTJ3+r6h3edYNWRbBvLv
	kTvfTTk92Z/v35DijZrZAHLuZ9VKVk1jdgxEKQDYX5OoQDxryPn4NC1SGK+qoUM=
X-Google-Smtp-Source: AGHT+IHtUXL6qE88NcA742NNnvRZ3OwS1PEsV1FbKiWQihqr5xxMbeis8+zR2wt/Qw0zy68klcF0mw==
X-Received: by 2002:a17:902:e741:b0:201:dc7b:a88f with SMTP id d9443c01a7336-201dc7bae70mr15567155ad.25.1723625783955;
        Wed, 14 Aug 2024 01:56:23 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:23 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 2/7] kasan: sw_tags: Check kasan_flag_enabled at runtime
Date: Wed, 14 Aug 2024 01:55:30 -0700
Message-ID: <20240814085618.968833-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095627_630047_99CE1401 
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

On RISC-V, the ISA extension required to dereference tagged pointers is
optional, and the interface to enable pointer masking requires firmware
support. Therefore, we must detect at runtime if sw_tags is usable on a
given machine. Reuse the logic from hw_tags to dynamically enable KASAN.

This commit makes no functional change to the KASAN_HW_TAGS code path.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
