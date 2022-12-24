Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B12C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCAaSFmXAE2oPw0mT1wuTXkJJA09P0rKThf7Sy4zsN4=; b=DcgtDJUh0mvdJZ
	UgJc39gtfXjHD2x+kdBHu1CntxXXljNoln8Rb6vrZhHn0MEzUZxUsf4cOnU2+PKyHFOyuN6DProsx
	aVFv6f4AfERXtnJdbb9K9pSDUzRYye7SvbT7rd6i2ifwD5InoAOoNYtfmtrpSEdnyp1C/fYtXGDAG
	YcZjJPSgzztgEvUPstnUcx3Dq16jreRabWGA/3AaDSLxdtKPo0QfLS9KNLfnCB0FC+iqSuKV4JxOP
	chwg5TBMnjlFTCBKUUNCkx6pG6Se/dTwC+O8/L7CaQYunEsEUwrMN5WSjHNxUkysjvI/gkmPHgaV4
	ti0L5JOYFCIZN9AsNuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Nu-0014AL-86; Sat, 24 Dec 2022 15:24:26 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p92wO-00H5ui-PF
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 11:43:58 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-03 (Coremail) with SMTP id rQCowABXXpbf5aZj9dVkCA--.18955S5;
	Sat, 24 Dec 2022 19:43:27 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com,
	Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: [PATCH v5 1/9] riscv/kprobe: Prepare the skeleton to implement RISCV OPTPROBES feature
Date: Sat, 24 Dec 2022 19:43:07 +0800
Message-Id: <20221224114315.850130-2-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXXpbf5aZj9dVkCA--.18955S5
X-Coremail-Antispam: 1UD129KBjvJXoW3XrykCF1UCr4UJry7JryrJFb_yoW7KFy7pF
	s5Cwn5WrWkA3s3G3y3A3WkurWFqan5Wa17KrWDZry5Jw45tr45Awn2grWUXrWxJrs0gryf
	WF1Fyry5Cry3X3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmK14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	ACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0c_-DUUUU
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCQYKE2OmnPBfhgABsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_034349_269104_557D1D5F 
X-CRM114-Status: GOOD (  15.88  )
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

From: Liao Chang <liaochang1@huawei.com>

Prepare skeleton to implement optimized kprobe on RISCV, it is consist
of Makfile, Kconfig and some architecture specific files: kprobe.h and
opt.c opt.c include some macro, type definition and functions required
by kprobe framework, opt_trampoline.S provide a piece of assembly code
template used to construct the detour buffer as the target of long jump
instruction(s) for each optimzed kprobe.

Since the jump range of PC-relative instruction JAL is +/-2M, that is
too small to reach the detour buffer, hence the foudamental idea to
address OPTPROBES on RISCV is replace 'EBREAK' with 'AUIPC/JALR'. which
means it needs to clobber one more instruction beside the kprobe
instruction, furthermore, RISCV supports hybird RVI and RVC in single
kernel binary, so in theory a pair of 'AUIPC/JALR' is about to clobber
10 bytes(3 RVC and 1 RVI, 2 bytes is padding for alignment) at worst
case. The second hardsome problem is looking for one integer register as
the destination of 'AUIPC/JALR' without any side-effect.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
---
 arch/riscv/Kconfig                        |  1 +
 arch/riscv/include/asm/kprobes.h          | 32 ++++++++++++++
 arch/riscv/kernel/probes/Makefile         |  1 +
 arch/riscv/kernel/probes/opt.c            | 51 +++++++++++++++++++++++
 arch/riscv/kernel/probes/opt_trampoline.S | 12 ++++++
 5 files changed, 97 insertions(+)
 create mode 100644 arch/riscv/kernel/probes/opt.c
 create mode 100644 arch/riscv/kernel/probes/opt_trampoline.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..5fa3094d55bc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -103,6 +103,7 @@ config RISCV
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
 	select HAVE_RETHOOK if !XIP_KERNEL
