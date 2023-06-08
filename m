Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F0DC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0223WBIF6fiVrmVpzVZ2XroPDihtxabq5UB2EQAg3c=; b=t77jbgRJ4EFXxg
	VzZG0UwGfvFPl5p0q/0+TKZVyWEXptlWPJUFwaiyw6/V6tkAawlKtw9K846inN44TjCU5pYvu2UNS
	dTFhRiIAgoRXDJurCT0gaoa57T9Qr4SPOmVO2JZaptiU+K2ip8b1mDqH6lo+idTL5Pmkr0gj6wcJa
	az9NjJJWJVFQdf/UHAa0qBbe3SzEVUcfJ1GTTXwHWi7jXUXiwYW0q3usDtu30geA5RkR3aa/gkrhF
	Uo/mb5ceZ3GAeIfPRcjQGl59aayLjOXtB/FV8TEebo8Gg9iFzx1Mi4e2uPkPnIlsQ2y1LeyKCc9iY
	YW9PSZJMHGsQYzXvuuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LOH-00ANtK-15;
	Thu, 08 Jun 2023 19:33:49 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LOE-00ANr9-1K
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:33:47 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bad1ae90c2eso1048594276.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252825; x=1688844825;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tza8VZpBdDATlz3Dj70XvbHnC1ZhEpBq1MlG3gUrqGw=;
        b=1MipXBHlCgYLfuzhfDW5ZwUI8FUsKSE60AsqsEXw+S0tSnJg5UOmjRzYFHDLdCAJt8
         yMkipeQIgxyZw78rcQRYlMT5UpzdJcWoIksfCpz/ydUZz6ZkI9xKVrX6kds0LvhIjEzt
         HS+XptOf+RYBmq4zm9J7IFzhbS7dVhum1cFHfBZOiQ+s0XEOXeKn/G9+gcrTCmXECFnx
         8UoS3IHRM3ERDzeB2SU7OV6jhVelmg9iMKHzFrc8fJmEIq5uTYUBI9N7JZJvtQPChnnD
         4+2NEzxtpjJGm4NjJthMMPpAkAfI8kDJwzbA28gjtv0iKudNeA4e3nFqgNhPbC/JEIjR
         C7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252825; x=1688844825;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tza8VZpBdDATlz3Dj70XvbHnC1ZhEpBq1MlG3gUrqGw=;
        b=SDd9ct+/MKXfygmX2lEIvySa48NIPTB9L2oQoQSMUstuZY4EwCZsEE5DxGgI4eNjJU
         HfuyXt1hKn/ogdff1hKYBEYE7OUTKBW96cn7JquNOuEvsUskIprBVgigjck43ARp/fB4
         ac5ecJwsBiTdIJZrvyf0nawc3bWMROB20b3pSMQQA1d2cwlCxsyY8uaWjdxeb4icCYbf
         y+d8XxOpPs5HBc4/ePJtxSkvIS4H6rO2B2Egm6aOz1sq289GsflZWTog3ZJdmq9FBvln
         YOMWc7x0pyhey8bvT8mP0RaZ8c4DVWmwVhctU7RoxV+FJwvBwKnaJHf0sr2znNuPqvGu
         yVgQ==
X-Gm-Message-State: AC+VfDytw8RZ5NnVzrbcnNpbzK6cOwqf37+KzwqVF9tq98GSpEEGGetW
	bwa4P5HctVkHvwL6Wl6VxWX0qQ==
X-Google-Smtp-Source: ACHHUZ5fRes1KtQJuT48o2Wy/FuADD12yA75OXTij0wfUrs7MG5//8NY8cIlqChq28IRelwNgydDPg==
X-Received: by 2002:a25:868e:0:b0:bad:1055:c9fd with SMTP id z14-20020a25868e000000b00bad1055c9fdmr569763ybk.49.1686252825296;
        Thu, 08 Jun 2023 12:33:45 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id e188-20020a251ec5000000b00baca49c80dcsm448503ybe.28.2023.06.08.12.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:33:44 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:33:40 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 20/23] sparc: iounit and iommu use pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <99962272-12ff-975d-bf7f-7fd5d95a2df5@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_123346_456050_E71888C0 
X-CRM114-Status: GOOD (  13.74  )
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

iounit_alloc() and sbus_iommu_alloc() are working from pmd_off_k(),
so should use pte_offset_kernel() instead of pte_offset_map(), to avoid
the question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sparc/mm/io-unit.c | 2 +-
 arch/sparc/mm/iommu.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index bf3e6d2fe5d9..133dd42570d6 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -244,7 +244,7 @@ static void *iounit_alloc(struct device *dev, size_t len,
 			long i;
 
 			pmdp = pmd_off_k(addr);
-			ptep = pte_offset_map(pmdp, addr);
+			ptep = pte_offset_kernel(pmdp, addr);
 
 			set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
 
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 9e3f6933ca13..3a6caef68348 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -358,7 +358,7 @@ static void *sbus_iommu_alloc(struct device *dev, size_t len,
 				__flush_page_to_ram(page);
 
 			pmdp = pmd_off_k(addr);
-			ptep = pte_offset_map(pmdp, addr);
+			ptep = pte_offset_kernel(pmdp, addr);
 
 			set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
 		}
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
