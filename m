Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A10F4BB6E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYKh5aKVCGmow/3QUdQPdIVVsvWufIkWUVMIMJonEDQ=; b=pH/mhp3H7EMnU2
	cnGB1M5fJfIFDtw3BgGz16M28PgxCWR/PW8Wz3pWvX2MbtL0SSfBFb+a+88fg87p4EkV27jqxTTWc
	GblAdB3kQCNNIHUnmhm7hg1Fstcs2y426L/Iu3NvYTyWtMRDYJYEoAlfs26/AWkmLeB75/qSl4QIe
	NrxNoBPlzWF1b+Tv9d5799yutiCXUdkUJO4jS+DIp88Mg4b2/ExuTFvJqJzr27GWTa1s6rEGCLp2p
	PT9ShW/x2iK5Y3U8EJqBgAznSRVlH9kVrfsCmLCO8TwBIo5UX6HAo8VvFwj6vYoq5Qc4vE5ndqTIS
	ousz6+rE6L7KoK466Ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfi-00000002Wku-0sRp;
	Tue, 24 Feb 2026 17:58:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwff-00000002Whi-1hFB;
	Tue, 24 Feb 2026 17:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64C436011F;
	Tue, 24 Feb 2026 17:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B645BC19422;
	Tue, 24 Feb 2026 17:58:02 +0000 (UTC)
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
Subject: [PATCH 0/5] mm: arch/shstk: Common shadow stack mapping helper and VM_NOHUGEPAGE
Date: Tue, 24 Feb 2026 17:57:52 +0000
Message-ID: <20260224175800.2500729-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
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

Hi,

arm64, riscv and x86 all implement shadow stack support and use a
similar pattern for mapping the user shadow stack (originally cloned
from x86). Extract this common pattern into a shared helper -
vm_mmap_shadow_stack().

Patch 1 introduces vm_mmap_shadow_stack() in mm/util.c, which wraps
do_mmap() with the flags required for a VM_SHADOW_STACK mapping. The
helper uses PROT_READ|PROT_WRITE prot bits instead of the earlier x86
approach of PROT_READ with an explicit VM_WRITE vm_flag. Functionally
there is no difference. I looked up the history of this flag on the
lists but it wasn't conclusive. My guess is that the original aim was to
mark the vma not writable but that would confuse the kernel, so it ended
up with the VM_WRITE flag instead.

Patches 2-4 update arm64, riscv and x86 respectively to use the new
helper, removing the duplicated mmap logic.

Patch 5 forces VM_NOHUGEPAGE when allocating the shadow stack via the
new helper, mirroring what commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK
to VM_NOHUGEPAGE") did for normal stacks. It will save some memory,
especially when the ulimit -s is high.

Boot-tested on x86, fully tested on arm64. I do not have a compiler
version that supports the -march=rv64ima_zicfiss_zicfilp option for
riscv, so any help with testing is welcome.

Thanks.

Catalin Marinas (5):
  mm: Introduce vm_mmap_shadow_stack() as a helper for VM_SHADOW_STACK
    mappings
  arm64: gcs: Use the new common vm_mmap_shadow_stack() helper
  riscv: shstk: Use the new common vm_mmap_shadow_stack() helper
  x86: shstk: Use the new common vm_mmap_shadow_stack() helper
  mm: Do not map the shadow stack as THP

 arch/arm64/mm/gcs.c         | 14 +-------------
 arch/riscv/kernel/usercfi.c | 12 +-----------
 arch/x86/kernel/shstk.c     | 12 ++----------
 include/linux/mm.h          |  4 ++++
 mm/util.c                   | 29 +++++++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 34 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
