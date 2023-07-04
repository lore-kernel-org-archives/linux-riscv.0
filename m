Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0614CEB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HmZ+7POAOTBh//ii9kc892JrBylOs31UM6Btg5Mwbyg=; b=00aOgHpHzgzPff
	auqlHQc5ed6XA7Jb0op37Fmec3SWxfd63E3/SelRz3PFx/BnYmWV6UKIjmFH+XmJjRpvpuKSU2Q+k
	cz/zdrpRs9XtSjdU0CXNwMbKYzWRuTEqT55SKEfkpZiGCTKURmDSbiGxN60rOwSxMcrPkXFR5/Luz
	lUEwd3fZoYM7WNgd8gj7QG+0OzrdZ4969rT+BxjCwnegoBW4ndDsRiG66ELd+ZV5yhC0Inp3YiHN7
	7Vl6b44w5X4rRNAHY473tW82UCf1PLkqZU4ckRVrRQ9yGp+fkMZ5JJv/IkZR1yS3qTZCPufJx7tAA
	7USXgCHuSXJ34nBwBg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGezX-00DEiS-12;
	Tue, 04 Jul 2023 12:18:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGezT-00DEhg-2v
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 12:18:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-314319c0d3eso3089874f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688473119; x=1691065119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOxTf/FoItb3tkCzHBcD5o9fcnb2mULyauZWaQEOj5s=;
        b=GQH147pJZZd0uy7HRqLSeRD4MqK0jpuyx9VA/x2qMTyfs0Ub6QrFkCnJxE4twAFKzC
         a5aSjiBKFpA59XP+5bbH2d4OtmkjTWMAjvbtmWGtV3wTgvKH3W2dTAnVTpjf7V/4t3kV
         pPumyphSN6NXKU9sqn8t0HeTmk7l2f0kJebl/ZrbKHVFleZDdjzfpdQ/hQXLGF7N6DZa
         aLKts8Ebf7KY84NpVDqqCmlmWU70AppsltS+lagdNuSYYiK/xmVCRcyLFyayiXmOlyJV
         SDN7yS1GSSdkM9SaH3486h7ROcBzo+DMnsFao3dwAdAGDOSqeYPxVPL1zXec6Tg0SAf7
         57vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688473119; x=1691065119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOxTf/FoItb3tkCzHBcD5o9fcnb2mULyauZWaQEOj5s=;
        b=gmTdY2C0awI0aD3CnTPyO256jASDIrgLlpB6YdXT/xLsKBVQ5nm2IogD0mKSXetSh9
         hBlqvwUyzI1gcAGK9dlpjwiVDMhuheuMu7vFBB+Tpo6e3d1iBRiC6UwoVr1t6SsKFQ2y
         U86kYR3xxh9thbS+tJ+nDO4HtrFsc3tG5mQmEf+in2et1KHhz4tjlue0U4XBzyXISjQ0
         o+a+W1eiJbYcFZuLnqmMvlhPrfK5nHzoc67xBUjAj7MjDIEW25Gd6fs6AfbO2vk3aklR
         NrHD+Xeea/Q+njcGd/QBMEr2TFdOEtRNWeRZunH3v9sUBuGrKaOMfqg7srNPY7XHKRUl
         MTBQ==
X-Gm-Message-State: ABy/qLa/XBYkw6FaTfokNrF8LAQ1lIDLE4F3Njuh/4hwmZIv7cUUvxyC
	zdGCsxm/YC5OnB6yyvWcwSORjw==
X-Google-Smtp-Source: APBJJlHKVFGDj8HJUjauugyXiH1dEykKVH1qQGBxW8/WWijgQIiyPCS5d3e9pSEYj/z2DB72x0U24g==
X-Received: by 2002:a5d:6986:0:b0:314:37a9:f225 with SMTP id g6-20020a5d6986000000b0031437a9f225mr5409529wru.40.1688473119531;
        Tue, 04 Jul 2023 05:18:39 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id d11-20020a1c730b000000b003fb416d732csm22409679wmb.6.2023.07.04.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 05:18:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Song Shuai <suagrfillet@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping
Date: Tue,  4 Jul 2023 14:18:37 +0200
Message-Id: <20230704121837.248976-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051844_161756_A6D20BA3 
X-CRM114-Status: GOOD (  13.10  )
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

So that we do not end up mapping the whole linear mapping using 4K
pages, which is slow at boot time, and also very likely at runtime.

So make sure we align the start of DRAM on a PMD boundary.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4fa420faa780..4a43ec275c6d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -214,8 +214,13 @@ static void __init setup_bootmem(void)
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
 	phys_ram_end = memblock_end_of_DRAM();
+
+	/*
+	 * Make sure we align the start of the memory on a PMD boundary so that
+	 * at worst, we map the linear mapping with PMD mappings.
+	 */
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
-		phys_ram_base = memblock_start_of_DRAM();
+		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;
 
 	/*
 	 * In 64-bit, any use of __va/__pa before this point is wrong as we
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
