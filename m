Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E4CC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 03:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In396PmWalepCx8bUwbcKc93RAwmC8KzXM2/YRqfWy4=; b=UztNh1p6Cy5TbE
	61z0LNRz4sDLUNLfvZCFfI1kCDK80DnU3aCTYlHJoOlnRJm2Xqdaqu8mmp6d42IkAQCerjYDsgXS6
	X/z8aGGePuxHW902jk26dWG0sJqcmTv76lO1ZqULDAY3P+9nX2kTsKoiAZzIKW+PaCh7dCDHRXHt/
	1t8Yxily/3clOcaHhI9zKBRxF5dey4axtFUOuWdhotJ45E9WzcN/3lXtal2fLNjbbuuPg7DCaBZNS
	qopnz2nurP5iG2DHtn4aUCa0/wW2vkyvY3lAUXSrsxmTaZIAZjberTXHj4dnKORTRiC1V4/m/aNm9
	hExwp784nfooMx2+BpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMdB-00000003aub-26a5;
	Thu, 01 Aug 2024 03:37:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMd8-00000003atM-13qx
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 03:37:31 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70d28023accso5040845b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 20:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722483449; x=1723088249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juGX4dhtMScEhsSdRcfK8Rpc9+vyV1DigC2XZp7/goM=;
        b=YttR9VMPhOjpeqckb2Sg6W89ITp8pj2vDhfuBnFTfWbg5WdbiB1+/q7Fpcfsk0tdm2
         ifqYrwYtYAmpyBrU/ienz1o+K1UHufh7XZFpuCUOdSOLEdIkCmd7gcPEHXdH8GyAjE31
         L4sdK0BQUEmqqrfM+H6c7dFY+gldaLtLq35c/LYfkiC3hOAtd6tJ82dzqA93rmniBiCd
         mVAec1hDxdiLmx+iHDILuDBFnyFQdrYOB8751FnW+agIYoUs8ppBwTX0qt2f6eLrtQiQ
         tYlZy7wPjw3wxlYY61PdVo3HsfMwP+40wVsmJMYtf687/fwBWmJKwfBMUtvghYIg5FiM
         i5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483449; x=1723088249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juGX4dhtMScEhsSdRcfK8Rpc9+vyV1DigC2XZp7/goM=;
        b=evm3cT47WLUCVKq4cdbIwxmNadwDXlDIUBGlRneFCtn6xOZ1Wkg6cHhuwL1t8B2/5O
         WR+UwieSHl+tkfzVHA80ybned2y6LCGqfYIf6/LY9IbnQd5co56zvi8fqigKRxm39O8W
         rrlWu71guHxv/LRUQcA2O946f8/XMQ9IXFvXBKI1PANBLikekfwyQd2kj6V3OY1ZD62/
         xqRT0/NOV6DLC7bEFZBWTwbB4n+qcKsKWB+S/yPNyOUMTO4blhdu3e9qZXEwlAAYo8Lk
         ESq5rVfVTZONMvX5is/WfmCns5dWf9LV5G5N6nLCXyBxpT47OaLTwThRyduJSUchWUov
         uoJg==
X-Forwarded-Encrypted: i=1; AJvYcCXAroW5kYloapl+s/Lz7GQrkb7yvbM8aqRH/V2SeZp+NcHqJcgfVBhteAwrA133bvObqO5ssZfn5KZVO5ZXm9L9DzLb/0vX3swWTaGUatAY
X-Gm-Message-State: AOJu0Yx5ErXWdMrQkJifnbVvjhoMa0pVA6imBgV7tntx85i8/XjbiAOe
	Nz603MMcomRfVtxzziX1hwhYuU21ZCAnQ0csc+2yqbk+jv4f06f8FxN+tKlfZpA=
X-Google-Smtp-Source: AGHT+IHd77R4Q6aO0Qn2A2tAcoDWubL4f4kxPAt+IpSkUcrrst/BIV5U2jMLCnwx7gBBaZIyiw7PjQ==
X-Received: by 2002:a05:6a00:4650:b0:70b:1134:95a8 with SMTP id d2e1a72fcca58-7105d7bbc06mr1573942b3a.23.1722483449233;
        Wed, 31 Jul 2024 20:37:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ae3asm10954457b3a.91.2024.07.31.20.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:37:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/2] riscv: Omit optimized string routines when using KASAN
Date: Wed, 31 Jul 2024 20:36:59 -0700
Message-ID: <20240801033725.28816-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240801033725.28816-1-samuel.holland@sifive.com>
References: <20240801033725.28816-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_203730_312034_825B31C4 
X-CRM114-Status: GOOD (  11.88  )
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

The optimized string routines are implemented in assembly, so they are
not instrumented for use with KASAN. Fall back to the C version of the
routines in order to improve KASAN coverage. This fixes the
kasan_strings() unit test.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/string.h | 2 ++
 arch/riscv/kernel/riscv_ksyms.c | 3 ---
 arch/riscv/lib/Makefile         | 2 ++
 arch/riscv/lib/strcmp.S         | 1 +
 arch/riscv/lib/strlen.S         | 1 +
 arch/riscv/lib/strncmp.S        | 1 +
 arch/riscv/purgatory/Makefile   | 2 ++
 7 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index a96b1fea24fe..5ba77f60bf0b 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -19,6 +19,7 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
 
+#if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
 extern asmlinkage int strcmp(const char *cs, const char *ct);
 
@@ -27,6 +28,7 @@ extern asmlinkage __kernel_size_t strlen(const char *);
 
 #define __HAVE_ARCH_STRNCMP
 extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
+#endif
 
 /* For those files which don't want to check by kasan. */
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index a72879b4249a..5ab1c7e1a6ed 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -12,9 +12,6 @@
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memmove);
-EXPORT_SYMBOL(strcmp);
-EXPORT_SYMBOL(strlen);
-EXPORT_SYMBOL(strncmp);
 EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(__memmove);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 2b369f51b0a5..8eec6b69a875 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,9 +3,11 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= strncmp.o
+endif
 lib-y			+= csum.o
 ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c43..542301a67a2f 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -120,3 +120,4 @@ strcmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
+EXPORT_SYMBOL(strcmp)
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 8ae3064e45ff..962983b73251 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -131,3 +131,4 @@ strlen_zbb:
 #endif
 SYM_FUNC_END(strlen)
 SYM_FUNC_ALIAS(__pi_strlen, strlen)
+EXPORT_SYMBOL(strlen)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621..0f359ea2f55b 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -136,3 +136,4 @@ strncmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strncmp)
+EXPORT_SYMBOL(strncmp)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index f11945ee2490..fb9c917c9b45 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 purgatory-y += strcmp.o strlen.o strncmp.o
+endif
 
 targets += $(purgatory-y)
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
