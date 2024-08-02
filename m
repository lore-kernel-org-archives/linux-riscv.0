Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E9C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woVTLCWPTbNjUwt1e6fz+gqM2HazmtNFdMz/pHjJKmU=; b=G39/ZsMNcA2ufN
	OIYr2sqNKKQbhRc3oXFXFc8E3yxSz9LLpIwiQGx6IoEtBa2tEy3XQitktzoHALOLmezBOObv4FVur
	7azQEB+AE6Qzl/9uMKmJBcDVw76+emU2hUwuc6Mek4hloOUL0xRIspJw/I6bmdw4E+/5uasu6dIp4
	hmMrWm0eYnxVdviLc1uoh2KqwHPm4bMIVIv0ttg6yWoT7+OsWbHTNpBTCqVdmowndKI1tyQ7kFfCr
	JsgtqrenJVCAvr09JzGfy0qSmiDGpr6KgC4W9yllXsgSORnV4QQaOKmOONxL9rt3P0HvmJsTERklO
	nsUhFDGUN+1aXOVK49Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu0n-00000009Ctw-3Rv1;
	Fri, 02 Aug 2024 15:16:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZu0H-00000009ChE-1k18
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:15:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so73405715e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722611735; x=1723216535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=;
        b=lpNPL9YbZ6FHKRz84ETmrKbs8sKXBtkUkFIZsvnrcZ9TnaDqbgD4C9uypSMeoWkm3A
         nVHIlWFyANK1NZa4K4GLJTzt7KIsQrS9Etn69O8XAt4jN0FvDbhvejve4Yrl/m30BHCp
         mmBinTbjHvmTKAR1i2A3ktvRuF9OEOO0VeKt6XO8+spVndNbYE5Zf6JZjsVtoi1i1yJO
         qJg4UBiv77vF/+1GKmAIcNRS1aq5E7gOk2Q1q1TmeageLbVqpG4Qpk6qr+mRjwXNlQ8b
         tXSfZqVbXbCbgjt6lp3Yrij6Ynzf+OQhQIkaSFWB3BeYBl7g09xnl0tYJBdWDFIrN0W7
         s58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722611735; x=1723216535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=;
        b=SeDlY47J77rHGBbkC0BMnOijfVORGKsn0prFbOc5lZZ1yMg/8AKGq1AczDtzlF1WmM
         OZdxYwuMknNMIK0XeKmTWrStWkzS3BJ+KEMyt62D6WE67TEpYW9s9Gt4b3HIB3pqndbo
         5R/77ZXfIaZxrmzajc9fKqI/Uix3lt6w11biSHSYDqPhOKQiKUsuUP4AVRbSpxZnIo5h
         QjlPqHV5JF8fbdvcl9Qb17aUTHxX/zyUm8MO0lGhX6DtpNt0/SGdwoPrswHlp7xlU1mK
         o9rQ9DNQElL/USQEnJ7MEnnBLDpL0NLDiY8rL+WJvjVInR7NeE8h+83oKQt4KQJd9I3d
         Q0gg==
X-Forwarded-Encrypted: i=1; AJvYcCVlugx9rC/mIWZ6YnKBhsf9EdicNiqA89/By6rsdiwD6srL0v6t7nBYYPSRYcbVCxDLryZb3fi72dlzlGYVxEcslM7C/VmyujYa7dpdnwI9
X-Gm-Message-State: AOJu0Yyt+9byCSUopM+j5No5ASzPllz9Solv9JAvw6scBY48G1f1DEPU
	VltOeG2KAVQqmAaYfihTXvSNNOrqGHGZTI1+QDfAJRifELtewbba1NSg7ldE1NQ=
X-Google-Smtp-Source: AGHT+IH4Zu+tW3v1CbjrzMX8UC2ElJa1MqCyLtpkk5dkYfGnqCXlVjQZLgHhH8VhTadf1xkkn6UFcw==
X-Received: by 2002:a05:600c:4713:b0:426:593c:9359 with SMTP id 5b1f17b1804b1-428e6b954cfmr36381225e9.32.1722611734897;
        Fri, 02 Aug 2024 08:15:34 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd06d078sm2168897f8f.94.2024.08.02.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:15:34 -0700 (PDT)
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
Subject: [PATCH v3 1/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Fri,  2 Aug 2024 17:14:22 +0200
Message-Id: <20240802151430.99114-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802151430.99114-1-alexghiti@rivosinc.com>
References: <20240802151430.99114-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_081537_477583_F9B2C9B9 
X-CRM114-Status: UNSURE (   9.80  )
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
 arch/riscv/mm/hugetlbpage.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 42314f093922..6b09cd1ef41c 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -276,7 +276,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -322,7 +321,6 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
