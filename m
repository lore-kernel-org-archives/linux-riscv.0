Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1509BC3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 02:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mTjSzd2VuOEjcOyo/RCcRWd4bW5ThyiyJbcTBBVuikA=; b=X1pZPe/k792DiB
	IT7jDWYe1BLxMM7DgyYAneFjXoDctUphwlMHjxsBmjZkJLlZqqcONaI5I4TuOPX3XXPqOvUlIpSF/
	0UyGJ0qBJuWAbKeiNYLwq3jGjBI6GcBm4ZVwxib6Q/XH9SEWWx3U5ixceaA+h6Gh8DR7Ss+6OmJL1
	CYVe6D5ZafoDjlEWbDR4yG8sKLWkSuNLvcrJbvut9CTqU4u75syrpIz6sKfFLaIHKMtqcqbox00YY
	yz52IXJ2rDMPtPaZh0oFrBGMNkv0YTfhpF825gd9CPz/guGUb7XH4bwL5KyJIiBBxyzrMdIdIEuSe
	Tzr07TvApzXwyjSU4GyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW56l-0000000B7jQ-4C5B;
	Tue, 23 Jul 2024 02:18:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW56j-0000000B7ij-2lqJ
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 02:18:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fd9e70b592so2195165ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 19:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721701109; x=1722305909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCOgQc9KD2XGZH574ODgjuwFya0AxvNADd4TgDpsqGY=;
        b=AtOv+V83Sh8zOQ5WYMgbJKp0fjNSLDtEJuh0XbA4LQtEt32vF6MOgJkRNgScp1I5Bt
         J0zKwkQDubtJt2Vp8tDKpEna5SEtQhtZ3PxEdRdcWzDKFIp7ZuIwGxKfCEXN7N19Cbow
         SftLCJdC6lZzMWEjuM5yxoytjnIu8FnH1wgvBdCTZijpGZ48VmszhV9Yt9XVjJgXJgxm
         7rqrEZ7oIxT0M4JFOq71thsLx0mgyQc9hebGSjAf/H/HdgLOT0BT/8k/7TRKR2HflQNj
         aT2hVcCtDSwuHazOMJtSFHZHWea1TMHkQFBUt+4IeqzKi/uJsWHdsExQXafto2XCf62/
         Xeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721701109; x=1722305909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCOgQc9KD2XGZH574ODgjuwFya0AxvNADd4TgDpsqGY=;
        b=F+4uHK9CqjylXTdLRHdPAQmJ9ZgDwSPV78BNF3vbb8ZjyVLuPzu+uxpsgVj9vW/SRu
         Ar3Jvj0DuXRoSVIIjxHtxJh2J6TzzXIHWNgScWKBcxjirlc8Cvto0iCOnVJ7pMcCMhLK
         Fqd+lKgsOzjUcextW6s0hckyXNB93pGZxKwM9Tz3MkJaGHDSMkg5nfLywiX3Uc8yuxZu
         a5KKKXvKBr4tzankBkwgWMwxEzb7wZaT37Rgamtv2kIRPxf2IvSHcH3b1xMsEJByYxj9
         7udoaCRx2J8OmY0OAVfi1AEG1GAFQFgiAFaxJIIrRjdcFZqsP9cFvkJkhUVjML2BQv0v
         bxNg==
X-Forwarded-Encrypted: i=1; AJvYcCX9MkhbRzfsHPYxmiL8jCWPH9+HeelLre3z4MzLXlPSeGowdczRSaHnNfaGqj6Py29hi+BB7WHNwoyA31Hv4QmiOMPXLZprNJMghfER8P99
X-Gm-Message-State: AOJu0YxNTojIZsuPTLj4ZNYqtqxJN/Ebad0/GY6WLD7W8LwkkwS/HcDs
	VP8Itz7LyRl6D4JBWRgcwW3uBTs0h1BMXf0ZkBk1Vv2rKs34tAz3/EnmEEvGong=
X-Google-Smtp-Source: AGHT+IHLVAW18zN+0gBUE02az2jmDMGy7YkWcLa5yHJa8UE1dySgQEyZHI7Dqpt3Zk8tPEcJDeKN4g==
X-Received: by 2002:a17:902:e885:b0:1fb:8e25:e631 with SMTP id d9443c01a7336-1fd74520f53mr68006945ad.8.1721701108701;
        Mon, 22 Jul 2024 19:18:28 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31a2d8sm62496825ad.121.2024.07.22.19.18.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 19:18:28 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	surenb@google.com,
	peterx@redhat.com,
	alexghiti@rivosinc.com,
	willy@infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3] riscv/mm/fault: add show_pte() before die()
Date: Tue, 23 Jul 2024 10:18:20 +0800
Message-Id: <20240723021820.87718-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_191829_720752_63C90FB6 
X-CRM114-Status: UNSURE (   9.44  )
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

When the kernel displays "Unable to handle kernel paging request at
virtual address", we would like to confirm the status of the virtual
address in the page table. So add show_pte() before die().

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/mm/fault.c | 52 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 5224f3733802..c72e6c7c09ef 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -22,6 +22,57 @@
 
 #include "../kernel/head.h"
 
+static void show_pte(unsigned long addr)
+{
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+	pte_t *ptep, pte;
+	struct mm_struct *mm = current->mm;
+
+	if (!mm)
+		mm = &init_mm;
+
+	pr_alert("Current %s pgtable: %luK pagesize, %d-bit VAs, pgdp=0x%016llx\n",
+		 current->comm, PAGE_SIZE / SZ_1K, VA_BITS,
+		 mm == &init_mm ? (u64)__pa_symbol(mm->pgd) : virt_to_phys(mm->pgd));
+
+	pgdp = pgd_offset(mm, addr);
+	pgd = pgdp_get(pgdp);
+	pr_alert("[%016lx] pgd=%016lx", addr, pgd_val(pgd));
+	if (pgd_none(pgd) || pgd_bad(pgd) || pgd_leaf(pgd))
+		goto out;
+
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = p4dp_get(p4dp);
+	pr_cont(", p4d=%016lx", p4d_val(p4d));
+	if (p4d_none(p4d) || p4d_bad(p4d) || p4d_leaf(p4d))
+		goto out;
+
+	pudp = pud_offset(p4dp, addr);
+	pud = pudp_get(pudp);
+	pr_cont(", pud=%016lx", pud_val(pud));
+	if (pud_none(pud) || pud_bad(pud) || pud_leaf(pud))
+		goto out;
+
+	pmdp = pmd_offset(pudp, addr);
+	pmd = pmdp_get(pmdp);
+	pr_cont(", pmd=%016lx", pmd_val(pmd));
+	if (pmd_none(pmd) || pmd_bad(pmd) || pmd_leaf(pmd))
+		goto out;
+
+	ptep = pte_offset_map(pmdp, addr);
+	if (!ptep)
+		goto out;
+
+	pte = ptep_get(ptep);
+	pr_cont(", pte=%016lx", pte_val(pte));
+	pte_unmap(ptep);
+out:
+	pr_cont("\n");
+}
+
 static void die_kernel_fault(const char *msg, unsigned long addr,
 		struct pt_regs *regs)
 {
@@ -31,6 +82,7 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
 		addr);
 
 	bust_spinlocks(0);
+	show_pte(addr);
 	die(regs, "Oops");
 	make_task_dead(SIGKILL);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
