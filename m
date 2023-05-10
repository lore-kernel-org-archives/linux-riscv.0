Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726DCC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hm0Q5PT2ojk1y+TIMfNS5wqkQJaypf7j7wqPUd0MNo8=; b=eeutgk0vF1OyM1
	Jp5cbTpQF8nrKSUwpMuDBI6NY6h3/1cF/HuKXPu6D1mGSdJ/cjeIZhb8KZE8wSKVVn+JHX80pPX4O
	KKuRz2ILCy3dd/d8TT996us3LonT8JlT4vKeCkxgk2rIkKWVEMMX52/LZyVFPHOAX3eYR6nr59YTT
	QUzt0Sd/oG7hAozyD50XoAv/YVBTJxWvV6XcRGLcJlqu+E50reZB6frcmAJQwvzaCUbh/wNm9u0AP
	aV9ufx5TofrxKC6kg7XmXgSYaWISgo0vj8SmPBMzRluTbZqsxON/kKPB6HDOfMuQgsnm3rMFhqaAV
	Tkg4i7dh0u0GWXKo/uGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbq3-0054g2-2e;
	Wed, 10 May 2023 04:54:07 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbq1-0054ea-0g
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:54:06 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55aa1da9d4aso120935087b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694444; x=1686286444;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7TU+EpCMsIU6CqnZRd0vWJGC9oqEXRuUswowSWl1o=;
        b=nx2nVYMVrNHZwwSl8w3NSmhsRvWihgBOt84R2c16JqiYC4KBl38YHxIAdhEkbKIKU+
         3KinRet9UKewX1U+bJzN/HA2S7KOTkCF4X7wqaw/K7+S17drzHhQwyGVptzSW8CKp+rn
         7n/QckVxFQIds+kKrngIuvcYjerJY8U+pP0nKt9JbKkli09JNKT1dmegLnEsv/7gGsJF
         Qp1n5E/tb+Ovu77mxoxN3oLzT8n8iySQ8FxtBPgBcz8wTrqYdAKrqvMBlZ96CIsNIEnp
         6lPBYSKwbzZLj7KAL6W20hrNmnnmTZNvlsZaMnXbJsKFp6VCUGJP8Oy+j1QTC9dUJ6vO
         gsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694444; x=1686286444;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7TU+EpCMsIU6CqnZRd0vWJGC9oqEXRuUswowSWl1o=;
        b=NKq9GPmCaOBfnT3cQUub24Iio9sRJJxJ430nnMlHjKE4/7NQYjc+sMYqXMdOjjsXaY
         ELqHD6i932EddVIgnawZGtYX7+bMCq4GwJIUlSP+tue6A8uyr2CQp/gZJIndjRd/ufGw
         mVbWBa+05tPBAq3WmPbSvmfFdXshpZFoj1OrfQvoH03Ew+u/h7F0Olnf5xjCn2SWY+qs
         GD8CS19lkJPkt37yrZx8uKUpQJt+NSpNUHNdF7mTZfsMmZD44dWDrSiIrGklu0FguACy
         lzmgTHSWeYu1oNkb8Y34MoRCln5lvSI6ujMPWsPqDtH6+oKDZiM7G3F1XR+UVvQ6Kx0T
         J20g==
X-Gm-Message-State: AC+VfDxSyVkAaIbe0XvCh4RjzQpwpR0gsKy3J0QEYf/ef363UhLxBcB+
	vUne3/Agi+73ppsBZMQcLCqTqA==
X-Google-Smtp-Source: ACHHUZ57Dsib2dNeEkcs0nwSe68HvlbijE2Qa11Gh7g4OTrdhlBqOZhC7lvqfUbJMl49On6qtViJzQ==
X-Received: by 2002:a0d:d955:0:b0:55a:ad0a:766 with SMTP id b82-20020a0dd955000000b0055aad0a0766mr17847236ywe.10.1683694444181;
        Tue, 09 May 2023 21:54:04 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l4-20020a81d544000000b0055b46dac76esm3814196ywj.116.2023.05.09.21.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:54:03 -0700 (PDT)
Date: Tue, 9 May 2023 21:54:00 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
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
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 09/23] parisc: unmap_uncached_pte() use pte_offset_kernel()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <12c4693d-8bb3-2852-8cf5-9777b427d770@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215405_247736_6CCF6F6B 
X-CRM114-Status: GOOD (  13.92  )
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

unmap_uncached_pte() is working from pgd_offset_k(vaddr), so it should
use pte_offset_kernel() instead of pte_offset_map(), to avoid the
question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ba87f791323b..52d5f8a5cdd2 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -164,7 +164,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
 		pmd_clear(pmd);
 		return;
 	}
-	pte = pte_offset_map(pmd, vaddr);
+	pte = pte_offset_kernel(pmd, vaddr);
 	vaddr &= ~PMD_MASK;
 	end = vaddr + size;
 	if (end > PMD_SIZE)
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
