Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B98C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 04:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D47F610A0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 04:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D47F610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oHdC5xf4QhB6HYMf5oixNhPe4enWn/KurUrEkqEbPJs=; b=XAX9GBYMjQdeDz
	DF3Ks/sq49i8bjmARddhiFxjcoCbu++NAV8zjJarLwO9fsNB1rzQSjhzWkyk4Jp/3w5vGr8SEhzbp
	+bXoXWZ/Zpvjemef+KDiuG/Og5cQVRSoOczZhu/QBqx+H1zMe+Pe4fheq2dgpECvnAXApxLBw7gPW
	S840GiBRvjZS2zjRmgakNvtKw0m59Kkr3VJPlZkQvyRSQjd1/+6mYTp4ly0gwJwKi2qySh8zV5aSm
	16YuquoOy8JRnIr35E7qHdMfQAw6wRvSGMysmSgvC0t9W1UePq4nBV2ylWz9IcLNqNwWHpjQBRqzT
	c//pYqBohjOJscFkLejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfb1f-003rvy-8b; Wed, 27 Oct 2021 04:58:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfb1b-003rvE-Nk
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 04:58:57 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1CE453FFF8
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 04:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635310728;
 bh=OZLbG+qup29O7pa3I3sT9lWunjud959dueLBGLyt7Gg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=IMdq8wnNV8k/11/aeviaqlBActJziQGxwOuTl5ZpYTDx6m6Q4JqrTyLglGCyfsMpt
 OX1kwlsavjv/fw+LKoWYKhKuc0ZTXdiAdfKGaO8bLvqJBFiy6xYVNcGgxPUp660aG1
 WFySlvX5h6Jn7eiy8v2ACOa3QhKgFCrKmhXY+GBAlEYkBxOaSHp6DTL5IwWYf2YZGY
 yDnsozatXjU2gB6zkVsTXbbZ9SKps7KCdP1/t1NAb8KPPkCUtjw/w8Qyj8R3J8w9jo
 LI/KL6J4BvL+Pm/NtMQG1pga6Eu4rehT8ENBYYHcgubcsc3wLGq1hQdrkf79zh5b8R
 N22nTxTMYCkOA==
Received: by mail-wm1-f69.google.com with SMTP id
 g77-20020a1c2050000000b0032ccc05989cso704005wmg.4
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 21:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZLbG+qup29O7pa3I3sT9lWunjud959dueLBGLyt7Gg=;
 b=ckiqa+KsNg/7XrSCA+t1Z97o/u+8URaWcL+fpNL8zsm6RFzblkPAqGz7mLXbG5TeQe
 mZwWhI3MkPs5QEgV7uyGi8gKoDM3nyhRc/co+UBdo5wI7YCXOZESY4qh+6QxatLPBoD1
 CHWMS8hJwaFJ18X/RoGqFJEkgVAp7LQK0ATV/vpJeMqbkONWuFFu8ShPnHS3JxLOOO8k
 y+PEg7emVJQtRe51LH6t49SFYpFQlm94gVvUTvMjHabKU9vFNmml+pv9RHE1bG/wMNgX
 1e+r+8DRynuRB4qTFFb4GWh83ngCA0IOYb3FxT0DiN2LF5+nnRO28tWUh62+/tnVnEn6
 Z2pg==
X-Gm-Message-State: AOAM531Qy0LffVbHTIcNE3w3GpZ9/t1w/1FmYVl4AjW0qc4w+bgxvgWZ
 UWoolhjpbKZMKPX45xNE7DfR8LzMxspIyAGLFQWEflhJk2Skyq3H2GvC9oah1CV04gqR/8mkAfQ
 +V4pq84kVVW9nlIndEbF/CHOqXNXDd+J/HLI4fjW2bWYZ9w==
X-Received: by 2002:a1c:e911:: with SMTP id q17mr3260833wmc.174.1635310727617; 
 Tue, 26 Oct 2021 21:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg7IteDGRbP/J7J7K13Z6DV5E7wAMFK7YSWsyBJTzgY5coRfA+N5jl6QLw37giV6SMkvlgDw==
X-Received: by 2002:a1c:e911:: with SMTP id q17mr3260825wmc.174.1635310727489; 
 Tue, 26 Oct 2021 21:58:47 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id o1sm11775586wru.91.2021.10.26.21.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:58:47 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/2] riscv: Fix asan-stack clang build
Date: Wed, 27 Oct 2021 06:58:42 +0200
Message-Id: <20211027045843.1770770-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_215855_950655_A8D2BEE5 
X-CRM114-Status: GOOD (  12.83  )
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

Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
Kconfig, it prevents asan-stack from getting disabled with clang even
when CONFIG_KASAN_STACK is disabled: fix this by defining the
corresponding config.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/Kconfig             | 6 ++++++
 arch/riscv/include/asm/kasan.h | 3 +--
 arch/riscv/mm/kasan_init.c     | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c1abbc876e5b..79250b1ed54e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -162,6 +162,12 @@ config PAGE_OFFSET
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
 
+config KASAN_SHADOW_OFFSET
+	hex
+	depends on KASAN_GENERIC
+	default 0xdfffffc800000000 if 64BIT
+	default 0xffffffff if 32BIT
+
 config ARCH_FLATMEM_ENABLE
 	def_bool !NUMA
 
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index a2b3d9cdbc86..b00f503ec124 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -30,8 +30,7 @@
 #define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
 #define KASAN_SHADOW_START	KERN_VIRT_START
 #define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
-#define KASAN_SHADOW_OFFSET	(KASAN_SHADOW_END - (1ULL << \
-					(64 - KASAN_SHADOW_SCALE_SHIFT)))
+#define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 
 void kasan_init(void);
 asmlinkage void kasan_early_init(void);
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index d7189c8714a9..8175e98b9073 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
 	uintptr_t i;
 	pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
 
+	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
+		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+
 	for (i = 0; i < PTRS_PER_PTE; ++i)
 		set_pte(kasan_early_shadow_pte + i,
 			mk_pte(virt_to_page(kasan_early_shadow_page),
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
