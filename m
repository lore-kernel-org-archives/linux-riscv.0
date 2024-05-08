Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E036AC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBrUpoxwr2NgcLYtSUFTK7svyqxuWBJFWRofjEdgR2s=; b=kYQ5VkG9WJokYb
	ZjgnbwUbrJgmmJXqTg5u0L5aJ7dLW1jIv+rFD+Q1A35SDblZHrvIXyAeKVu/TJTRqZiVstwh7KDn4
	LBq5HLxzxRpAtqu5ON0G6EkzFiY91EfcKt4hgShKb+mttW+ubgeAPqy+Icxgz0FuLsUyiENUW/vuH
	zQfCnxbJc/nRKsW3CBjRTW5Hrl3ib5BadZpCISQLWLVWo1QMSe7QFzOTlCmSQBbM05aq1r7j/TSMZ
	YlmrbZlxv1+PvXKXDWIQfY2zPsW+qHk2PukrphDSYxGjUhU15194gzeGoPvVjU4YbTXe+iUgrlPEn
	GAk7uZg/2+5HwjS8vpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fb5-0000000FGK7-0xAn;
	Wed, 08 May 2024 11:36:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fb2-0000000FGII-25pu
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:36:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34db6a299b8so2838105f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715168186; x=1715772986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM+WuwVvF178uIr+5Dc8IcJyYSbzDoUf3sQGwgQ7LEI=;
        b=dbRLSjGk6mKS54+fXvPwhVwph6eDl0lTBMDaWoY9JZ8IIMuAHrL3T/N78v0K0Umca4
         DVDpMpB8CMpFw0ed72ZxtotW5Z9ApD0mbCSZCvvAyty9OkNd2bglFkUyqGUMabIu8CSL
         2buvxDOgnOfyVvKzdU/5Lihjn5golOP9nmd5cBPpnA+1kCbkT5TUjpik2h0hB2qLg2a0
         E/fu6q/MUxfF2fpxj+Y3VHQozq+HiDPRkNniERBZvqHpyj6kjLg3V3rcy0CU9sI/qQAw
         s2DplJNIdQeRPoemgM17bkpZUqFqoJJjDgDFG+rPw7SEgJugSihx6AN0c7phFLpwGRG8
         azjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168186; x=1715772986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM+WuwVvF178uIr+5Dc8IcJyYSbzDoUf3sQGwgQ7LEI=;
        b=dOzWHi6063YZzRTLV9uW78nIQGdTJzgYxrVUAMw6qXyIOzK2yLZ2BKj1Z2U1Edc7EE
         XPd7EgGq0b9l451mlorVBKk4uUWmxig3wL1enn3pjxS2NCqB6BZU2Av7F1ZsRJTuolMT
         MGToHzcft9gh+7t5CCJZ22eUkMBS2jDe4WxmMaCxE1DQiKzBh2GAovTZWHQ3e5O0fsBd
         WfBxj5BbvWFUQbIgdwrbe6pGMBE+8FO0xK/8bVAKA4KW7ju9rpY3VUzbe++i9D1CWcjJ
         +ulvbazbv5an5wyYVwmMIKZxchiURzCyhhfQBfszjrEt75owXFohfbUQ2qnU5e9R9MNj
         bvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB2AiceGbDDhJnaUPb7sx7Fgob2oGCqqMvO/8TMJnUPD+1gaVpAFTL4cTrMfgv2DW+HM1jAJJpqEOmPzrUyyCiDgzLSGxyh0RAP/ARH0/a
X-Gm-Message-State: AOJu0YzyVLpiVuQpWZ6/Vugsmeb1iNOt7nlHVNC8Ze4F1E1+vmgB4L6G
	r65vRPRz53MHZYl1qKu6e0suJYCmhYAY8lVptsy0B9TvOAJeyq60w2s00CtJWXA=
X-Google-Smtp-Source: AGHT+IHVO5vcmWKipbJIGDQ+CDJ8RhNP/JYjB5jDnNbYNNxR9pALzbWj/fP/sjh1jhNLJi0qhKSTGw==
X-Received: by 2002:a05:6000:508:b0:34c:77bd:2545 with SMTP id ffacd0b85a97d-34fca810737mr1911157f8f.70.1715168186464;
        Wed, 08 May 2024 04:36:26 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id dn15-20020a0560000c0f00b0034d9012e74bsm15283014wrb.72.2024.05.08.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:36:26 -0700 (PDT)
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
Subject: [PATCH RESEND v2 2/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Wed,  8 May 2024 13:34:12 +0200
Message-Id: <20240508113419.18620-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508113419.18620-1-alexghiti@rivosinc.com>
References: <20240508113419.18620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_043628_546598_23FD99A6 
X-CRM114-Status: UNSURE (   9.08  )
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
