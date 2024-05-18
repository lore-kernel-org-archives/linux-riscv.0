Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ADBC25B74
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NCP6DosLDOWmkGp2pZFRz2bSdUlUxnwrHmWcsV/2tc=; b=2d885oJGUuekXD
	VtgvodY2G4/2Cxr8RG+brdiPZ/xq8JLqQE19AlgnKs87HChJnLbSgYmKK94+x5roy6G3Fh1/zKkqR
	toa3vfCaLCcAIyBRO5C/T/ME03X2NGPGY2GxCYdXPHhrblZjmb73POX3T9c4Y9kPEHJSOOCVT95kq
	Xt2iJyudZPFH0qhi7GCKZD45wO5Ug6ll6oiskTgGdaU3xAX/Z6RquqcrHTO627yk8BmEdCUQQMHgy
	Qj6edNuyLW8SKKhwUzx698msE5vG7VpmkIeCNtfrienLEXySRfL/sVtf0FF8vp1MvtBZbeUlz9scc
	KpJQVAJfNBuT6pZK6Y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ErE-00000009ixE-1WQ3;
	Sat, 18 May 2024 07:51:56 +0000
Received: from out0-205.mail.aliyun.com ([140.205.0.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Er9-00000009isx-1hON
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 07:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716018702; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=MvaQlNmLKjB1JJG125kcLMl74RVFk5etnjUBr5sySWs=;
	b=knkBhkh+cAp/OM9pDWGTF1FPlDyn0B21FyT/fgi/PH4u6FTjM650g3I98SwY6cBbW0tCGKhd/GdkyTOmnHr7YinVx6wRik8q+Mq4HhEjyctPNzGeo5ENLYJKMsO2ZSaCFQG5pBR/mDwk5jDmE2oppZMrZUQqtUYgG3xDca151gE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R771e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047203;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XgA9uMj_1716018698;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XgA9uMj_1716018698)
          by smtp.aliyun-inc.com;
          Sat, 18 May 2024 15:51:39 +0800
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
Subject: [PATCH v3 3/3] mm: Use update_mmu_tlb_range() to simplify code
Date: Sat, 18 May 2024 15:49:14 +0800
Message-Id: <20240518074914.52170-4-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240518074914.52170-1-libang.li@antgroup.com>
References: <20240518074914.52170-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_005151_622404_0E27BF7A 
X-CRM114-Status: UNSURE (   8.51  )
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

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 mm/memory.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index eea6e4984eae..2d53e29cf76e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
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
