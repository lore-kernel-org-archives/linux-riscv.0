Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5115AC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxTM6WUfoy4zb2q3Of2IAVUf8UmhClcv6Y4AZAuK7hM=; b=YuI2LZZuYEFe7J
	3BaZll85HUVYyVUuRohlgdui/wzrZZDSaXyku9e0+t4IHPgzpjuZhYRVUhE5TKQu8KpYvxKSEYmbR
	AbMH90wTG6kyjxunVjOziq/0osUvaJuAapAJog/NQ3Q8usQz2jSkf9setuG2l2leV5BdIiRq5++Kv
	8Mto4BE09QtqraE2FBG3wO3Tr0XSI/pe5Z5rCCj7FdUEwZGzJvbyuFkNTYFVWTlwnHXS/z+QfbyNw
	BVX5D3cjUIKIp6K0kyDwj8hP4Gy2b5EV95N5JW9uBzhkWdlpCr9G9aGdZpUdDGLpMoaocGqAlysgY
	BABUfmb30GoGQJkRBVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2P4-00BkKj-1Y;
	Tue, 12 Dec 2023 13:02:26 +0000
Received: from fzi-msx-e-03.fzi.de ([141.21.8.252])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2Oz-00BkHr-1s
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 13:02:24 +0000
From: Frederik Haxel <haxel@fzi.de>
To: 
CC: Vitaly Wool <vitaly.wool@konsulko.com>, Frederik Haxel <haxel@fzi.de>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu
	<andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, "Greentime
 Hu" <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Sami Tolvanen
	<samitolvanen@google.com>, Nam Cao <namcaov@gmail.com>, Guo Ren
	<guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@rivosinc.com>, Baoquan He <bhe@redhat.com>, Chen Jiahao
	<chenjiahao16@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] riscv: Make XIP bootable again
Date: Tue, 12 Dec 2023 14:01:12 +0100
Message-ID: <20231212130116.848530-2-haxel@fzi.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212130116.848530-1-haxel@fzi.de>
References: <20231212130116.848530-1-haxel@fzi.de>
MIME-Version: 1.0
X-Originating-IP: [141.21.46.139]
X-ClientProxiedBy: fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45) To
 fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_050221_639742_C4768978 
X-CRM114-Status: GOOD (  12.10  )
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

Currently, the XIP kernel seems to fail to boot due to missing
XIP_FIXUP and a wrong page_offset value. A superfluous XIP_FIXUP
has also been removed.

Signed-off-by: Frederik Haxel <haxel@fzi.de>
---
 arch/riscv/kernel/head.S | 1 +
 arch/riscv/mm/init.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b77397432403..a2e2f0dd3899 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -89,6 +89,7 @@ relocate_enable_mmu:
 	/* Compute satp for kernel page tables, but don't load it yet */
 	srl a2, a0, PAGE_SHIFT
 	la a1, satp_mode
+	XIP_FIXUP_OFFSET a1
 	REG_L a1, 0(a1)
 	or a2, a2, a1
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2e011cbddf3a..a65937336cdc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -174,6 +174,9 @@ void __init mem_init(void)
 
 /* Limit the memory size via mem. */
 static phys_addr_t memory_limit;
+#ifdef CONFIG_XIP_KERNEL
+#define memory_limit	(*(phys_addr_t *)XIP_FIXUP(&memory_limit))
+#endif /* CONFIG_XIP_KERNEL */
 
 static int __init early_mem(char *p)
 {
@@ -952,7 +955,7 @@ static void __init create_fdt_early_page_table(uintptr_t fix_fdt_va,
 	 * setup_vm_final installs the linear mapping. For 32-bit kernel, as the
 	 * kernel is mapped in the linear mapping, that makes no difference.
 	 */
-	dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
+	dtb_early_va = kernel_mapping_pa_to_va(dtb_pa);
 #endif
 
 	dtb_early_pa = dtb_pa;
@@ -1055,9 +1058,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
-	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 
 #ifdef CONFIG_XIP_KERNEL
+	kernel_map.page_offset = PAGE_OFFSET_L3;
 	kernel_map.xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
 	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
 
@@ -1067,6 +1070,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
 #else
+	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 	kernel_map.phys_addr = (uintptr_t)(&_start);
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
