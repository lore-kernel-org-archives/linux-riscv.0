Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B49EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KA9x6m8HZAEcGBP4kt+oOSXuYAo6unrVd7H++BxHReY=; b=sZIUovdbMYOG+F
	y8gIq+4mzgJVZzab1+0hBYPso668mRqr2noh7VqzaP/JkbfpMrflSjWvJMOmXYg2L5NzHyShgGmz5
	6d1GhxxfxLNg2XUMNG0YBS/SjvODsoF7eCMge37P5x7ut4HmtxvAo2Dduw1zmq9B2hjJbelMtAc8e
	7TN+K8cALiucc6+46vE03diYQp6R9Xbm1wC+/88aSHg2zJ+nyQsJZv7bBvC7D9O8RzTkVIKD0gkvA
	tSqWM7PWw2ygl5adkp4IW9ZqyEl3YX9QuywppT/OL2w1hfaDAvff0twiWTnnf4hLFimA00sKnutqX
	VVQONcUCRype2fjocPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Fk-00E32W-1N;
	Tue, 11 Jul 2023 07:57:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8Fi-00E31I-0F
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 07:57:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3143b72c5ffso6259270f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689062260; x=1691654260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GXjLhe5TXUta+EXxk7AgfyYmiNiXB9g5OSSIlBPGEA=;
        b=jpjsGIvHWDXwtmenwjPw+yleh84wYF4Gde1Y36TPhdybnF0jpwSLd/aOo7CFMtSuDK
         ScyvlYS80l2vcQ9apidNHokPdNcKdGvUFOz16EWh6HyNXWzuR/QaMrKyDRVuWrs51yKx
         skZgZTUZjD6cFKSOYgb53UN64gLFvysjjqU8dLz9nE2+HJHAHGf48tinF7oqdJtBI4pc
         Et4wuuECz5m6cPYyXZRudVvVIj9AKfqmjpYZWVzHlfwOhzfYW2aebgP/Fu+HS+8C0bcV
         XDhilVqCMXb407/A4iXWplI1yIn5lQwUah0v2s5df1KU/cDtaR7kCadJjP9Y4QwOQKtB
         s4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689062260; x=1691654260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GXjLhe5TXUta+EXxk7AgfyYmiNiXB9g5OSSIlBPGEA=;
        b=bBZ6gl8cIGNfU2TkhNcONOi2374y85DhPv6qvACjHdV56KQpM1UaIu3hUlK9Dhr8NG
         tKPLYSpEs0XRcxI4ST0dvSn8FEvRCt/TtRzcINF6fgWNjCRGXxh4chQ2K9v9b57XuEhD
         WEXcGD1KmJFPcejs6/O/eXD+ECi1BQohwALyZWHru4Pbt00/a2Di3tDJsqmrnajw8mEZ
         vI8euSifaLls5FT6whruZyojJtcIyqCZCZOCzXoGe4Jw/NiDqFiZFKkLaf+8xA4OSVGM
         mHez8TuqpUEy7vb4Z3rTwasQwec9m/ai3w2AGiNJ8kIO+AMvP61PN382CeyCjnFm6y9X
         YeeA==
X-Gm-Message-State: ABy/qLYq1TR38oJfPSCCY4EiJySFfNJY/S2Tq8oKHmQEeIWdkCKrB4d4
	t/iwFs7CsOiOXacHkOGvzKKH+A==
X-Google-Smtp-Source: APBJJlFF+JXKqksjRHwPA1L44xQAHuT0wraSNDH0ZMzzf07N8OaPZzuThlMge3mXhbU6gGV1bjdvMg==
X-Received: by 2002:a5d:4404:0:b0:314:46cb:880a with SMTP id z4-20020a5d4404000000b0031446cb880amr18276011wrq.28.1689062260118;
        Tue, 11 Jul 2023 00:57:40 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d49d0000000b003143bb5ecd5sm1499978wrs.69.2023.07.11.00.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:57:39 -0700 (PDT)
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
Subject: [PATCH 3/4] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
Date: Tue, 11 Jul 2023 09:54:33 +0200
Message-Id: <20230711075434.10936-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711075434.10936-1-alexghiti@rivosinc.com>
References: <20230711075434.10936-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_005742_115669_027BA9E9 
X-CRM114-Status: GOOD (  16.31  )
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
index 3e4acef1f6bc..de61ecaa218a 100644
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
+unsigned long tlb_flush_all_threshold __read_mostly = 64;
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
