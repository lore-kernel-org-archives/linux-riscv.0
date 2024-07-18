Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59992C3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mWeDtoLg2tSmiwtV+4FdIQlAtYwMJNy71mINY2tRNhw=; b=1liI9zDpsVQNu1
	2Wg+sRTBpXXIful1Y7fa8gsj+LVk57zeYhrlaVgRbEmzW3Yzu9B3cu7qFcNXewJREc6cr0eeL3HJp
	A/GXWxdXNv2asNce9aosym1FwH6MCs4JtUDrED0aySBUqIR24+jLWsh5oGjUf8KgDew0L1PxIce0e
	/723ugGmTt3mQTYacfXlbWu6G0tjXLbZ5SH662pyi1gL92IBNZTDAwyJsZ8vUVlFFAGki4ubY/0CO
	O3VzaNT9JXsVlfBYK10QwXGuf53zYW6pqG18RKEEymR04KRIa+y7Xg3Lu5D1fVWoa505uonnfDX2e
	xtevXX1L+5E9PBHqHuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUGkb-0000000FWK7-2X4K;
	Thu, 18 Jul 2024 02:20:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUGkY-0000000FWIK-0Bzl
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 02:20:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fc566ac769so2661035ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721269200; x=1721874000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9SZYdZsUUoeIjJIREJT2CI+WWVTiYc+Wvm2FRooJHI=;
        b=R/jQXvZ20AqpkvCbsQwURKoG5zzaL4GJpw24jYqYyRAjfCnX/8LybIe2gWN0Yd/64N
         oyvnI9bEX9MqRDAOOUsWgDvFhMNK+nHiupPliG/1vhP5JGKeRGvcZK00x8N5pjcbC0F3
         CsKCsh0Y9CI8L2x9xYXoZaZwozxlgkbJTwYLcANMiT+b/v0zJm6lrqyniaTUiFWKGDPo
         WzdbmjAQD0H06iXPx+LK3Od7MX9PFyBRw6rgbv9FyRyUq8Jw4ykXd8V7bcgoqFy9KCTv
         n7Y0SsnqPMryln9oTvc4DznLowdGttJYZL0DwqS/N4XxLuabvOmMv9fz82sxgZEheHs8
         zplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721269200; x=1721874000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9SZYdZsUUoeIjJIREJT2CI+WWVTiYc+Wvm2FRooJHI=;
        b=kIYSW0n7scFcnu8B7GId/14IVtSNBc/HPXBX+dnj25OhABdZh0fUHgRRGLfwcYEcLh
         Yp72YcxzsBO9rLlwbkCTa7fe/0rmMlEoRAZUvmOHqPYN/Q07M05kdOBV3+pHxseJn/ds
         0ZKWmlzQSLi2IkCeGjMS0rmvqtJMcXqOwNsGUNlIsMdibqUSZublFYlFj1Gtl+NGfq+i
         3juXZdiS7Y+4S+JjX16GHAsBuZVr7AxrEMrUh0w+Osz2D67ceFh7hU4+wAKq3uaWY/7r
         BfkdfYqahcxezmarDnCHnQJpq1pmht7pQKigs8u7zDEAaAezHgSAOs+TpFtORPsGcOuA
         bCDg==
X-Forwarded-Encrypted: i=1; AJvYcCUB/8HOWZNmxKaZYXtKqW1TjT33Vg0gVqFksodiJfi+zvROmy7MFKjGB+NsZLGqnBvQhgYeprmbcl61Gaxl+B/y3tHyTaxQ+OXHAfOikLUT
X-Gm-Message-State: AOJu0YzsHSqpI1mYri4kNjqfQRPnNzatbuVSuH9YlL3JY5JBaO15Fmgj
	SLu9EQUzoueafndvDmuqi1H0v8v9nCPYmtla77Tw6o1Je6bV39Pw0H3vYrkaOWs=
X-Google-Smtp-Source: AGHT+IGHbBfQu2e2YWhJChF1C+hZkw/qVjCPVvObxOb7FpH7Ohyx7cX+w8+p0XCiuteXdW56LLgYZw==
X-Received: by 2002:a17:902:db0d:b0:1fb:1b16:eb80 with SMTP id d9443c01a7336-1fc4e15c311mr28657665ad.26.1721269200464;
        Wed, 17 Jul 2024 19:20:00 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb70060sm83732525ad.58.2024.07.17.19.19.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jul 2024 19:20:00 -0700 (PDT)
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
Subject: [PATCH] riscv/mm/fault: add show_pte() before die()
Date: Thu, 18 Jul 2024 10:09:35 +0800
Message-Id: <20240718020935.12803-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_192006_269358_5597E5C2 
X-CRM114-Status: UNSURE (   9.55  )
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
---
 arch/riscv/mm/fault.c | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 90d4ba36d1d0..dfe3ce38e16b 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -22,6 +22,52 @@
 
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
+	pgdp = pgd_offset(mm, addr);
+	pgd = READ_ONCE(*pgdp);
+	pr_alert("[%016lx] pgd=%016lx", addr, pgd_val(pgd));
+	if (pgd_none(pgd) || pgd_bad(pgd))
+		goto out;
+
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = READ_ONCE(*p4dp);
+	pr_cont(", p4d=%016lx", p4d_val(p4d));
+	if (p4d_none(p4d) || p4d_bad(p4d))
+		goto out;
+
+	pudp = pud_offset(p4dp, addr);
+	pud = READ_ONCE(*pudp);
+	pr_cont(", pud=%016lx", pud_val(pud));
+	if (pud_none(pud) || pud_bad(pud))
+		goto out;
+
+	pmdp = pmd_offset(pudp, addr);
+	pmd = READ_ONCE(*pmdp);
+	pr_cont(", pmd=%016lx", pmd_val(pmd));
+	if (pmd_none(pmd) || pmd_bad(pmd))
+		goto out;
+
+	ptep = pte_offset_map(pmdp, addr);
+	if (!ptep)
+		goto out;
+
+	pte = READ_ONCE(*ptep);
+	pr_cont(", pte=%016lx", pte_val(pte));
+	pte_unmap(ptep);
+out:
+	pr_cont("\n");
+}
+
 static void die_kernel_fault(const char *msg, unsigned long addr,
 		struct pt_regs *regs)
 {
@@ -31,6 +77,7 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
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
