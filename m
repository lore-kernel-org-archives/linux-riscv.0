Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2D3C7EE2A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ztSv9SYn+0ixxw8aGfLuruWE6US0IBqu50DUnGn+CPA=; b=VooWYhR1/uaRy2
	2UIGNvn0ZZH+EpQqLn/tfCMOW/oZ8J0fONdIAykvhZpsDZ4xNIYn8Sku5RwVPoZcrBjDTiFQZ59H2
	6Z9nnJA7wqp51uB3GphMKmzaCsOtr+H1Zjp2N/w4VHg5SBQ4Or3YK2T3fmepYCQ7rkPnxgvnpLgRU
	bF5TdNCzgXRotjrGMOzzDTWgwiCMeG2p6x9NDg1rS/VvD89n/AB9UaLhEUfbpjyRbl51vrZ55EdGj
	+AtM3XeMBpfj4nfYSXs6GfgVJA59DM1MZvHeR6MeGWddHR8ydFPXPycuu1W+XaIPg+VSEr+hiV6O8
	N1G/7JBGukjIGPHLmOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyzj-000000050vL-25q1;
	Tue, 24 Jun 2025 08:27:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyf9-00000004xlT-3XjS
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 08:05:54 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowADn_FRSXFpoFc3eCA--.42565S2;
	Tue, 24 Jun 2025 16:05:39 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 24 Jun 2025 16:04:46 +0800
Subject: [PATCH] riscv: cpu_ops_sbi: Use static array for boot_data
MIME-Version: 1.0
Message-Id: <20250624-riscv-hsm-boot-data-array-v1-1-50b5eeafbe61@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAB1cWmgC/x3MQQqDQAxA0atI1gbGVEv1KuIiOrFmUUcSkRbx7
 h1cvsX/J7iYikNXnGByqGtaM6qygGnh9S2oMRsoUBOeVKOpTwcu/sExpR0j74xsxj+s4qOl0L7
 GSAS530xm/d7vfriuP7OT6gJrAAAA
X-Change-ID: 20250624-riscv-hsm-boot-data-array-1d392098bd22
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>
Cc: Vivian Wang <uwu@dram.page>, Han Gao <rabenda.cn@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: rQCowADn_FRSXFpoFc3eCA--.42565S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFWkZrWkJr4xZF47uw17Jrb_yoW7CFW8pF
	y5Jr1UWF4kXr1UAw1xtry5ur15Ar1DA3W3JFn7tF1rAF1UGr1UJr1Ut3yIka98tFy8JFy7
	tr4DZa1xKFyDJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjWSotUUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_010552_261995_59F7481E 
X-CRM114-Status: GOOD (  13.11  )
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

