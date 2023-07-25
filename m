Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1CDC001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1lTqSWOQ6z39Dzrqm18Ok+uk8ZLkcNJVh0oZYoiP/5A=; b=Cc9lZjqCp8sgjA
	E2ex9bgAsPZny6ycXfvsGenmxASmzJdixRxPvo3SEWkLoTbYhfRyJUIyfhunEJ6z1RlxL/FyFT5ul
	Ok+ZEH6cGVVcjKls8dcETUTmyAiUpv+TS8ME2SAN866alSJC0SFUKNFgQ9c9Y9z+MtfkEx5jvZG7v
	hQaV5pKYvZB3usQG7uHmvArVkzgveKoDm779m5B5FXVGgvXKmTsb7WV2lkHqNbPDmOdRmjCsvVkTu
	q476cSG24FrGtabcWGRGJkRdpcIuwX9z2f0DzE3MdwPatmhKmQdKEkwqgIfwEW4ExRbmogz2qetY5
	ISpepujjf9YOT/G4zCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOI08-007cm3-0k;
	Tue, 25 Jul 2023 13:22:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOI04-007ckQ-1e
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 13:22:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso4241227f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690291369; x=1690896169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwtTaSSywQCK+6eOzMzkFHCbywbdbCbQr7TZ7zLckhk=;
        b=aq8K6g1kNKVAXaB8qnVBVyLtEJCw6IO9Lv2x7L+0ECjGDne7M5Bm9519ngrBxeqQOv
         P59gcWCHJNnmhX7F0a3wa7Ho1ZNxKBoJaw+CysLoZCTpXK2QdmTNZzDeXjLmLW0ppoZy
         pPCkH29ysNp0p00fnqjBum/pmRXmF9UAN2eP3AEBVngA4SBk71IAmXTemgIbgN1WI91w
         eLn3KC73YZHADqy4+YlpcAYcgU11lgBS9erwG4oQt8lZ7vSlV9gTmQvVQdaEp93sCAxY
         MDbTSjFY6VdjH+Q/03QJQNo38iSo6siDDgds2H/QPrAIM2Sc8XuAow5pPL7nxy9Sq2bc
         RTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291369; x=1690896169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwtTaSSywQCK+6eOzMzkFHCbywbdbCbQr7TZ7zLckhk=;
        b=HQ6aeOsR4UchCGvKIuEQZWyoqK72E55UhMbFOTg+fYBHa8ynGm3lE0uSJrerCyGGaU
         hPOUyZFFlnmGww/hpOwpPhKJu85IUQ6nFHGRM3lqkF4bYPDaYeCAuRIzQIZjGsYQzQjn
         q4RZs/y1Q76W/n6b1mqgXrXweuMgo5AW92JRpLnwJ0wnru4y7d53Q4sfaKamoDtJCrcM
         oHIWhV7HhwFWR8DRQswIv8aEco/wvjO9E2/HRnrWNbhAX0kIS+DHcuovLlZ/WJh5/VUx
         tEX9pzHE3swUe7xB6I6HQ6P6lVaGYA9t50mvmzYrVvPl4bXIukzz3rfNl2zYioceW42j
         v3Ag==
X-Gm-Message-State: ABy/qLYyXQxUII8GtIx7PYpVWw3iWvPLKJ8ltRN9AerD9p+XpCUfzw20
	nJFsdkCNazYaJ7lgkwMFs+P3qacZ+AaG4e+iWqo=
X-Google-Smtp-Source: APBJJlFymLrBaWWUbB5UjgLpC16CJw07bX0IHX8fcMSRniPWmXOiT8czHRNEnE1IFY6cpux2ayWVRg==
X-Received: by 2002:a5d:53c3:0:b0:317:568d:d69a with SMTP id a3-20020a5d53c3000000b00317568dd69amr6197749wrw.11.1690291368309;
        Tue, 25 Jul 2023 06:22:48 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b003143c532431sm16175035wrs.27.2023.07.25.06.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 06:22:47 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Implement flush_cache_vmap()
Date: Tue, 25 Jul 2023 15:22:46 +0200
Message-Id: <20230725132246.817726-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_062252_732562_15DE4889 
X-CRM114-Status: UNSURE (   9.65  )
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

The RISC-V kernel needs a sfence.vma after a page table modification: we
used to rely on the vmalloc fault handling to emit an sfence.vma, but
commit 7d3332be011e ("riscv: mm: Pre-allocate PGD entries for
vmalloc/modules area") got rid of this path for 64-bit kernels, so now we
need to explicitly emit a sfence.vma in flush_cache_vmap().

Note that we don't need to implement flush_cache_vunmap() as the generic
code should emit a flush tlb after unmapping a vmalloc region.

Fixes: 7d3332be011e ("riscv: mm: Pre-allocate PGD entries for vmalloc/modules area")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cacheflush.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8091b8bf4883..b93ffddf8a61 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -37,6 +37,10 @@ static inline void flush_dcache_page(struct page *page)
 #define flush_icache_user_page(vma, pg, addr, len) \
 	flush_icache_mm(vma->vm_mm, 0)
 
+#ifdef CONFIG_64BIT
+#define flush_cache_vmap(start, end)	flush_tlb_kernel_range(start, end)
+#endif
+
 #ifndef CONFIG_SMP
 
 #define flush_icache_all() local_flush_icache_all()
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
