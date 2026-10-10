Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C9FCA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+uZnqt29oC1qzNvfgd/Ipmu0T29yiuc7K0aYH5dePI=; b=2LrpPIsQXVaP5V
	7Nn0nJBbgOwBR69RaisipqJmUb1UPQ76tW6m1+mTM8KtCIoec04X4j/g4aVeCBy96SVCC+HmnaDM/
	d+nd0/yBdOo7a1TmH6BPxe51fh0+idOGdwP8/CBV8V0IAlAJUkRs2U/m62K9Bl4CeTcgBDKoYTRtq
	KuSoMVHZ0Sz3R2M676vByQ766mTagMVSslqRgGVLX4SHxKoa3p6AwqXLLPJObdfpp2RXJelIqZK81
	pQKtdfn11Jbu0OkGyL/ohD5ug5T3YXdCAxhsR+BmB631HprASfK9J/c9xAgjqIxb91g5utrlAfGOu
	p78YZw77NqTH209+Q2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDJ-00000007ued-2ENR;
	Sat, 10 Oct 2026 11:26:06 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDC-00000007ubx-0Ubf
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:03 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso230493a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 04:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631557; x=1792236357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=;
        b=VxDDxB8pM651IOE8XM2qxNstJYHUP0rytYEm+MAIBv5fWHvNBofp60pV9fndvA/8Rr
         jDFYeVe/nIsK/nuIDIplG+AvVjjDuYBaLaUglgRebGZan+rlOhacoLp6pE6mmXDmNLt+
         9pgzIEYZlZmieEo3roHejW9bDR4eAmYIJeksNB75DA+MJ4iI1JQP9QR9zui6s1et+RXQ
         VjoGy4qjii18jSTjMyveNdoGZyLJGRjV7CGCTlp2kRIaqVuoyZrrKAFQuT4y5t01nJ31
         nLhH6uxVb1a50Qcp6/Cs/VD5EoznchRLRF4tdGaUyG79MZjpKevbTznlfb0j4kmQaIbs
         kyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631557; x=1792236357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iE2QEQrwTXqpoYPa2dWn+Ity3YDDboIZyxHqWaOWsQs=;
        b=sOXimVoxfMdhyXcD9lH9oW7FL2PtsQM0J2BG3TZ1msIKUa97dSmPYku9mypZw2IAHW
         graJ4dG97QBhE0OKxoAiWxMhMQjw9oQBRgd8R6rK7DrbJoRd8U+SmlFAZrs4nv9XS3/a
         IA/e2ave+rvkz8h4liydFX1FBCG7Lsb7ox+TKlkvW9EWf3VuoInyuINJVc4daIEPommt
         4M3lCd4ok9OGrtLBnL3wZi7t6O8oHyAbX5HXz/czf3hRDZFjXht54kA2T8Xy1Sd2LeKp
         wbJmGEfu9N9IEG+yR5IvsiS8EQ/QOMsOr9fX5GQIK6A3G0rodn0dkHUR9fFAnDip6lWZ
         3alw==
X-Forwarded-Encrypted: i=1; AKwUvBzOaUXquuisKmqwGSMRWYsAuDT57tFc15fg5ZnTp6pBb5eThONK1jk2oKSnF1GJRLcGVjskaV96KbAa1Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYJUyT2ng0Go1i1gLS1uqxfaMcC/WMkTPGI00j+7dEL2CImKMdHa
	43zUyu3fRUfF3UpaihTb+lpoYVJ+JJocv8o8PVffa3GjV+lFwftP2B7tCjKSpx4xiWQ=
X-Gm-Gg: AYBFou0OvnOHsa5/wGpLQHHoy5p3YrIohMrVuht7dODf/fCxTOQI+S1VDDnN8TWG/o4
	ke+WYoi+d6TJDRajopqUzeVAx/QP4P2I1GFcwGV03u9kkKDgebgkQNi1NDU50lxut/0Uw37I3SH
	p+VJjwkNxmQPbf3FltaA6z5CKT56Xmf1VlX3tmd04pvnEXEDgisvqW3XFg8scqAaaMndEdEFbgp
	Tsww89Jv6QmPDzz9xWSHjwzEuhp3ZawXpP7X19BuDYp2pjpvi1CU6wBY3XH+HOoHN4ZzFhMd/cV
	1zUleQZydqR5HMSn8JpokLKYREl5+1/g+DhUkkwqOE4OZSKhm54Ix660NaL4Te7Xw1okmV2m3X+
	mMXPft4BJkYbSplZJvmFNWspZBUBo2lsheweOH/obq0wm9idtLOgn+xqS2RfNG7ONZ9Z6fDAtCA
	Bf+3clojo9fjlkqdk1SLYm7NSQ0I2zLw+MKRONG9KsnEFI20J4BG7j93vtxTosnEhBOQ5t9zx8A
	z1oGF9y24n2DVWEaIcOpcleNSMyvy17jA4rUvdFwvFOUsSw
X-Received: by 2002:a17:90b:2d06:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ab3a32d491mr3593827a91.9.1791631557025;
        Sat, 10 Oct 2026 04:25:57 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:25:56 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 1/4] mm: fix missing page-table destructor in pagetable_free()
Date: Sat, 10 Oct 2026 19:24:54 +0800
Message-ID: <20261010112457.49485-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042602_381720_F2F22249 
X-CRM114-Status: GOOD (  15.01  )
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

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
splitting a PMD. Restoring the vmemmap backing pages does not collapse
the PTE table, so a later memory hot-remove eventually frees it through
pagetable_free() on x86-64. That releases the page without running the
matching destructor and leaves NR_PAGETABLE elevated.

Make pagetable_free() detect constructor-backed pages and run the
destructor before releasing their memory to fix the problem.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Move destructor handling from x86 into pagetable_free() (suggested by
  David Hildenbrand)
- Trim and update the commit message (requested by Dave Hansen)
---
 include/linux/mm.h | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5cca90fc1df6..771a7d60b0a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
 	__pagetable_free(pt);
 }
 #endif
-/**
- * pagetable_free - Free pagetables
- * @pt:	The page table descriptor
- *
- * pagetable_free frees the memory of all page tables described by a page
- * table descriptor and the memory for the descriptor itself.
- */
-static inline void pagetable_free(struct ptdesc *pt)
-{
-	if (ptdesc_test_kernel(pt)) {
-		ptdesc_clear_kernel(pt);
-		pagetable_free_kernel(pt);
-	} else {
-		__pagetable_free(pt);
-	}
-}
-
 #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+/**
+ * pagetable_free - Free pagetables
+ * @pt:	The page table descriptor
+ *
+ * pagetable_free frees the memory of all page tables described by a page
+ * table descriptor and the memory for the descriptor itself.
+ */
+static inline void pagetable_free(struct ptdesc *pt)
+{
+	if (PageTable(ptdesc_page(pt)))
+		pagetable_dtor(pt);
+
+	if (ptdesc_test_kernel(pt)) {
+		ptdesc_clear_kernel(pt);
+		pagetable_free_kernel(pt);
+	} else {
+		__pagetable_free(pt);
+	}
+}
+
 static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