Since commit 6b9f29b81b15 ("riscv: Enable pcpu page first chunk
allocator"), if NUMA is enabled, the page percpu allocator may be used
on very sparse configurations, or when requested on boot with
percpu_alloc=page.

In that case, percpu data gets put in the vmalloc area. However,
sbi_hsm_hart_start() needs the physical address of a sbi_hart_boot_data,
and simply assumes that __pa() would work. This causes the just started
hart to immediately access an invalid address and hang.

Fortunately, struct sbi_hart_boot_data is not too large, so we can
simply allocate an array for boot_data statically, putting it in the
kernel image.

This fixes NUMA=y SMP boot on Sophgo SG2042.

To reproduce on QEMU: Set CONFIG_NUMA=y and CONFIG_DEBUG_VIRTUAL=y, then
run with:

  qemu-system-riscv64 -M virt -smp 2 -nographic \
    -kernel arch/riscv/boot/Image \
    -append "percpu_alloc=page"

Kernel output:

[    0.000000] Booting Linux on hartid 0
[    0.000000] Linux version 6.16.0-rc1 (dram@sakuya) (riscv64-unknown-linux-gnu-gcc (GCC) 14.2.1 20250322, GNU ld (GNU Binutils) 2.44) #11 SMP Tue Jun 24 14:56:22 CST 2025
...
[    0.000000] percpu: 28 4K pages/cpu s85784 r8192 d20712
...
[    0.083192] smp: Bringing up secondary CPUs ...
[    0.086722] ------------[ cut here ]------------
[    0.086849] virt_to_phys used for non-linear address: (____ptrval____) (0xff2000000001d080)
[    0.088001] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/physaddr.c:14 __virt_to_phys+0xae/0xe8
[    0.088376] Modules linked in:
[    0.088656] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc1 #11 NONE
[    0.088833] Hardware name: riscv-virtio,qemu (DT)
[    0.088948] epc : __virt_to_phys+0xae/0xe8
[    0.089001]  ra : __virt_to_phys+0xae/0xe8
[    0.089037] epc : ffffffff80021eaa ra : ffffffff80021eaa sp : ff2000000004bbc0
[    0.089057]  gp : ffffffff817f49c0 tp : ff60000001d60000 t0 : 5f6f745f74726976
[    0.089076]  t1 : 0000000000000076 t2 : 705f6f745f747269 s0 : ff2000000004bbe0
[    0.089095]  s1 : ff2000000001d080 a0 : 0000000000000000 a1 : 0000000000000000
[    0.089113]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[    0.089131]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
[    0.089155]  s2 : ffffffff8130dc00 s3 : 0000000000000001 s4 : 0000000000000001
[    0.089174]  s5 : ffffffff8185eff8 s6 : ff2000007f1eb000 s7 : ffffffff8002a2ec
[    0.089193]  s8 : 0000000000000001 s9 : 0000000000000001 s10: 0000000000000000
[    0.089211]  s11: 0000000000000000 t3 : ffffffff8180a9f7 t4 : ffffffff8180a9f7
[    0.089960]  t5 : ffffffff8180a9f8 t6 : ff2000000004b9d8
[    0.089984] status: 0000000200000120 badaddr: ffffffff80021eaa cause: 0000000000000003
[    0.090101] [<ffffffff80021eaa>] __virt_to_phys+0xae/0xe8
[    0.090228] [<ffffffff8001d796>] sbi_cpu_start+0x6e/0xe8
[    0.090247] [<ffffffff8001a5da>] __cpu_up+0x1e/0x8c
[    0.090260] [<ffffffff8002a32e>] bringup_cpu+0x42/0x258
[    0.090277] [<ffffffff8002914c>] cpuhp_invoke_callback+0xe0/0x40c
[    0.090292] [<ffffffff800294e0>] __cpuhp_invoke_callback_range+0x68/0xfc
[    0.090320] [<ffffffff8002a96a>] _cpu_up+0x11a/0x244
[    0.090334] [<ffffffff8002aae6>] cpu_up+0x52/0x90
[    0.090384] [<ffffffff80c09350>] bringup_nonboot_cpus+0x78/0x118
[    0.090411] [<ffffffff80c11060>] smp_init+0x34/0xb8
[    0.090425] [<ffffffff80c01220>] kernel_init_freeable+0x148/0x2e4
[    0.090442] [<ffffffff80b83802>] kernel_init+0x1e/0x14c
[    0.090455] [<ffffffff800124ca>] ret_from_fork_kernel+0xe/0xf0
[    0.090471] [<ffffffff80b8d9c2>] ret_from_fork_kernel_asm+0x16/0x18
[    0.090560] ---[ end trace 0000000000000000 ]---
[    1.179875] CPU1: failed to come online
[    1.190324] smp: Brought up 1 node, 1 CPU

Cc: stable@vger.kernel.org
Reported-by: Han Gao <rabenda.cn@gmail.com>
Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index e6fbaaf549562d6e9ca63a66371441fe8b230cb3..87d6559448039cdd2e8a604a19bd832ab5a98fc2 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -18,10 +18,10 @@ const struct cpu_operations cpu_ops_sbi;
 
 /*
  * Ordered booting via HSM brings one cpu at a time. However, cpu hotplug can
- * be invoked from multiple threads in parallel. Define a per cpu data
+ * be invoked from multiple threads in parallel. Define an array of boot data
  * to handle that.
  */
-static DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
+static struct sbi_hart_boot_data boot_data[NR_CPUS];
 
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
@@ -67,7 +67,7 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
 	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 	unsigned long hsm_data;
-	struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
+	struct sbi_hart_boot_data *bdata = &boot_data[cpuid];
 
 	/* Make sure tidle is updated */
 	smp_mb();

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250624-riscv-hsm-boot-data-array-1d392098bd22

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
