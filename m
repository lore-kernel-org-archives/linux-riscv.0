Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2686C0218C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woVTLCWPTbNjUwt1e6fz+gqM2HazmtNFdMz/pHjJKmU=; b=rKgyjSGPHkpZq8
	R6HhcHjZQoskH9H3tUNJ8OFxPXFUXSCd6qTkAqqogWCYDjt5CYM5hP5rsp7txcny2+d4hmm5+DRe0
	ZlEl3MnunQz32SG3B0zApLOJ5e4KAnrh9oMqSBGG2A4e2OnzzxFN5MkVLKFbO0jNRJcEf7vPQerYt
	25+cA5g2NKKIgWiwPJ4psbVIa+GrxMJw8V/3GREXZ8ek7gwwWRjiNWqk1dLLAt24xwEHDFh/a1Uql
	ds/sQfgCaIVDAD62omfAiNeJDkpELdYGSyQl6O6BR0c5IwGkK/rWajTkok+B/y7fpL7Bi7sUD0jyY
	JGBmMzIzz7jVYDCQ5lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLZS-000000021eW-07rg;
	Mon, 27 Jan 2025 09:38:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLXu-000000021Is-0okx
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 09:36:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43622267b2eso43420725e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970601; x=1738575401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=;
        b=miwJcCjaGI49ihA7LbNxXDyRqi2KrkBbF968D7K4yD4KX3HMy7EGT0xzxh4ifANlS6
         tAuQyC9Gafoym96jMd81oxfxikjvksNOdvLJkDzPH3q98e2tmUYDNLRRAS+ncAyXuuI7
         B7Ew+vvYBJP7aH+Bomuqt4amu96PQmbjLhV1BhASNKjKtvOTXf4aXpPM/3cGKixA12Lx
         CLNBudYry9u3rY0oXPn1Ap84NQBz4DBQ/X+MT+Y6TH07ceYOttS57yfTzLbCW1JL3hAA
         NV5M8mfuQsOxuvTjcpyz1HH96ZqotHZ3Mt8pZs8SvCEUatA8Ov8+QFuEezIqnObUr3sF
         y9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970601; x=1738575401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=;
        b=PstwHt6GKW6UeG2fw0Bfa9pai/64oUZ5RyDUBqTvMqd7wWug7wPY5Y4m5pubG2jBLp
         4VKW1qwFu00ku/7OjijlzhVzg/yJtYEiHr4MBOxnTMihYnIdnUiFmRkDiQim/MGNEjOh
         QmXR2qJtxhxloxrk131Hxkt6H6A/9xdzr4QnSQ7YdhLlvirnZVlWkMZU+/ktCJeGYEq4
         8HfO7TpbS7R6Dm6Ap7cBD81lwU2Rg+r8zSU1LB3aNwUz74p2lFBCzCuWwhgUAVoX2C4G
         cPRZd87grkjrGERtrw3Ane3iosqvs2ChuZEfpvahZHN6YKDfl8lpK1K3CVjyP3R4aL/3
         s3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYuVa0VgLok71VqNZZ7KgEUg8P5S0lFZaLy6ftBWiZvaHk6fP5YUAC1zIpHKVSv0HzoG7oO0jNqziQbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXV2hPx2VFuS6deg4/i4EKkx5njlAYOoGgvUBQnJsXaNFF25xc
	i6tNPypnsxxi+JYKQ+R5hNYDC79R9SJipBSxCdfeZpM/692tIH07swBVeXEIQF0=
X-Gm-Gg: ASbGnctM6cYjHeS/rSvVvMl+2UKZxytwLpxLsOoODPcB185fwdnkeRDUR5QKmuWdMxh
	Ti/a3c2r/dPxh7H2CTiBhQGhvggwLx0lKuZdJzFEVsf/BbsfMWFKMZYiwWb0vbNOoR4+HLSyi6I
	7LzRcMU/q9nHDxcuz/BbprhzavZ3R1K4sowMyaaxIiOxOZKAvYMM+u+Yo/FrCciTAwCy9mcSNYa
	typSOVeP2K3Oj2gNkKQ/tg7YNgXNsQuj5j5JW0YblYFuYxX+QIgHS1u7CwEp8L9Y0LDy5jXRYzT
	cnR+MpdDrmIqWac4CRDJyUzFJNQDk+E=
X-Google-Smtp-Source: AGHT+IHUUXHJ5coMzJl68ATLI/2WB7Q+b+nPXfERL8/PDwCduzlj4e0CTpfsp9bAQ08qd/jskgeAvg==
X-Received: by 2002:a05:6000:1445:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38bf59ed62fmr33321912f8f.53.1737970600263;
        Mon, 27 Jan 2025 01:36:40 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176490sm10314205f8f.1.2025.01.27.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:36:39 -0800 (PST)
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
Subject: [PATCH v4 1/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Mon, 27 Jan 2025 10:35:22 +0100
Message-Id: <20250127093530.19548-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013642_230444_505BB185 
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
