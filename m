Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E153C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=etb+sw+YKTIICF9nmGXiYLbnHg9Mav+BB2FM1q0V2jE=; b=wlZFEjovhFnuml
	62G6DkeMdRF2ut5EP08cM0cb6phwrsviE2og9dsPAlO/BK+knEjR6XF+e/X644JdkOq5tuMh3rb57
	hNkBa3OUwGV3oOSfUTeNG1boFLvNzyhuc7CJs56PKZmZsyfHBhkggpdM2gxa6Fx21IDIfwUO0KeQx
	iD1svUqusFCFp/r006EmdvbDrePlE0LWdnsG24UJnQs87ipt7syV7/mEjFAdJSxfHso7m5ErFW3yF
	ob41i1WlumKiJrGLi4esNhfKNlmj89KT2j9CE/8qPUbnlu828DxqBFMpvFf2Hn4MbnKjs6T6S0B/d
	96Gff++y83uwiCJxDERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWt74-00000000Cwc-43J7;
	Thu, 25 Jul 2024 07:42:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWt71-00000000CvT-3K1t
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 07:42:09 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7a115c427f1so466055a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 00:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721893326; x=1722498126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5y15oCnd596cs9ptnOqqQNvBeeOGFsgLCTvbSMuHYA8=;
        b=gvhwgsB8J7kvLQ47BeKz60dj8+V/cajrIg5DNv3FPFTqntCtmYXv+WkuX1LZsVIhhT
         m7VnS6touQBUHPg8WrAZSFKdPQc9UFaTeDRwC6GaiJCHz4bOTMoFDe7gdoITskeVzJEd
         Md8NEUrHlib0gqtAdxpGDODCWhx/68xF3V97PxCGFtFib95YaYRqlC9cfXYuaF11StIv
         obcJLJcs1JnfTaieI8VGMYzM9KzunuqXVFLCFrzykqoUyrD8pn+rXu/HhmoOvoFCQaEM
         O43pijA+IVN0SyBb4BYiPtr5He/+mnSaoR69mUZwWud031xB7IO1deJXaejEcYwHmzY6
         4XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721893326; x=1722498126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5y15oCnd596cs9ptnOqqQNvBeeOGFsgLCTvbSMuHYA8=;
        b=RTOFERKXrgqXiwFo40fhItwNJgL0PwXW9ZWLqcz7MWpd0Gvai0Fm7z5Zmd9DVBV2oH
         x9NSZQGAx1pjk0Gq1OleemMr0TrNDXB67ywitNAjPLGoVhLhviu+bGyv773ucANZEuOP
         SxfKjYnNVCM/8c9CXQsahacmEKF0y2BYvdx6yvi9sr/nsCi1epnc/K54Jn8zCvTfg/QY
         iJ5+bNtGsf2Yrb0rE0DMP6Ehc7WLMJeLXcVqDUR/obC7IA8V7SkKBGgu4KiqlbDqpMpL
         u+Uq2Rh9niMrrBZOAmPrTHD8zWjW3kZALYJp3KilxaTf4PJXbaYO1NKzB6Ae3qsyeKVx
         yq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWS9vooc6JNZgUXX/qMHQsbBt6tfv8MIvpTBvi3Oyv2KNmaeRuYMkLQnbHnGlPLLSpDM3hhznj0Z6XdGSyPBJe6rUpSk9G6xFkJtYZM+Fbp
X-Gm-Message-State: AOJu0YzGlEVlBiHd6jaqYPVokO82NNuhocSa0jiOQiMbiat+ZhgPpOQJ
	JzgO7iEH9f6KUnJlwQhy5xHMvL4BKqT+d2AIpatVuPAOXN0q4Hzny0kHquvwWzA=
