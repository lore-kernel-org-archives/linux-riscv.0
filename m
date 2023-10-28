Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78402C4167D
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fk647J3C9xovr+MO8HH24TmMsBdXSGzUlCAMCGH1VaY=; b=OuVxvq1CWXfSDG
	6S/nNZ/rj3wXE5cH0Ho9U0vTozYRNNgU+gSjU832e1D/uXzhHfdDIbhoFxtgCeHsfNkX0IwRShFhW
	0nZLndeEZRwaA3BHkzqtwdhtqZ+9twXqeYPu5ig23aTEJxtAHpFBhTKGjyQjL+IE0tlVtNdCwxKZ0
	56doIBcNti1BsL8eUQGw1VyROBNuuQj9eAQyeYFE0P+sdcf9GNaKXG+UnpcgYC8a2aHWS/Ja4arss
	/Pm61PWeTSZX47RXsYxxFUShycl0Iy/i3XVHXk0ATxXv970/jxguRvM8foMI9SONi024Kuqr6OVrp
	rQdf9sSfgPRL5P70Ki0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVQ-000vkH-1k;
	Sat, 28 Oct 2023 23:14:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVC-000vYd-03
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc329ce84cso6296765ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534837; x=1699139637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYq2JBnvfDkZMtFq+gFMcak9lyRAM53Oqx2LdQZI3vI=;
        b=Lqjk+0rB3Y+3RxX58KWbLyCBtFZcvwffMxxQaMzl1Wgt8udLA57DUQqhArnphsdZn2
         K25W6sq11+bKunr+8kdqw13y+yhWzLT8zqaZm/mGdi+WPutn1tizOUAQxjM4+yya0vXY
         HnDEjeQYYQ4JT/5Eiv3gghwp5bL4jCN3ZYMkt2IOYfrfUGu1nNFRm+Zusjz9r6mDHRDB
         SdGiiZI31IOx0/0PwgP6OriLfOQjiKL0YZaetSyEl/flARow2eJpQT80CxkqfM/4wD8l
         8nbsHCWsrF4tSdXperJWlu8jDVGMsKosV/FxTj05xPWOPbTZUrFoTv6WNJzXnFCAzVlM
         d4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534837; x=1699139637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYq2JBnvfDkZMtFq+gFMcak9lyRAM53Oqx2LdQZI3vI=;
        b=o+VLJ6tyBUNtcjilnF4amqXiMcsX+zaMAWf+u0kzBuJC9SKljtkjLC+fJSp93wdYuF
         h4pY8UOu9y2Kel9Uxjwx2DuwfDzmNKBga7QtUz0Rc1LzErFdHgdUumRw6QPekXsro+6P
         Q/P/F8zHwpA3VwUigG2G42495v5a8PIeTfZ49cEUmz9ufMcgfBKLfp1taV8obCBIOFZv
         vKuX0+0LWPNvqUklLEo+Bxco3rhJEEJ+jeNLZK5yI+o7pjx1eDKjXBTAHj0GI4/wgQ4y
         cCisuatbHBkWT8Zdc/OO4mvWmGnbTaDnMRS76idLqRIw1FJdLXHu0jVbNWHCVAtoIcbM
         5YCA==
X-Gm-Message-State: AOJu0YyGZk9FIUIjKCAONO128bstWPj/PPYk5MLlGCc7D8KKnjvxxRMA
	WOksOBrXTDzjFmVZp950z59M/w==
X-Google-Smtp-Source: AGHT+IHR5gJkl+2hmALdgeC6Mspb2OIhkdCFo9rAzDT7R89li8y2sxi8zbkov4fwyI0EL6o8dg+K/w==
X-Received: by 2002:a17:902:f542:b0:1c5:a7b7:291c with SMTP id h2-20020a170902f54200b001c5a7b7291cmr8203243plf.12.1698534836728;
        Sat, 28 Oct 2023 16:13:56 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:56 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 11/11] riscv: mm: Always use ASID to flush MM contexts
Date: Sat, 28 Oct 2023 16:12:09 -0700
Message-ID: <20231028231339.3116618-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161358_087697_82B9EBC5 
X-CRM114-Status: GOOD (  12.34  )
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
pages. So it is always most efficient to use the single-ASID code path.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
index 1cfac683bda4..9d06a3e9d330 100644
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
