Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1084C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDhRUiItKkGpps0WUcqAlolJKnE9Mzb2/HDCkk09X+I=; b=MOqxwymwwfAjYf
	LPJjcz/m+rSRjxoeedZDyQPpoC4DmSNXzSDSfviN/HllbEnHP+KqZ8uVL8LyavpmhHKpBSy+DwNP/
	rZA5VUhs/mzOXB40zXRn1/pXgqpI9wWQgEfruHMS0oNenyrUuzo9wmFMH7ewpko5fEUVbwIClZHJq
	HgrSuj+2RJC5W/+xG9HaGsrzWcRxrBKxmfKerBPZUdb6zCT/v+fLCXSHBDQIlHnxxo31MiAGmXBtG
	gxYyHLhPlPvFlkbSpB7MK9rmgiB92hLqZsTv7HPXMQh3rfU8W+84v7oIO0ascEizfXJ/4nUbptzo6
	dgfaA88U24NaaWFm7Sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fB-003xVZ-1X;
	Thu, 23 Nov 2023 06:58:13 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63f8-003xTN-0q
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:58:11 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso511078b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722689; x=1701327489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LItBiu3njgwOLf534DBFrKwLVF0r3rYUowPJh3TGf00=;
        b=REERRMXFt1KFxF6U5zz2z+MWy+D7gu8zSJqNaP5U5Hg+1M9e8KVELh2DwUbG74mK0P
         dmm+CIYyJbqxANvHhAo63B4rrqZ8K0T5gcYk1FC9MGZbC50fdAaOdPit6yWv9FDaP8+9
         Ll6AG82jfpIppXoXd1v7OHuN5GwpbZcS4H8iGc19YBSfhMY1n1H8lQQggfLI0dVvpzp3
         cNXfJfUpCWP+Fffg/8yLMAT+QoEqNV6qu5ilaAkpNnsV3C1SG/Dv/yKOlN0LtYg5JAE8
         6lwZ4ikrK4vPfitru4RXGlxJXtjBiwEC2KAeqLfDjCABYlgj7n0l4RC9l981aeb5i6MK
         UWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722689; x=1701327489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LItBiu3njgwOLf534DBFrKwLVF0r3rYUowPJh3TGf00=;
        b=H04/SA5OyLo3F1/s2cPvkQiikyEF9rDGf6153OJsj8u297888Trhot1TAAHfNSXJuq
         h/tqMBAUDdwEpnoOCZhEfllBnbJd7qiRkvo4QmXF0ODgSXfD0Nm9oG269NGCpmct4A6Y
         lGXsEBknpVyOs5aCpuV7iQAIAZw3WAYUpgwa8DIMdtfR72n/f5R34kSk+sswX1N3YRxZ
         bQoFhITSBp41BkMKmLC6qKSavAQ03X8oUzK5xC2g3B4e8fRWGIktVBhcicuJ8gCPtqiH
         Z6OqXIuvIJDtA3IARSI9AJ0UW8NB8TZrfQ+DO8pL54rXYEBJGA5DJEs5VF+oEvpRiVrS
         s1rQ==
X-Gm-Message-State: AOJu0YwcGUF4Mz0RB/jcKM2T2kLRqCP2L+7yfITUxB0CGdwHlOXnxvK6
	jMkCBP2D6JXbSUMl4gq6UXXqxg==
X-Google-Smtp-Source: AGHT+IHDftjTLrWgyN3MNpT75XgaN32WdbFQKAWGC+MLKZT2N1z3VTeVkMs+OclMTvua0pcY3LDEGg==
X-Received: by 2002:a05:6a00:35cf:b0:6cb:8c70:4790 with SMTP id dc15-20020a056a0035cf00b006cb8c704790mr5824334pfb.1.1700722689341;
        Wed, 22 Nov 2023 22:58:09 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.58.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:58:09 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 08/11] riscv: Apply Svnapot for base page mapping
Date: Thu, 23 Nov 2023 14:57:05 +0800
Message-Id: <20231123065708.91345-9-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225810_317343_DF6C3BAB 
X-CRM114-Status: GOOD (  12.05  )
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

The Svnapot extension on RISC-V is like contiguous PTE on ARM64. It
allows ptes of a naturally aligned power-of 2 (NAPOT) memory range be
encoded in the same format to save the TLB space.

This commit applies Svnapot for each base page's mapping. This commit is
the key to achieving larger base page's performance optimization.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 34 +++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 56366f07985d..803dc5fb6314 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -230,6 +230,16 @@ static __always_inline unsigned long __pte_napot(unsigned long pteval)
 	return pteval & _PAGE_NAPOT;
 }
 
+static __always_inline unsigned long __pte_mknapot(unsigned long pteval,
+		unsigned int order)
+{
+	int pos = order - 1 + _PAGE_PFN_SHIFT;
+	unsigned long napot_bit = BIT(pos);
+	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
+
+	return (pteval & napot_mask) | napot_bit | _PAGE_NAPOT;
+}
+
 static inline pte_t __pte(unsigned long pteval)
 {
 	pte_t pte;
@@ -348,13 +358,11 @@ static inline unsigned long pte_napot(pte_t pte)
 	return __pte_napot(pte_val(pte));
 }
 
-static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
+static inline pte_t pte_mknapot(pte_t pte, unsigned int page_order)
 {
-	int pos = order - 1 + _PAGE_PFN_SHIFT;
-	unsigned long napot_bit = BIT(pos);
-	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
+	unsigned int hw_page_order = page_order + (PAGE_SHIFT - HW_PAGE_SHIFT);
 
-	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
+	return __pte(__pte_mknapot(pte_val(pte), hw_page_order));
 }
 
 #else
@@ -366,6 +374,11 @@ static inline unsigned long pte_napot(pte_t pte)
 	return 0;
 }
 
+static inline pte_t pte_mknapot(pte_t pte, unsigned int page_order)
+{
+	return pte;
+}
+
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
 /* Yields the page frame number (PFN) of a page table entry */
@@ -585,6 +598,17 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  */
 static inline void set_pte(pte_t *ptep, pte_t pteval)
 {
+	unsigned long order;
+
+	/*
+	 * has_svnapot() always return false before riscv_isa is initialized.
+	 */
+	if (has_svnapot() && pte_present(pteval) && !pte_napot(pteval)) {
+		for_each_napot_order(order) {
+			if (napot_cont_shift(order) == PAGE_SHIFT)
+				pteval = pte_mknapot(pteval, order);
+		}
+	}
 	*ptep = pteval;
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
