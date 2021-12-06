Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0613C43219
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrkboLfVg1QDYRUIdsXjowwABDk32ydnz8sOIC90tsc=; b=GydmItcLdnLGtO
	/RZd7AC8MKWPXCBEdUgbMlQn3ABo2cFxJNfJFzeTebhxL8ss+a/j3i9PJsH08fnvkfn/QyL/+VvDI
	zg5DDfhnJi/IQ0C5Qs9jUVdPY2ujU1h/otNdEjkX8WYBKf7gfYM6gfEHDJLDb0vADbsSzi/Th1gkr
	DL9ST5WzMyiL7YlC/ekn/QJTIzmVS571/fktUpAC0ztQSEWpk9U0/FS+DcqePWIiFhiQaoh/3qxQF
	qLNMgO+cwDueJbgzWbYYlehlD3GmExrSm0Uk6/t6wSvd0GxwIOKd8NTKYthEuECEMd/n3hlBGKjhg
	huralZNZnKAXmbrrU5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBcf-003RIg-2W; Mon, 06 Dec 2021 10:53:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBcb-003RGA-Oj
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:53:27 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 78FEF3F1F8
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788004;
 bh=gG/WhBjtCMK9Juy/cpLoUS+Fz+e97sYPeCnLmIYCPu8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=asObokCf90fsDpuNacvxsmD3GYtI4o5fXM55ZEVyMDeuG/xOqyVthKEWW5zjckipm
 VYJDqA6wvXGUzJK+dGgGIbTOpaDdAvokMp/6BKUi/k9ZvIxgYVUoH4x+LdADG6RGRy
 H2+irsG6iFi/NBB6pEKrq7Yw3JO5GplVLMOL9Zs9z28LYSCyB9epzyYnfTQ07KFzWP
 KyIN6Av+rZJvXhSFao8PAKM3HLOz2mPGXvBjh+rMOzemWfrK91e71SKu7ZgpI/oHjB
 0OhFb2QvayQi8vbsGoUCh+7MTOW4et3CGzKEqmKWMpmZkoZpg91c2szktNZoDv87IY
 edHfF20/x6rKA==
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so7677021wmc.7
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gG/WhBjtCMK9Juy/cpLoUS+Fz+e97sYPeCnLmIYCPu8=;
 b=EoWOfaXLLJdPcBE0mFiJP4O3vlPKoW1NQ9N80ZIzmFh5Tavnp9D2c8yYZ8H2WC9uLc
 UFZF4gSHKXQqP0IjgsxXYI9Ki91eveusb30S6fB3SEwSAasEAikmFmDODfylzAW2s5OA
 9L1qw8lfHYMEehzWuYaZT1huGmLThI32hxmPILAT2StL+kKoH+jDWVKU+zJVCjPHseTm
 jvSIqD10yKYRsuVOSoacP4h59N6HI9RN9YtcGmkY5E1DPtYqIoZwj/UqQLwlHFyggDOB
 o319RL16Y4mbvfqJiHOG3qP66RG3yZBvpT4R/9Kou9Hs5q1FiYlnGvX3TGXm6H5XCMFH
 D4OA==
X-Gm-Message-State: AOAM531nXKywLdK/AIXU8ep1MvJ10MHnz2pA5J9yXJmNmQCffn0Cha3s
 PRi9f1PLPMhcFexejKK9HvbiwvTZ4DXwqOTzgNCxzf5MGG3rnVYjbBI9YOyiOI/U1URyblKKFUj
 XXXnYs6XE/w1jUHfvsbDFlnitJyJrpCgLNQ1YLUGmjXLpIA==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr37750673wmi.151.1638788003996; 
 Mon, 06 Dec 2021 02:53:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxopdWj9u1iMI/f8aQI95EBYjbHFU9+o6qbVXkckCCLscAAHiW0VAZVryb3dDIQkey6IRVgJg==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr37750632wmi.151.1638788003798; 
 Mon, 06 Dec 2021 02:53:23 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id p5sm11021231wrd.13.2021.12.06.02.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:53:23 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 06/13] asm-generic: Prepare for riscv use of pud_alloc_one
 and pud_free
Date: Mon,  6 Dec 2021 11:46:50 +0100
Message-Id: <20211206104657.433304-7-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025325_990087_187DE724 
X-CRM114-Status: GOOD (  14.54  )
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
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
