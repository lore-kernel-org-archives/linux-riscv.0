Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A5C7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx01GYPdxtOMRfydmE44p9ANpu30h1QH2mMYNd32WLk=; b=rvRhVfDfp0OuBZ
	jv/stpCPtiK7kIUj2PecibyiQDf9Ali7ocDtqDe+3l9Qmohu4ZGJTeo3dpm269COr7qtZPoUP23eF
	/xOWEIz0uy5o2qiwao+h3S3NdCQ59zXWaRU8uP7Drk8Z9Penq0xMIlfgcJgA0/gIgSHfDKJr3fyMk
	Gr8W3qhaUUJN6Ly1UN3nk7PQ9b0EXEGXpDuCi4RB5al5EFvfyr64pqHardWQSSPiOAAEX3k6VfBRp
	Us+exr0ClPSKG/R3iG6+/yU4gQ4DiMFFSWutsqzHV25BbMVc8swSv1b5a5XRJJGgDySF7Z13yXxb+
	aFleDOSDqxKGps09Yb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbsh-00552R-1I;
	Wed, 10 May 2023 04:56:51 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbse-00551Z-32
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:56:50 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-55b7630a736so101758517b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694608; x=1686286608;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvuiwGfmHxTbGTIrjZEu2Atjrxfj5l7d/xiFwRLchQg=;
        b=r94LQDZtq2Ahs+pJ02XRyENxJHGD3oe8r85F2aY3lvsikc/je1Po6VKiCqGzvG34y8
         kIuRE1yIIechhFDgP3aPNUwpsvddbLpTk1K5K+zsi9h4zTnxpk/JVyiDuMs9BN+OFeXh
         nh4AqDsTEXGceRxF3pEZTvbfDGAiIr5yaqLJ7E2ZoOdKC1Zkn5Abo0ezT8CCDEe5hzan
         c+lECJHpRVibRO6qY89AP62g051JuNBSBft2ut/t1eSbSZxO5Og6LOCNCOMTH+prHdN+
         QRgICMzswpXaaxM5lmYItFqDFDCHtHoD+lRFcRdM6eNSSTq3389JYb3eyyNp72I0hHaA
         zjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694608; x=1686286608;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvuiwGfmHxTbGTIrjZEu2Atjrxfj5l7d/xiFwRLchQg=;
        b=Wf+8RCtg9kqTjmUteg7SuCtFIoRq9AY58CL9yUN/pURJKXGv0Kly52UvtGMIo1CjeI
         9RXgrFTA8sfJ7j+rvWnq1q/+aATZCxcyYIIrkKlAPX1lgITkrgvnbyoeYr/kh2psLwks
         7K2VUxBRKuNzvYgkefVEP/Cza4yayCNK3an61S1K9o/J7JjxwSnl9ROgO0Y8rx5jTcBY
         mH1jpmD8JH9ReIcGo9n8XZ/v7NYjKKuNcs0SGw2UzKs28x4gdeOME9n+cXAku5d/9KnW
         zDL77roqkvx6hMUg9bNJ4JdweKFDgzaosX3KaZi4RX2OJRMA8SCeaSd+UNkBKgiBRkfe
         ow4w==
X-Gm-Message-State: AC+VfDxfdPe0UTYSKZBtwlpwJY7X8jbnb47+Nd44QHu1wW1TpYDtvqie
	vrbdfssCIyOM4zMA6q4oBa5n8w==
X-Google-Smtp-Source: ACHHUZ7AyL+rmns/Ft/OH9KHX6GHbff2/XDcrKV9m3YxNF0ibK6GlQcG44pT8V6Ez5OWany7qS8Crw==
X-Received: by 2002:a0d:db49:0:b0:55a:314d:afdc with SMTP id d70-20020a0ddb49000000b0055a314dafdcmr18425257ywe.37.1683694608059;
        Tue, 09 May 2023 21:56:48 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f206-20020a816ad7000000b00559fb950d9fsm3842735ywc.45.2023.05.09.21.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:56:47 -0700 (PDT)
Date: Tue, 9 May 2023 21:56:44 -0700 (PDT)
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
Subject: [PATCH 11/23] powerpc: kvmppc_unmap_free_pmd() pte_offset_kernel()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <8bc72262-3771-4fbf-8738-44d9a8a1ba6a@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215648_977672_60FC2539 
X-CRM114-Status: GOOD (  13.20  )
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

kvmppc_unmap_free_pmd() use pte_offset_kernel(), like everywhere else
in book3s_64_mmu_radix.c: instead of pte_offset_map(), which will come
to need a pte_unmap() to balance it.

But note that this is a more complex case than most: see those -EAGAINs
in kvmppc_create_pte(), which is coping with kvmppc races beween page
table and huge entry, of the kind which we are expecting to address
in pte_offset_map() - this might want to be revisited in future.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 461307b89c3a..572707858d65 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -509,7 +509,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 		} else {
 			pte_t *pte;
 
-			pte = pte_offset_map(p, 0);
+			pte = pte_offset_kernel(p, 0);
 			kvmppc_unmap_free_pte(kvm, pte, full, lpid);
 			pmd_clear(p);
 		}
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
