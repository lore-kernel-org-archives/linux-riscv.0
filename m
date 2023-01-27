Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBD6C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wm2iu0DF8uezCJ4AKCNGE+vKfDXNTe2PqPipoWfSSFI=; b=hLGm48zZbTHYvV
	R3CW0ginTJtteY1ZEhkui4Oj85hlpkrbPtgk9sRY0UiuViGBVjdRfC4wiLayZC6gvwuDzB3LD01pR
	R/OkDOhxpGpodqfcspoth1LAoIvT/uBCxQ/uFyMfgIrJKYpIwXIQhOAMq9V90tAdLyK9COsYyZ1ci
	ku5LIAPRKLH0CxqyT/CoViRI0RIexJ38u/M8748Oq+wzjJDr64ap6b7ip5kv9sALw8pZWOlklUbbr
	bnMUwwaAVRDMPz5+74F/fILkkzWjGEdbvtNBHtXN6PsLAMbMgK7DdMqLy77YgdUlnUOI2Rfnsparo
	VgTLK9p1mhCpGEXafdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLP33-00F6a6-JF; Fri, 27 Jan 2023 13:45:45 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOby-00Evkk-9X
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:17:49 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S9;
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
Subject: [PATCH v6 05/13] riscv/kprobe: Introduce free register(s) searching algorithm
Date: Fri, 27 Jan 2023 21:05:33 +0800
Message-Id: <20230127130541.1250865-6-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S9
X-Coremail-Antispam: 1UD129KBjvJXoW3WrWrKry5Kr43JF45Jr18Xwb_yoWfXw45pF
	ZxWw4FqF4UtFs5W3y3tr1kZrWSgFs3Grs8Cr15t3yUZr43G3ySqF4vga43Zr1DJF13Zr48
	Gr4Y9rWI9r4DAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjTmh7UUUUU==
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiAwkEE2PTrr4g0QAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_051746_768442_C3698D42 
X-CRM114-Status: GOOD (  23.01  )
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

To do jump optimization, it needs to clobber two integer GPRs, the first
one is used to form AUIPC/JALR jumping to detour buffer, the second one
is used to form JR in detour buffer. Since kprobe can be installed
anywhere of kernel/module text, hence the register being clobbered needs
to be chosen carefully to avoid changing the original logic.

The algorithm for finding free register is inspired by the register
renaming in modern processors. From the perspective of register renaming,
a register could be represented as two different registers if two neighbor
instructions both write to it but no one ever reads it. Extending this
fact a register is considered to be free if it has never been read since
the first write on it in the execution flow.

Let's use the example below to explain how the algorithm work. Given
kernel is RVI and RCV hybrid binary, and one kprobe is instrumented at
the entry of function idle_dummy().

Before			Optimized		Detour buffer
<idle_dummy>:					...
 #1 add  sp,sp,-16	auipc a0, #?		add  sp,sp,-16
 #2 sd   s0,8(sp)				sd   s0,8(sp)
 #3 addi s0,sp,16	jalr  a0, #?(a0)	addi s0,sp,16
 #4 ld   s0,8(sp)				ld   s0,8(sp)
 #5 li   a0,0		li   a0,0		auipc a0, #?
 #6 addi sp,sp,16	addi sp,sp,16		jr    x0, #?(a0)
 #7 ret			ret

To optimize kprobe, it used to patch the first 8 bytes with AUIPC/JALR,
because from #1 to #7, a0 is the only register that satisfies condition:

 - Never been read before write
 - Never been updated in detour buffer

So a0 will be chosen to form AUIPC/JALR and JR.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
---
 arch/riscv/kernel/probes/opt.c | 221 +++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/riscv/kernel/probes/opt.c b/arch/riscv/kernel/probes/opt.c
index c03cdb1512a6..d38ed1a52c93 100644
--- a/arch/riscv/kernel/probes/opt.c
+++ b/arch/riscv/kernel/probes/opt.c
@@ -12,6 +12,9 @@
 #include <asm/kprobes.h>
 #include <asm/patch.h>
 
