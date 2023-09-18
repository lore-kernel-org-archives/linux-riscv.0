Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C079ACD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80O5lAk5FKAIxoUTRO4qvOw+KJCGEEwNGjdmmUEIeCo=; b=hpur6J4EmPIgh1
	BMJpFdjVwBLW3gjoq4dC+qGG79Y6EVuc7DvhMmMxFVSlJ3xdID8L2m3dlFcKFi6I7qGTnOtG3KmKj
	3ycV55SpZvUAESsLvNJsRvncQ7g/ct5fvkGA37HziMVQ3qUH/i8IrJXJ3ouCqTwAPVT2+cH/T5UyP
	YYMi3ysn6uaQ3spfKB2BT336hclM6j75l0+bpoK0dczQtUQuqW8GozT34ZrGsDM4azvk/ndQ0TpqA
	UrD1vs+N36N0Drz968YXZvzr+lP5luLFMvUgvwEpMkSmt6KoB1PzPV6iNIctlyNc27wDGPBIhQ0uy
	cFBB4Ub51ZCbzWCZw7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8jV-00Ei4m-0M;
	Mon, 18 Sep 2023 07:31:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8jP-00Ehyj-1W;
	Mon, 18 Sep 2023 07:31:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE75660F8F;
	Mon, 18 Sep 2023 07:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5155AC433B7;
	Mon, 18 Sep 2023 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022302;
	bh=35ZlmvV7rKqwzQaOmbBijH380/EeVtPirZbGWiToTW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2NNM60PB58jmuhS2dGN8NLbq1KB4ygYvRR0t6DZZJS7qBVZpROHao20O2uQV3bli
	 0QvXp0s5+eLFeJhc/w10Fn3KC9lksq3uhoYzEZC5CWp+6gjai+j/d0a89/bBUhyjJy
	 FfXXBFOSn88hPGWgJbSxUtSr8ULAUympoyAWJKP5uJmt4lykdt9r5kJb2u9np9CG9l
	 pAU2vChu/4/QGlbV5wO6V/EhzFjCpLIlsY1oLhcdgzQ+bitYphtILzsTup5ZLrX357
	 OmssgGZ5JmBAamSicGtU177ClYYdO2+YHkslBuFOroSFhEYDOcBWDp8NAr0VRv3fiX
	 mkBw/0g11HpDQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes allocations
Date: Mon, 18 Sep 2023 10:29:51 +0300
Message-Id: <20230918072955.2507221-10-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_003143_602466_DF78C6A9 
X-CRM114-Status: GOOD (  15.91  )
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

powerpc overrides kprobes::alloc_insn_page() to remove writable
permissions when STRICT_MODULE_RWX is on.

Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
generic kprobes::alloc_insn_page() with the desired permissions.

As powerpc uses breakpoint instructions to inject kprobes, it does not
need to constrain kprobe allocations to the modules area and can use the
entire vmalloc address space.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/kprobes.c | 14 --------------
 arch/powerpc/kernel/module.c  | 11 +++++++++++
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 62228c7072a2..14c5ddec3056 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -126,20 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offse
 	return (kprobe_opcode_t *)(addr + offset);
 }
 
-void *alloc_insn_page(void)
-{
-	void *page;
-
-	page = execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
-	if (!page)
-		return NULL;
-
-	if (strict_module_rwx_enabled())
-		set_memory_rox((unsigned long)page, 1);
-
-	return page;
-}
-
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index 824d9541a310..bf2c62aef628 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -95,6 +95,9 @@ static struct execmem_params execmem_params __ro_after_init = {
 		[EXECMEM_DEFAULT] = {
 			.alignment = 1,
 		},
+		[EXECMEM_KPROBES] = {
+			.alignment = 1,
+		},
 		[EXECMEM_MODULE_DATA] = {
 			.alignment = 1,
 		},
@@ -135,5 +138,13 @@ struct execmem_params __init *execmem_arch_params(void)
 
 	range->pgprot = prot;
 
+	execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_START;
+	execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_END;
+
+	if (strict_module_rwx_enabled())
+		execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
+	else
+		execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_EXEC;
+
 	return &execmem_params;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
