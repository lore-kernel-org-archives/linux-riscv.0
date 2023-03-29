Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E5C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w0vmHm5cDGPGs+11OuD138RYDO7OcYXprusXjQdZmk=; b=z4ldVVPP3bDv3M
	8dkndZmrDskYm2EQRNHQcxDJaDJ7No97gwReTIeM9X3uGYWDRUgCdPxvwCl1PT8IXox4/QFA5n4aG
	KlPN24JQVJ5DORlZHpgbwXGYEGlSYon2JO00G4eGdV3nmQE2VsikS1LokKWeN6LjPP/l4tZWuH+Wu
	9uH6SaETbTdTLWg1he+UFbH/plYshFyaU0R7rBROUyqUGdUP0xEYsF4eN2Q8uDg91kQkFw+iUIJoA
	f0KhGFyMkKsw74ARt7Fl5clD5QkGzxpwWHaUEKjrm7cTRb/0S690LsidhnGDPxy78VgD6IHhjTwsK
	JNkmJUyDqHjkQdA5G4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phR4t-00H5yu-1V;
	Wed, 29 Mar 2023 08:22:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phR4r-00H5wu-0c
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 08:22:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m2so14755282wrh.6
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680078157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkd1yySkMZCjQpFk/I00/AFBZMzwvjb6fzx+RcYU4u8=;
        b=h5xChJSmqqdKg1QSgQom43LhcMDU0XiEsWSGiNAEWStm39CVorzpPFv0ONnnnIzsF9
         Ty9fCdH2xUz2wOZR3NKor67Qdex16pDFGgwBHihecdqsxLGSk+HTgbwfoT7RYQekKSxu
         SbmuwSNFsjGFqHbtDD6ksJRWX27fdpcnLkWqD3UW1R5E7gBu7qHO15F//p+2aDSW2ZPJ
         3XfGMZn7kWWzAn00jE4Xlv2bopw4A0wydAb2rWVMI7SGd4F+bM+QTGAHlxcNNsqJ80D2
         U2GBrATYMSRGj1vmfr96jLrF4tREftjHjgSGNdVyO36HJXh94p23JlkJWCxZ3yplJUqT
         117Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkd1yySkMZCjQpFk/I00/AFBZMzwvjb6fzx+RcYU4u8=;
        b=yJT09n0PbMIGx4wlpVknRomjh9cPnH9uUgziEOgjstxvtEd7DDeDRPIXNn18b5dmrk
         uMTqWiu8GMtc/QmV+YpRoSZxa7HIEAXUvsB6AioEKWs9O/tysOzqmu2H2lT6IbJXwQC5
         o/7xJfBafNNob++uJ9LPaEhrnruAxBle6vgzigcnNl82uO8eneN55QPkrzzq6ZqvSoLQ
         kDLnG/4dtt1DjTdlXPJvF325mQteMvJa+CTPHVifDX+oSwBAY1Rhxw3/ZEkTm2/iR8nm
         SHCJy1gaYovVChmw0Qkg9T+KnzBjVDGlN4rGpSjTCbQX+zTSra0OJkUkEoisGTDDF38p
         8XxA==
X-Gm-Message-State: AAQBX9eM/nxTo7ij6Mcr236G+Ri1dWSnHmePw2h2vyF+W/1F5/i9cu/x
	Kj69q3AxoqntGurstuEwlO+jtA==
X-Google-Smtp-Source: AKy350ZkffXk96u2+42Qo7i7ZWXLM9FtJwE6V4RF+IY/ajIq1EyS7UxT/cCOOkgZrg6bEngki+QLiQ==
X-Received: by 2002:adf:f8c2:0:b0:2c3:e7d8:245c with SMTP id f2-20020adff8c2000000b002c3e7d8245cmr13699207wrq.13.1680078157521;
        Wed, 29 Mar 2023 01:22:37 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6082000000b002c6d0462163sm29468263wrt.100.2023.03.29.01.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:22:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes v2 3/3] riscv: No need to relocate the dtb as it lies in the fixmap region
Date: Wed, 29 Mar 2023 10:19:32 +0200
Message-Id: <20230329081932.79831-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329081932.79831-1-alexghiti@rivosinc.com>
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_012241_227716_59A01F5A 
X-CRM114-Status: GOOD (  14.92  )
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

We used to access the dtb via its linear mapping address but now that the
dtb early mapping was moved in the fixmap region, we can keep using this
address since it is present in swapper_pg_dir, and remove the dtb
relocation.

Note that the relocation was wrong anyway since early_memremap() is
restricted to 256K whereas the maximum fdt size is 2MB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb78d6bbabae..0f14f4a8d179 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -249,25 +249,8 @@ static void __init setup_bootmem(void)
 	 * early_init_fdt_reserve_self() since __pa() does
 	 * not work for DTB pointers that are fixmap addresses
 	 */
-	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
-		/*
-		 * In case the DTB is not located in a memory region we won't
-		 * be able to locate it later on via the linear mapping and
-		 * get a segfault when accessing it via __va(dtb_early_pa).
-		 * To avoid this situation copy DTB to a memory region.
-		 * Note that memblock_phys_alloc will also reserve DTB region.
-		 */
-		if (!memblock_is_memory(dtb_early_pa)) {
-			size_t fdt_size = fdt_totalsize(dtb_early_va);
-			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
-			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
-
-			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
-			early_memunmap(new_dtb_early_va, fdt_size);
-			_dtb_early_pa = new_dtb_early_pa;
-		} else
-			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-	}
+	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
+		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
