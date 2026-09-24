Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D00C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQPemtJKqLJ4Hk6gns0HGWHu85/xQCUFpzTx8AuP7u0=; b=3A1gtHZmSsJjeq
	jAEwX0No5uvXREgPARco4YdmeVxSyMVPM9bbnhTQuacZMfWjotEiNBD/Mhrw9L8cVQWYN3ZZL1osW
	wejXYeHTK/nZ2VVpzBGP5lEqnC5dvOe8+atyD3Q7idalj0VVKU+qexwUyWMxVf9oXKVMjrB7hHszS
	tGmDng5k12oPHQtDp1JMH/KqULjwWEDIcVNi8+ExrSc31+rO4OjYdBIgmbIwYLZCyu7ezYdVzB042
	aZy/bfxEhWEcMoPv5KFdsi4aKhm+7L2U6eJuyPHYPia9cA1WhbadDhoD5t93Hx8FOb1Xtl4NtbGXC
	IbeJYe/U+zWdhSBSNEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cen-0000000A7Tp-2feb;
	Thu, 24 Sep 2026 06:10:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ceg-0000000A7Pl-0HAj;
	Thu, 24 Sep 2026 06:10:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA85640211;
	Thu, 24 Sep 2026 06:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1171F00893;
	Thu, 24 Sep 2026 06:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790230201;
	bh=Fa0KQ3fgRkDVGiDssz/j9qXG8YHMD9kKAj2GPSYE3Uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JH592GnKcE2iGAD07ASXMeBURt6QXUxEDyZ1fIFQ0oGthXjgqzKxtqRghMZfV1SDX
	 KjJCxF8wcsi0g3KU9Ll7drA0AED0KkzETF78nCFEaWQ7DCGbNiDY9pAKt3CISBLgxN
	 ByVHf4gXBDkom9D/wNER72wL+d5o/rzfaA8lNRA6OZohytw6ckxnTgM58h5UUmx0oI
	 QZxwJQoZCfqoiQUriDiBnPqaMeSVQgkY4vpC+PYkcwBmnmgSD/0GybQM/AP391pGdc
	 dpQTnoZxeQ5tW8Wygzal5/6KEoXFAcjH/muCPqK8a6yKzU5SdpruNHq7BWA6AsmqPm
	 rBHuXRBApBJFQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool sizing
Date: Thu, 24 Sep 2026 11:37:54 +0530
Message-ID: <20260924060756.1325156-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
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

Memory-encrypted guests use shared or unencrypted memory for DMA and may
route all DMA through SWIOTLB. The default pool can therefore be too
small for I/O-intensive workloads.

Move the existing x86 guest-sizing policy into the SWIOTLB core. For
SWIOTLB_POOL_CC_GUEST, size the pool to 6% of guest memory, clamped
between the normal default and 1 GiB. Preserve an explicit swiotlb=
size.

Host memory encryption still selects a normal-sized shared pool and
does not use the guest-sizing policy.

A restricted DMA pool already provides shared bounce buffers for its
devices. Record its presence during reserved-memory initialization and
do not select the confidential-guest default-pool policy solely because
guest memory encryption is active.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/x86/mm/mem_encrypt.c | 24 ------------------------
 kernel/dma/swiotlb.c      | 27 +++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 95bae74fdab2..912f22ca838f 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -101,9 +101,6 @@ void __init mem_encrypt_init(void)
 
 void __init mem_encrypt_setup_arch(void)
 {
-	phys_addr_t total_mem = memblock_phys_mem_size();
-	unsigned long size;
-
 	/*
 	 * Do RMP table fixups after the e820 tables have been setup by
 	 * e820__memory_setup().
@@ -114,27 +111,6 @@ void __init mem_encrypt_setup_arch(void)
 	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
 		return;
 
-	/*
-	 * For SEV and TDX, all DMA has to occur via shared/unencrypted pages.
-	 * Kernel uses SWIOTLB to make this happen without changing device
-	 * drivers. However, depending on the workload being run, the
-	 * default 64MB of SWIOTLB may not be enough and SWIOTLB may
-	 * run out of buffers for DMA, resulting in I/O errors and/or
-	 * performance degradation especially with high I/O workloads.
-	 *
-	 * Adjust the default size of SWIOTLB using a percentage of guest
-	 * memory for SWIOTLB buffers. Also, as the SWIOTLB bounce buffer
-	 * memory is allocated from low memory, ensure that the adjusted size
-	 * is within the limits of low available memory.
-	 *
-	 * The percentage of guest memory used here for SWIOTLB buffers
-	 * is more of an approximation of the static adjustment which
-	 * 64MB for <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
-	 */
-	size = total_mem * 6 / 100;
-	size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
-	swiotlb_adjust_size(size);
-
 	/* Set restricted memory access for virtio. */
 	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 }
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 75ee63cd354e..e626cca63ad1 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -33,6 +33,7 @@
 #include <linux/kmsan-checks.h>
 #include <linux/iommu-helper.h>
 #include <linux/init.h>
+#include <linux/math64.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/pfn.h>
@@ -80,6 +81,7 @@ struct io_tlb_slot {
 
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
+static bool restricted_dma_pool_present __initdata;
 
 enum swiotlb_pool_policy {
 	SWIOTLB_POOL_NONE,
@@ -478,7 +480,25 @@ swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
 		size = min(swiotlb_default_pool_size(), size);
 		break;
 	case SWIOTLB_POOL_CC_GUEST:
-		return;
+		/*
+		 * For SEV and TDX and CCA, all DMA has to occur via
+		 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
+		 * happen without changing device drivers. However, depending on
+		 * the workload being run, the default 64MB of SWIOTLB may not be
+		 * enough and SWIOTLB may run out of buffers for DMA, resulting in
+		 * I/O errors and/or performance degradation especially with high
+		 * I/O workloads.
+		 *
+		 * Adjust the default size of SWIOTLB using a percentage of guest
+		 * memory for SWIOTLB buffers.
+		 *
+		 * The percentage of guest memory used here for SWIOTLB buffers is
+		 * more of an approximation of the static adjustment which 64MB for
+		 * <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
+		 */
+		size = div_u64((u64)memblock_phys_mem_size() * 6, 100);
+		size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
+		break;
 	case SWIOTLB_POOL_NONE:
 		WARN(true, "Cannot adjust SWIOTLB size without a pool\n");
 		return;
@@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
 	if (swiotlb_force_disable)
 		return SWIOTLB_POOL_NONE;
 
-	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+	    !restricted_dma_pool_present)
 		return SWIOTLB_POOL_CC_GUEST;
 
 	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
@@ -2142,6 +2163,8 @@ static int __init rmem_swiotlb_setup(unsigned long node,
 	    of_get_flat_dt_prop(node, "no-map", NULL))
 		return -EINVAL;
 
+	restricted_dma_pool_present = true;
+
 	pr_info("Reserved memory: created restricted DMA pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 	return 0;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
