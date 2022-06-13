Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18461C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fyHB+JqN1aZj9aTbxnyxrPYaFv87fxFAFnogeTDwMp0=; b=Ce5MyE6RuAWKM1
	B1V+LPfh2DCtcoXOJ2otp/Lanm4nJ0qK6jnT2bRnBmSxe0+yJUgYzDLFxt9S9SSjBB//+yh9zLhMC
	rcsFyIzkTTsU3xzntl7gd+T+VRQyXEXPUOpp2aEx+v5Dx0qlgYlJh9ZH++pqmpgcPMr7/PQto45dj
	IdgzOySP3D+91Txm/EpKisf7V0+RsSC7bmyCGmSyu7SveAEfn82zNZeHcdoe+JncfI+IrjAaLCFwD
	DSWBqbSEGtKS9FTV+O0AlkCEoHxUV85CeNQrcumg3eoAFQWKZS3woFb/jgIzYOCSbA9LCu0/HrDo3
	n08bonajhqvSU0FIv/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0f0U-0026iL-Nn; Mon, 13 Jun 2022 08:01:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ezy-0026Mt-R9; Mon, 13 Jun 2022 08:00:37 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LM3qt6nPZzjXZ3;
	Mon, 13 Jun 2022 15:59:22 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:25 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:24 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <corbet@lwn.net>, <will@kernel.org>, <ardb@kernel.org>,
	<catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<mawupeng1@huawei.com>, <anshuman.khandual@arm.com>,
	<thunder.leizhen@huawei.com>, <wangkefeng.wang@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 0/6] introduce mirrored memory support for arm64
Date: Mon, 13 Jun 2022 16:21:41 +0800
Message-ID: <20220613082147.183145-1-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_010035_265908_D40405AF 
X-CRM114-Status: GOOD (  13.79  )
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

From: Ma Wupeng <mawupeng1@huawei.com>

Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
introduced mirrored memory support for x86. This support rely on UEFI to
report mirrored memory address ranges.  See UEFI 2.5 spec pages 157-158:

  http://www.uefi.org/sites/default/files/resources/UEFI%202_5.pdf

Memory mirroring is a technique used to separate memory into two separate
channels, usually on a memory device, like a server. In memory mirroring,
one channel is copied to another to create redundancy. This method makes
input/output (I/O) registers and memory appear with more than one address
range because the same physical byte is accessible at more than one
address. Using memory mirroring, higher memory reliability and a higher
level of memory consolidation are possible.

These EFI memory regions have various attributes, and the "mirrored"
attribute is one of them. The physical memory region whose descriptors
in EFI memory map has EFI_MEMORY_MORE_RELIABLE attribute (bit: 16) are
mirrored. The address range mirroring feature of the kernel arranges such
mirrored regions into normal zones and other regions into movable zones.

Arm64 can support this too. So mirrored memory support is added to support
arm64.

The main purpose of this patch set is to introduce mirrored support for
arm64 and we have already fixed the problems we had which is shown in
patch #5 to patch #8 and try to bring total isolation in patch #9 which
will disable mirror feature if kernelcore is not specified.

In order to test this support in arm64:
- patch this patch set
- add kernelcore=mirror in kernel parameter
- start you kernel

Patch #1-#2 introduce mirrored memory support form arm64.
Patch #3-#5 fix some bugs for arm64 if memory reliable is enabled.
Patch #6 disable mirror feature if kernelcore is not specified.

Thanks to Ard Biesheuvel's hard work [1], now kernel will perfer mirrored
memory if kaslr is enabled.

[1] https://lore.kernel.org/linux-arm-kernel/CAMj1kXEPVEzMgOM4+Yj6PxHA-jFuDOAUdDJSiSxy_XaP4P7LSw@mail.gmail.com/T/

Changelog since v3:
- limit warning message in vmemmap_verify via pr_warn_once()
- only clear memblock_nomap flags rather than bring the mirrored flag back
- disable mirrored feature in memblock_mark_mirror()

Changelog since v2:
- remove efi_fake_mem support
- remove Commit ("remove some redundant code in ia64 efi_init") since
  efi_print_memmap() is not public
- add mirror flag back on initrd memory

Changelog since v1:
- update changelog in cover letter
- use PHYS_PFN in patch #7

Ma Wupeng (6):
  efi: Make efi_find_mirror() public
  arm64/mirror: arm64 enabling - find mirrored memory ranges
  mm: Ratelimited mirrored memory related warning messages
  mm: Limit warning message in vmemmap_verify() to once
  mm: Only remove nomap flag for initrd
  memblock: Disable mirror feature if kernelcore is not specified

 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/arm64/kernel/setup.c                     |  1 +
 arch/arm64/mm/init.c                          |  2 +-
 arch/x86/include/asm/efi.h                    |  4 ----
 arch/x86/platform/efi/efi.c                   | 23 -------------------
 drivers/firmware/efi/efi.c                    | 23 +++++++++++++++++++
 include/linux/efi.h                           |  3 +++
 mm/internal.h                                 |  2 ++
 mm/memblock.c                                 |  7 ++++--
 mm/page_alloc.c                               |  2 +-
 mm/sparse-vmemmap.c                           |  2 +-
 11 files changed, 38 insertions(+), 33 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
