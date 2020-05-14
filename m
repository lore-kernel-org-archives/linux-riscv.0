Return-Path: <SRS0=9B1f=64=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E4DC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 May 2020 17:05:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03AFD2065D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 May 2020 17:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OX+VlSxM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVcX2vcK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03AFD2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O0GH6huauOXD0kBojSzaoBNYNJMwSplEIK4TSWXrNY=; b=OX+VlSxMsvL0l3
	yQSQYkck+wn9KY9KeuPjX89HIngZv3zh0ESzTCH+IkCmnSafGOCYFCkTMnFVIxVqa8TVbfRitc/RQ
	0Icde+2frDwzVFkLys/wENH+mPXZhCaiUpegNSwJNw0h2pqXBi3jO9WgHDCR++Wl0yKar/mLY1OPu
	uWvfU2H0z66IEQbCkDMhMurlQyIn7q8r1vu9CgQTHRt+klKw+fzUz51+lY6AcFc8XOdEH32DzE+4A
	Kd7qZ0uRhdg89QBnrBjHoiHB2V72/0nRqsHfWVg+TqSwiUbA0YKotchY+dGTkdbUQ35iE7BNW7Iec
	cv7Lf55pkZlZ6AmLXdng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZHIC-0003pe-A6; Thu, 14 May 2020 17:05:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZHI7-00031N-VA; Thu, 14 May 2020 17:05:05 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D208206D8;
 Thu, 14 May 2020 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475903;
 bh=44XXBwqf7ZdJi139qXlwO51vvXhQ450CmPWvc64Elpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cVcX2vcKsPsKDmMAS87dHuEJJ8eUvdSGajlPhYwFuiRJfueaw2+fisGXnor5syKhU
 9h3N5W4e4o2uV5ohsNoh5KyYV/kirPUl7kHdzkprgJKtt717KeE0Fo99VHdYAjovTc
 rK2nhnvnaVjaC2DT2klZJ/7NiWCQPaPFfNLpXbUg=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] m68k/mm/motorola: move comment about page table
 allocation funcitons
Date: Thu, 14 May 2020 20:03:20 +0300
Message-Id: <20200514170327.31389-6-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514170327.31389-1-rppt@kernel.org>
References: <20200514170327.31389-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_100504_067869_F0762604 
X-CRM114-Status: GOOD (  12.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 linux-csky@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The comment about page table allocation functions resides in
include/asm/motorola_pgtable.h while the functions live in
include/asm/motorola_pgaloc.h.

Move the comment close to the code.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/include/asm/motorola_pgalloc.h | 6 ++++++
 arch/m68k/include/asm/motorola_pgtable.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/motorola_pgalloc.h b/arch/m68k/include/asm/motorola_pgalloc.h
index c66e42917912..f3cb453a07b7 100644
--- a/arch/m68k/include/asm/motorola_pgalloc.h
+++ b/arch/m68k/include/asm/motorola_pgalloc.h
@@ -18,6 +18,12 @@ extern void init_pointer_table(void *table, int type);
 extern void *get_pointer_table(int type);
 extern int free_pointer_table(void *table, int type);
 
+/*
+ * Allocate and free page tables. The xxx_kernel() versions are
+ * used to allocate a kernel page table - this turns on ASN bits
+ * if any.
+ */
+
 static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
 	return get_pointer_table(TABLE_PTE);
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 48f19f0ab1e7..9e5a3de21e15 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -227,12 +227,6 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmdp, unsigned long address)
 #define pte_offset_map(pmdp,address) ((pte_t *)__pmd_page(*pmdp) + (((address) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1)))
 #define pte_unmap(pte)		((void)0)
 
-/*
- * Allocate and free page tables. The xxx_kernel() versions are
- * used to allocate a kernel page table - this turns on ASN bits
- * if any.
- */
-
 /* Prior to calling these routines, the page should have been flushed
  * from both the cache and ATC, or the CPU might not notice that the
  * cache setting for the page has been changed. -jskov
-- 
2.26.2