X-Google-Smtp-Source: AGHT+IGXdcb1PcXS18T/DF+tMQrCmpJ3aqEFdTn7rhawFPZkk6XxcHmob7PNovbBuO2DM+K4+H4q9w==
X-Received: by 2002:a05:6a20:2d24:b0:1bd:deac:c052 with SMTP id adf61e73a8af0-1c47b117d86mr1267871637.1.1721893325857;
        Thu, 25 Jul 2024 00:42:05 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm2886437a91.17.2024.07.25.00.41.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Jul 2024 00:42:05 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	cuiyunhui@bytedance.com,
	samitolvanen@google.com,
	gregkh@linuxfoundation.org,
	suagrfillet@gmail.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	conor.dooley@microchip.com,
	chenjiahao16@huawei.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	ajones@ventanamicro.com,
	bhe@redhat.com,
	vishal.moola@gmail.com,
	ndesaulniers@google.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: mm: add paging_check() before paging_init()
Date: Thu, 25 Jul 2024 15:41:55 +0800
Message-Id: <20240725074155.20565-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_004207_863746_32A5DAA2 
X-CRM114-Status: GOOD (  14.77  )
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

When establishing a linear mapping, the virtual address is obtained
through __va(). If the physical address is too large, such as 1TB, then
the virtual address will overflow in the address space of sv39.
The log is as follows:
[    0.000000] Unable to handle kernel paging request at virtual address 000000d97fdf7ad8
[    0.000000] [000000d97fdf7ad8] pgd=000000407ff7e801, p4d=000000407ff7e801, pud=000000407ff7e801
[    0.000000] Unable to handle kernel paging request at virtual address 000000d97fdfaff0
[    0.000000] [000000d97fdfaff0] pgd=000000407ff7e801, p4d=000000407ff7e801, pud=000000407ff7e801
...
[    0.000000] Insufficient stack space to handle exception!
[    0.000000] Task stack:     [0xffffffff81400000..0xffffffff81404000]
[    0.000000] Overflow stack: [0xffffffff80c67370..0xffffffff80c68370]
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.6.3-00133-g60497fad461d-dirty #71
[    0.000000] epc : die_kernel_fault+0x158/0x1c8
[    0.000000]  ra : die_kernel_fault+0x12a/0x1c8
[    0.000000] epc : ffffffff808cde36 ra : ffffffff808cde08 sp : ffffffff813fff80
[    0.000000]  gp : ffffffff815a1678 tp : 0000000000000000 t0 : 0000003130386537
[    0.000000]  t1 : 0000000000000031 t2 : 6537666637303430 s0 : ffffffff813fffc0
[    0.000000]  s1 : ffffffff815b0b28 a0 : 0000000000000016 a1 : ffffffff81495298
[    0.000000]  a2 : 0000000000000010 a3 : ffffffff81495298 a4 : 00000000000001fe
[    0.000000]  a5 : 000000d97fdfa000 a6 : ffffffff814250d0 a7 : 0000000000000030
[    0.000000]  s2 : 000000d97fdfaff0 s3 : ffffffff81400040 s4 : 000000d97fdfaff0
[    0.000000]  s5 : ffffffff815a0ed0 s6 : 0000000000000000 s7 : 000000008f604390
[    0.000000]  s8 : 0000000000000000 s9 : ffffffffffffffff s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : ffffffff815baa9b t4 : ffffffff815baa9b
[    0.000000]  t5 : ffffffff815baa88 t6 : ffffffff813ffda8
[    0.000000] status: 0000000200000100 badaddr: 000000d97fdfaff0 cause: 000000000000000d
[    0.000000] Kernel panic - not syncing: Kernel stack overflow
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.6.3-00133-g60497fad461d-dirty #71
[    0.000000] Call Trace:
[    0.000000] [<ffffffff800066bc>] dump_backtrace+0x28/0x30
[    0.000000] [<ffffffff808cdac8>] show_stack+0x38/0x44
[    0.000000] [<ffffffff808d9d40>] dump_stack_lvl+0x44/0x5c
[    0.000000] [<ffffffff808d9d70>] dump_stack+0x18/0x20
[    0.000000] [<ffffffff808cdfb6>] panic+0x110/0x2f2
[    0.000000] [<ffffffff80006532>] walk_stackframe+0x0/0x120
[    0.000000] [<ffffffff808cde08>] die_kernel_fault+0x12a/0x1c8
[    0.000000] ---[ end Kernel panic - not syncing: Kernel stack overflow ]---

