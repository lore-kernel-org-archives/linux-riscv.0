Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79470C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hv2uyf6nXONlbolrT8gJUCq4WSIwXD8fHNgfQvgQPqs=; b=N4aZ+BZ766vSJ7
	K6lmgOpBKujo1krzQu7JnkGpvjESTw12LmcJKbNRUYD4RRb9vzM+2xEYV8CnYnKLGs2N57A5KzOYc
	zevlJtWuQ9sTWMYDDkKBqis7fxV7lvk74gmcotjmIxc+/hqnl43JaH1ImzJV+FZ81DGcu5Z+7QIRV
	oz7LWNLtM6YQYHz/DD2SWng4Tl588IUZ1biAkyCCMzDdKVzLx+LRT6Oi9inlJaf3Eo0GpFTQuCptF
	K2bcY8FhYF/PKz4//QYwaaSZrggDT1irrrokv6F7eAYkInM9D8NDn5wVYLfs4CObEdBPyCuw/6uvF
	/NQYQMWZeJi7HF3YPapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWP8-00Gobg-33;
	Mon, 31 Jul 2023 17:09:58 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWK1-00GkrA-2J;
	Mon, 31 Jul 2023 17:04:44 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d1d398ec0ebso4881101276.1;
        Mon, 31 Jul 2023 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823080; x=1691427880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=fypnJ8EOp6389G/yrEsdiBw8+ODFJB18UGVsK1WnMmuuyVJGZEMRFzagFIz/t/iUP/
         2hQUC88xrJTr5zC02f819WJdC4SisRLoHgth8vaUsDxgglJhi6MHYK2vk4aVYQFhtjHu
         EJ82jl2MiLVTmBE59Pwb2ZF5o5qt31wsfoof30f3jCxfq5PoYDaunPmGz2hyM4ah/4KD
         ydzqEb1pNZ1YIAh6SsOFxKI8oa6yw/2SpcLuoX5OxyBAJ0szyfenY4ClRYrgeaYLOg5P
         lgJjKay9Zm3G6SxJT2EV+hC0IYmKARvYedORBaKi0opdpa/X1F5LwQzjJG/maSgO9ToG
         3U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823080; x=1691427880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=SdIO5ZFiQdOhglBPeDmZf5fzZvtvskktDktUOK+/jugGq+MhcCWfoixLu3LJo+kKYe
         cdnWOyAdnlQqgN0kbKYjDTDvsLr+DN6ucDuCkgJngFBSFWZj6Mpx/Khal6CesOGvDmZF
         dRx8OHK1ovvvaWaSaMeq2XRTK2a1Rm9rYNtJRAsKfRYMhxHzWxQPd9nQqt28h7oRMmiB
         q6EnLdR3FdTLGieqwd3cfUymQ2egcvcI27O15rVhsipDtpgWTnSU8ZFLCvXOL27itmiz
         DxvebaOHfNWGVFhilWwm14cpsf3cuDTUepZLQ1GEaMIFvcwlPz0lno+WgToGfg9023V9
         XcLA==
X-Gm-Message-State: ABy/qLYLPDqXBxg6fSqbnrM+lrBGfA1OQESYkW+HVWaKZAnEFlvzc+92
	h3Af2GcT0CEq60sseNK3Myc=
X-Google-Smtp-Source: APBJJlEdwhqcmTMrEtHQGs0fafmxeVWw9ywX+xXLwsxfbs/EAm9tmHsbV10DQDaT24PRZb9zbh9R9w==
X-Received: by 2002:a25:aca8:0:b0:d0b:2ff2:ff8 with SMTP id x40-20020a25aca8000000b00d0b2ff20ff8mr11589261ybi.21.1690823079964;
        Mon, 31 Jul 2023 10:04:39 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:39 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:31 -0700
Message-Id: <20230731170332.69404-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_100441_788849_E7EF0217 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
