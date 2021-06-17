Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15CEC2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6934E613F0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6934E613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRbETxvOGmj9KESP0z5tciR40jxyymM1aK5xod5c7oI=; b=lfJzmtKX79l6B1
	vvrrmIDqeulhpjz0UT5/iVNtSEcgl8+c1SaT7S78oh5hVDP6wwfQjdHGvYqlOI5VoOpSMYlGgHYcv
	31HVhdrBcJ2p3GqQQNbyWZ8r93rXM1UABN4hcSrlyLi/c/+TbJBXx8D0Rdmy4iqNiwO4pqogV4VE+
	FEeIqxFKP3LJvsaKo7SxwLMOfdLt8sB/1UTf8moze+JRkqKtyoU+e43a2pboA9ZNuzvRliASKO65R
	nfEnm9Fvq8+ZBT3RVjAm7Z56N3oy723TDXEdRJPx37mJC6qdg3eVt8ggn8ltswYAI0CTpE1s1Sgk1
	07BnC3pzoJ39v2F6dcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttwR-00AvMy-C3; Thu, 17 Jun 2021 15:28:27 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttwO-00AvLM-JG
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 15:28:26 +0000
Received: by mail-ed1-f50.google.com with SMTP id z12so4626868edc.1
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 08:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FVDwFs2xHOEhSpP+OaWvipHFOx9EExeCmOqxSerbcM=;
 b=bL6BgQuWt9r1dweXjn1XSdvU7VnOkfAFO+oKo498iKF7FwfOOeuGeU9hjfrjSp44Am
 HbtpmCyKR6PLEv2ADl3pRjT3QG4IHn2I4LWR5kSuTGL7Fo4FN1YhE6ASQT59YlZddnXM
 7eJHKu3aLNcw8fR4miMj4yr5kTIyMKs9UPYw2on8hJuFNOAKubAq22ktd8SKUV5vtZ1l
 r+HSpz/ZhoLm9fmI9WpTZiHSazXAyRGh0sAeRaWdwdTisv/hi3rCFEl2KMIeNdD0uCxr
 KeCmFtzY6lRuAYeNXc0dIxis5YXElvPdNi17QTdk46IYSuh8vMiUGf9OIho917+Njvvy
 CDFw==
X-Gm-Message-State: AOAM531bB9yTd3g6jqodhqw6sUCnr5NsgAQGeT+CZSx7IaEnM7tO8Od2
 4C9yiJB2Eq+WuUVFIm4f7eNXGyujzsKccA==
X-Google-Smtp-Source: ABdhPJy5ZWJ2v6Z/VT0vS6YYgk2KdhYYjP3mEp3SfxDkxhH7pfuRs4wHrcyf5WMFM03M2A6bq50hcg==
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr7287948edt.326.1623943702665; 
 Thu, 17 Jun 2021 08:28:22 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id g11sm4497850edz.12.2021.06.17.08.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:28:22 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 2/3] riscv: optimized memmove
Date: Thu, 17 Jun 2021 17:27:53 +0200
Message-Id: <20210617152754.17960-3-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617152754.17960-1-mcroce@linux.microsoft.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_082824_679291_E16C90D8 
X-CRM114-Status: GOOD (  16.78  )
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

From: Matteo Croce <mcroce@microsoft.com>

When the destination buffer is before the source one, or when the
buffers doesn't overlap, it's safe to use memcpy() instead, which is
optimized to use a bigger data size possible.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 arch/riscv/include/asm/string.h |  6 ++--
 arch/riscv/kernel/riscv_ksyms.c |  2 --
 arch/riscv/lib/Makefile         |  1 -
 arch/riscv/lib/memmove.S        | 64 ---------------------------------
 arch/riscv/lib/string.c         | 23 ++++++++++++
 5 files changed, 26 insertions(+), 70 deletions(-)
 delete mode 100644 arch/riscv/lib/memmove.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 6b5d6fc3eab4..25d9b9078569 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -17,11 +17,11 @@ extern asmlinkage void *__memset(void *, int, size_t);
 #define __HAVE_ARCH_MEMCPY
 extern void *memcpy(void *dest, const void *src, size_t count);
 extern void *__memcpy(void *dest, const void *src, size_t count);
