Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3949EC61D98
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1//ZmfbzvQWrgeHwJSjY0RPFLAEhUje1i5lKuU+SekI=; b=B7cNjRhMrydA9K
	cf5ZyEOJiEJ1CP05dljoFeFDoXePwcqbtF8KCWWrtCbWj+K/YIcp3gwhuLjM8LpEwi7qO+2ktw82I
	5t1ODIdxv9+MYBEISV7J8AGJyFHOOYMjOOsQEuspe9KsC+PE3tm/dTVRW7i7zaulYBxPUBICEkPbr
	ffMo36PvgMM4MoZnigGgzRaU4JKOZ+6qlxTagkntsAL2j5cgcFBle+qMRjQmZ4AjVi0RLP2WqJvTo
	oHG4yiEFq1QvDZSw/5NZzNP+8FYafR9EUJwVdCpGYX3Dk0geYKO1XS89TKIOn5kzRGkHeFSbCSQj1
	pPHUTWf3oeT7++bri6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bjF-000NGt-0E;
	Wed, 22 Nov 2023 01:08:33 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bjA-000NCS-0T
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:29 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b6a837a2e1so3635626b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615307; x=1701220107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wj2ICW1Fptg7hPvDVbuVBoYZZibiQ7SyAcM7RK2jyBY=;
        b=iZXwdjbOkGaR0SiH6TAV5H8KWJTvonLdpoRy1ZqKJdNjm1Vq15mx+ROUUH7V1QPv2K
         RQDSvIeB1W05CjbGesdrj+1crPueCy8rAKgvE4GoEHOlOKWx9AiMw38pHk/yQWBIkUUb
         YdGyIMuZZEpJ5dqj8Xqo66iiJUh1LFyT6CXIdacCxQMQ6k6nCRDaMSlSqGebTfCnNfZ4
         ND84v7EUGDpwjKHsJZFpI+2iQ1LZBg+Nxz95aGnw8TEpFWaTapc9L1iBHTG06UZwWNnt
         G2czdw7z4oAnkZHv/+86vOd+3XJZrhVlPl4rZuP7t+7aJqJ0Ns5Gy9bJ76VaT/U9QEiQ
         waZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615307; x=1701220107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj2ICW1Fptg7hPvDVbuVBoYZZibiQ7SyAcM7RK2jyBY=;
        b=mMdL0lcgC23lZrUt0sQYBHo+INH7Q3U2I0NeIqwqnVM05cRB3nYXi/95zGiydyURWL
         hSgx4+Eq3LlR0WlSodPeNH2JgyQXV+WVRjSMKITTYgc7d/IdrBUj3buJwuPLQ2S2mkAu
         1KiTiwZUMtYWfQ+iy92iqsMEtsTXOzUOE9LzrfCQL+Y38jvUov95VUcC/raMmoYPn/sY
         hTI+Tf282Efeom0CHzoJjDsMk9upn8JFM+phXhYk4O+kbdbK79gH1wlnpQC2Hso52+sP
         uykQ/UDmoO1CU4HpDvwvSognRUVGuKXgAeQldY/XZ9L9TLa1XPjhD6HU3C4aJ3aRtgAN
         Iayw==
X-Gm-Message-State: AOJu0YyLdose4vRYkZU4LuIZRoODcRBndqi3x6oRt6RsZnpyKM9eUP4l
	fZhlE672fOoVyCgLX3QAnw24xQAPAAPCAp+rYWg=
X-Google-Smtp-Source: AGHT+IE4b2JAkpIlmqFLR7/QsgdBYQzfOQCASKlXtamU7cDqbXpB+e41Rju/TG/nF3J4VXpKvwiJIw==
X-Received: by 2002:a05:6808:699:b0:3b7:673:8705 with SMTP id k25-20020a056808069900b003b706738705mr885196oig.18.1700615307054;
        Tue, 21 Nov 2023 17:08:27 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 8/8] riscv: mm: Always use ASID to flush MM contexts
Date: Tue, 21 Nov 2023 17:07:19 -0800
Message-ID: <20231122010815.3545294-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170828_185921_4E71040D 
X-CRM114-Status: GOOD (  12.72  )
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

(no changes since v2)

Changes in v2:
 - Update both copies of __flush_tlb_range()

 arch/riscv/include/asm/mmu_context.h | 2 --
 arch/riscv/mm/context.c              | 3 +--
 arch/riscv/mm/tlbflush.c             | 5 ++---
 3 files changed, 3 insertions(+), 7 deletions(-)

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
index 23409d70440f..d6619be10341 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -90,8 +90,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		/* check if the tlbflush needs to be sent to other CPUs */
 		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
 
-		if (static_branch_unlikely(&use_asid_allocator))
-			asid = cntx2asid(atomic_long_read(&mm->context.id));
+		asid = cntx2asid(atomic_long_read(&mm->context.id));
 	} else {
 		cmask = cpu_online_mask;
 		broadcast = true;
@@ -122,7 +121,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 {
 	unsigned long asid = FLUSH_TLB_NO_ASID;
 
-	if (mm && static_branch_unlikely(&use_asid_allocator))
+	if (mm)
 		asid = cntx2asid(atomic_long_read(&mm->context.id));
 
 	local_flush_tlb_range_asid(start, size, stride, asid);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
