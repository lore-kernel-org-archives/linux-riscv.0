Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33678C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 04:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aa4IKbOCePb+k3sXvq0iaxkmEE5VfMSuxQXl2AVyE5M=; b=jcRHRLRisQAUX4
	/EyzyUVQEVYfPFupfE6a7RJFraxMfrLRjXMLc/AIlNiEMSlUMPewbWcsQEZHzcJoJJeT+lBUUMfOS
	gtW5uYgpCUD2cE6oIifN/42y9v69IRdixiCk1JXWN/4qWslPyO+lJ3UEVz1d6k17n1D4U75rxKpOS
	sy8O+9CtZcbQaDmct71zcc5rr3LAfCLv2VR1jpOnKvQOCWQHmWcLBMZrGc54tCDNa33B8Z4YVqfPe
	Fg/P8FnqafEkVga9paRGWWsL+hxn6dOhyMhj6Vb5EbedhTGZziPgH68s2aQQJMMPnXzVCMSDccXU6
	JGnN1SedDUbrWaD/21Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVkXe-00000008Ivi-2rhd;
	Mon, 22 Jul 2024 04:20:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVkXb-00000008Iug-1q2j
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 04:20:53 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d1158d149so340090b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 21:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721622050; x=1722226850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p54eG25IX4K7qH1am1LIVsFIDVdw1nNvCzAAhUWsgsw=;
        b=c1/LoZoCl7bfI8fAZuR63x5tQx0CNiJocPec0Q01TWDB0WJYpuQsUgeG4k+evlrUUb
         x3B114xiU5rCNO1cpGDZMyfQ/hu02ynAa/f1WVwFA0Xx+VF+s9xVDWNgVsjIueSg4IBV
         AH0TxprT84jtgJFFOqv6M2fkhWkpuJZVk+Tinl/uwP7SGvsD4ZfnPVwVd/7lYqc/aBgP
         Igj0NCGXY16bTQ878Bjn3zLrJMKM9NkvdZThrQQ7fmQls8vRIkfNsMXtRIvQmvR2vC72
         m4pIiyi754f+zxiUnlteQMzk/PAY61GP0dye+sxbayYBi4pNP7W1ih0uOH/7iYptZRpo
         GFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721622050; x=1722226850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p54eG25IX4K7qH1am1LIVsFIDVdw1nNvCzAAhUWsgsw=;
        b=lk+7DQU9MHMv+m2a4opaagWYW0zEMUgAKdxveI8xw4kOpg4mb/p699ipJERwn+Uq2f
         KzPTaiClgWiLQ5JpUit8jY3XgGdgY184mB1QhRDpbWroVHoVxnGUvv/dsRY9I05DWDOB
         /BO2Iwce3GkFUDwM4PYBAlgRdhhU7wiNVt9Qv9B5n/16m2X6sKT1Wtk+KtoRfKMXJnt5
         Nu1YRD3Os9O6mIzPkRW9J2JGL30QgE5FKtYlh2Ox1qQj6ixxgsP6DIVz/CN5WgnNV41I
         79qI0bsXaAHa0toZPm/GqeQ5eZi8qNnFz/gXmA8cujienfNqGmjnGoPf0dN9FStwvcWv
         3Uzg==
X-Forwarded-Encrypted: i=1; AJvYcCWHrz05/maVuaLRnqJ1WrlXfZz4CRzmfsEF/aOC9Ug+SRuXIoA6d4R8PUl9/1tPFGJf70fzIhi89tGg5Yy6W/PIOyhPFCtJ/bqkRrIDM8+j
X-Gm-Message-State: AOJu0YwHpN4A6LRgIvYq/92byTzk3rXfnpWceM3NzeGHV37YKq2l6WZ+
	GdVTUo0WwkkMZ1sublJKHtKohqWUAhndmpSUSeAkPA6OS+Tft1Xe/anFz8REStbCLJ5v4y/cc2p
	PYno=
X-Google-Smtp-Source: AGHT+IH8fTq3s2tWLINAZyA5rbZ0LM6s0MZ12d2PMJTOXBz/IbcNiG5imYLZzJZ18BdDsyJ9KnNiwA==
X-Received: by 2002:a05:6a00:3cc2:b0:70d:2a4d:2edc with SMTP id d2e1a72fcca58-70d2a4d3191mr1296928b3a.20.1721622049629;
        Sun, 21 Jul 2024 21:20:49 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0f267834sm3225618a12.79.2024.07.21.21.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 21 Jul 2024 21:20:49 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
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
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2] riscv/mm/fault: add show_pte() before die()
Date: Mon, 22 Jul 2024 12:20:37 +0800
Message-Id: <20240722042037.27934-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_212051_832029_F3CA1725 
X-CRM114-Status: UNSURE (   9.62  )
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
---
 arch/riscv/mm/fault.c | 53 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 5224f3733802..666d282a8bf4 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -22,6 +22,58 @@
 
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
+	pr_alert("Current %s pgtable: %luK pagesize, %d-bit VAs, pgdp=0x%016lx\n",
+		 current->comm, PAGE_SIZE/SZ_1K, VA_BITS,
+		 (mm == &init_mm ? __pa_symbol(mm->pgd) :
+		 (unsigned long)virt_to_phys(mm->pgd)));
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
@@ -31,6 +83,7 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
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
