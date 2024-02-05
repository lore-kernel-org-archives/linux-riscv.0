Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D66C4829A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 04:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=reCCfgsfGlxSijgMPWW3q7vgEB1Ci4Okla4zDDkZSRQ=; b=Mr0bB/gRcYQ9Vt
	h4aWjUxTiFWNHGp17ejzC1Ew+Y4ciQHNFYyPH6DJAtmaixZyUp7PIYE7caAaLzcgpSWCFZAbLJYOg
	zskc4vsIF3psGQNLYS18/MwMehPGKg6T1AOQvDvOQFbQcwRTBI1TGgKbVjZsZjfD7Hg+O7/qOf/ub
	WgaAB7ooZyjP1YFcPLaVSl+7sCuGUcYac3D8ye9vU2Nl5ruFAVpcwR2i7uBDU72CNaTPF64iptO0F
	pSl0abVhKw7KhHFweq6UPYk0XIc01CE1BGgg2JJaZ+b1LzHiHRp8Cqh84Aqkvj9Boox0Yo1UMEVkh
	yXd4WDjPXb5yGHpk9l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWqcV-00000001zKx-1dgF;
	Mon, 05 Feb 2024 04:30:11 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWqcS-00000001zKR-3irc
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 04:30:10 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7bf0f3bf331so181008339f.3
        for <linux-riscv@lists.infradead.org>; Sun, 04 Feb 2024 20:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707107407; x=1707712207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3r2vA5FIOIQLGifM1d7hYof79l8b2L/VuDazcZIHp8o=;
        b=cx4ciBVKs+YOBmkbPOGKS0OEIR9eiYjHgts/8fOXEN1RCowDzVT/t+rx7qKDcyfhTK
         YP58L6/sz8gD0NaZYiz6Pf3FMx+wjI396i75PxgYoJgp4uVpj4981rJBEyl3H8rgl0k9
         fL4ttxtU3nIHGBwmOvfzHIrwGdgFcYwai8R2cbXP7mQGVcfgWgLJZeptfGG6xWKc3uuQ
         sb9RYcE6zo/TSHGbFFu0NM2INms1/30Lo7S9Qr1x02y/CMs4Yu77rcBxjxeMYM23+UH3
         MCcrjtuiLtKYWHAx4EsmjU3kuWsQEUCJq3s/8SJBrsVYMOJyE5eG04XbFkJz5HiJx3uL
         hj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707107407; x=1707712207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3r2vA5FIOIQLGifM1d7hYof79l8b2L/VuDazcZIHp8o=;
        b=pIww4fXfl0L+AuIDYGUbiLBzO0YP+ZrT+lBfMDJkMEQboWXMQV9ujOFSLe6wsyuIhS
         TBY3NUBK5dwLkNKKI/KHLIIVq5jiAy85JvxtYrgZKIePRbjQob2qZWGmQ6NGoh5TuqYI
         0hqPllN08t9qmiNtpm3oysQrctYH0PEg0n4/AyOx07IcOuXmiHY/QfqI4d8ygHekMj/H
         F7BAj48xQeCcKwP0mDHkZ9VjfRmqZ2UCygqmI2JlySWcbdadGzx2MvnpS6+Rsk73Afz5
         v2m6NZAr7yuolk1ajDJihG8RPYIiwslg+lg2S5l61NCXDviLjh3vTDJIh3ZT0eb4HIm+
         hlwg==
X-Gm-Message-State: AOJu0YwzrmUutY35DBU7+jaMNnbiZn5IX+FAW57j7ANK1KBHN1IRUK8u
	wCF7CkicR/kpg3U5FtiJP2S7itFAxJw1nwT1HP60HC4lH3ekpZsBSmaUUCaXBNs=
