Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F250EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9JK/ou9T/7CsmFm/MRy34e7aX0LimALi2tj8OVXuuY=; b=3q2YzpxJa9d/PW
	Nko1AW6quotcpca8VrWxdZm//8yuIMa6ZhKD7z/Q5biQ/t9VFkZlG8A7HCUkp2g/sasesO3PErCmB
	QmL1BnFVHF+bhMbxOm70JoQwXa5TuZ3616HvYMmdLIiTNI9PZ0Dtwhg6dj9rNcmWprVsrdjZ/f+PH
	5owMCZcButIn1K2byUYvzUZUzptdLnIlHduqHke2qWe3X33BPQgD1HKn86yXkKgwLYFwuswRc+wnA
	CkOy/NFnttZBILUZqoxXM4XU/umwBIbthpNn2mvg1sM3Ky/jSOSDbnlezwcxfBfOtigG7+PR3heRR
	PLjMK5SRjTuoF2x8NGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOdb3-00BXeH-V3; Mon, 28 Feb 2022 10:49:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdaQ-00BXCx-0I; Mon, 28 Feb 2022 10:49:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC2A1063;
 Mon, 28 Feb 2022 02:49:01 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C396D3F73D;
 Mon, 28 Feb 2022 02:48:52 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org,
 openrisc@lists.librecores.org, linux-um@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: [PATCH V3 02/30] mm/mmap: Clarify protection_map[] indices
Date: Mon, 28 Feb 2022 16:17:25 +0530
Message-Id: <1646045273-9343-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_024902_135621_A170F2FC 
X-CRM114-Status: UNSURE (   8.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

protection_map[] maps vm_flags access combinations into page protection
value as defined by the platform via __PXXX and __SXXX macros. The array
indices in protection_map[], represents vm_flags access combinations but
it's not very intuitive to derive. This makes it clear and explicit.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/mmap.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index d445c1b9d606..34000a7d7efa 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -102,8 +102,22 @@ static void unmap_region(struct mm_struct *mm,
  *								x: (yes) yes
  */
 pgprot_t protection_map[16] __ro_after_init = {
-	__P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
-	__S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
+	[VM_NONE]					= __P000,
+	[VM_READ]					= __P001,
+	[VM_WRITE]					= __P010,
+	[VM_WRITE | VM_READ]				= __P011,
+	[VM_EXEC]					= __P100,
+	[VM_EXEC | VM_READ]				= __P101,
+	[VM_EXEC | VM_WRITE]				= __P110,
+	[VM_EXEC | VM_WRITE | VM_READ]			= __P111,
+	[VM_SHARED]					= __S000,
+	[VM_SHARED | VM_READ]				= __S001,
+	[VM_SHARED | VM_WRITE]				= __S010,
+	[VM_SHARED | VM_WRITE | VM_READ]		= __S011,
+	[VM_SHARED | VM_EXEC]				= __S100,
+	[VM_SHARED | VM_EXEC | VM_READ]			= __S101,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= __S110,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __S111
 };
 
 #ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
