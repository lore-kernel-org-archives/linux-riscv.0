Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D54DFC6171
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEtOqZ4so3Jo8IJX4rCrhkFQ/91e8uCxcre9NiXtqos=; b=lGLtOebkM+flQv
	AIFu6XjlSwgtLWF95t4A5gXZ8i3aTjSm9feUxnbeLvzDfB+4r2dVwcOilk1RxujaRE+tzDKdjq2/L
	1Vy5GPQizuKHocMrto2MgBGbR2QuaebFUvbbEerj/P8eiZezKdmF82q+NBgBWUEQsk6pMUD//c8X+
	pKIC2WGqBslC8S0DOIrXCynbY+vcor0I2T2D32GEj4FxU6yWj04T8jCnQIVzLisVxffOSpkrhhRmX
	qYD20sZqLsG4u/IQvpUJf9rsFhDphzMnqPqbVY/UVM9lPUOeX5LLbhwVeBUVT+0E2HURfRdbKcX0H
	HymoS0Yq6+Sh7cwWx8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxJ2-000000097Py-22x2;
	Sat, 03 Jan 2026 08:48:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIz-000000097M2-1R8z
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 08:48:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so10580831b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 00:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430092; x=1768034892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=;
        b=j3tLSqQkYGI7YlRwHDBJdKthYbE8/gm6Qh9AUxFuySzBIsmQF23NWtb0dmCk/xSmNW
         rKGZ3QDeHB9W4iwhlEqqaUIfSooS4p8M72ClZPY52x8wlCUtEuuN0S1PgDw9SYzM9dus
         3KuSyFad054HQqpafGEdAOmiMSbX3o5dkRlJNOJM8De9aT0+3kNajdMwsYuDhoanuaVc
         D5ZUqfse+zHq2Lke3PVFszaVVnLSFX2zr9jFwmDlYsATjqicE65shAJ8AOeyxciEE4dd
         t/h1XBbpno8fKZ8BwRzPNVHxha4ieqGOyHUG7bi2zRKweP6e4Np4ZlCFAZQUwb96+OZv
         3cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430092; x=1768034892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNQtBvCUtmnAPeuru8aiLc1c6bgNqqxLSRGoZ3PSDyY=;
        b=Rq0KnRRUEyUHT5Emz/1ssD6j80CWD6o08ERDQdZB1bWTYBd1sVpBLp+tC0ILDLXeQj
         7ZGiAgrLDo/FTVsTdKyiwrjIcVuBkxGI0hTlkKEyUs1ymzZ/XWmlM14AJFpG5r7P9l6f
         8KS853KjSqkd/MlF3e+Wh3yyUPdymyIk6B+iu1YGUOLhm+ZK1XrcuESogiAYVQNc/FSa
         Z5p+JrztVbVpLAx698qtJ0XnVTxQKNzuxMsQqpamGEj/qsCUq7OnwaT2MV+9Rvbgpnyn
         ljt2KXv2SGETxaFl/+itT+Flh7zVwUyqHDBXrSsQ0CLslDALoUB+3mjfyOSv2utnyX56
         M6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjjdQcBakPGkbc3VbvZ7zE3TdW432nyKa1UuDa4OQ8SDtWslL+ZU9dJhgz8rncLZHU7fo7xtemCfFy6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw4JAodDvvgi8uiO6rDDXww/iEwxLAw9Y71AS0eyHuIcB1FyZd
	FUBaLF6puaZXBL6wKhhSPbY1OhAKjYEfZqF7QIvAA3X13Q1Awvvs/qkp
X-Gm-Gg: AY/fxX4WcuKqOtsbkYG5DcmJBu80lmYxbbVbI82QJ1HjzjsvMuMpzJO2KhWnFFBO7Qh
	IhKKqtXwsJFePUaP5ElS36MbW06qsw5UMen01exkhG3MZ/nRPg7moaYTfKVoPJPL9XFm+1mrssW
	mnHcgI6P9M7mB/p7fjtgyR9onYu1wps2ig5HgLg9WGK3p8Rntyjtk+bSm7jEm8cxZ6uPyBXCREF
	ayK1QlfIc1jKqwVasb32zTeWp9qBfhTgZCJJWfZQVTgr0ivwf6xg/Bvq3mCZMq6p8S2cdYYRWTW
	/6Zg/60c1TNPozLCZBLn6mXxOtT9iCfSMJINFCbYduB8EZ1Xx7EilNPxUVoHPufItaunCVF9JNe
	FvaWbjkyHrTPh+5ULFwCkZPkSkt9JGbsQ825/ooWc+Y8P42c8DOtxRiQpN0OE42b9bJSy5BAD4r
	xvZRKw7c1f0xATG3opylZRU/cev3espUbmCf0=
X-Google-Smtp-Source: AGHT+IGp+2Ae35OlKcY/AZO4SFhsJuhif38Zo263lmc6gG+RjhGQaVQCgX9rVZBWLxbZMYLURcJ7SA==
X-Received: by 2002:a05:6a00:e11:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-7ff6421137cmr37196936b3a.12.1767430092345;
        Sat, 03 Jan 2026 00:48:12 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:12 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 5/5] uprobes: use kmap_local_page() for temporary page mappings
Date: Sat,  3 Jan 2026 16:42:43 +0800
Message-ID: <20260103084243.195125-6-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004813_377198_19AE0CBD 
X-CRM114-Status: UNSURE (   8.28  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 kernel/events/uprobes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index d546d32390a8..a7d7d83ca1d7 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -179,16 +179,16 @@ bool __weak is_trap_insn(uprobe_opcode_t *insn)
 
 void uprobe_copy_from_page(struct page *page, unsigned long vaddr, void *dst, int len)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	memcpy(dst, kaddr + (vaddr & ~PAGE_MASK), len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static void copy_to_page(struct page *page, unsigned long vaddr, const void *src, int len)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	memcpy(kaddr + (vaddr & ~PAGE_MASK), src, len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t *insn,
@@ -323,7 +323,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 		return ret == 0 ? -EBUSY : ret;
 	}
 
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	ptr = kaddr + (vaddr & ~PAGE_MASK);
 
 	if (unlikely(*ptr + d < 0)) {
@@ -336,7 +336,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 	*ptr += d;
 	ret = 0;
 out:
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	put_page(page);
 	return ret;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
