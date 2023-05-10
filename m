Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04202C7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPReqVOetHZzRDiMnK5ra6xe/BnOoVvFUmK9tkPUNf8=; b=TFAjxewn5YRrsN
	w6zw5HgaCx54qJm3wJge6QLeUD0fVvOE/GObrT8dp3N1+G+b2LLBWH8uL3K3y9GZgI0lNA8VoT8D2
	TkZvyct3U6Be5s03An0uFAb1cI5/dk35gpQxx11B7kl2aQofBR15SfZg12Z1VyP0UFcme9HMJYGdM
	zMuQBOxZC32FA/VFJDsmO1YhKcE+Z9Qi7R3/NB1NsMx9+hgoslWMd5aKHy0fzpteBSiyjWA/hVvoR
	XgvYEifOQoWDE2kBl7agvZvbcZ5eCDpqzKhRy6RB99bjNC63kEA68R2i3N3JaTa5Nlqw5Z1X3wTUh
	l6Jm7zJhrkvepMWnFI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwc6Y-0057QK-2M;
	Wed, 10 May 2023 05:11:10 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwc6W-0057Oz-0o
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 05:11:09 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-55a829411b5so62583897b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 22:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695467; x=1686287467;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5YV0zKgmgEyAUPKTSjojlBVWu7n9Z5EbrT7MCf/bI=;
        b=2vB4gHPvdrYwpepEfO1nF7s17T93hgvovaDeIEtq/j7tZEKBAX6MfSFdULN3s1RrSv
         XbcEaHE4RfnjNOR2bGTDUPbkUVKLAEh7Z60FKXcJrN5AB5F5sDrBlIYfucGi5YFq3CRE
         x2J76JMa1KrQtFzkek9dhFVhgpBZ4hkaFn0t/tEhn6Lp6XTc2qq6OFMsvbIv1u0qf83/
         DuPOrKKE39rYYW8ERQAhpQjY3kAUjmEo/2XpafFM5jSnKHS+15Ix6XCgfH0XnW/sjbs8
         PlPBuW0lMaTsO4yfeYWj+it6wzwQ+thFBn+MFXcJGic5E+ghFwv9VEoF4ainQyun9oWL
         kbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695467; x=1686287467;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5YV0zKgmgEyAUPKTSjojlBVWu7n9Z5EbrT7MCf/bI=;
        b=F6y6m5Ls5NsQdazYZ77DxXuNh2lp2pxp6iIc2kSgugGd7lF/AVFvkjKcmMktH/qB32
         4VySBHJX7kkM5WEPXk/Ps7C6LYyVOSHzFdS7rWXvY1TMFoXtzx5SPYPMMN4nGDQSPlds
         nvL5tw3siRxKJVVqLvfdpaGF8Vyusjc7P66gbQ/ARi1yZtODCH1KWLJ8V2m2MPBxHLRO
         T84ek2qUMq4AAu6XQIzEVj1ZhnAw1q6GuPqt3UMML7aGWBignpGJFIJaen/ddch0GYen
         MO+ZUyN2ViKB/gucnrE1nsGMTNhA4P3mr6XOa9s4kM5VZ0r/Qwqoq5TPeJO+RSuyfWV/
         hNeQ==
X-Gm-Message-State: AC+VfDzR0DzR5Im7Eedb9eH2n1fqwborxcVc4s/yhLUA9DruDQWOVXcg
	JgeYNImidG0uxFTfIOeYLxhThg==
X-Google-Smtp-Source: ACHHUZ5S12uJTV3RgA8xdSJdxWq0jDZ0XleloV6/dK1s9NkYAdupH7Dq2nQz0anegdxAtAS1U2ZfRQ==
X-Received: by 2002:a0d:d4c3:0:b0:55a:9d84:2e4e with SMTP id w186-20020a0dd4c3000000b0055a9d842e4emr17689769ywd.18.1683695467357;
        Tue, 09 May 2023 22:11:07 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l65-20020a0dfb44000000b005461671a79csm978797ywf.138.2023.05.09.22.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:11:07 -0700 (PDT)
Date: Tue, 9 May 2023 22:11:03 -0700 (PDT)
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
Subject: [PATCH 23/23] xtensa: add pte_unmap() to balance pte_offset_map()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <ff6b25c6-f537-6b5c-8743-c9fc2bd81f91@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_221108_293966_06457DBF 
X-CRM114-Status: GOOD (  13.68  )
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

To keep balance in future, remember to pte_unmap() after a successful
pte_offset_map().  And (might as well) pretend that get_pte_for_vaddr()
really needed a map there, to read the pteval before "unmapping".

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/xtensa/mm/tlb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index 27a477dae232..0a11fc5f185b 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -179,6 +179,7 @@ static unsigned get_pte_for_vaddr(unsigned vaddr)
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned int pteval;
 
 	if (!mm)
 		mm = task->active_mm;
@@ -197,7 +198,9 @@ static unsigned get_pte_for_vaddr(unsigned vaddr)
 	pte = pte_offset_map(pmd, vaddr);
 	if (!pte)
 		return 0;
-	return pte_val(*pte);
+	pteval = pte_val(*pte);
+	pte_unmap(pte);
+	return pteval;
 }
 
 enum {
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
