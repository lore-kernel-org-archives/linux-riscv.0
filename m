Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3036C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7D76108F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 14:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC7D76108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ikr6+O8VsBzX6yhpC8qUexcjSMq0Rx0cwHWnLVWky5s=; b=TEmzv68ZDhC9bj
	Uoc36HZpZlapmn/OfJFA738sZblpeQi+4zTh3fOYKhBgRn6AuiCDT5x8EX7ZitSgz/JWINRdqFun5
	s8jHu9K8uiO4MDuReXDEWsTII08jzgBWdRQCL5syM/M2mMxK1iKfLyXAwky7gQzcb5PnYR2ZdxwHL
	qG+iUlzQRlIgL4Ag3ksXfwEAm96VixVpRaQgwT70wpv6Ybk/0zy1siwmAmdXJzOpirBK/+STxeRhG
	f/PPXkGOUmwrY1uT4B/RIY6BilpxzBnYxzaKEVauUWrZVUBZ/TELpqmqIsZOmH1M/kIyIbrovdp9x
	4bbQO75oeXJh+LS1ak1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVayr-00BPlT-Pf; Wed, 29 Sep 2021 14:54:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVayl-00BPiq-Ht
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 14:54:41 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4511B401A9
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632927278;
 bh=KeLkiElzlzQvNNsdjcFFS61hMwkuiVlVaM0dpBDB2C8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=AA67gU2cxJXMMRaO8pbCndiNI7QUFQFjL0S63L4aKUJSdbJGDqDGhSQp6QS9y92yS
 dnGtXy+gfpE2uAhU4RrbM9qiHGTTEPw6c8aQusgiXWR+bL5SQjBzw4r/QPBqhLK6Az
 UBXfb+T8ZYUbMz8zjg6+a4uRuw3xU2VV7x5W5UQWAYQpPofvJxPOLY7QKesV/tmdxU
 5bvZnRoey63Rm7gmjDY+iwKbW0Gm6yEMDc26v/Eze4F0cfS/gK3P5y80IyLLCQUhaI
 FqUyPBLsLNEhTgIeB5V0VOo6UFWfwpTdfczoCpn2KXvBxwIWSQfQH1rojNAZtH5/QV
 PzzYCnAU8n79Q==
Received: by mail-wm1-f69.google.com with SMTP id
 z194-20020a1c7ecb000000b0030b7ccea080so2813683wmc.8
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 07:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeLkiElzlzQvNNsdjcFFS61hMwkuiVlVaM0dpBDB2C8=;
 b=DtCoSb8AeJ1Mh2IV548a1VFu2o8gHofHRyPS9Hj3PDvhM5klvNnfbZpBqCdkm6rPkE
 yh1TpTiis8BtoznWfKRRtC+Alpxq20Z/RIWn+ngFubbR2bdW1POMF+O0EsFCyXU3SP3T
 E+fvULR0QmVjdz4p6TGUy2Gpn++z4Xlk+f2D4M1K73p/E4X1dVaAjkL4gstWQNL+aoui
 ADxbJSc+W3GPN7eZrvX96jDqPP/HrnXCqZCNQoMl92rOHoEsaMijpC1HVkwJyNVRrv6c
 Mm1DePMWOC/5j9tgADE70wyk+uPJS582rtWpr38yflGToICspbJ/lkY3qRhEc8+cqvTw
 f1qw==
X-Gm-Message-State: AOAM532HMWzPm28alQpWCCmMy9+axNaKyvjxDZLzEuiHEVYNZh3Rld3G
 1GC2zu8K2QYpYn7wFLAh6xivYEkqNbzH+v/pelO0j+UkAhXTIBqTDsuMYTu0ZPEP12QeME0lGYy
 sHgKA2ZOfjUYmEpJgwCAKSXiSPu1/tsJJYunqfdpNJaYk5w==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr293230wri.113.1632927277894; 
 Wed, 29 Sep 2021 07:54:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznSOSKp7IsVxoGkS1FzlBdLKaSOLFFxwn3CJ2ynXMOJFl6ygDinvXG42wU0gmBr6aiM6e8Lg==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr293200wri.113.1632927277749; 
 Wed, 29 Sep 2021 07:54:37 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id e8sm127119wrr.42.2021.09.29.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:54:37 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 03/10] asm-generic: Prepare for riscv use of pud_alloc_one
 and pud_free
Date: Wed, 29 Sep 2021 16:51:06 +0200
Message-Id: <20210929145113.1935778-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075439_776617_985BB077 
X-CRM114-Status: GOOD (  15.04  )
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

In the following commits, riscv will almost use the generic versions of
pud_alloc_one and pud_free but an additional check is required since those
functions are only relevant when using at least a 4-level page table, which
will be determined at runtime on riscv.

So move the content of those functions into other functions that riscv
can use without duplicating code.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 include/asm-generic/pgalloc.h | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 02932efad3ab..977bea16cf1b 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -147,6 +147,15 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
+static inline pud_t *__pud_alloc_one(struct mm_struct *mm, unsigned long addr)
+{
+	gfp_t gfp = GFP_PGTABLE_USER;
+
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (pud_t *)get_zeroed_page(gfp);
+}
+
 #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
 /**
  * pud_alloc_one - allocate a page for PUD-level page table
@@ -159,20 +168,23 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
  */
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	gfp_t gfp = GFP_PGTABLE_USER;
-
-	if (mm == &init_mm)
-		gfp = GFP_PGTABLE_KERNEL;
-	return (pud_t *)get_zeroed_page(gfp);
+	return __pud_alloc_one(mm, addr);
 }
 #endif
 
-static inline void pud_free(struct mm_struct *mm, pud_t *pud)
+static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
 	free_page((unsigned long)pud);
 }
 
+#ifndef __HAVE_ARCH_PUD_FREE
+static inline void pud_free(struct mm_struct *mm, pud_t *pud)
+{
+	__pud_free(mm, pud);
+}
+#endif
+
 #endif /* CONFIG_PGTABLE_LEVELS > 3 */
 
 #ifndef __HAVE_ARCH_PGD_FREE
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
