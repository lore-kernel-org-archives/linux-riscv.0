Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E0DC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBrUpoxwr2NgcLYtSUFTK7svyqxuWBJFWRofjEdgR2s=; b=p2iyc//c83+gv1
	8ZDCay/kFc+AZQwUIA77Ew2kXCLCqxNflvm6TFGXpepDP510dE1/8M4bLre0u92HmIfZUjVksVX4/
	//mhEvl2h4/val/PzaDhIFWwWZgtUcc0nuH3S4D0PYwpbL+NJVyh/eOgOn7C9vvaPeSV4OU9lR7yg
	rWqLDbLy4EuSPjwJy4mY+aVd/S6Y/0GjZYRllWi/W0EP/pth+2d466p/m3Vy7DpTnfpVkB6Po7oYa
	toe27z6k03Vvsn/WLeQLPVpCwMdnWTQQEt7bECzgS74nf6pl531jpEV9Ml1M2+2q6vR85Zi9X9Gda
	LVpLmtG8wUEYoc7XioDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fLo-0000000FBSH-3YQ9;
	Wed, 08 May 2024 11:20:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fLl-0000000FBOv-2u8j
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:20:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-41b79450f78so28471285e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715167239; x=1715772039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM+WuwVvF178uIr+5Dc8IcJyYSbzDoUf3sQGwgQ7LEI=;
        b=kKAO2xROt2RCE8Nwsk5eA7q3yWjzS7LBQY22Jq0zrJE1k8IQ0usA2WaOlDPFRF71p6
         0YA/9BGnry2xUmjTF6eS7PFC3yb7s1vhvdzX5yB8l0raDpCSUNrEQH2u7tMdeG6H2tHs
         SiovOC3V4w10T03n1+WrcQ/jhHDb2mypTD/ABHY8ZPNOkVncB7zZzgea7XRk9SrdkwCN
         W6i5FzJYXh0/ZJi9cynKxOu8ZZFBkocGo8b3oC7+gUN/g5sJH/ohM2cVlal/JOMIZnwX
         4NAsPLyU5ua9gW+Xt0hnmotD6vvnFKxBPriBIrsY6BcNyfUrgo7cQiKmCn1FiOIpg2ah
         WVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167239; x=1715772039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM+WuwVvF178uIr+5Dc8IcJyYSbzDoUf3sQGwgQ7LEI=;
        b=COlEJ2QsOGnqsGhOdjAlPbAMxoTJkwJu4qnZP5YWLRampi3CpckBSqhjMufIpQ59od
         6F7cBPiRQFLG1mvPkQ/+97AmIRxby7Z8lm02gYAf0VMolMnRY0+UFi2ZAy9pVyMyNZgK
         9G+Zoyx4raB8dTzQOwxk5tOu/X1f/lmV7UX42SEmtimHnIEVUGPVpeXvhr+hKv2hCgtB
         uE7WXfAtRtAvA39csi7xG4JmtSn7eGjjfUIC7Hbn2Lf4CFuUa3wQzgtru8MgSioeA1/L
         Bk04VtvkFYHVL0XgInpCR6w9T2TWzF+wYkAOsi7PgaPEsWCUg8ouE4cVfI3z6i02VKGh
         Yy/A==
X-Forwarded-Encrypted: i=1; AJvYcCWcksldGdSoeZT5klW8530DcQsmJpa+RM74kkpORVgP5vNk8psiXfRt7o4jfa5begLWX0SBBT06953NJxBfifZ7WnyS6p2pBriYj20mB5mz
X-Gm-Message-State: AOJu0Yzvp37bJ6NoC58tWoeXUQiJKgKpKh+5T08Z2FTtt15SU6JJM05y
	wRpTD+np9XXq0qUEFaDymxu3LrQaAZTlYCBRYrMI8UmYQQl+8lo+dVO0qv5w2Ho=
X-Google-Smtp-Source: AGHT+IEtMJJRHnAlx2d7EmAnwEp8LMaoiRtpdi+BWrYkSsfaWBlt5vRm4skQUYamx6SwwnjaoJRU9Q==
X-Received: by 2002:a05:600c:1395:b0:41b:e201:eedb with SMTP id 5b1f17b1804b1-41f7269010amr20541325e9.41.1715167238957;
        Wed, 08 May 2024 04:20:38 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87c254f1sm19678785e9.14.2024.05.08.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:20:38 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 2/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Wed,  8 May 2024 13:18:22 +0200
Message-Id: <20240508111829.16891-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508111829.16891-1-alexghiti@rivosinc.com>
References: <20240508111829.16891-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_042041_862746_35992346 
X-CRM114-Status: UNSURE (   9.45  )
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

The pte_t pointer is expected to point to the first entry of the NAPOT
mapping so no need to use huge_pte_offset(), similarly to what is done
in arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index fe8067ee71b4..f042f5c8bdb7 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -274,7 +274,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
 	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	ptep = huge_pte_offset(mm, addr, pte_num * pgsize);
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
@@ -319,10 +318,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	}
 
 	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	ptep = huge_pte_offset(mm, addr, pte_num * pgsize);
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-
 	orig_pte = pte_wrprotect(orig_pte);
 
 	set_ptes(mm, addr, ptep, orig_pte, pte_num);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
