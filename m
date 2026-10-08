Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47827CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xh5Shdd3a7zsRAkJgATtnt44gQcOg3Jpg20AxNztKRo=; b=shHAY4fDFWe35h
	kJnElIbqYpG9muluRonMugSxCgwe+UH2EZ52aBCXXJl7Zc1Hi0Uxig0oEbIBc01Gnirg5eCi7jbY4
	cF/ZYmZTpm0ch6G5TSvF8KUrysQ8pbkTwLJEtin0YzNMDQwDVfxZ8RhNMLrcbB3SPkEhEy6k4LYqd
	5CQ3+uNBHpWVDKbcZpveBnQq+/fBUmV8eVBKFy+VheKKKSOtUjoIJXTDzThMMmAEE4znyUGhBBrVF
	GuJxnZU+pM4fC2Xhi5ijlVHiCMklvRRsbVPmLoJbbUQPmBN9cC8zIW1K6cH6e9SM+HRcqaUZlo3/8
	XOlb8uJlACwgy002Wxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaR-00000003kX5-0ObA;
	Thu, 08 Oct 2026 07:30:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaP-00000003kVY-0K88
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3a4d455ace3so2778835a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444640; x=1792049440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=;
        b=FPa1Tk6eYk7IEVM8JGTxcMq/s6rzFlarPbIqrcgKbufqHjkuN0Jk9Jo/W+QlIT2jJk
         /VSPfLBXPLVoJBMi7aoIktj3XHt2fjch1BdwVsdUJXgmSxlTR6aRzL3udbJFSJaHc/n4
         dmnn+Jn8l/pgfYoCm2EyuD+I/lAokuvSV43srQgmJtoBlBvxrq0YuPjAzS9yb21Dc3OQ
         qeB/vnaxkkiwasDxbB8TCbOgD2dQldbpYIM9BaCbF6ueAoNRdE5eQ0lTEw5encwSNdxr
         DY56EePmoWXJPuWWX+Zmtp5xCbj02W6sXKO1+FvRcyOIe+/TpevYz9HRarQ4qmEmMXZr
         5+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444640; x=1792049440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T793OI/j+CqX3HPTudoj2H2H2daFaSvH0eU6CPZ2Mo=;
        b=MjlS2zD+q7Ys76Zqn2/qeFJlIC89k+GyEyTiXVt29v/gCINBQD12tvI2zElNnKI/rN
         nJvbHFg+bmGpm/NlaynVOZOjEgX/RJKPEsj8YYBzaahtJtjsWmwwXdi2e2QTpOFm+2u+
         ZI2MMGwINmKiavV6fTzQ4RmY5RFEk0m0l5yUXrJ1WazauGItI355ZGm7H0YBneYgYr+7
         Cf/1a1JmBTrdxN4/HBVZpZdWlOgJGmPKcwTvnEbzd3RKuk/QzEI7oaIkPOMF83ZlWPs0
         CqaOYRCUyz4XfRK+eTbENc1FRGK3mWZAxI8Gbr0Nx+/jcAaglsVlQ7jO2lpr0SUx3gOO
         ZaFA==
X-Forwarded-Encrypted: i=1; AKwUvByQ98EehM6ERRJgPf3+FSRMEXD4xcMkGhP4ZhpHNLXu87ulS80/dueT/oEPWGTvirgKHi32/VeIkqMQhw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIdj74+fFWSkI7eCvBDwWTXOSitd2dl+LT7kv4louJnqrWXuHZW
	bwbnV/aRrWkYBeXTq2M7tv5auJq1bAgR2tVSXtkzpVyF3tVxyPciOtrSrJf8S8ESgsU=
X-Gm-Gg: AYBFou3fhW9P7KUn3uTJI2CneH7NaEIChrISQ92jh/UJkAnbn18Nd9HSveyCgFSJ32Z
	VCCSexB7YfnjzjV05FaW6tfp/e+juOeW3YX1l9g7CUW7kuL20mirE0Gfr0a5NE51hGMte+WgUgf
	BTnQ67bsPlyT+Hdt2JzqHn+OJrGa+hufAINT5NLVnFjcs/MC5F25B1JrsVWmjcg2iTDVT98a+AJ
	C+V2rflvgrlxT2OmRFVE0R8tDGtk5Rdrh0YAMeRlIfzlhk0SYvN/dpPCKUNSIYrxDAzKCzSD8Q7
	ieAIVEZ99HEIz3Say7IgiL/MTQym40AaNu4PfLDSXv6m1qg1sGavqG8hx1sc2OAaOha78oCd9DL
	/vdKKR44B+T3E4FB6qrOjtAUoI9vqpWaK1NbstVO7i66/lggbrok2s7hLYdLFOln4w6x6uifAku
	cQVV2DurFnbPiCnB65bVSl1kJaR1sJG1J5f4Q2kW9bAW8kTfbI6FMkwsHK7aQ+5vZkdGYkysuNe
	euTX9zCzRWD7+eeWkQ=
X-Received: by 2002:a17:90a:156:b0:3a8:a1e3:32a1 with SMTP id 98e67ed59e1d1-3a8a1e332e4mr2636515a91.45.1791444640094;
        Thu, 08 Oct 2026 00:30:40 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:39 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 1/4] x86/mm: fix missing pgtable destructor for vmemmap tables
Date: Thu,  8 Oct 2026 15:30:18 +0800
Message-ID: <20261008073021.2512665-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003041_130180_946013C4 
X-CRM114-Status: UNSURE (   9.93  )
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

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HugeTLB vmemmap optimization uses pte_alloc_one_kernel() when splitting
a PMD. Restoring the vmemmap backing pages does not collapse the PTE
table, so a later memory hot-remove eventually frees that table through
free_pagetable(). That path currently calls pagetable_free() directly
without decrementing NR_PAGETABLE.

Use PageTable() to identify constructor-backed tables and run the
matching destructor before freeing them. Keep reserved and
constructor-free tables on their existing paths. This also prepares
vmemmap teardown for generic runtime allocations through the normal
pgalloc helpers.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e682180291..a3ea627157ab 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1003,6 +1003,8 @@ static void __meminit free_pagetable(struct page *page)
 {
 	if (PageReserved(page))
 		free_reserved_page(page);
+	else if (PageTable(page))
+		pagetable_dtor_free(page_ptdesc(page));
 	else
 		pagetable_free(page_ptdesc(page));
 }
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
