Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EB6C04A94
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf80ksYXnvNCBktgK4vWXGukX5x0+wihZBeBIZ9t/S8=; b=XL1odqgXGd9b7Z
	C494VoflCp69QYCH+UXitlDEHI23j06CZsaZobW80GL8/ZrTyEBl/taogdxCHpFolr2spXvVj9a7+
	+vK+nfG0gSef+NWU8qduJzE/Qhzty445Ea3CMNQFPxZrwn1GWDdSz43cia2wKNl7XsNyTBPk8Ehjn
	wPfdmkEJu56IbG4kOaFiF75y6AmGkg+eFqHtrck2mc/YOVClVB/VbxD1qFodkImL3oanVilnVTFIT
	p53eKKD9wkdw5W17bs2xiVwFd6INs/Mfo48Rwgm21/iBjmWF4U25mw433qaff/I4Rakp42zD0hqcE
	Fu0x8wfyzBCS9hkvNbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6Ce-000F6a-1W;
	Thu, 27 Jul 2023 18:59:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6Cb-000F4l-0C
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 18:59:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso14148005e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690484344; x=1691089144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDamHVk4ujUG+CHbAQWQotzld5TgznJ3XAxjQYSqNSU=;
        b=IdGa66UtIIFbYYRT34X7nXZCEdzcXTUXP42pHU+fRDakhGzxioo4R0X4pMQHNU3UvT
         cb6zYYiY1GSCrHL23POq5GqGsmx16xdh+ORbhy0jbLlh3508NDq2BU8MNyVptXqxHU3m
         z6Huh+dgLHgTmMh6/GFFtZgMKDfLTF/lLUhuu6lFFzZ5FfNz2M+UalL7Nxy2wcTt4Urm
         vHdUKMcDMqL0Rjs+nJEbZgdzu00ikS2T1OAVYH9IyrUU52fcpQTId9PDN+EBqrinVVD3
         YmbFuFktcTPCtmoQ7c19/s3iT4UVf0BCy+pzRa9E9o/mm8ujQqggxhdzJL4AmSxTKYKG
         +0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484344; x=1691089144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDamHVk4ujUG+CHbAQWQotzld5TgznJ3XAxjQYSqNSU=;
        b=bW/yjsfPO+WDs6dnJXcR22N29/TnU1eEBHaNA2ejcW/a382pNf3OlpK6zaHlvXtcjM
         OB6+++AuH8P4h7yvDS3R3Oa2uQacoId1VZ+meDDuBSnziQpvFlBpb5VMs7SsRq3xKc7c
         T7Kqoh/4McEnBwr48crcvYGTAtvuWYM0uVEffUTnqpZUdpQLXBP2iOCLqZRVVF1alQy/
         vLIwtFgo1ZCNYZOR5ZIhRlOYApgHytc+t3ZfWG/Nvbp//aZ08R4RWAxm8XDVzGu/cFC1
         s6BOZQEziD44B+wlgvHNKxmSI3fZN1X5u3k13rnpywAiuL01pPXIGiPBxf/vyf4PMpW7
         mQVw==
X-Gm-Message-State: ABy/qLZhbmK/PsLdKUcsqxlw3yLbPxp6TK2JoIfrIms+oI8MNCXO/CZl
	Ephqp9vn40pAXkD+QRdxp4ArsA==
X-Google-Smtp-Source: APBJJlHhcGHjdWFgZg+N+yKc2Y2lhGlFYBwO6VQdAW4Af4g86WHeGB5c7zLJbHluWyguraWCOhnK6A==
X-Received: by 2002:a05:600c:aca:b0:3fb:a937:6024 with SMTP id c10-20020a05600c0aca00b003fba9376024mr2398881wmr.29.1690484344310;
        Thu, 27 Jul 2023 11:59:04 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c22c200b003fa96620b23sm5376517wmg.12.2023.07.27.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 11:59:04 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/4] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
Date: Thu, 27 Jul 2023 20:55:52 +0200
Message-Id: <20230727185553.980262-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727185553.980262-1-alexghiti@rivosinc.com>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_115909_097156_62C82367 
X-CRM114-Status: GOOD (  15.79  )
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

Currently, when the range to flush covers more than one page (a 4K page or
a hugepage), __flush_tlb_range() flushes the whole tlb. Flushing the whole
tlb comes with a greater cost than flushing a single entry so we should
flush single entries up to a certain threshold so that:
threshold * cost of flushing a single entry < cost of flushing the whole
tlb.

This threshold is microarchitecture dependent and can/should be
overwritten by vendors.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/tlbflush.c | 41 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 3e4acef1f6bc..8017d2130e27 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -24,13 +24,48 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 			: "memory");
 }
 
+/*
+ * Flush entire TLB if number of entries to be flushed is greater
+ * than the threshold below. Platforms may override the threshold
+ * value based on marchid, mvendorid, and mimpid.
+ */
+static unsigned long tlb_flush_all_threshold __read_mostly = 64;
+
+static void local_flush_tlb_range_threshold_asid(unsigned long start,
+						 unsigned long size,
+						 unsigned long stride,
+						 unsigned long asid)
+{
+	u16 nr_ptes_in_range = DIV_ROUND_UP(size, stride);
+	int i;
+
+	if (nr_ptes_in_range > tlb_flush_all_threshold) {
+		if (asid != -1)
+			local_flush_tlb_all_asid(asid);
+		else
+			local_flush_tlb_all();
+		return;
+	}
+
+	for (i = 0; i < nr_ptes_in_range; ++i) {
+		if (asid != -1)
+			local_flush_tlb_page_asid(start, asid);
+		else
+			local_flush_tlb_page(start);
+		start += stride;
+	}
+}
+
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
 	if (size <= stride)
 		local_flush_tlb_page(start);
-	else
+	else if (size == (unsigned long)-1)
 		local_flush_tlb_all();
+	else
+		local_flush_tlb_range_threshold_asid(start, size, stride, -1);
+
 }
 
 static inline void local_flush_tlb_range_asid(unsigned long start,
@@ -38,8 +73,10 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 {
 	if (size <= stride)
 		local_flush_tlb_page_asid(start, asid);
-	else
+	else if (size == (unsigned long)-1)
 		local_flush_tlb_all_asid(asid);
+	else
+		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
 }
 
 static void __ipi_flush_tlb_all(void *info)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
