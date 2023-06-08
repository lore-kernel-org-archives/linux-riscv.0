Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03152C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kdiJq1056w7Z4FMVJV+9w5Plbhp6ZduH4q3c2c3opY=; b=kzwHcXabwy1x7o
	DzSDwj5jGoP+xS2vsFog12CVQNkbr6HuTKCxZrE7Gcb/mfy7K+P08LNuKZIKtZH96AFu8ssXBSVe0
	e6RmYWT5Bcz1I8RvWIZtDL0GSwofyDnJB8nOkeXSyttVWdFd0NRYArScwsO4bOnCX0fis6Rx7HhWc
	wGWiVdB27Txn21ufBKTvc9P7KHeJrOCwjQ8l7LU75C7RkxrWsNERbPsT3lyZl4zylcyplR9LROd8R
	I0nAuT+92j04YpqsRhxZrQWjYm/DaPTWJOM7NuZCI8Ce6Y3Ea8RzeWG/N6Xnq7yB+NVwvTy7/wvLa
	IsOYJuVPaiB4wroKMu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LQy-00AOf9-0A;
	Thu, 08 Jun 2023 19:36:36 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LQt-00AObY-2H
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:36:33 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-565d354b59fso9549607b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252991; x=1688844991;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmemeLuI+WpEQXgz9TQT0mwehV8FTU9BDTa5EhoH+Rw=;
        b=7iZl7qFoE643/vqqfaylOOM4UugSzxQOXfGxIkvhFgrLBJMpREbmLbhzK1Dfpeq7sW
         vLxMNbMxtYruESXi/vLA/FRPFy86oy/Rlv/K+QRhWyPjxrgHE6clF71I8HICL+Wbu4D8
         52TIPF5OsTmaSTlVcpOmlJ2hXgN4iVitvobit3uBB1+XryThJwAiK1B3ovBLWTXnWBEi
         ML7bTpBpfErXrO5jZn41yk5x35HzdiBPWQx9RrfkGfIWSKYY13HndzOzcbi8dz53N7Pe
         Ykc3xEYKN/aDtb36dEI3aYN9owd5brP5GXTjP0NKjFTbVVbOSNnZMLMGudJLdaSlcXEi
         8u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252991; x=1688844991;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmemeLuI+WpEQXgz9TQT0mwehV8FTU9BDTa5EhoH+Rw=;
        b=ZbIIXH5Pm4mjnzSQ30wCta6Hl5e74HZjnf8AHPv3W6P+/bqM0+doGBuwc6ZRlJuqKT
         gLykpbhXkyVSzRz1cnqG+1ZxXy0eLO0pMvEJno0o+0k2upR0VsCqoGETVkoOjAncluI0
         pymZ8Vmuyk8abfzLNlLmTQDOxNCLiswXxgxDIws4Vz/ICjB4VacHSKE0Zg5Zdz/yyh0v
         0SL/hZzwPKvoxZWXIHc4H75NrEJIb8c47ae1uNKzgvWgsh33WxfQTcGCjcvrd+TVZykU
         7HatykB/d2Eg+6kwvHgxE4k0GTdS9xfaOaQ9a5k+4RJzR/acSUPBzvSR1wIBZVhXlQmP
         M4Xw==
X-Gm-Message-State: AC+VfDxcj1rLW6qY2sYBDP+35dhvdj0chKjHA0qjGtN8N0aKD3pKI/tX
	yOkmWPU2K7wHF7ov58sHIP+Xaw==
X-Google-Smtp-Source: ACHHUZ5QdxKuy9jo3MUvUBLJWa7hkCRN4WqLqFRikF/N35P5/sjJc9i1Jxr6DqBjKGQqjHCt1+UtTA==
X-Received: by 2002:a0d:ef01:0:b0:568:d586:77bb with SMTP id y1-20020a0def01000000b00568d58677bbmr743298ywe.14.1686252990588;
        Thu, 08 Jun 2023 12:36:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a11-20020a81bb4b000000b00545dc7c4a9esm108298ywl.111.2023.06.08.12.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:36:30 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:36:26 -0700 (PDT)
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
Subject: [PATCH v2 22/23] x86: sme_populate_pgd() use pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <497d7777-736e-85f2-c37-aa6bcf155e4@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_123631_750821_436D74AD 
X-CRM114-Status: GOOD (  13.99  )
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

sme_populate_pgd() is an __init function for sme_encrypt_kernel():
it should use pte_offset_kernel() instead of pte_offset_map(), to avoid
the question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/x86/mm/mem_encrypt_identity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index c6efcf559d88..a1ab542bdfd6 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -188,7 +188,7 @@ static void __init sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 	if (pmd_large(*pmd))
 		return;
 
-	pte = pte_offset_map(pmd, ppd->vaddr);
+	pte = pte_offset_kernel(pmd, ppd->vaddr);
 	if (pte_none(*pte))
 		set_pte(pte, __pte(ppd->paddr | ppd->pte_flags));
 }
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
