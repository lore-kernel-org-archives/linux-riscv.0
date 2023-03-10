Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DFCC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvuN+BvigCwXsWBp0hMU5ptbYimtvY3ZlGFJhrwUKHE=; b=LVr+3axpMPIfne
	++MfXLzV3ZgLzqZAkEVDmE4d1CYKzFnis5z8kliLO5uw+wp0LZefY5S50U23tuYpCxQ4/d0tMwaAr
	XTI6qOHvj1bqDj16p4AenBxWUr70gk6soMjiw0oxw/6hUif56yEnLGk79416NbRHs02356JuYoyjD
	QZlpxTDI8CKDYvHiMxbIqwA19LTaZHZtjRlVBYKhRb6PkGitWDGqkyl+l0miNwYXktdnmGF6DKiJI
	5rdeR/6mvMH0nHyi9iWDnVWLfeLxycjaWo1VKLkp7nJJFs/9+TqKYa6ELfCbmI5gTJNgGLNV6NCUV
	YKWmpvt5wKIosSasXaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZN0-00E25w-OF; Fri, 10 Mar 2023 09:49:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZMo-00E1zU-Pv
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 09:48:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso2997944wmp.4
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 01:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678441727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGavHCNEAmB3AhZu0LKzFHubCv5xCdNflVD0ekR4UY0=;
        b=nEDaPnA8Ty4PvBzODbwL6B2sTto11mRsb4Jzs2H7G9p6A7ZKSNrhnk3x4BOWFO5NAM
         I/78Se50og1itnoiMPakGj3AveG31x2j6/j/50CVZh8lwbX6MQDYxcf8yYxVJoMofzOn
         So11W4KjPW25NSlFIH8QkPFlfV0uo7dzOyl980DN9KkNz+cd36ioi6QDF2EBD7bd5PyU
         POxxiU/fHG2HLQE58X+B7ZTBTf7m1Ez0P/WNGhmIjfMIHPth9RdlR4D0u/Oxg4pQMLp3
         2eK+lEAa5joep7xYw4om/Il1YLWfTzdepO6+BmZdGMIWNwLKWLRg8ZeFmMq9uBF+PfuR
         4knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678441727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGavHCNEAmB3AhZu0LKzFHubCv5xCdNflVD0ekR4UY0=;
        b=wzIJb2yddPVwKakfMT+w/k7pE9n+BQ7EkLDjprJ/bfaMydYrTpO7lc4unM/txZsM16
         F/ZWYJEMykq6WtWy0ZTTP6QmGzRFYBKTzKlpeLK0m7fR5uLiGMp0kUzL62LT8G4SaK30
         UZSEQ81NQ7T48P8mOCZv1b0zyQhm2pW0wDJz+u2p3m8hInoicgyYdx2YC82UWzUBqYft
         0we+0eO1OCFa0Zi631o2iaSxJBoyOR0iny0AZ9sypFso2XmNNwxyvOQ/9JbKFG+nFxpv
         bQ44VoYALC85yLDAHhtioRz6DYpJiBjUYCV3vaO6ihMA40sQQcOLkPCjHVDTOZgkHDzC
         w40A==
X-Gm-Message-State: AO0yUKVODne29GUGZ2dMnVJMyAFgNqTtg9Xl4L97ONAWNus6CR0FNBAc
	kyzRe7pFSuIg7VRolyM84FQHww==
X-Google-Smtp-Source: AK7set+y/rX3YhT007UnAYJB6sfLfhyhEqqnKFykNxvLHTsOstaKSQULB4uzAM12oQybO0ImSo5iuQ==
X-Received: by 2002:a05:600c:b8a:b0:3eb:578d:ded3 with SMTP id fl10-20020a05600c0b8a00b003eb578dded3mr1976475wmb.35.1678441727129;
        Fri, 10 Mar 2023 01:48:47 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003dc5b59ed7asm1572826wmi.11.2023.03.10.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:48:46 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 3/4] arm64: Make use of memblock_isolate_memory for the linear mapping
Date: Fri, 10 Mar 2023 10:45:38 +0100
Message-Id: <20230310094539.764357-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310094539.764357-1-alexghiti@rivosinc.com>
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_014850_878492_DD307E7B 
X-CRM114-Status: GOOD (  14.83  )
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

In order to isolate the kernel text mapping, we used some sort of hack
to isolate the kernel text range which consisted in marking this region
as not mappable with memblock_mark_nomap. Simply use the newly introduced
memblock_isolate_memory function which does exactly the same but does not
uselessly mark the region as not mappable.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/mm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 6f9d8898a025..408dc852805c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -552,7 +552,7 @@ static void __init map_mem(pgd_t *pgdp)
 	 * So temporarily mark them as NOMAP to skip mappings in
 	 * the following for-loop
 	 */
-	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+	memblock_isolate_memory(kernel_start, kernel_end - kernel_start);
 
 #ifdef CONFIG_KEXEC_CORE
 	if (crash_mem_map) {
@@ -568,6 +568,7 @@ static void __init map_mem(pgd_t *pgdp)
 	for_each_mem_range(i, &start, &end) {
 		if (start >= end)
 			break;
+
 		/*
 		 * The linear map must allow allocation tags reading/writing
 		 * if MTE is present. Otherwise, it has the same attributes as
@@ -589,7 +590,6 @@ static void __init map_mem(pgd_t *pgdp)
 	 */
 	__map_memblock(pgdp, kernel_start, kernel_end,
 		       PAGE_KERNEL, NO_CONT_MAPPINGS);
-	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 
 	/*
 	 * Use page-level mappings here so that we can shrink the region
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
