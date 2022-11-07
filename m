Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD2AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0lXb+fTcOX9JRWtA/twjUoBvwmI63Qrl2KYBL4Egyw0=; b=wqOF4tXzlciRCA
	ZcasmZCubNza/nrmzgiYr1SQKzSIbQaOSyISJCuf3jbzldS8X44a18TUrbJTvPZZ7OmUXnYRATjK+
	fyEuuipmB8S9r6rASD37sk5h+JPnByVIUC2eVAArw+LgW7YBTF2x3UHdWAQZkmXjKM1RQBiugMvjz
	4Z8AkdUp/bffaZa9DviNA8gzO0iGzE+CU9bqLJynQ3wUyvtxPuPXBS5ChM6UbqH8kxZ8lRAeoR5NB
	Ogm2kncbuBe53+RomIzKD5gO0gwPvKYDRP8ElVyMIdTRcSltRACKIXQJ/Tb/l95lvKfEreXHtfHQu
	Z8nWxWS+x4OzHFL5+KTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3rD-00FdXo-2Z; Mon, 07 Nov 2022 15:16:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3r5-00FdUK-8a
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 15:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667834167; x=1699370167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hua8FnSNgyK0XNfauia0YSWtJJuQvu8Oq20DaFtM3II=;
  b=XLpF/dPO/Q6dQ6rgX/ASrV5H/5SyZkcgBX5Kz9ilH6+rrw1oYw9t9Z4l
   mNa1TtPMk5pj3bQsiaXJXar2UkSsWGXUArG245bAV9KMefysRAAf9ExsG
   FGZv4FVePeUn13t4pwS4hFstE33zcrS1Q/qAp3/jyEGWAcBVCqwEQAon/
   5EklR+I1qqU2XtOq2RgUuas3AKLsrR+7P7/8b+auQqW1QxAjDnOlbOM9M
   /6HObDI6oS8JZLFdxezmczVKHl4tXaSkTD0LgIfBRVSgES8ClD0qzvi7w
   mYbhtn6lIqipcPuo0bP05FxxIFnOqaqp+wUwOJJaSMXjiGFZR6fJe8xR5
   w==;
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="198734479"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2022 08:16:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 7 Nov 2022 08:16:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 7 Nov 2022 08:16:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>, Nick Kossifidis <mick@ics.forth.gr>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, Evgenii Shatokhin
	<e.shatokhin@yadro.com>
Subject: [PATCH v1] riscv: fix reserved memory setup
Date: Mon, 7 Nov 2022 15:15:25 +0000
Message-ID: <20221107151524.3941467-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_071607_331855_A7F87FC7 
X-CRM114-Status: GOOD (  16.73  )
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

Currently, RISC-V sets up reserved memory using the "early" copy of the
device tree. As a result, when trying to get a reserved memory region
using of_reserved_mem_lookup(), the pointer to reserved memory regions
is using the early, pre-virtual-memory address which causes a kernel
panic when trying to use the buffer's name:

 Unable to handle kernel paging request at virtual address 00000000401c31ac
 Oops [#1]
 Modules linked in:
 CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-00001-g0d9d6953d834 #1
 Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
 epc : string+0x4a/0xea
  ra : vsnprintf+0x1e4/0x336
 epc : ffffffff80335ea0 ra : ffffffff80338936 sp : ffffffff81203be0
  gp : ffffffff812e0a98 tp : ffffffff8120de40 t0 : 0000000000000000
  t1 : ffffffff81203e28 t2 : 7265736572203a46 s0 : ffffffff81203c20
  s1 : ffffffff81203e28 a0 : ffffffff81203d22 a1 : 0000000000000000
  a2 : ffffffff81203d08 a3 : 0000000081203d21 a4 : ffffffffffffffff
  a5 : 00000000401c31ac a6 : ffff0a00ffffff04 a7 : ffffffffffffffff
  s2 : ffffffff81203d08 s3 : ffffffff81203d00 s4 : 0000000000000008
  s5 : ffffffff000000ff s6 : 0000000000ffffff s7 : 00000000ffffff00
  s8 : ffffffff80d9821a s9 : ffffffff81203d22 s10: 0000000000000002
  s11: ffffffff80d9821c t3 : ffffffff812f3617 t4 : ffffffff812f3617
  t5 : ffffffff812f3618 t6 : ffffffff81203d08
 status: 0000000200000100 badaddr: 00000000401c31ac cause: 000000000000000d
 [<ffffffff80338936>] vsnprintf+0x1e4/0x336
 [<ffffffff80055ae2>] vprintk_store+0xf6/0x344
 [<ffffffff80055d86>] vprintk_emit+0x56/0x192
 [<ffffffff80055ed8>] vprintk_default+0x16/0x1e
 [<ffffffff800563d2>] vprintk+0x72/0x80
 [<ffffffff806813b2>] _printk+0x36/0x50
 [<ffffffff8068af48>] print_reserved_mem+0x1c/0x24
 [<ffffffff808057ec>] paging_init+0x528/0x5bc
 [<ffffffff808031ae>] setup_arch+0xd0/0x592
 [<ffffffff8080070e>] start_kernel+0x82/0x73c

early_init_fdt_scan_reserved_mem() takes no arguments as it operates on
initial_boot_params, which is populated by early_init_dt_verify(). On
RISC-V, early_init_dt_verify() is called twice. Once, directly, in
setup_arch() if CONFIG_BUILTIN_DTB is not enabled and once indirectly,
very early in the boot process, by parse_dtb() when it calls
early_init_dt_scan_nodes().

This first call uses dtb_early_va to set initial_boot_params, which is
not usable later in the boot process when
early_init_fdt_scan_reserved_mem() is called. On arm64 for example, the
corresponding call to early_init_dt_scan_nodes() uses fixmap addresses
and doesn't suffer the same fate.

Move early_init_fdt_scan_reserved_mem() further along the boot sequence,
after the direct call to early_init_dt_verify() in setup_arch() so that
the names use the correct virtual memory addresses. The above supposed
that CONFIG_BUILTIN_DTB was not set, but should work equally in the case
where it is - unflatted_and_copy_device_tree() also updates
initial_boot_params.

Reported-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Link: https://lore.kernel.org/linux-riscv/f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com/
Fixes: 922b0375fc93 ("riscv: Fix memblock reservation for device tree blob")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/setup.c | 1 +
 arch/riscv/mm/init.c      | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index ad76bb59b059..67ec1fadcfe2 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -283,6 +283,7 @@ void __init setup_arch(char **cmdline_p)
 	else
 		pr_err("No DTB found in kernel mappings\n");
 #endif
+	early_init_fdt_scan_reserved_mem();
 	misc_mem_init();
 
 	init_resources();
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..50a1b6edd491 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -262,7 +262,6 @@ static void __init setup_bootmem(void)
 			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 	}
 
-	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
