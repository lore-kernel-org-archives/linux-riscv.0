Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB851C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUo6pvQuFWuGLhBMNtpa7PS6eOJqdIb/+JqL4ygMRGg=; b=f8P4FAf9pn/r6X
	4URAPgERbqY5NIGs22QpnsNotc6Yu/0WCD0toTI9ajoftEm7/OEFihE0Dz56jp9MABUQmIJ8acl22
	7/T/g3f7QFZ3qpemh3wuA/m8WSlzByLGwz9rladkFPdoTrE9KZ/4mWSrX3kIFE3ZBN3tViS9XQec+
	okk/xunn8rjYmIbdv4FmGxNfSZ9OawYHk5N6g57zHiy4qaUTZIIGr0RfS9e+n3onk6N0vQuTye7H1
	kcNDBEKb+R36ylZCh25eBDe3TLQVExO7+ksKe4Z+xTEgRsmUtXixOFQZiicI9i81RN7bQ3UvT68Rf
	iHWKImwd4q/zNwDCgx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LB5-00AJp5-2E;
	Thu, 08 Jun 2023 19:20:11 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LB2-00AJmL-2E
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:20:09 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bb167972cffso1091001276.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252005; x=1688844005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/dR8Qg9bFHe49vUjKvOi0Rl/4IhXWfwv6MExDzA+GE=;
        b=mXQ7UC6cKQLLZIQ28oFk9gQ5KxeKVwwY9rk3e7MKP3JMMgFBUS0Y4Ow9xYO3QBbWBp
         OG1o7JhalsKeTrmK+H6URVPXbxrefFexNILlJOVSmAp7Qw//UVTcssC14O2AbNOpA95o
         3fphns61QjibpjRegZHBgnDNFY4BaX8z0yU2Yg9FB0o8UxxLFxwBrXonk679QJW2NVtL
         a5CA3hBH6G8j2p1GNpc9/KN99Dv4NvapDgXnvT++Pvq7LeadMsdSuwcoq6yEHgW25m/P
         tlZmPB8WvPaouvvNC3jzVDH6WgeuI0e6ggHbT3c4Xpt7le2+MhNk3DZW5USJxtb/KL2r
         qm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252005; x=1688844005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/dR8Qg9bFHe49vUjKvOi0Rl/4IhXWfwv6MExDzA+GE=;
        b=L7Z48IVcPB/EIyZc+IWxCPjC2vHrcxU/kEKZFFouklupp9+iNWp0VTCvziqp8BGnXR
         Y2DiDV0619f1kP9ZGdMMAQ0wn/F8rbYXXQyRmZA6hUFrCvGU7/LD5/lQ3nDKIsoIfwEl
         WpTrXAZ6WiRucI0bo/cL5StspVq0Bv4tulOipo49p6uuP84+2DivHJBQgPjDGUQBVKWo
         0Gji4w86uBslMTNGJf0lAHmAE9MlJmiXou0cb1ziBrJkYh3XwSDoghpBVPiTcuLrFNfa
         jkpdkbEoP8e3mi5SnQRbkO+gBBtlcAbXbSKjvz35eF2BtAuCl3oTtQCb20svefE2ByOP
         biyg==
X-Gm-Message-State: AC+VfDzC5DMyIfNZScESV7AHzgqumT/SisS8fSkA4pXlb0GT9R9OElbX
	Sn3rINvCuVD8Do2u5QgYYkpfaw==
X-Google-Smtp-Source: ACHHUZ4wGfYoiszAK487KBc/kae1dH0iFiJPU4oIJDoWEvbSOVI5OJwBbX6lcOBaT8/42nfo55JclQ==
X-Received: by 2002:a25:ce90:0:b0:ba8:16df:e3f5 with SMTP id x138-20020a25ce90000000b00ba816dfe3f5mr700600ybe.0.1686252005314;
        Thu, 08 Jun 2023 12:20:05 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 2-20020a251802000000b00b9dfcc7a1fasm446566yby.7.2023.06.08.12.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:20:04 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:20:00 -0700 (PDT)
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
Subject: [PATCH v2 09/23] parisc: unmap_uncached_pte() use
 pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <358dfe21-a47f-9d3-bf21-9c454735944@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_122008_730014_F473AD2E 
X-CRM114-Status: GOOD (  13.73  )
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
index 71ed5391f29d..415f12d5bab3 100644
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