+#include "simulate-insn.h"
+#include "decode-insn.h"
+
 static int in_auipc_jalr_range(long val)
 {
 #ifdef CONFIG_ARCH_RV32I
@@ -37,15 +40,233 @@ static void prepare_detour_buffer(kprobe_opcode_t *code, kprobe_opcode_t *slot,
 {
 }
 
+/* Registers the first usage of which is the destination of instruction */
+#define WRITE_ON(reg)	\
+	(*write |= (((*read >> (reg)) ^ 1UL) & 1) << (reg))
+/* Registers the first usage of which is the source of instruction */
+#define READ_ON(reg)	\
+	(*read |= (((*write >> (reg)) ^ 1UL) & 1) << (reg))
+
 /*
  * In RISC-V ISA, AUIPC/JALR clobber one register to form target address,
  * inspired by register renaming in OoO processor, this involves search
  * backward that is not previously used as a source register and is used
  * as a destination register before any branch or jump instruction.
  */
+static void find_register(unsigned long start, unsigned long end,
+			       unsigned long *write, unsigned long *read)
+{
+	kprobe_opcode_t insn;
+	unsigned long addr, offset = 0UL;
+
+	for (addr = start; addr < end; addr += offset) {
+		insn = *(kprobe_opcode_t *)addr;
+		offset = GET_INSN_LENGTH(insn);
+
+#ifdef CONFIG_RISCV_ISA_C
+		if (offset == RVI_INSN_LEN)
+			goto is_rvi;
+
+		insn &= __COMPRESSED_INSN_MASK;
+		/* Stop searching until any control transfer instruction */
+		if (riscv_insn_is_c_ebreak(insn) || riscv_insn_is_c_j(insn))
+			break;
+
+		if (riscv_insn_is_c_jal(insn)) {
+			/* The rd of C.JAL is x1 by default */
+			WRITE_ON(1);
+			break;
+		}
+
+		if (riscv_insn_is_c_jr(insn)) {
+			READ_ON(rvc_r_rs1(insn));
+			break;
+		}
+
+		if (riscv_insn_is_c_jalr(insn)) {
+			READ_ON(rvc_r_rs1(insn));
+			/* The rd of C.JALR is x1 by default */
+			WRITE_ON(1);
+			break;
+		}
+
+		if (riscv_insn_is_c_beqz(insn) || riscv_insn_is_c_bnez(insn)) {
+			READ_ON(rvc_b_rs(insn));
+			break;
+		}
+
+		/*
+		 * Decode RVC instructions to find out some destination
+		 * registers never be used as a source register.
+		 */
+		if (riscv_insn_is_c_sub(insn) || riscv_insn_is_c_subw(insn)) {
+			READ_ON(rvc_a_rs1(insn));
+			READ_ON(rvc_a_rs2(insn));
+			continue;
+		} else if (riscv_insn_is_c_sq(insn) ||
+			   riscv_insn_is_c_sw(insn) ||
+			   riscv_insn_is_c_sd(insn)) {
+			READ_ON(rvc_s_rs1(insn));
+			READ_ON(rvc_s_rs2(insn));
+			continue;
+		} else if (riscv_insn_is_c_addi16sp(insn) ||
+			   riscv_insn_is_c_addi(insn) ||
+			   riscv_insn_is_c_addiw(insn) ||
+			   riscv_insn_is_c_slli(insn)) {
+			READ_ON(rvc_i_rs1(insn));
+			continue;
+		} else if (riscv_insn_is_c_sri(insn) ||
+			   riscv_insn_is_c_andi(insn)) {
+			READ_ON(rvc_b_rs(insn));
+			continue;
+		} else if (riscv_insn_is_c_sqsp(insn) ||
+			   riscv_insn_is_c_swsp(insn) ||
+			   riscv_insn_is_c_sdsp(insn)) {
+			READ_ON(rvc_ss_rs2(insn));
+			/* The rs2 of C.SQSP/SWSP/SDSP are x2 by default */
+			READ_ON(2);
+			continue;
+		} else if (riscv_insn_is_c_mv(insn)) {
+			READ_ON(rvc_r_rs2(insn));
+			WRITE_ON(rvc_r_rd(insn));
+		} else if (riscv_insn_is_c_addi4spn(insn)) {
+			/* The rs of C.ADDI4SPN is x2 by default */
+			READ_ON(2);
+			WRITE_ON(rvc_l_rd(insn));
+		} else if (riscv_insn_is_c_lq(insn) ||
+			   riscv_insn_is_c_lw(insn) ||
+			   riscv_insn_is_c_ld(insn)) {
+			/* FIXME: c.lw/c.ld share opcode with c.flw/c.fld */
+			READ_ON(rvc_l_rs(insn));
+			WRITE_ON(rvc_l_rd(insn));
+		} else if (riscv_insn_is_c_lqsp(insn) ||
+			   riscv_insn_is_c_lwsp(insn) ||
+			   riscv_insn_is_c_ldsp(insn)) {
+			/*
+			 * FIXME: c.lwsp/c.ldsp share opcode with c.flwsp/c.fldsp
+			 * The rs of C.LQSP/C.LWSP/C.LDSP is x2 by default.
+			 */
+			READ_ON(2);
+			WRITE_ON(rvc_i_rd(insn));
+		} else if (riscv_insn_is_c_li(insn) ||
+			   riscv_insn_is_c_lui(insn)) {
+			WRITE_ON(rvc_i_rd(insn));
+		}
+
+		if ((*write > 1UL) && __builtin_ctzl(*write & ~1UL))
+			return;
+is_rvi:
+#endif
+		/* Stop searching until any control transfer instruction */
+		if (riscv_insn_is_branch(insn)) {
+			READ_ON(rvi_rs1(insn));
+			READ_ON(rvi_rs2(insn));
+			break;
+		}
+
+		if (riscv_insn_is_jal(insn)) {
+			WRITE_ON(rvi_rd(insn));
+			break;
+		}
+
+		if (riscv_insn_is_jalr(insn)) {
+			READ_ON(rvi_rs1(insn));
+			WRITE_ON(rvi_rd(insn));
+			break;
+		}
+
+		if (riscv_insn_is_system(insn)) {
+			/* csrrw, csrrs, csrrc */
+			if (rvi_rs1(insn))
+				READ_ON(rvi_rs1(insn));
+			/* csrrwi, csrrsi, csrrci, csrrw, csrrs, csrrc */
+			if (rvi_rd(insn))
+				WRITE_ON(rvi_rd(insn));
+			break;
+		}
+
+		/*
+		 * Decode RVI instructions to find out some destination
+		 * registers never be used as a source register.
+		 */
+		if (riscv_insn_is_lui(insn) || riscv_insn_is_auipc(insn)) {
+			WRITE_ON(rvi_rd(insn));
+		} else if (riscv_insn_is_arith_ri(insn) ||
+			   riscv_insn_is_load(insn)) {
+			READ_ON(rvi_rs1(insn));
+			WRITE_ON(rvi_rd(insn));
+		} else if (riscv_insn_is_arith_rr(insn) ||
+			   riscv_insn_is_store(insn) ||
+			   riscv_insn_is_amo(insn)) {
+			READ_ON(rvi_rs1(insn));
+			READ_ON(rvi_rs2(insn));
+			WRITE_ON(rvi_rd(insn));
+		}
+
+		if ((*write > 1UL) && __builtin_ctzl(*write & ~1UL))
+			return;
+	}
+}
+
 static void find_free_registers(struct kprobe *kp, struct optimized_kprobe *op,
 				int *rd, int *ra)
 {
+	unsigned long start, end;
+	/*
+	 * Searching algorithm explanation:
+	 *
+	 * 1. Define two types of instruction areas firstly:
+	 *
+	 * +-----+
+	 * +     +
+	 * +     + ---> instructions modified by optprobe, named 'O-Area'.
+	 * +     +
+	 * +-----+
+	 * +     +
+	 * +     + ---> instructions after optprobe, named 'K-Area'.
+	 * +     +
+	 * +  ~  +
+	 *
+	 * 2. There are two usages for each GPR in the given instruction area.
+	 *
+	 *   - W: GPR is used as the RD oprand at first emergence.
+	 *   - R: GPR is used as the RS oprand at first emergence.
+	 *
+	 * Then there are 4 different usages for each GPR total:
+	 *
+	 *   1. Used as W in O-Area, Used as W in K-Area.
+	 *   2. Used as W in O-Area, Used as R in K-Area.
+	 *   3. Used as R in O-Area, Used as W in K-Area.
+	 *   4. Used as R in O-Area, Used as R in K-Area.
+	 *
+	 * All registers satisfy #1 or #3 could be chosen to form 'AUIPC/JALR'
+	 * jumping to detour buffer.
+	 *
+	 * All registers satisfy #1 or #2, could be chosen to form 'JR' jumping
+	 * back from detour buffer.
+	 */
+	unsigned long kw = 0UL, kr = 0UL, ow = 0UL, or = 0UL;
+
+	/* Search one free register used to form AUIPC/JALR */
+	start = (unsigned long)&kp->opcode;
+	end = start + GET_INSN_LENGTH(kp->opcode);
+	find_register(start, end, &ow, &or);
+
+	start = (unsigned long)kp->addr + GET_INSN_LENGTH(kp->opcode);
+	end = (unsigned long)kp->addr + op->optinsn.length;
+	find_register(start, end, &ow, &or);
+
+	/* Search one free register used to form JR */
+	find_register(end, (unsigned long)_end, &kw, &kr);
+
+	if ((kw & ow) > 1UL) {
+		*rd = __builtin_ctzl((kw & ow) & ~1UL);
+		*ra = *rd;
+		return;
+	}
+
+	*rd = ((kw | ow) == 1UL) ? 0 : __builtin_ctzl((kw | ow) & ~1UL);
+	*ra = (kw == 1UL) ? 0 : __builtin_ctzl(kw & ~1UL);
 }
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
