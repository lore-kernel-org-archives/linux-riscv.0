Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE1ECAC598
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GDarMEP+79MQFYUdB4hOjYoDH+wlQwYvhXw6N34inM4=; b=nlJeEcAKVWCfUn
	7bdxWVH8BF4nldjuHJQ+U2qZoccFVY4QsOid3W8VAITOlrRY4Ed6H2fmVquDFC+Vwb9tjmEM265MD
	gibewBYWsdOml+31BXVhGlSC3EQUvHXXviWMA2r02VWC4GMYxDCJ2h2Hdx3sQQRsrquPUYdARofrL
	FNgLiLuzDE3PKwFtoRGZwvwsS7npWqQlaBTnPbgFeUHNmk1HcUQZH0FfpBvTXiMT3ndNq50XYyXCM
	FhYQIHSREDYlsy29kRsUX/3xgvpY3obLr2iLpN+GZvpOStRoc5epSH0Cc6DLOe2uHr1723pYpw+Kp
	DTfwHmrF4vQsnOF1RO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6EG-00000003bO4-3qq5;
	Mon, 15 Sep 2025 10:14:36 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6EC-00000003bIX-1jIu
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 10:14:35 +0000
Received: from ubt.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAD3lxHf5sdoHWn3Ag--.53429S2;
	Mon, 15 Sep 2025 18:13:51 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V12 0/5] riscv: mm: Add soft-dirty and uffd-wp support
Date: Mon, 15 Sep 2025 18:13:38 +0800
Message-Id: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3lxHf5sdoHWn3Ag--.53429S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw4xGry5XrWktFykurW3KFg_yoWrtrWxpF
	4UG343tr4rtFyxKws3Xw1j9a1Yqan5t345Gw15J34rA3y7K3WjvrnY9a1rGF1DJF4UWryS
	qrZIkr9093yqyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxU958nDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAgGB2jHtULAJQAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_031432_809487_8F451D45 
X-CRM114-Status: GOOD (  18.36  )
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

This patchset adds support for Svrsw60t59b [1] extension which is ratified now,
also add soft dirty and userfaultfd write protect tracking for RISC-V.

The patches 1 and 2 add macros to allow architectures to define their own checks
if the soft-dirty / uffd_wp PTE bits are available, in other words for RISC-V,
the Svrsw60t59b extension is supported on which device the kernel is running.

This patchset has been tested with kselftest mm suite in which soft-dirty, 
madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
and no regressions are observed in any of the other tests.

This patchset applies on top of v6.17-rc6.

[1] https://github.com/riscv-non-isa/riscv-iommu/pull/543

V12:
- Rename the macro API to pgtable_supports_soft_dirty/uffd_wp();
- Add changes for setting VM_SOFTDIRTY flags conditionally;
- Drop changes to show_smap_vma_flags();
- Drop CONFIG_MEM_SOFT_DIRTY compile condition of clear_soft_dirty() and clear_soft_dirty_pmd();
- Fix typos;
- Add uffd_supports_wp_marker() and drop some ifdef CONFIG_PTE_MARKER_UFFD_WP.

V11: https://lore.kernel.org/all/20250911095602.1130290-1-zhangchunyan@iscas.ac.cn/
- Rename the macro API to pgtable_*_supported() since we also have PMD support;
- Change the default implementations of two macros, make CONFIG_MEM_SOFT_DIRTY or
  CONFIG_HAVE_ARCH_USERFAULTFD_WP part of the macros;
- Correct the order of insertion of RISCV_ISA_EXT_SVRSW60T59B;
- Rephrase some comments.

V10: https://lore.kernel.org/all/20250909095611.803898-1-zhangchunyan@iscas.ac.cn/
- Fixed the issue reported by kernel test irobot <lkp@intel.com>.

V9: https://lore.kernel.org/all/20250905103651.489197-1-zhangchunyan@iscas.ac.cn/
- Add pte_soft_dirty/uffd_wp_available() API to allow dynamically checking
  if the PTE bit is available for the platform on which the kernel is running.

V8: https://lore.kernel.org/all/20250619065232.1786470-1-zhangchunyan@iscas.ac.cn/)
- Rebase on v6.16-rc1;
- Add dependencies to MMU && 64BIT for RISCV_ISA_SVRSW60T59B;
- Use 'Svrsw60t59b' instead of 'SVRSW60T59B' in Kconfig help paragraph;
- Add Alex's Reviewed-by tag in patch 1.

V7: https://lore.kernel.org/all/20250409095320.224100-1-zhangchunyan@iscas.ac.cn/
- Add Svrsw60t59b [1] extension support;
- Have soft-dirty and uffd-wp depending on the Svrsw60t59b extension to
  avoid crashes for the hardware which don't have this extension.

V6: https://lore.kernel.org/all/20250408084301.68186-1-zhangchunyan@iscas.ac.cn/
- Changes to use bits 59-60 which are supported by extension Svrsw60t59b
  for soft dirty and userfaultfd write protect tracking.

V5: https://lore.kernel.org/all/20241113095833.1805746-1-zhangchunyan@iscas.ac.cn/
- Fixed typos and corrected some words in Kconfig and commit message;
- Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste
  error;
- Added Alex's Reviewed-by tag in patch 2.

V4: https://lore.kernel.org/all/20240830011101.3189522-1-zhangchunyan@iscas.ac.cn/
- Added bit(4) descriptions into "Format of swap PTE".

V3: https://lore.kernel.org/all/20240805095243.44809-1-zhangchunyan@iscas.ac.cn/
- Fixed the issue reported by kernel test irobot <lkp@intel.com>.

V2: https://lore.kernel.org/all/20240731040444.3384790-1-zhangchunyan@iscas.ac.cn/
- Add uffd-wp supported;
- Make soft-dirty uffd-wp and devmap mutually exclusive which all use
  the same PTE bit;
- Add test results of CRIU in the cover-letter.

Chunyan Zhang (5):
  mm: softdirty: Add pgtable_supports_soft_dirty()
  mm: userfaultfd: Add pgtable_supports_uffd_wp()
  riscv: Add RISC-V Svrsw60t59b extension support
  riscv: mm: Add soft-dirty page tracking support
  riscv: mm: Add userfaultfd write-protect support

 arch/riscv/Kconfig                    |  16 +++
 arch/riscv/include/asm/hwcap.h        |   1 +
 arch/riscv/include/asm/pgtable-bits.h |  37 +++++++
 arch/riscv/include/asm/pgtable.h      | 143 +++++++++++++++++++++++++-
 arch/riscv/kernel/cpufeature.c        |   1 +
 fs/proc/task_mmu.c                    |  15 ++-
 fs/userfaultfd.c                      |  22 ++--
 include/asm-generic/pgtable_uffd.h    |  17 +++
 include/linux/mm.h                    |   3 +
 include/linux/mm_inline.h             |  10 +-
 include/linux/pgtable.h               |  12 +++
 include/linux/userfaultfd_k.h         |  27 +++--
 mm/debug_vm_pgtable.c                 |  10 +-
 mm/huge_memory.c                      |  13 +--
 mm/internal.h                         |   2 +-
 mm/memory.c                           |   6 +-
 mm/mmap.c                             |   6 +-
 mm/mremap.c                           |  13 +--
 mm/userfaultfd.c                      |  10 +-
 mm/vma.c                              |   6 +-
 mm/vma_exec.c                         |   5 +-
 21 files changed, 306 insertions(+), 69 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
