Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA775C47E49
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9WTX/I9XPaKmnIiTc6h34W3p+pnbsVIQIZr0tAQ0U4=; b=hiB4tMHXqxg+p8
	1MfhaSbJa80ZOebJAny4Lj9MkhXUPYvrqe9zkDWd5q+CAATBZaG4WEfmXXjDPdTQNc7eLES9whEqr
	nq6gGDUnNfzl/6Jd/A33uLJu+EfDclt8qUDNw/wBMEEsg8BBynuPQ7AktwyWKp8fVbSMdnyEmiV/h
	YtyHm/HAjW6jIau4d2GStT5Q0IAiAoslF9vVuFn6hF+uOxh+1T6G5yTPvQbqJbbj8+Q1Rtmsdpu2O
	FrafwyCsHDp6ehLjVSoghKCzHMFKffwlIQtv21CdKEXo0r2A3wgWwyILy3Y/VjbKX5o0Bj+PzW9jl
	Da1aDBY1yavCckWnGK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSeG2-003fp1-0u;
	Wed, 24 Jan 2024 14:29:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSeFz-003fnm-0r
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 14:29:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65D1E61D5A;
	Wed, 24 Jan 2024 14:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159CCC433B2;
	Wed, 24 Jan 2024 14:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706106574;
	bh=yiRheaS9gSGRAyOPZIgt6Cn9n01PdUHVYcjkvKmHKMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CiC/MCCy3GxxdX/l0tnM1x8BLgHVPz0HzHZZvTFTE1EixM7FZNI6Sq99iece/ZYwD
	 sFXIfUz0px5ZQQtCzBQkqpxsnfadayb1gVBHvX9w7Q67kJo7afWX7NUoD4bmn8vGEY
	 hYfXZIGijRkj3JEEAL1svS2Gn2y2ympnuqdDIZtEAC4jskJHe9mt7GTJ5d1RDzUa/j
	 /29BO0OJ6p1XMwlkijeWiC6373ktEQWsMVDq+X4hw+Y2JfuvUu3e9bfETMBATb0ePl
	 zrcEEWSLclcuek/LwADkdOQ+OyvXQSHwt7q/LnJazCEGoHlD2jZqrjs2JkeXrxY736
	 /dzuC02g6v7xQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Frederik Haxel <haxel@fzi.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	heiko@sntech.de,
	greentime.hu@sifive.com,
	cleger@rivosinc.com,
	samuel.holland@sifive.com,
	guoren@kernel.org,
	namcaov@gmail.com,
	alexghiti@rivosinc.com,
	bhe@redhat.com,
	akpm@linux-foundation.org,
	chenjiahao16@huawei.com,
	bjorn@rivosinc.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 08/11] riscv: Make XIP bootable again
Date: Wed, 24 Jan 2024 09:28:51 -0500
Message-ID: <20240124142907.1283546-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124142907.1283546-1-sashal@kernel.org>
References: <20240124142907.1283546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_062935_390939_C4C2D7EF 
X-CRM114-Status: GOOD (  12.82  )
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

From: Frederik Haxel <haxel@fzi.de>

[ Upstream commit 66f1e68093979816a23412a3fad066f5bcbc0360 ]

Currently, the XIP kernel seems to fail to boot due to missing
XIP_FIXUP and a wrong page_offset value. A superfluous XIP_FIXUP
has also been removed.

Signed-off-by: Frederik Haxel <haxel@fzi.de>
Link: https://lore.kernel.org/r/20231212130116.848530-2-haxel@fzi.de
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/head.S | 1 +
 arch/riscv/mm/init.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3710ea5d160f..0097c145385f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -88,6 +88,7 @@ relocate_enable_mmu:
 	/* Compute satp for kernel page tables, but don't load it yet */
 	srl a2, a0, PAGE_SHIFT
 	la a1, satp_mode
+	XIP_FIXUP_OFFSET a1
 	REG_L a1, 0(a1)
 	or a2, a2, a1
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0798bd861dcb..5f1921d014b1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -172,6 +172,9 @@ void __init mem_init(void)
 
 /* Limit the memory size via mem. */
 static phys_addr_t memory_limit;
+#ifdef CONFIG_XIP_KERNEL
+#define memory_limit	(*(phys_addr_t *)XIP_FIXUP(&memory_limit))
+#endif /* CONFIG_XIP_KERNEL */
 
 static int __init early_mem(char *p)
 {
@@ -950,7 +953,7 @@ static void __init create_fdt_early_page_table(uintptr_t fix_fdt_va,
 	 * setup_vm_final installs the linear mapping. For 32-bit kernel, as the
 	 * kernel is mapped in the linear mapping, that makes no difference.
 	 */
-	dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
+	dtb_early_va = kernel_mapping_pa_to_va(dtb_pa);
 #endif
 
 	dtb_early_pa = dtb_pa;
@@ -1053,9 +1056,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
-	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 
 #ifdef CONFIG_XIP_KERNEL
+	kernel_map.page_offset = PAGE_OFFSET_L3;
 	kernel_map.xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
 	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
 
@@ -1065,6 +1068,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
 #else
+	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 	kernel_map.phys_addr = (uintptr_t)(&_start);
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
