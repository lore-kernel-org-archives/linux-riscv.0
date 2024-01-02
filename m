Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D1CC4707B
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lp0+H4CrN5+X/+hWWNaR/K52KLlk1E30geDBLaRXbQ=; b=TqA5oM2tIkp/Gz
	3gxSTLcBCnxGcWKuQs5qN15BqvTBBnkcJ8phMkBhl1TCIb52h8TRq3dfuxOq+oYVWZrtUpyoEzwDz
	AziUoXYQllr0L5rVLPp+QqRBju9i3lXwtmWGaM4lX+8ktIyTKj07ic3n9wjsD/GO5sleA5hhrXFK8
	tNdP6+aTrGOl98gsnLDpM/CmxKwI1y4pCcUdLGBV+KHHncnzPaTlAXSqsYEUutAKjnVRqh7OAbqHu
	N8sU1Mj51h/1GgaMu7TXTFhp8tmzd3g9O85WI4RuD0OdhLtsZoelPTzm/UrRcF5WF+VyvGVqzipD6
	WgYVTmW1FAHn2yp+7bdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpe-0098Yd-2H;
	Tue, 02 Jan 2024 22:01:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpa-0098Un-2K
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3f2985425so36164955ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232909; x=1704837709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntXY1BdgwMpYCVbC/qFvmg3dz3t/ZzKIeqKl93B+ekg=;
        b=DpRm75I7F3nitvKfPEWkfdTdE38CcRA6YXjZCFR+OjIAr93v6NzyB+1LwxGUtbjq4D
         02bUBUp94anemJ3TSsEcfMED01agYUY52NoV5sv9MeHuiiLyzh/7MWkyfyYAn49RPihq
         dCBsITs8FxvV7wURjR8xvrRWkyfhgi/H+Ispv2W30ku9uBm2VJGBuxUkFPICFSzJZ20Z
         wwpEWK0TKCPc0TGl8EBHrpyYrQYSckA45eLV/UrIUYICNlD4A9clQld8o3cBZX11GT+x
         wmuluZqoi9pbmJtykqn6x0JcBzy7hFPwDFZCL304pMMa3q3ajjfjXj8ybHqf4KmijpSr
         nymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232909; x=1704837709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntXY1BdgwMpYCVbC/qFvmg3dz3t/ZzKIeqKl93B+ekg=;
        b=jMfkUIJKEg//cBUiDGNitIj9RU3lWJHDltegZW1v6y8P86DEPuQdIDIPDde7ql+cTD
         R0aTZSBR4BmHdtwA/jS3CwjGlFgfx0gGlbBmJtcPkqIz8rN3tbK52f2jITV4xNgomoJ1
         JiVJxFfGqh1nXlWPwDH1Gs1gDfNisCIyeSqeokH+1sEqdeyB8Dy9wLY170Nmf4/vJ85V
         BHiKdVbUK2BTiZLU8kZ8a3dULyGPU1QQiTq7ZamphKojclfITC2m9MnltYoyGZCh6YXF
         GFoFQbNwpHBtAGjpHmDxieWf7GlDEU4/DxMBzaAg+utsf4Nfhr3PN3o2ZFYMEl9cpNEr
         D+ow==
X-Gm-Message-State: AOJu0YwBhyMTiXGNnt5Jz4m8sSGVnZEaCmqrPG51YkLnojnUwQWjIZuJ
	TioatD4r0hDo2jgtBwFFHbovFrUVB8Mxaw==
X-Google-Smtp-Source: AGHT+IE6m2P6rWzQ+Gmcf0Ghh7A4crRVy8Bq5ePskuN3Kp4kY6ZC52OLPfUohVtqOdFfc+/yJvJ6pQ==
X-Received: by 2002:a17:90a:bc46:b0:28b:31f5:9668 with SMTP id t6-20020a17090abc4600b0028b31f59668mr5241043pjv.30.1704232909372;
        Tue, 02 Jan 2024 14:01:49 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:49 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 12/12] riscv: mm: Always use an ASID to flush mm contexts
Date: Tue,  2 Jan 2024 14:00:49 -0800
Message-ID: <20240102220134.3229156-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140150_759195_4AD929B5 
X-CRM114-Status: GOOD (  13.93  )
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

Even if multiple ASIDs are not supported, using the single-ASID variant
of the sfence.vma instruction preserves TLB entries for global (kernel)
pages. So it is always more efficient to use the single-ASID code path.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - There is now only one copy of __flush_tlb_range()

Changes in v2:
 - Update both copies of __flush_tlb_range()

 arch/riscv/include/asm/mmu_context.h | 2 --
 arch/riscv/mm/context.c              | 3 +--
 arch/riscv/mm/tlbflush.c             | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 7030837adc1a..b0659413a080 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -33,8 +33,6 @@ static inline int init_new_context(struct task_struct *tsk,
 	return 0;
 }
 
-DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
-
 #include <asm-generic/mmu_context.h>
 
 #endif /* _ASM_RISCV_MMU_CONTEXT_H */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 3ca9b653df7d..20057085ab8a 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -18,8 +18,7 @@
 
 #ifdef CONFIG_MMU
 
-DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
-
+static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 5ec621545c69..39d80f56d292 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -84,8 +84,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		if (cpumask_empty(cmask))
 			return;
 
-		if (static_branch_unlikely(&use_asid_allocator))
-			asid = cntx2asid(atomic_long_read(&mm->context.id));
+		asid = cntx2asid(atomic_long_read(&mm->context.id));
 	} else {
 		cmask = cpu_online_mask;
 	}
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