+#define __HAVE_ARCH_MEMMOVE
+extern void *memmove(void *dest, const void *src, size_t count);
+extern void *__memmove(void *dest, const void *src, size_t count);
 #endif
 
-#define __HAVE_ARCH_MEMMOVE
-extern asmlinkage void *memmove(void *, const void *, size_t);
-extern asmlinkage void *__memmove(void *, const void *, size_t);
 /* For those files which don't want to check by kasan. */
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index 3f6d512a5b97..361565c4db7e 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -10,6 +10,4 @@
  * Assembly functions that may be used (directly or indirectly) by modules
  */
 EXPORT_SYMBOL(memset);
-EXPORT_SYMBOL(memmove);
 EXPORT_SYMBOL(__memset);
-EXPORT_SYMBOL(__memmove);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 2ffe85d4baee..484f5ff7b508 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 lib-y			+= delay.o
 lib-y			+= memset.o
-lib-y			+= memmove.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE) += string.o
diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
deleted file mode 100644
index 07d1d2152ba5..000000000000
--- a/arch/riscv/lib/memmove.S
+++ /dev/null
@@ -1,64 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#include <linux/linkage.h>
-#include <asm/asm.h>
-
-ENTRY(__memmove)
-WEAK(memmove)
-        move    t0, a0
-        move    t1, a1
-
-        beq     a0, a1, exit_memcpy
-        beqz    a2, exit_memcpy
-        srli    t2, a2, 0x2
-
-        slt     t3, a0, a1
-        beqz    t3, do_reverse
-
-        andi    a2, a2, 0x3
-        li      t4, 1
-        beqz    t2, byte_copy
-
-word_copy:
-        lw      t3, 0(a1)
-        addi    t2, t2, -1
-        addi    a1, a1, 4
-        sw      t3, 0(a0)
-        addi    a0, a0, 4
-        bnez    t2, word_copy
-        beqz    a2, exit_memcpy
-        j       byte_copy
-
-do_reverse:
-        add     a0, a0, a2
-        add     a1, a1, a2
-        andi    a2, a2, 0x3
-        li      t4, -1
-        beqz    t2, reverse_byte_copy
-
-reverse_word_copy:
-        addi    a1, a1, -4
-        addi    t2, t2, -1
-        lw      t3, 0(a1)
-        addi    a0, a0, -4
-        sw      t3, 0(a0)
-        bnez    t2, reverse_word_copy
-        beqz    a2, exit_memcpy
-
-reverse_byte_copy:
-        addi    a0, a0, -1
-        addi    a1, a1, -1
-
-byte_copy:
-        lb      t3, 0(a1)
-        addi    a2, a2, -1
-        sb      t3, 0(a0)
-        add     a1, a1, t4
-        add     a0, a0, t4
-        bnez    a2, byte_copy
-
-exit_memcpy:
-        move a0, t0
-        move a1, t1
-        ret
-END(__memmove)
diff --git a/arch/riscv/lib/string.c b/arch/riscv/lib/string.c
index e48a79a045d8..9c7009d43c39 100644
--- a/arch/riscv/lib/string.c
+++ b/arch/riscv/lib/string.c
@@ -89,3 +89,26 @@ EXPORT_SYMBOL(__memcpy);
 
 void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
 EXPORT_SYMBOL(memcpy);
+
+/*
+ * Simply check if the buffer overlaps an call memcpy() in case,
+ * otherwise do a simple one byte at time backward copy.
+ */
+void *__memmove(void *dest, const void *src, size_t count)
+{
+	if (dest < src || src + count <= dest)
+		return memcpy(dest, src, count);
+
+	if (dest > src) {
+		const char *s = src + count;
+		char *tmp = dest + count;
+
+		while (count--)
+			*--tmp = *--s;
+	}
+	return dest;
+}
+EXPORT_SYMBOL(__memmove);
+
+void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmove);
+EXPORT_SYMBOL(memmove);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
