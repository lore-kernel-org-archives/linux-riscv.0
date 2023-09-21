Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52E6E7D0A0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzRE9HvwMbWQvdav3p7hOkdc+fYOsoY9HpesX4X4IC8=; b=e9kyw4r1ZtCJRN
	3IPy4r4/F9S9ECkgHdntC2GlYR4Gl3qBQrW9fWVSKoi/qJVrr53028dssVVu1jKzPsbm5Z0CYj+1/
	VjMO38m+UegKS5HCOEX/crYIGIleKL+kRJhsvkuHL3gXS1PwCk3h7UPdyaQtAsboRk+AouoRAAOc2
	41FjM5iK46v2ufhAKCOUGmW5QjaULiBwIG0zA1y89wGoRlblIegbGskMODOc48HEhmKqrq9leeOFY
	CVzDqkvHO8nWNbqyQ2tWOj8CgCQFY1oDwwEv73LU3wrH49cLHBjgxE8W6OzrtpJv+9Su9GUlsO9Fe
	a3Ogck1TWLrCg1i71ptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNW9-006erJ-29;
	Thu, 21 Sep 2023 17:31:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPu-006UdW-0K;
	Thu, 21 Sep 2023 16:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rwFdA7NTCOSN56OoLgooEuv9WkGbezxG1625Lwk7ze8=; b=jDM9NqRemr2UtqBlfwebWtuiEL
	v9VLpiaVqO14f9g30oWR36H3ol9oEyKC/Di6Zv2PUWkMJspd5gM0ZCKP8SzKV81aw+2uGF5CteoxL
	Seu4ZZqKR6e99hXEWBZaXx9wQyS63LM601h+lRjZRBkcr2mviD0nYgGfDGIWM2yww7OBmRKQTl5Dk
	KexljRoSfFaJRqoNaHD5B6mt1vlvxTQXgdPma0hKgJPExvz+0foC4XxcIM18ptn0LUE1VapnNrONI
	bbaCllchyz6ekYO4B/LrBZQUh7U+H1vkdTnpY63fgXrOyzDhcfs+KmJUtuWIRfaeJLbiEgVdN6FOI
	lvFDHmHA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPm-00FUdd-0N;
	Thu, 21 Sep 2023 16:20:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECB2D1713;
	Thu, 21 Sep 2023 09:21:05 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 811AA3F59C;
	Thu, 21 Sep 2023 09:20:24 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/8] parisc: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:00 +0100
Message-Id: <20230921162007.1630149-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_172032_231790_6B81AF42 
X-CRM114-Status: GOOD (  12.48  )
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

In order to fix a bug, arm64 needs access to the vma inside it's
implementation of set_huge_pte_at(). Provide for this by converting the
mm parameter to be a vma. Any implementations that require the mm can
access it via vma->vm_mm.

This commit makes the required parisc modifications. Separate commits
update the other arches and core code, before the actual bug is fixed in
arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/parisc/include/asm/hugetlb.h | 2 +-
 arch/parisc/mm/hugetlbpage.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/hugetlb.h b/arch/parisc/include/asm/hugetlb.h
index f7f078c2872c..29ba631862c5 100644
--- a/arch/parisc/include/asm/hugetlb.h
+++ b/arch/parisc/include/asm/hugetlb.h
@@ -5,7 +5,7 @@
 #include <asm/page.h>
 
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
 		     pte_t *ptep, pte_t pte);
 
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index a8a1a7c1e16e..fc5e1ad8e5e8 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -139,10 +139,10 @@ static void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	purge_tlb_entries_huge(mm, addr_start);
 }
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
 		     pte_t *ptep, pte_t entry)
 {
-	__set_huge_pte_at(mm, addr, ptep, entry);
+	__set_huge_pte_at(vma->vm_mm, addr, ptep, entry);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
