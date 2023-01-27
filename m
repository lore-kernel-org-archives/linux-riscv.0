Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69AFC54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GiHG6T8UFRN2ZLk5SUzYvhlpIw79bmaVXbWK2U0mSc=; b=k4wOYpQWD9ZhXd
	kWdUyTAOk4IQWgnJLZJl5GQXKsecYyxWnNzl6vOdT6wP7cwqk+4V+d9HNztKgL3f0Ps0I2Ghf1Fcd
	GDdaVygwMgyI8aECZBD4DME1xtH4/7NikOBVDgT2R201sREPDYMx6AWoq5wBw4QjvOgrC7UxfZ5Zc
	JTzCSKuLVfa6qAPCkCb1pzzRs5nvdDXbkJTZTdLDnN4FqSCewCSIo1mzc2qJ/ydbNe4JMxclbO1Rz
	EKeIDSMeDwJo7vodflS2/iyD2EQVkzZEPp4OP9gigdGvJSy3Pgyl62g9MuKontAogugPYwBzYH6cd
	kql//vJCDomGuGaeKhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOqj-00F1eR-Ua; Fri, 27 Jan 2023 13:33:02 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOR0-00Ery9-GW
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:06:40 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S8;
	Fri, 27 Jan 2023 21:06:09 +0800 (CST)
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
Subject: [PATCH v6 04/13] riscv/kprobe: Add common RVI and RVC instruction decoder code
Date: Fri, 27 Jan 2023 21:05:32 +0800
Message-Id: <20230127130541.1250865-5-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S8
X-Coremail-Antispam: 1UD129KBjvJXoW3XF47tr4rZFWfGrW7WF48WFg_yoW3Ar15pa
	n5Crn0v3ykGF93urZ7tr48CrWYqw4rGw4DKay0ga1ayF12qr4UXr9aqry3tF4kWFWFgr47
	CFZ8JrWkG3y2y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFc
	xC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_
	Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2
	IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0LvKUUUUU
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiAwcEE2PTrr4g0AAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050627_157105_8ADF18D0 
X-CRM114-Status: GOOD (  11.18  )
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

These RVI and RVC instruction decoder are used in the free register
searching algorithm, each instruction of instrumented function needs to
decode and test if it contains a free register to form AUIPC/JALR.

For RVI instruction format, the position and length of rs1/rs2/rd/opcode
parts are uniform [1], but RVC instruction formats are complicated, so
it addresses a series of functions to decode rs1/rs2/rd for RVC [1].

[1] https://github.com/riscv/riscv-isa-manual/releases

Signed-off-by: Liao Chang <liaochang1@huawei.com>
Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
---
 arch/riscv/include/asm/bug.h             |   5 +-
 arch/riscv/kernel/probes/decode-insn.h   | 148 +++++++++++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  42 +++++++
 3 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..9c33d3b58225 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -19,11 +19,14 @@
 #define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
 #define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
 
+#define RVI_INSN_LEN	4UL
+#define RVC_INSN_LEN	2UL
+
 #define GET_INSN_LENGTH(insn)						\
 ({									\
 	unsigned long __len;						\
 	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ?	\
-		4UL : 2UL;						\
+		RVI_INSN_LEN : RVC_INSN_LEN;				\
 	__len;								\
 })
 
diff --git a/arch/riscv/kernel/probes/decode-insn.h b/arch/riscv/kernel/probes/decode-insn.h
index 42269a7d676d..785b023a62ea 100644
--- a/arch/riscv/kernel/probes/decode-insn.h
+++ b/arch/riscv/kernel/probes/decode-insn.h
@@ -3,6 +3,7 @@
 #ifndef _RISCV_KERNEL_KPROBES_DECODE_INSN_H
 #define _RISCV_KERNEL_KPROBES_DECODE_INSN_H
 
+#include <linux/bitops.h>
 #include <asm/sections.h>
 #include <asm/kprobes.h>
 
@@ -15,4 +16,151 @@ enum probe_insn {
 enum probe_insn __kprobes
 riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *asi);
 