In other words, the maximum value of the physical address needs to meet
Documentation/riscv/vm-layout.rst to ensure that there is no overflow.
For sv48/57, the actual virtual address space is huge, so this problem
is generally not triggered, but it is also checked in the code.

We give a warning for the overflowed physical address region and reverve it
so that the kernel can bringup successfully.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/page.h    |  9 +++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/setup.c        |  1 +
 arch/riscv/mm/init.c             | 30 ++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 57e887bfa34c..f6c0f6e14ecb 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -38,6 +38,15 @@
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
 #define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
+
+/*
+ * See vm-layout.rst, the size of L3 direct mapping of all physical
+ * memory 124GB, L4 is 64TB, L5 is 32PB.
+ */
+#define MAX_PFN_MEM_ADDR_L5	(0x80000000000000ULL)
+#define MAX_PFN_MEM_ADDR_L4	(0x400000000000ULL)
+#define MAX_PFN_MEM_ADDR_L3	(0x1F00000000ULL)
+
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c8e8867c42f6..e4835de5a743 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -915,6 +915,7 @@ extern uintptr_t _dtb_early_pa;
 #endif /* CONFIG_XIP_KERNEL */
 extern u64 satp_mode;
 
+void paging_check(void);
 void paging_init(void);
 void misc_mem_init(void);
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2a79d4ed2660..366918578544 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -273,6 +273,7 @@ void __init setup_arch(char **cmdline_p)
 	parse_early_param();
 
 	efi_init();
+	paging_check();
 	paging_init();
 
 	/* Parse the ACPI tables for possible boot-time configuration */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b0cc28f7595f..aa25dcf8a0ff 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1482,6 +1482,36 @@ static void __init reserve_crashkernel(void)
 	crashk_res.end = crash_base + crash_size - 1;
 }
 
+static void __init phymem_addr_overflow(void)
+{
+	phys_addr_t end = memblock_end_of_DRAM();
+
+	if (pgtable_l5_enabled) {
+		if (end > MAX_PFN_MEM_ADDR_L5) {
+			memblock_reserve(MAX_PFN_MEM_ADDR_L5, end - MAX_PFN_MEM_ADDR_L5);
+			WARN(true, "Phymem addr 0x%llx overflowed, reserve [0x%llx-0x%llx] directly.",
+			     end, MAX_PFN_MEM_ADDR_L5, end);
+		}
+	}
+	if (pgtable_l4_enabled) {
+		if (end > MAX_PFN_MEM_ADDR_L4) {
+			memblock_reserve(MAX_PFN_MEM_ADDR_L4, end - MAX_PFN_MEM_ADDR_L4);
+			WARN(true, "Phymem addr 0x%llx overflowed, reserve [0x%llx-0x%llx] directly.",
+			     end, MAX_PFN_MEM_ADDR_L4, end);
+		}
+	}
+	if (end > MAX_PFN_MEM_ADDR_L3) {
+		memblock_reserve(MAX_PFN_MEM_ADDR_L3, end - MAX_PFN_MEM_ADDR_L3);
+		WARN(true, "Phymem addr 0x%llx overflowed, reserve [0x%llx-0x%llx] directly.",
+		     end, MAX_PFN_MEM_ADDR_L3, end);
+	}
+}
+
+void __init paging_check(void)
+{
+	phymem_addr_overflow();
+}
+
 void __init paging_init(void)
 {
 	setup_bootmem();
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
