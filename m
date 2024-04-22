Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AEBC07E8F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CSFGpkzJii2QJF5z9PH9H86cnzugclJjXdmoGZZujk=; b=ALOqp/l4hXk7PS
	D/NVXwenFFHRzSdIbQnl14iP2p2PwfES5unbd66keYLxeTvqafOh4eA5fXG8vemPO5xs03Vi9HueZ
	BvwiGlAGoEP0z4wfKK7Cvge/tfhZTZICDS0KnAm3dEuwnrtXqMvM4030uQXiUS32BO3BejtT0tR6p
	g6I0/SBNxVb2CS3KDQgnZuSpVQizP3cl+t0q/4alw2/WNyyp4NUPBGO9sdRCjap+lgDVL+Ho0QLT5
	+Uq5Nn6QhVBQ+RF0T0cvVd3ePiCdDkhXDzTI0e8BeZwdSCCpY3d9h7fLqqVUlXxPPcw9Mdl7JpVhv
	o1PQPNFzqZO8+ZnA8KKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypLC-0000000CiiI-0hpQ;
	Mon, 22 Apr 2024 08:47:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypL3-0000000CiZD-3JF4;
	Mon, 22 Apr 2024 08:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 296EB60D32;
	Mon, 22 Apr 2024 08:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DACC3277B;
	Mon, 22 Apr 2024 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713775669;
	bh=DCxnhfiOCuZ1vbHkz6N1kzg5vD2Mqvj8bCN8VHj/6O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mps6aHrb6AV3oyZl5FmE+MfwgISX2oKniz00n73cWPu8M38bphHsNqTfQijby4bMh
	 I8s7vmc5ajRK4JIpr5iBWaNBz04iwyWpipy7y5HC6V4I/DOInX+0dmc1xHzMV8vP6d
	 SAIkRF3xAit5Hjhbf/wdCcT3+Bxk4ZHwq4AXY22A270Ocxxd7L/iPoPlXuCCUS9B1v
	 HRuTA3LRRGxR2hMjbwnJ8palU3umjclGLu8ZSedMuy2V8vamJEYEa/l9xd8JJEcD0C
	 CW+EUs/cOAJg4BVftrSx3urpNYaYPI5lz+fF9RdQQCwpiy73NrybWs6ZQcHjku8Hc+
	 IWeFpdB8IJ2Sw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
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
Subject: [PATCH v5 02/15] mips: module: rename MODULE_START to MODULES_VADDR
Date: Mon, 22 Apr 2024 11:47:10 +0300
Message-ID: <20240422084717.3602332-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422084717.3602332-1-rppt@kernel.org>
References: <20240422084717.3602332-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_014750_015624_6D592508 
X-CRM114-Status: GOOD (  13.74  )
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

and MODULE_END to MODULES_END to match other architectures that define
custom address space for modules.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/mips/include/asm/pgtable-64.h | 4 ++--
 arch/mips/kernel/module.c          | 4 ++--
 arch/mips/mm/fault.c               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 20ca48c1b606..c0109aff223b 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -147,8 +147,8 @@
 #if defined(CONFIG_MODULES) && defined(KBUILD_64BIT_SYM32) && \
 	VMALLOC_START != CKSSEG
 /* Load modules into 32bit-compatible segment. */
-#define MODULE_START	CKSSEG
-#define MODULE_END	(FIXADDR_START-2*PAGE_SIZE)
+#define MODULES_VADDR	CKSSEG
+#define MODULES_END	(FIXADDR_START-2*PAGE_SIZE)
 #endif
 
 #define pte_ERROR(e) \
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 7b2fbaa9cac5..9a6c96014904 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -31,10 +31,10 @@ struct mips_hi16 {
 static LIST_HEAD(dbe_list);
 static DEFINE_SPINLOCK(dbe_lock);
 
-#ifdef MODULE_START
+#ifdef MODULES_VADDR
 void *module_alloc(unsigned long size)
 {
-	return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
 				__builtin_return_address(0));
 }
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index aaa9a242ebba..37fedeaca2e9 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -83,8 +83,8 @@ static void __do_page_fault(struct pt_regs *regs, unsigned long write,
 
 	if (unlikely(address >= VMALLOC_START && address <= VMALLOC_END))
 		goto VMALLOC_FAULT_TARGET;
-#ifdef MODULE_START
-	if (unlikely(address >= MODULE_START && address < MODULE_END))
+#ifdef MODULES_VADDR
+	if (unlikely(address >= MODULES_VADDR && address < MODULES_END))
 		goto VMALLOC_FAULT_TARGET;
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
