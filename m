Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2647FD3774
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLAzuf/lTm4QLDauwN7B1XZ/IiNN5ta0TC4Qdl5DM6o=; b=l5B/FSRWR1139g
	isPTY7taAkDf35i+FEgNWTM/NvLGudoiwpGheKJ9V7vIJhCdpnYtSkWoP4lappwsi0BHSR9kASW6T
	WoUH0DLQIqfi7u2IVgVMSqF5NRBWtS5xDAOYCiuWV9LmUehw4Vb21SQ8KDfExY6jq2O5urzNm7dOo
	Fy7WiQ/xrYptgp4Gnew7XATj5IeS0SeBQ7zmBIac6utGb/5Rl78o1GPam6DD2CaWYgTcJfJUuq3dD
	GX3XA1SeBj8olbVuaWZ6CKtewcMbL5Uh9vDHXXCYAFfG29mEXz+LtgFs789x4an14eE7aBuqzWnb7
	zYILasfmr82o2MAftTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHWz-00000004To4-0luy;
	Wed, 25 Feb 2026 16:14:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHWv-00000004TkA-2r1H;
	Wed, 25 Feb 2026 16:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4326F43392;
	Wed, 25 Feb 2026 16:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC27C116D0;
	Wed, 25 Feb 2026 16:14:25 +0000 (UTC)
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
Subject: [PATCH v2 5/5] mm: Do not map the shadow stack as THP
Date: Wed, 25 Feb 2026 16:14:02 +0000
Message-ID: <20260225161404.3157851-6-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225161404.3157851-1-catalin.marinas@arm.com>
References: <20260225161404.3157851-1-catalin.marinas@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081429_760656_F3A9657D 
X-CRM114-Status: GOOD (  13.09  )
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

The default shadow stack size allocated on first prctl() for the main
thread or subsequently on clone() is either half of RLIMIT_STACK or half
of a thread's stack size (for arm64). Both of these are likely to be
suitable for a THP allocation and the kernel is more aggressive in
creating such mappings. However, it does not make much sense to use a
huge page. It didn't make sense for the normal stacks either, see commit
c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE").

Force VM_NOHUGEPAGE when allocating/mapping the shadow stack. As per
commit 7190b3c8bd2b ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if
THP is enabled"), only pass this flag if TRANSPARENT_HUGEPAGE is enabled
as not to confuse CRIU tools.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/util.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 51f7f417e91f..419cb81ab353 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -629,14 +629,18 @@ unsigned long vm_mmap_shadow_stack(unsigned long addr, unsigned long len,
 {
 	struct mm_struct *mm = current->mm;
 	unsigned long ret, unused;
+	vm_flags_t vm_flags = VM_SHADOW_STACK;
 
 	flags |= MAP_ANONYMOUS | MAP_PRIVATE;
 	if (addr)
 		flags |= MAP_FIXED_NOREPLACE;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		vm_flags |= VM_NOHUGEPAGE;
+
 	mmap_write_lock(mm);
 	ret = do_mmap(NULL, addr, len, PROT_READ | PROT_WRITE, flags,
-		      VM_SHADOW_STACK, 0, &unused, NULL);
+		      vm_flags, 0, &unused, NULL);
 	mmap_write_unlock(mm);
 
 	return ret;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
