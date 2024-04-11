Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE94C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJy+Ra/7Z8eLooWsJhd3oUigFgyE6mv+GDuRxm8u55Y=; b=ELr0+pugb0YB9C
	xmCeBo/0LIyuulqahqO0yjs3cz4C1AV+AJIHOIrj/myU9X7HoXaYkOEodc/Uzlqgbt0lZkyWeGeK5
	EAOx0VAYbohi7hOQYmrRwEZFomQF2/Z1tC/S1JYLEx+PD+++lmVZ6A097zoazFnR0WBhY6WelekgM
	fy9Nwxw07a1XB4HozRh5j0eEsZWHc3ltZj8MH/sfHMxhTvu6TNcDXB1RDP7W6fcghPu364F/UFtxj
	bSZqk7Nc8DB/MoSRDHqoRxBRbPARAjOAsZVgGnbRVeNIuIJspPqY8CqfmqvdqcCJUGiPZQf9T2CPs
	u1FdgcEXfl9fin9LkeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruy4X-0000000DKmw-0ziq;
	Thu, 11 Apr 2024 17:18:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwl-0000000CwfH-0mKb;
	Thu, 11 Apr 2024 16:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DC02620F0;
	Thu, 11 Apr 2024 16:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A810C4AF09;
	Thu, 11 Apr 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851602;
	bh=GpS8ytfjSzE76nC42qU8VRxGL9fjdKFDqm8vIE1x4YY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRW/q4WS++c0r4pBuIO3O4Xg4RhucjdHqnNZoi79AHoLhQPJWC7o5buwGGFBPvniC
	 VKRspPAvG+oxGO/Mu52T5QZWLHipAdpse5TDkTXl4UCRQQbTzoV2tVhPjQUCAlmNo0
	 NG232/NssiPa7JNKn0tv4mghHev6HdVbKr+LbbRCokaCTTwVdChPLdcxxCtgfIMnpO
	 Z1hyZ7UoVGi2N4el/7GuNUEzPhXZ5vzgMOKVlVVadMtRh3z+39u712GiPM9IWHw2qe
	 adjgDWeIItjJVb1bdKVNluXidKTvt1LLI9M1CnLR4urws3bFChygnRYjAkvNDCL/IG
	 2uw/kGGX3wdrg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [RFC PATCH 7/7] x86/module: enable ROX caches for module text
Date: Thu, 11 Apr 2024 19:05:26 +0300
Message-ID: <20240411160526.2093408-8-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160526.2093408-1-rppt@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_090643_700481_E1AACA2C 
X-CRM114-Status: GOOD (  14.25  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
text allocations.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/x86/mm/init.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 8e8cd0de3af6..049a8b4c64e2 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1102,9 +1102,23 @@ unsigned long arch_max_swapfile_size(void)
 #endif
 
 #ifdef CONFIG_EXECMEM
+static void execmem_invalidate(void *ptr, size_t size, bool writeable)
+{
+	/* fill memory with INT3 instructions */
+	if (writeable)
+		memset(ptr, 0xcc, size);
+	else
+		text_poke_set(ptr, 0xcc, size);
+}
+
 static struct execmem_info execmem_info __ro_after_init = {
+	.invalidate = execmem_invalidate,
 	.ranges = {
-		[EXECMEM_DEFAULT] = {
+		[EXECMEM_MODULE_TEXT] = {
+			.flags = EXECMEM_KASAN_SHADOW | EXECMEM_ROX_CACHE,
+			.alignment = MODULE_ALIGN,
+		},
+		[EXECMEM_KPROBES...EXECMEM_MODULE_DATA] = {
 			.flags = EXECMEM_KASAN_SHADOW,
 			.alignment = MODULE_ALIGN,
 		},
@@ -1119,9 +1133,16 @@ struct execmem_info __init *execmem_arch_setup(void)
 		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
 
 	start = MODULES_VADDR + offset;
-	execmem_info.ranges[EXECMEM_DEFAULT].start = start;
-	execmem_info.ranges[EXECMEM_DEFAULT].end = MODULES_END;
-	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
+
+	for (int i = EXECMEM_MODULE_TEXT; i < EXECMEM_TYPE_MAX; i++) {
+		struct execmem_range *r = &execmem_info.ranges[i];
+
+		r->start = start;
+		r->end = MODULES_END;
+		r->pgprot = PAGE_KERNEL;
+	}
+
+	execmem_info.ranges[EXECMEM_MODULE_TEXT].pgprot = PAGE_KERNEL_ROX;
 
 	return &execmem_info;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
