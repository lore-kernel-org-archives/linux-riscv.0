Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAF4F4BB6C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQmboWC5prO03Jzz3IsiCxnrQvxQh6VuPS9ut7Eo1so=; b=PUV4WFdU8Wt72O
	D8PCUO/D7RcXgp52Y5oPOTIX3KVk9u8CIPvPboJ/aKYHrjTV9n/z37fSEeDpmXEUIUdGykIgBOULZ
	swBFRr0x7qlVxlv+YFzJQteQfbh0yaPCdG0kaL3aQAP5eA2UgpVuS36xeaWVLUhZ/OAw/3DbMKNiS
	ocx3voZpe6Cg91VfGwLLRGauzJWnweczHwv8XCYzl4lwhZ6Tng0RxLG1yriHBJm8mUgnNRmR48ZZ5
	EqnpudBeb/4kSqJDEcJxT5bJx1peAJ8biF6QGzgcn+WW3gcvV9DtTwtyOcZlneMYyF5Bt9JbhHF5r
	zAusOYs2/2X0bv5GSo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfw-00000002X2g-0bVN;
	Tue, 24 Feb 2026 17:58:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfm-00000002WqJ-1gJl;
	Tue, 24 Feb 2026 17:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0F6F6012B;
	Tue, 24 Feb 2026 17:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38832C19425;
	Tue, 24 Feb 2026 17:58:10 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH 2/5] arm64: gcs: Use the new common vm_mmap_shadow_stack() helper
Date: Tue, 24 Feb 2026 17:57:54 +0000
Message-ID: <20260224175800.2500729-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224175800.2500729-1-catalin.marinas@arm.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
MIME-Version: 1.0
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

Replace the arm64 map_shadow_stack() content with a call to
vm_mmap_shadow_stack().

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/gcs.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 04a23a497f20..680749611a9a 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -12,19 +12,7 @@
 
 static unsigned long alloc_gcs(unsigned long addr, unsigned long size)
 {
-	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
-	struct mm_struct *mm = current->mm;
-	unsigned long mapped_addr, unused;
-
-	if (addr)
-		flags |= MAP_FIXED_NOREPLACE;
-
-	mmap_write_lock(mm);
-	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
-			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);
-	mmap_write_unlock(mm);
-
-	return mapped_addr;
+	return vm_mmap_shadow_stack(addr, size, 0);
 }
 
 static unsigned long gcs_size(unsigned long size)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
