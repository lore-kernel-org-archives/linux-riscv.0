Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F36C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 22:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYqZ16sWLCxXfO5dEzKEYRdGCazS1Q8c5hQQEpLFhjY=; b=heU8ZZ0wtLZjCQ
	5cv7EhQug5693/VgnQ483N88+82o3Cv/ph7tJkEARCIh+tewEx/KW3RSRCYkpLKjqPr3QT/Jzb4g0
	7bz2/IjCqxifSZcSCSE/YwIzcw2oPD/irjtwjM7DgCfCo7nSCFz4l8qrNEXFH7OSuGy8OyD4W+Iu5
	ryKzRtOT5E3BpEaGkLpnwSybI5BIozpOOqm41sp3f4sLpx1J39RqNhQmCDTSxbrtHVR7u+EussqUm
	2NmiPpvzMuazwTEXMfCpcJsaGJgi2HjCoa2dEwvP0W3SapnkKejS2wMDp5eEZhplh3ctJSDZ1v9aX
	Fds82HTi84NO3NYNEa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UWm-001M4M-1M;
	Wed, 31 May 2023 22:42:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UWa-001LwD-13;
	Wed, 31 May 2023 22:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=; b=ZIvW2O9i45AWGcnKkGXtJxXcOu
	C4+g85k2y+eyuLRItK6UrNbHc1Gt5i2C8CsYjA52jEzNZuU5g1lTyjGWW7fmalamA+TgQMoiZyKxj
	ZamVZBmuhV00eizsPwpZviDQY0N3tkItosDjvatkjwSHMrYmpkNbrPZvmzib9Zqo67JPWR1vF4Hsg
	efn2W/uHE7eB5Zf75429pmQaAr0xAMLwbE4X8JjwHJzdTU51jlKo9LktiWrfQq9XmW4QQPVdBtMq5
	zK+jpmd+hSYaKPvokUJ7XIesIkjrfvtdwWMLZzyOiiyL/DkzoKaajN2Qhg2wtfRpvSc2ltajdTqCp
	tMEW1oDg==;
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4TPm-00FdKH-1Q;
	Wed, 31 May 2023 21:31:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565eaf83853so692477b3.3;
        Wed, 31 May 2023 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568681; x=1688160681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=;
        b=I4ZK3ufVe7mv71vTYogtgymswU5NJnWubvNrBVwVZ1xQ0v/p7EI5y5eDyiHJRrHKpG
         azRQJKWH7AViYgdCK9GdEYZ8omA3oIlbOzs852fLZAEvIF+ozvEvZkK1/lCOTaAOLLWg
         oij0mtTKcWvOTyQV92r6jSH492LqXNF3KyTROTbV0zOPwz64hVwHxQg5gRw6g2twpMr+
         Syr51H68T+2e3gvOiE/6C7bywaJcNLAGV+Y3hFA7u25fKQ4NEmZwbyYlQc7gCZ6R/kVr
         pYNZAd+SPL7/3au6VqcXubefeyJmThujQisY5D7sD9GWsMGa+7uty95WSWwZ8guF3AKi
         4svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568681; x=1688160681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=;
        b=JvzEnMzgA5B8D/jMJ9CF4TcS6ykJNvbI7wMnt2hU2j0vZdlIaWnz3RsQpSLDOmFLzW
         +ukmqc16qgJGK/NSPQE6wmzdGLFtlUkHUFHtbo/6rFmKJBY2cPNJE6Wel2YLmK/Ta13c
         09XnSffV5atoK7FMUAtouR77hvvl9w1k9YZ0nyH0vExcZH/sS8DAHyrJtln0MZ221Deq
         W5JB+xQ7vwrPEBkdCXM3JFz7DIrEIWnLJZ3AgvLtsdptyHghS5aCb+nYw0XnUg5BWWOf
         E5TjyICzfKiO/bF5K6kmtnj9CS1vmL3QhKcoYN7/JnC9cl4QewXDCyRzd/J2vqXOu39F
         z1BA==
X-Gm-Message-State: AC+VfDz8ZUHKVTsrh77EBmPmBabHQmWPN6jWACH5o5ODEKrYLib7pnLU
	68cvMa7ojQdVcg4/3tEqtO8=
X-Google-Smtp-Source: ACHHUZ4MgiQhTnDT0ikSenPgoz+0X6zm2wOF95JZP/LWMfbyCLY8nB5YKCMBE1n0Fb7UhukNcNCVlw==
X-Received: by 2002:a0d:f5c6:0:b0:561:1c14:b8df with SMTP id e189-20020a0df5c6000000b005611c14b8dfmr6643798ywf.47.1685568681477;
        Wed, 31 May 2023 14:31:21 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:21 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v3 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Wed, 31 May 2023 14:30:04 -0700
Message-Id: <20230531213032.25338-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_223133_116346_12CE3FBD 
X-CRM114-Status: GOOD (  10.02  )
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

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 620537e2f94f..3a9c40e90dd7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2912,15 +2912,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2939,7 +2939,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
