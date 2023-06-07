Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE636C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5WY3DHfpbTfVXSdTu+/zwQwv+q8CqxAd0A4akxOj9uY=; b=ENFRe5AthqS1LZ
	2ASle4B7RNUWl0eftGycMQ1tjlmVLfw3PhUO6As7ZZfOXYqUv4eUfxVEITkZwiWz8jFCWbh/T7Zb+
	2UsSYm+oVNgPDzpDZOP6kYxsWWZXDlQam5rbiE1Arn5LO3YnXSih2pXo4Z5TSY8asRoOnTCbZ7cDA
	3WJfLAczgaba7S7zAuHX0ZjrjQudf1xcrlDSa9hR+2VEhHJCcA1owhuVUGhXJswMZ6HvHKESahZ3U
	zxn3t7YpDbjp0Ik60PX77EjCNj9rzWmJ2/nPKywTqDQrc4z9KSxRGpyOWcK+AQhNDsDfrDsq18n0m
	zrn2Yn30s+/EH2JTFNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6skh-005yna-1d;
	Wed, 07 Jun 2023 12:59:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ske-005ymS-1I
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 12:59:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30aef0499b6so5629205f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686142736; x=1688734736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJowdc9e59oB9wLZyR+086niExyuveZY6dunY32SgSw=;
        b=qYGg+N98bKzlnOSPs1w2WU3nsb+GHqRRgSHImrjk+cI7oLcG2JrvcdZENBR/LrxErj
         CJ03F5EweLHhwLn/VZG9dRqx8pnZmwYX1hsu4ZJvoNMwfYu4bLI6becMzNzZouVxOPsF
         DtM13TFnXRSQounOafPHJyFNSkuRogJ0byeSMwsOFxWckEdkJz6wZf97nGyE1QCgbIo1
         gibaGN5I6O5VTp107lFVSW0BKXnSCwe3172yaicz42X+MT7xGq/mLjyIKZtO8cSZUlzh
         JIvtwJEHhjhIC4vmIofAz6h2MWGZsRSD1ZR+B6l5cSLt4DISIxxFLtuQuPdoBgkbL0ZP
         z+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686142736; x=1688734736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJowdc9e59oB9wLZyR+086niExyuveZY6dunY32SgSw=;
        b=BRGSsKmWtH+iRLb0Cw0Oker0T/US1jZk49DsI8/1i0X97KRF70yfC30xeZZBWzebHY
         Izco05tJmcqEfXs/u+BSdLmxp7uZtC+Fh+YdepeOc5SpUntNf15Dp7P4TskMt1hzjVdy
         d4C6kHLVLxTJbUV3GvBni0LcVYiZzewyLSCsG2PmisDIA8yPjVP5FUv6tOsflsCUIo3A
         6OR3dujVw4wILlj90X/4d+BvkfRy75kffJYDWCg/0bIYpZQ03g0jETKGRnWQwiRsajE4
         JSk8+/PJ+WdTCk8aZXKKigKIg59uxt1g5ILAaYSlBHZuR4yeIEk/RCKSzU0VIv8hVI91
         1Tsw==
X-Gm-Message-State: AC+VfDwwa+1XynbUglOwBSYYOUMeEa3oP52v2EF3FK1BEoGHqr9XztZj
	GmjRo6OoqS2EHP70osvKiiMybA==
X-Google-Smtp-Source: ACHHUZ4TWTfgOEoFeZVMqWAp8ZN/koVFrf7eHsf6VrJB/pLXD1S4I70XGWbwV2qVsNa3FRrfijmKDQ==
X-Received: by 2002:a5d:558d:0:b0:30a:e00e:8af7 with SMTP id i13-20020a5d558d000000b0030ae00e8af7mr4621946wrv.63.1686142736136;
        Wed, 07 Jun 2023 05:58:56 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f42d8dd7d1sm2164096wml.7.2023.06.07.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 05:58:55 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH -fixes] riscv: Check the virtual alignment before choosing a map size
Date: Wed,  7 Jun 2023 14:58:51 +0200
Message-Id: <20230607125851.63370-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_055900_642697_1D4054B6 
X-CRM114-Status: GOOD (  11.15  )
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

We used to only check the alignment of the physical address to decide
which mapping would fit for a certain region of the linear mapping, but
it is not enough since the virtual address must also be aligned, so check
that too.

Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
Reported-by: Song Shuai <songshuaishuai@tinylab.org>
Link: https://lore.kernel.org/linux-riscv/tencent_7C3B580B47C1B17C16488EC1@qq.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d42ea31c7de0..5143eef4c074 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -660,18 +660,19 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 	create_pgd_next_mapping(nextp, va, pa, sz, prot);
 }
 
-static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
+static uintptr_t __init best_map_size(phys_addr_t pa, uintptr_t va,
+				      phys_addr_t size)
 {
-	if (!(base & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
+	if (!(pa & (PGDIR_SIZE - 1)) && !(va & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
 		return PGDIR_SIZE;
 
-	if (!(base & (P4D_SIZE - 1)) && size >= P4D_SIZE)
+	if (!(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
 		return P4D_SIZE;
 
-	if (!(base & (PUD_SIZE - 1)) && size >= PUD_SIZE)
+	if (!(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
 		return PUD_SIZE;
 
-	if (!(base & (PMD_SIZE - 1)) && size >= PMD_SIZE)
+	if (!(pa & (PMD_SIZE - 1)) && !(va & (PMD_SIZE - 1)) && size >= PMD_SIZE)
 		return PMD_SIZE;
 
 	return PAGE_SIZE;
@@ -1177,7 +1178,7 @@ static void __init create_linear_mapping_range(phys_addr_t start,
 	for (pa = start; pa < end; pa += map_size) {
 		va = (uintptr_t)__va(pa);
 		map_size = fixed_map_size ? fixed_map_size :
-					    best_map_size(pa, end - pa);
+					    best_map_size(pa, va, end - pa);
 
 		create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
 				   pgprot_from_va(va));
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
