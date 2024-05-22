Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EF7C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of98eY7Wp/NV1mKaq8nrgqMLyrmUFn6acvuLn15JNjY=; b=hTo0Cs6V54VOyw
	S/vCoECiRsgjcs+npa0WS/V7Rc9fiNX5SVjvPaMl0OtyQH1J5zsZL/mGVTj4r4chD/gIWug+H5qYY
	fzbpNGK8mKk8cYil/NEFOWJK1oxOxRBOyDdbc6qtFJtWkPoNdR5gx7uuIGv/UOaNtsMivfrGwUdFy
	frfWtYXaW3baFxFZW+fifJljFi6pFN7Fqp2Gtm3Yhnjb83HDSO8j4zd7G9ivHt9SdC3VKKLAZLwqt
	q8Led34Wu3yNU3qcfXEn3fvh9ZGZTLaynIeHvCNBJ+WgdvkLlU2AedvAZp+aA0Tp6eB1m6oR8qbRZ
	iaIxenSTHb6Y7RgrQRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fEG-000000025eU-217M;
	Wed, 22 May 2024 06:13:36 +0000
Received: from out0-193.mail.aliyun.com ([140.205.0.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fEB-000000025bo-0osQ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 06:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716358408; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=+clcXfgLVBiQX5MySmBhLxW05UlCMsdDj9QlU2/Rreg=;
	b=B4/AEljeEc4czr6Krmr9tXSx0HmLFIprZX5qVYJYK5HyMR/gOIYekhkBDrS1HxUAHroD3izKeDnmPnknjnASYwKUUQvAZmdyKnf+VmCijTLio3qFMmDgzBVROPxg8i+QiMh4aUmDrVaAa2EQUWRyP5MhYFg5xR+HIZxQUzdDe+8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045129160;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.Xk0LCMY_1716358405;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.Xk0LCMY_1716358405)
          by smtp.aliyun-inc.com;
          Wed, 22 May 2024 14:13:26 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-riscv@lists.infradead.org>,
   <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <ioworker0@gmail.com>,
   <libang.linux@gmail.com>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v4 3/3] mm: Use update_mmu_tlb_range() to simplify code
Date: Wed, 22 May 2024 14:12:04 +0800
Message-Id: <20240522061204.117421-4-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240522061204.117421-1-libang.li@antgroup.com>
References: <20240522061204.117421-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_231331_433945_0C282F91 
X-CRM114-Status: UNSURE (   8.50  )
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

Let us simplify the code by update_mmu_tlb_range().

Reviewed-by: Lance Yang <ioworker0@gmail.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 mm/memory.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b5453b86ec4b..1297474546d6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4416,7 +4416,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4486,8 +4485,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 		update_mmu_tlb(vma, addr, vmf->pte);
 		goto release;
 	} else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
-		for (i = 0; i < nr_pages; i++)
-			update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pte + i);
+		update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
 		goto release;
 	}
 
-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