X-Google-Smtp-Source: AGHT+IGtmgrjzTQeAl5TEJlluMyMvgVEktxni8+qxt143FJmmGYy+5tc5cLjFKC2Z6sTdzGLUuAXVw==
X-Received: by 2002:a92:c150:0:b0:363:c63f:6dcc with SMTP id b16-20020a92c150000000b00363c63f6dccmr2960923ilh.29.1707107406907;
        Sun, 04 Feb 2024 20:30:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXzNYHT4cS5fhRnf89OrnogwBxuC4KnPYpo14hZA9l6pDsnlJSHRLanviOZDz4C+Agl2JWXISe7b3KfV9HfScCZa5tCnUDTgDNNpb+e2QsYZeUnExe1sG4GNKNkJ6tozMAmBJW/66GJHbHeMJtsycQz6FiRPzkLqsxbha+aEYG3+AvcFnsMtO5xM0OotGhUEKD6PAlAqcFWV7B5Znhwo1srt4gFzaIcQ13EcbB7LsXJ0mSpz7FuAH5xPS/W4pha3lS0oJ+sAAub8isRwya7Da3+vpvnq85/CK+dO99ygVc7ADtkZzdGDUlrfvOcD4+o4/m/t7kRahyyUgFQON5pH5k=
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id m20-20020a056638409400b0046e917416c8sm1889131jam.89.2024.02.04.20.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 20:30:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] RISC-V: Don't use IPIs in flush_icache_all() when patching text
Date: Mon,  5 Feb 2024 09:59:55 +0530
Message-Id: <20240205042955.833752-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_203008_957236_E72BEEB0 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If some of the HARTs are parked by stop machine then IPI-based
flushing in flush_icache_all() will hang. This hang is observed
when text patching is invoked by various debug and BPF features.

To avoid this hang, we force use of SBI-based icache flushing
when patching text.

Fixes: 627922843235 ("RISC-V: Use IPIs for remote icache flush when possible")
Reported-by: Bjorn Topel <bjorn@kernel.org>
Closes: https://gist.github.com/bjoto/04a580568378f3b5483af07cd9d22501
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/cacheflush.h | 7 ++++---
 arch/riscv/kernel/hibernate.c       | 2 +-
 arch/riscv/kernel/patch.c           | 4 ++--
 arch/riscv/mm/cacheflush.c          | 7 ++++---
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a129dac4521d..561e079f34af 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -32,7 +32,8 @@ static inline void flush_dcache_page(struct page *page)
  * RISC-V doesn't have an instruction to flush parts of the instruction cache,
  * so instead we just flush the whole thing.
  */
-#define flush_icache_range(start, end) flush_icache_all()
+#define flush_icache_range(start, end) flush_icache_all(true)
+#define flush_icache_patch_range(start, end) flush_icache_all(false)
 #define flush_icache_user_page(vma, pg, addr, len) \
 	flush_icache_mm(vma->vm_mm, 0)
 
@@ -43,12 +44,12 @@ static inline void flush_dcache_page(struct page *page)
 
 #ifndef CONFIG_SMP
 
-#define flush_icache_all() local_flush_icache_all()
+#define flush_icache_all(want_ipi) local_flush_icache_all()
 #define flush_icache_mm(mm, local) flush_icache_all()
 
 #else /* CONFIG_SMP */
 
-void flush_icache_all(void);
+void flush_icache_all(bool want_ipi);
 void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 671b686c0158..388f10e187ba 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -153,7 +153,7 @@ int swsusp_arch_suspend(void)
 	} else {
 		suspend_restore_csrs(hibernate_cpu_context);
 		flush_tlb_all();
-		flush_icache_all();
+		flush_icache_all(true);
 
 		/*
 		 * Tell the hibernation core that we've just restored the memory.
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 37e87fdcf6a0..721e144a7847 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -182,7 +182,7 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
 	ret = patch_insn_set(tp, c, len);
 
 	if (!ret)
-		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
+		flush_icache_patch_range((uintptr_t)tp, (uintptr_t)tp + len);
 
 	return ret;
 }
@@ -217,7 +217,7 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
 	ret = patch_insn_write(tp, insns, len);
 
 	if (!ret)
-		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
+		flush_icache_patch_range((uintptr_t) tp, (uintptr_t) tp + len);
 
 	return ret;
 }
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 55a34f2020a8..03cd3d4831ef 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -17,11 +17,12 @@ static void ipi_remote_fence_i(void *info)
 	return local_flush_icache_all();
 }
 
-void flush_icache_all(void)
+void flush_icache_all(bool want_ipi)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
+	if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+	    (!want_ipi || !riscv_use_ipi_for_rfence()))
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -87,7 +88,7 @@ void flush_icache_pte(pte_t pte)
 	struct folio *folio = page_folio(pte_page(pte));
 
 	if (!test_bit(PG_dcache_clean, &folio->flags)) {
-		flush_icache_all();
+		flush_icache_all(true);
 		set_bit(PG_dcache_clean, &folio->flags);
 	}
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
