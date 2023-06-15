Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B6BC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDpY+c5H+ekHuOn1/jeoIWXb6CNdWS/VsQtp0BajFZ4=; b=lUkFQamJ/bAmYg
	1lPj0SGJgHWSDskmNZmME+y48y5SiHj5D/lFsJNs5RM8taa5eNEXjyPuVL+6UPbwMgUx2MHLDpnNG
	GKjR74e9VffSfur9gktutMx5n7ASokZLs20A9X2jtbcZmYcPT44KaGdIOxTAcOa9kSjZvR+vlQgFN
	HEd/t2Dzz77tzeTVz7M5rWs9Qdxd9DeFsXbo5a0Kz7M6iuwhh4n2Dew6Y73PbJw0vSq5Ty88HllYz
	QpghmkXm3SGRVKkMvBP5wvtbFNniPSyPNm/FHOK3e+CUv7e1sX7pTH2ie6t6HF8ygDx/hD7MnpJwD
	9baboCOH5HBZOJOqM4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vzY-00GIVk-0L;
	Thu, 15 Jun 2023 23:03:00 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vzU-00GITu-1c
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 23:02:59 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-56ce61769b7so1881177b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686870174; x=1689462174;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rocsqxxn2Z+cT1JHYvXfzCdKlHTpr3EP6mTFGVcBZg0=;
        b=MJTZvP19w7L3mwEdMeExhSCW1AUDkDcDZIGA09b4Lsgr6AlQ/Jre5s3pQVCVJJ7rQb
         5+EQMNtJaTaY+aRJKrCSqlImib7KZddKIew66TbvLd683FL9AyfE66fgz1T7BtZHDMm8
         2jNBCticE3VbvZxgnHDLhllKeMXxMDja6NYMekmWJVMnL0qXYLEhZcbBya6ztZKzets8
         eOxxHJ/YfIwfRnvaqFcbsGZUKRVZaOyJdqvanJIQ7D74NV/Gvoq+dfmVK1oXzh1JvH5P
         0RtdON+E/jvZHQ2QI/6IDa9W4KDnatFP6KwfH05hk8Ymf0ujYFguYsacUpxAce6WF76M
         r8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686870174; x=1689462174;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rocsqxxn2Z+cT1JHYvXfzCdKlHTpr3EP6mTFGVcBZg0=;
        b=R5RMv1zoIW2Li+pjYDVu2D8vcwDYNOk1mvG5Z4fPoY4PSFzDk5pxnp/IJlPtEGUbpo
         ga4pnsAcTEGNtFmXh1YIRvS/vBz5bood2zveT+oTvtV7VvHgh0VnyaclAmujbXDuPaH/
         jO5MoSTm5iPDsx9XfUg+8w/jAQotwcVvTu7aS013d22dYU+Uge0ieKa6CB+/wUPGWb5j
         UgtKG5Q71cLMzRAvlGYsWR0T78fwBqHVSapM0PLm2g9551SP/cD116KKseS+y4OR9W6S
         iowQT8bHt3CYT+VbuH8I6itjEYcpJd45/Ku5bwI3z58S54rN3TrgEm2fiqimq70Pr1Fo
         nwYQ==
X-Gm-Message-State: AC+VfDzRdDqVZsfz0BT7C6nHTjzBDT0/YyUfNwSTOYQzv6vTGUnK+AzC
	vrEP9yP5vt6i4FnjnDN9C0TsXA==
X-Google-Smtp-Source: ACHHUZ4yNZeWVfFpqfOHWwVeKQ0LO1X5XLl6oMWM14BiamATBX7pt4vwNxCwa9vlqY3LDt6NBppgPg==
X-Received: by 2002:a81:7bd5:0:b0:56d:2dd6:c5b3 with SMTP id w204-20020a817bd5000000b0056d2dd6c5b3mr138534ywc.31.1686870174477;
        Thu, 15 Jun 2023 16:02:54 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id w6-20020a0ded06000000b0056d2a19ad91sm2857020ywe.103.2023.06.15.16.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:02:54 -0700 (PDT)
Date: Thu, 15 Jun 2023 16:02:43 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Nathan Chancellor <nathan@kernel.org>, Hugh Dickins <hughd@google.com>, 
    Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
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
    Max Filippov <jcmvbkbc@gmail.com>, Yu Zhao <yuzhao@google.com>, 
    x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org
Subject: [PATCH v2 07/23 replacement] mips: add pte_unmap() to balance
 pte_offset_map()
In-Reply-To: <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
Message-ID: <addfcb3-b5f4-976e-e050-a2508e589cfe@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com> <178970b0-1539-8aac-76fd-972c6c46ec17@google.com> <20230614231758.GA1503611@dev-arch.thelio-3990X> <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com> <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X> <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_160256_588232_3BEB33BC 
X-CRM114-Status: GOOD (  14.85  )
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

To keep balance in future, __update_tlb() remember to pte_unmap() after
pte_offset_map().  This is an odd case, since the caller has already done
pte_offset_map_lock(), then mips forgets the address and recalculates it;
but my two naive attempts to clean that up did more harm than good.

Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Hugh Dickins <hughd@google.com>
---
Andrew, please replace my mips patch, and its build warning fix patch,
in mm-unstable by this less ambitious but working replacement - thanks.

 arch/mips/mm/tlb-r4k.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 1b939abbe4ca..93c2d695588a 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -297,7 +297,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
-	pte_t *ptep;
+	pte_t *ptep, *ptemap = NULL;
 	int idx, pid;
 
 	/*
@@ -344,7 +344,12 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	} else
 #endif
 	{
-		ptep = pte_offset_map(pmdp, address);
+		ptemap = ptep = pte_offset_map(pmdp, address);
+		/*
+		 * update_mmu_cache() is called between pte_offset_map_lock()
+		 * and pte_unmap_unlock(), so we can assume that ptep is not
+		 * NULL here: and what should be done below if it were NULL?
+		 */
 
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 #ifdef CONFIG_XPA
@@ -373,6 +378,9 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	tlbw_use_hazard();
 	htw_start();
 	flush_micro_tlb_vm(vma);
+
+	if (ptemap)
+		pte_unmap(ptemap);
 	local_irq_restore(flags);
 }
 
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
