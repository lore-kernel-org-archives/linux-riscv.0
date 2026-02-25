Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC67EFD3770
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YC7pG5NZ8x69yTPDvu0hS/65AwGcnC2i/K+e7QQlKy0=; b=CjciAREK8TDuQi
	NAkHQQ68oigYyRnYn1PcQD3sGNm0Mi/+bFaGIuqrqdXfil9RtRgYMHfzAsQQ4xF2mSLWqUGhxXFmi
	fJI/kTL8RJC/m9mq+5TMPI2YwNAbO4nHbitvw3D8QMLULYwsssPIEm9Cdo3dA7C1PzG7vhNP3sjvz
	JqipfwaKyR0mjNjucOyOXv7lMs6zhCWcEgiaUsr4rzzxvXZA971FR3ftOww48HoD5EWW47U2IB2yJ
	oNlxUx4WPy1tzbb4WAoEfeGZkXNFDeynMRF8SqUVIzaARC5Gz3+27147kSNvmG1BtAjJJ5iqcNaAD
	ub4+olsgvko/yXy2wADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHXO-00000004UD2-1K8c;
	Wed, 25 Feb 2026 16:14:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHXM-00000004UAc-1NhA;
	Wed, 25 Feb 2026 16:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5076600AE;
	Wed, 25 Feb 2026 16:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1798CC19425;
	Wed, 25 Feb 2026 16:14:21 +0000 (UTC)
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
Subject: [PATCH v2 4/5] x86: shstk: Use the new common vm_mmap_shadow_stack() helper
Date: Wed, 25 Feb 2026 16:14:01 +0000
Message-ID: <20260225161404.3157851-5-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225161404.3157851-1-catalin.marinas@arm.com>
References: <20260225161404.3157851-1-catalin.marinas@arm.com>
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

Replace part of the x86 alloc_shstk() content with a call to
vm_mmap_shadow_stack(). There is no functional change.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Tested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
---
 arch/x86/kernel/shstk.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 978232b6d48d..9725e7d89b1e 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -100,17 +100,9 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
 static unsigned long alloc_shstk(unsigned long addr, unsigned long size,
 				 unsigned long token_offset, bool set_res_tok)
 {
-	int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_ABOVE4G;
-	struct mm_struct *mm = current->mm;
-	unsigned long mapped_addr, unused;
+	unsigned long mapped_addr;
 
-	if (addr)
-		flags |= MAP_FIXED_NOREPLACE;
-
-	mmap_write_lock(mm);
-	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
-			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);
-	mmap_write_unlock(mm);
+	mapped_addr = vm_mmap_shadow_stack(addr, size, MAP_ABOVE4G);
 
 	if (!set_res_tok || IS_ERR_VALUE(mapped_addr))
 		goto out;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
