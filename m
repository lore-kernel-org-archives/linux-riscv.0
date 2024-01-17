Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C320C47DA2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFDjkyvXQi1NqJ3ho0cMRrPYNJXupEB4eDd7IeIVWqI=; b=mWXJ015nlC/a9p
	v5gNIvgduBzJP5Sdj2RJ9+RQqNUXbWBvZ2AAuY0um/LkW++BAAYdSq7q4PJhb4sxRJi+KoO2dqzTV
	AuG4hgJn0Zm+5efPKskPe/+VK4xiWby8UlZBkRL8ed0LES1li+ZpOu3AqH2tHnHoF7ZZYXe7GXQMQ
	rFi3HvuDvteUuoYM6dML7t3cfpUu9hoedcCXhE0KEbrKjHdiUazF+orpEIIFVsT6HMs6eWVi2MHuO
	QNGd8JxVUZYC9emyjj98cwTLs4RCCLqCFBdesohbuGhcnAdZ8b8hW5Nh8z7IqfKMMJMMH0a3obC5k
	1saI/T6Xabq61LdZatCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC4w-000Yyk-0W;
	Wed, 17 Jan 2024 20:00:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC4o-000Yx3-3A
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 19:59:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3373bc6d625so9718965f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 11:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705521592; x=1706126392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aqDc7wFhUblpWDXInFN43NA3e6m4V27astgceGCPPc=;
        b=tI9Hai+eZhZrwufvXEj8SwQtk/sXQmtI1wGrMVIuW4Wu3+eGyTaAnDMvG1860U9u4U
         Fe1yrxf0NpSzwCEvthRZyM1rrqqXaBGdjYP/bI3FRjqf3UklWG9nKn5zU+RvsNEzBOdk
         3zwKAZZvIZ7crtN1AccVV4MFwy6pWtEWuRye1Ziwxd6hrBgGn9upwrLKzW1+npa5a6pe
         l5/JitWobNRW95ourG02fE8AK0Yy2raVk8WbIrTh12xEl7uey8/TlOh+TY1mF+fx1CB8
         o8lf4yM+eDc/UGyoLEMA8+ySw1rTXylSxGbWBxrgxq6dv/4DhWGa242SlFEx4eUsuGiF
         F+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705521592; x=1706126392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aqDc7wFhUblpWDXInFN43NA3e6m4V27astgceGCPPc=;
        b=C4hfKSPUUPe748zCIdTFht07uRz4iFoH5AuUjPUNtXKnwNk1kXk+WDzaDqU7qMZlW2
         Tty6gPlk0sdZZSZWIebH5OXhMSLL07tGp8dTp3FXO9GIFeQznzxDKvbsygwiaOXJOMyB
         ii5VJK73GFWV7HPHpDuAcNNYkxrlBCx9OLg46bHwPca/NmYvnGDqLWhFvYuvmoLRQ29s
         QdlV40esjEYE1yHYvyBqBQ1ipuh2T+VytdamKuTtGBmBkjJDVRa6w95ZVsLBkYWyDhwd
         bgu66wx92yqfHwuu9/B0S2akBOF5smI0nY54pVWNDxzgy2wynoOyLKwk5ZEAYzpY3WBu
         1YLA==
X-Gm-Message-State: AOJu0YwVwjiH4MNhL9wBgg6tOd/HOJJN+DLkMrd5oSRBjXv017oiwCJn
	v4suYr9XRi0/AJI1/fKeZ/grmwvrlPP9SA==
X-Google-Smtp-Source: AGHT+IH/7y3jh4RsdypLFLgoZFvg4xOYBxfTQlbB2rSxLluKLmi1ibIVgsCqywHLSrX2RjCOL7MVgw==
X-Received: by 2002:adf:eb92:0:b0:337:9f43:93dc with SMTP id t18-20020adfeb92000000b003379f4393dcmr3455303wrn.141.1705521592223;
        Wed, 17 Jan 2024 11:59:52 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i6-20020adfb646000000b00337bc2176f6sm2350294wre.81.2024.01.17.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 11:59:52 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/2] riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled
Date: Wed, 17 Jan 2024 20:57:41 +0100
Message-Id: <20240117195741.1926459-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117195741.1926459-1-alexghiti@rivosinc.com>
References: <20240117195741.1926459-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_115955_021659_D178FF3B 
X-CRM114-Status: UNSURE (   9.43  )
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

When NAPOT is enabled, a new hugepage size is available and then we need
to make hugetlb_mask_last_page() aware of that.

Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 24c0179565d8..87af75ee7186 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -125,6 +125,26 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return pte;
 }
 
+unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	unsigned long hp_size = huge_page_size(h);
+
+	switch (hp_size) {
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SIZE:
+		return P4D_SIZE - PUD_SIZE;
+#endif
+	case PMD_SIZE:
+		return PUD_SIZE - PMD_SIZE;
+	case napot_cont_size(NAPOT_CONT64KB_ORDER):
+		return PMD_SIZE - napot_cont_size(NAPOT_CONT64KB_ORDER);
+	default:
+		break;
+	}
+
+	return 0UL;
+}
+
 static pte_t get_clear_contig(struct mm_struct *mm,
 			      unsigned long addr,
 			      pte_t *ptep,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