+#ifdef CONFIG_KPROBES
+
+static inline u16 rvi_rs1(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 15) & 0x1f);
+}
+
+static inline u16 rvi_rs2(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 20) & 0x1f);
+}
+
+static inline u16 rvi_rd(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 7) & 0x1f);
+}
+
+static inline s32 rvi_branch_imme(kprobe_opcode_t opcode)
+{
+	u32 imme = 0;
+
+	imme |= (((opcode >> 8)  & 0xf)   << 1)  |
+		(((opcode >> 25) & 0x3f)  << 5)  |
+		(((opcode >> 7)  & 0x1)   << 11) |
+		(((opcode >> 31) & 0x1)   << 12);
+
+	return sign_extend32(imme, 13);
+}
+
+static inline s32 rvi_jal_imme(kprobe_opcode_t opcode)
+{
+	u32 imme = 0;
+
+	imme |= (((opcode >> 21) & 0x3ff) << 1)  |
+		(((opcode >> 20) & 0x1)   << 11) |
+		(((opcode >> 12) & 0xff)  << 12) |
+		(((opcode >> 31) & 0x1)   << 20);
+
+	return sign_extend32(imme, 21);
+}
+
+#ifdef CONFIG_RISCV_ISA_C
+static inline u16 rvc_r_rs1(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 2) & 0x1f);
+}
+
+static inline u16 rvc_r_rs2(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 2) & 0x1f);
+}
+
+static inline u16 rvc_r_rd(kprobe_opcode_t opcode)
+{
+	return rvc_r_rs1(opcode);
+}
+
+static inline u16 rvc_i_rs1(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 7) & 0x1f);
+}
+
+static inline u16 rvc_i_rd(kprobe_opcode_t opcode)
+{
+	return rvc_i_rs1(opcode);
+}
+
+static inline u16 rvc_ss_rs2(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 2) & 0x1f);
+}
+
+static inline u16 rvc_l_rd(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 2) & 0x7);
+}
+
+static inline u16 rvc_l_rs(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 7) & 0x7);
+}
+
+static inline u16 rvc_s_rs2(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 2) & 0x7);
+}
+
+static inline u16 rvc_s_rs1(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 7) & 0x7);
+}
+
+static inline u16 rvc_a_rs2(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 2) & 0x7);
+}
+
+static inline u16 rvc_a_rs1(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 7) & 0x7);
+}
+
+static inline u16 rvc_a_rd(kprobe_opcode_t opcode)
+{
+	return rvc_a_rs1(opcode);
+}
+
+static inline u16 rvc_b_rd(kprobe_opcode_t opcode)
+{
+	return (u16)((opcode >> 7) & 0x7);
+}
+
+static inline u16 rvc_b_rs(kprobe_opcode_t opcode)
+{
+	return rvc_b_rd(opcode);
+}
+
+static inline s32 rvc_branch_imme(kprobe_opcode_t opcode)
+{
+	u32 imme = 0;
+
+	imme |= (((opcode >> 3)  & 0x3) << 1) |
+		(((opcode >> 10) & 0x3) << 3) |
+		(((opcode >> 2)  & 0x1) << 5) |
+		(((opcode >> 5)  & 0x3) << 6) |
+		(((opcode >> 12) & 0x1) << 8);
+
+	return sign_extend32(imme, 9);
+}
+
+static inline s32 rvc_jal_imme(kprobe_opcode_t opcode)
+{
+	u32 imme = 0;
+
+	imme |= (((opcode >> 3)  & 0x3) << 1) |
+		(((opcode >> 11) & 0x1) << 4) |
+		(((opcode >> 2)  & 0x1) << 5) |
+		(((opcode >> 7)  & 0x1) << 6) |
+		(((opcode >> 6)  & 0x1) << 7) |
+		(((opcode >> 9)  & 0x3) << 8) |
+		(((opcode >> 8)  & 0x1) << 10) |
+		(((opcode >> 12) & 0x1) << 11);
+
+	return sign_extend32(imme, 12);
+}
+#endif /* CONFIG_KPROBES */
+#endif /* CONFIG_RISCV_ISA_C */
 #endif /* _RISCV_KERNEL_KPROBES_DECODE_INSN_H */
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index a19aaa0feb44..e89747dfabbb 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -28,4 +28,46 @@ bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
+/* RVC(S) instructions contain rs1 and rs2 */
+__RISCV_INSN_FUNCS(c_sq,	0xe003, 0xa000);
+__RISCV_INSN_FUNCS(c_sw,	0xe003, 0xc000);
+__RISCV_INSN_FUNCS(c_sd,	0xe003, 0xe000);
+/* RVC(A) instructions contain rs1 and rs2 */
+__RISCV_INSN_FUNCS(c_sub,	0xfc63, 0x8c01);
+__RISCV_INSN_FUNCS(c_subw,	0xfc43, 0x9c01);
+/* RVC(L) instructions contain rs1 */
+__RISCV_INSN_FUNCS(c_lq,	0xe003, 0x2000);
+__RISCV_INSN_FUNCS(c_lw,	0xe003, 0x4000);
+__RISCV_INSN_FUNCS(c_ld,	0xe003, 0x6000);
+/* RVC(I) instructions contain rs1 */
+__RISCV_INSN_FUNCS(c_addi,	0xe003, 0x0001);
+__RISCV_INSN_FUNCS(c_addiw,	0xe003, 0x2001);
+__RISCV_INSN_FUNCS(c_addi16sp,	0xe183, 0x6101);
+__RISCV_INSN_FUNCS(c_slli,	0xe003, 0x0002);
+/* RVC(B) instructions contain rs1 */
+__RISCV_INSN_FUNCS(c_sri,	0xe803, 0x8001);
+__RISCV_INSN_FUNCS(c_andi,	0xec03, 0x8801);
+/* RVC(SS) instructions contain rs2 */
+__RISCV_INSN_FUNCS(c_sqsp,	0xe003, 0xa002);
+__RISCV_INSN_FUNCS(c_swsp,	0xe003, 0xc002);
+__RISCV_INSN_FUNCS(c_sdsp,	0xe003, 0xe002);
+/* RVC(R) instructions contain rs2 and rd */
+__RISCV_INSN_FUNCS(c_mv,	0xf003, 0x8002);
+/* RVC(I) instructions contain sp and rd */
+__RISCV_INSN_FUNCS(c_lqsp,	0xe003, 0x2002);
+__RISCV_INSN_FUNCS(c_lwsp,	0xe003, 0x4002);
+__RISCV_INSN_FUNCS(c_ldsp,	0xe003, 0x6002);
+/* RVC(CW) instructions contain sp and rd */
+__RISCV_INSN_FUNCS(c_addi4spn,	0xe003, 0x0000);
+/* RVC(I) instructions contain rd */
+__RISCV_INSN_FUNCS(c_li,	0xe003, 0x4001);
+__RISCV_INSN_FUNCS(c_lui,	0xe003, 0x6001);
+
+__RISCV_INSN_FUNCS(arith_rr,	0x77, 0x33);
+__RISCV_INSN_FUNCS(arith_ri,	0x77, 0x13);
+__RISCV_INSN_FUNCS(lui,		0x7f, 0x37);
+__RISCV_INSN_FUNCS(load,	0x7f, 0x03);
+__RISCV_INSN_FUNCS(store,	0x7f, 0x23);
+__RISCV_INSN_FUNCS(amo,		0x7f, 0x2f);
+
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
