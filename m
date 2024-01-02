Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0C7C4707B
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ls1C07FBg1CnEUPS6mO2x68gE/7aWV9l3ZK/jEhzHb0=; b=GfdqBmNFDt4TFD
	tqMuK8tQyUj0GVpsxQLV9DrP11NH6/rDhVVLdyoWDbwq0FTYNyf2o6KTADRz36ARhTDDp1wmTg8mE
	NgWsx4xttzozM84ddsJ7bfzOGTzLYY87JA8NbgbqcHVAfDeEIKw2WOCNj405D3F9q7yW0fmpDOfhv
	s2z+bkxEX5jRLUL+SW/MZuplRCmkBJyoiBK7U4rSHKVBvMplqXRKeWOY0V+x1h1qGu0EF1OojvjSn
	DQ6hFZBK8JY7/ECnub7Y3qWzoER3OAtJPLPaKQvVpEN9NlYAYVOl0vZmoWFL/nAyG2GfcK9DenZM5
	6bvglRYh12P6pYNK71iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpY-0098U3-1N;
	Tue, 02 Jan 2024 22:01:48 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpS-0098Pe-2t
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:45 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso2158168a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232902; x=1704837702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtzHkWRF5gALofCSRDnlYgSzHUyaPaF++esfIcBOkBw=;
        b=MUJN1kVp6oplOOOxzV1x/ark5BdO8ph7rr8loGkhWyNJGCo0mdsCA8qsXvwEtCEaoL
         WEzX/AJGIAOiebdPpZeW1OdTfr7xjCYfZ/GdTUGkzSj9YtobvCA0jd0x2GGLDidVSpSK
         muAwrOVxk9vHeH3un53O/4Rl1MmZ0o63VnflE18nVB/m4fYjd6DW6M2Dow3B6t2qPIpr
         aWruJaJ0nslum0OXb6ydqlPorbjoWBZkWsf2TlBHkxzUYBA5iqaow2JZDaON3eIUYiql
         UmFO8FfSyRDXcYpbrVahsGGZ4azOaRzwbiucdxDcu2OvzQ0YijA66GEGdSPlmiAoQ7jh
         9v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232902; x=1704837702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtzHkWRF5gALofCSRDnlYgSzHUyaPaF++esfIcBOkBw=;
        b=YZEz1BnyWzvIYVfcQPgIMFq1yNSMbhBOxGhdfBoepOirgY4D6/okVwpq5QrhKDZ+SI
         yTMbvSzhRWkil6oygjcEuR2w9FTOCr+N+d/2jQDSErowtS14b4CqTYzJCwuuVePUVqKu
         K9ktiVu0p+/K/8OhrxCPwE/DD5gcCLk/T8BlBB4awZBrFJBiZNoKlpIS2EpP9Gn8WKHz
         Vcy4bb2dPw8wEzvd5FWRd9YEBCw1Px7ZR9e0E20T+IBdQ1R0ecuxwhSwXJOoIQjoufgz
         Q51C9C9SqDxw9K/9BhKzKacfFuQVnZHnGPna9z5yzRS4a2VJowo+DVCWiYVOgUQddjGC
         xgHg==
X-Gm-Message-State: AOJu0YwSl/UR2Dix8QAV+RI/0FNkH4gES3WLG0t43VHx3JXpf0sKdcA9
	k6imqA7pilPlkVm2U/f0QrJ8TzJKhOIDAQ==
X-Google-Smtp-Source: AGHT+IExkJSZEsbRdHGUNd8kiI0pICSa1vMynIFUPWzzc2fqMiijvWM2jfH6XllBTjKhdLtvimrjxg==
X-Received: by 2002:a17:90a:740a:b0:286:7f0d:6254 with SMTP id a10-20020a17090a740a00b002867f0d6254mr6006468pjg.63.1704232902374;
        Tue, 02 Jan 2024 14:01:42 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:42 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 05/12] riscv: mm: Combine the SMP and UP TLB flush code
Date: Tue,  2 Jan 2024 14:00:42 -0800
Message-ID: <20240102220134.3229156-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140142_967178_7D61F304 
X-CRM114-Status: GOOD (  12.93  )
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

In SMP configurations, all TLB flushing narrower than flush_tlb_all()
goes through __flush_tlb_range(). Do the same in UP configurations.

This allows UP configurations to take advantage of recent improvements
to the code in tlbflush.c, such as support for huge pages and flushing
multiple-page ranges.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - Merge the two copies of __flush_tlb_range() and rely on the compiler
   to optimize out the broadcast path (both clang and gcc do this)
 - Merge the two copies of flush_tlb_all() and rely on constant folding

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

 arch/riscv/include/asm/tlbflush.h | 29 +++--------------------------
 arch/riscv/mm/Makefile            |  5 +----
 2 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..7712ffe2f6c4 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -27,12 +27,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
-#else /* CONFIG_MMU */
-#define local_flush_tlb_all()			do { } while (0)
-#define local_flush_tlb_page(addr)		do { } while (0)
-#endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
@@ -46,26 +41,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
-#else /* CONFIG_SMP && CONFIG_MMU */
-
-#define flush_tlb_all() local_flush_tlb_all()
-#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
-
-static inline void flush_tlb_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-/* Flush a range of kernel pages */
-static inline void flush_tlb_kernel_range(unsigned long start,
-	unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-#define flush_tlb_mm(mm) flush_tlb_all()
-#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
+#else /* CONFIG_MMU */
+#define local_flush_tlb_all()			do { } while (0)
+#endif /* CONFIG_MMU */
 
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 3a4dfc8babcf..96e65c571ce8 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,15 +13,12 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
 obj-y += pmem.o
 
-ifeq ($(CONFIG_MMU),y)
-obj-$(CONFIG_SMP) += tlbflush.o
-endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_KASAN)   += kasan_init.o
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
