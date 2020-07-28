Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF98C4345B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 05:14:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1CD822B48
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 05:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H96wYwSK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAjIiROU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1CD822B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X2oLDoZM0jniq++nXf5W+TepP5YryoUynQXlV+XYeqk=; b=H96wYwSKu5QPv+4Trz9m558xD
	qU1xKQYpobpgKStZAfVmMOniQk8XBOhl2+IcvbA9pSVmMzwl0CxxEKX46otpuCM0M5ZNLfmbHIaz5
	pdnJqYAFenKgeFbsDDfZ/n44j2EcF1HPbiBFkM0ZAlm8HypMZoY6lnzvXdGOhAMMeDcA8FSCHz+Ie
	GUkI9lyFrqoorMyKrR3UAPmm8+NRcmcZnqISshm+cbHvHGdNhCrAq8KvdzbIKHfFUYpH2oo45QbQa
	SGMHuUtsXHs1/418SLD6IOiRqUgFY3e6ncgVMuKlxtFeuEyGgwnFfdFsx1VZZVU9Lc5yz9UhzUN1f
	+7O3eZTMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Hw4-0005Mf-86; Tue, 28 Jul 2020 05:13:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0HvN-00052F-NA; Tue, 28 Jul 2020 05:13:16 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B649522B45;
 Tue, 28 Jul 2020 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913193;
 bh=w0NUYCkRPztxWdauIZ7iYp1zOp1jLcG8AD5t4PqIxsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YAjIiROU+83p25BDNEgIN9KISlKJXThut30Rs4cNno1O6shiBCHaHk29LQKLS7Ax5
 Ejyf6BAz+viwYwWWCNj69uR3Ffj9ovcm+78DaXms94OZuxA4yw2XiA7huGDx/Xn9eG
 FxVpJAd03+F3yNWhAm0fZShWCJUQp1/pDjBxfrnc=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/15] powerpc: fadamp: simplify fadump_reserve_crash_area()
Date: Tue, 28 Jul 2020 08:11:44 +0300
Message-Id: <20200728051153.1590-7-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_011313_896339_9C461BFA 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

fadump_reserve_crash_area() reserves memory from a specified base address
till the end of the RAM.

Replace iteration through the memblock.memory with a single call to
memblock_reserve() with appropriate  that will take care of proper memory
reservation.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 78ab9a6ee6ac..2446a61e3c25 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
 /* Preserve everything above the base address */
 static void __init fadump_reserve_crash_area(u64 base)
 {
-	struct memblock_region *reg;
-	u64 mstart, msize;
-
-	for_each_memblock(memory, reg) {
-		mstart = reg->base;
-		msize  = reg->size;
-
-		if ((mstart + msize) < base)
-			continue;
-
-		if (mstart < base) {
-			msize -= (base - mstart);
-			mstart = base;
-		}
-
-		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
-			(msize >> 20), mstart);
-		memblock_reserve(mstart, msize);
-	}
+	memblock_reserve(base, memblock_end_of_DRAM() - base);
 }
 
 unsigned long __init arch_reserved_kernel_pages(void)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
