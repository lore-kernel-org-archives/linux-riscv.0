Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BCBC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CSFGpkzJii2QJF5z9PH9H86cnzugclJjXdmoGZZujk=; b=aVSgIsZ/5LvUvg
	Asp2+oh7BLqv1u+9d24yBD3ARGb8c4tXVGfa0E9+NqKD46D5KmgMgyHULMkOwqMVvVpMsPSASZrbd
	vCdfeWHF16Hsgb2Brc0w51pCLD/FGrZmk3UOW6ml9/OeP5iAxRbPkhXouJ+R346v53kgG6gud1TvB
	O6YiDK7vmcMZWzvS67KURfWs5HBG7ZpxBXp4CPAk9gacWxK+eTK8kX4C5qPUD9xiEDdaoqaoEB66s
	JpwJgvQsHBjiq1LlUm7FptRN/K0dRPrUjBPflDzBdnsEg/VB569acG9FMTQu5vKqluUSpWjVfI+5B
	XKuiuDdzYg7KwsvCbg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqEz-0000000Cyil-1BB8;
	Mon, 22 Apr 2024 09:45:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqEi-0000000CyTv-3Rrh;
	Mon, 22 Apr 2024 09:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 325E460D42;
	Mon, 22 Apr 2024 09:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979B2C32782;
	Mon, 22 Apr 2024 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713779119;
	bh=DCxnhfiOCuZ1vbHkz6N1kzg5vD2Mqvj8bCN8VHj/6O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZee716i2NvTHrefcf/oQGlTDn2j+EcgYjKiWPeAYh0vQkdq4nSVaACsF3xiVgZio
	 83P5gGlciq/2esGsMsLCWXYJLDEFgqpwq8GbJzpQQ2zmW5Do/piiuEqScInvgtvolx
	 n/mzauoUoCxB4q2uI2+7+cSednMvfUk7JJXizOtWKkMUSD543th6GhVontSQoUqmHH
	 7H3Q6WZxtcAEvhk4LnEiCyk/2v5MOyO/JHts5qVF6EnwUgqQ9WuMVLm5YxSWtns6vF
	 PlMSZFG0ZyMgxzsIkA0nytKifWCJoeuvPvyhQisTQRSdMp/pBO9jcf7E3CfVZXhiuX
	 DkI6aakNO0BKA==
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
Date: Mon, 22 Apr 2024 12:44:23 +0300
Message-ID: <20240422094436.3625171-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422094436.3625171-1-rppt@kernel.org>
References: <20240422094436.3625171-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_024521_039291_44267724 
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