+	select HAVE_OPTPROBES if !XIP_KERNEL
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
index e7882ccb0fd4..e85130c9112f 100644
--- a/arch/riscv/include/asm/kprobes.h
+++ b/arch/riscv/include/asm/kprobes.h
@@ -41,5 +41,37 @@ int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
 bool kprobe_breakpoint_handler(struct pt_regs *regs);
 bool kprobe_single_step_handler(struct pt_regs *regs);
 
+#ifdef CONFIG_OPTPROBES
+
+/* optinsn template addresses */
+extern __visible kprobe_opcode_t optprobe_template_entry[];
+extern __visible kprobe_opcode_t optprobe_template_end[];
+
+#define MAX_OPTINSN_SIZE				\
+	((unsigned long)optprobe_template_end -		\
+	 (unsigned long)optprobe_template_entry)
+
+/*
+ * For RVI and RVC hybird encoding kernel, althought long jump just needs
+ * 2 RVI instructions(AUIPC+JALR), optimized instructions is 10 bytes long
+ * at most to ensure no RVI would be truncated actually, so it means four
+ * combinations:
+ * - 2 RVI
+ * - 4 RVC
+ * - 2 RVC + 1 RVI
+ * - 3 RVC + 1 RVI (truncated, need padding)
+ */
+#define MAX_COPIED_INSN		4
+#define MAX_OPTIMIZED_LENGTH	10
+
+struct arch_optimized_insn {
+	kprobe_opcode_t copied_insn[MAX_COPIED_INSN];
+	/* detour code buffer */
+	kprobe_opcode_t *insn;
+	unsigned long length;
+	int rd;
+};
+
+#endif /* CONFIG_OPTPROBES */
 #endif /* CONFIG_KPROBES */
 #endif /* _ASM_RISCV_KPROBES_H */
diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
index c40139e9ca47..3d837eb5f9be 100644
--- a/arch/riscv/kernel/probes/Makefile
+++ b/arch/riscv/kernel/probes/Makefile
@@ -3,4 +3,5 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o simulate-insn.o
 obj-$(CONFIG_RETHOOK)		+= rethook.o rethook_trampoline.o
 obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
 obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
+obj-$(CONFIG_OPTPROBES)		+= opt.o opt_trampoline.o
 CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
new file mode 100644
index 000000000000..56c8a227c857
--- /dev/null
+++ b/arch/riscv/kernel/probes/opt.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Kernel Probes Jump Optimization (Optprobes)
+ *
+ * Copyright (C) Guokai Chen, 2022
+ * Author: Guokai Chen chenguokai17@mails.ucas.ac.cn
+ */
+
+#define pr_fmt(fmt)	"optprobe: " fmt
+
+#include <linux/kprobes.h>
+#include <asm/kprobes.h>
+
+int arch_prepared_optinsn(struct arch_optimized_insn *optinsn)
+{
+	return 0;
+}
+
+int arch_check_optimized_kprobe(struct optimized_kprobe *op)
+{
+	return 0;
+}
+
+int arch_prepare_optimized_kprobe(struct optimized_kprobe *op,
+				  struct kprobe *orig)
+{
+	return 0;
+}
+
+void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
+{
+}
+
+void arch_optimize_kprobes(struct list_head *oplist)
+{
+}
+
+void arch_unoptimize_kprobes(struct list_head *oplist,
+			     struct list_head *done_list)
+{
+}
+
+void arch_unoptimize_kprobe(struct optimized_kprobe *op)
+{
+}
+
+int arch_within_optimized_kprobe(struct optimized_kprobe *op,
+				 kprobe_opcode_t *addr)
+{
+	return 0;
+}
diff --git a/arch/riscv/kernel/probes/opt_trampoline.S b/arch/riscv/kernel/probes/opt_trampoline.S
new file mode 100644
index 000000000000..16160c4367ff
--- /dev/null
+++ b/arch/riscv/kernel/probes/opt_trampoline.S
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 Guokai Chen
+ */
+
+#include <linux/linkage.h>
+
+#incldue <asm/csr.h>
+#include <asm/asm-offsets.h>
+
+SYM_ENTRY(optprobe_template_entry, SYM_L_GLOBAL, SYM_A_NONE)
+SYM_ENTRY(optprobe_template_end, SYM_L_GLOBAL, SYM_A_NONE)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
