Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD42C76196
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Apr 2023 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L+P/8mvDu2Ne1WrcGomXXlK0fRB3AaYvEdNIYQltqI8=; b=hPuBI8uXJ1n5KN
	r8FGV0Gh4IA/a8v6krk/lNO+rTPSHGZB6gac6Cug4tTqVIBhPQJzo1BXWqR+twE7RqVqpgvJ/srym
	MwGx9LnqZD1Dp7u2/IDMGpi7TRt1v+z/T8Wr3VFcCwvMqJeyg0T11hVWn949VkHtHA17ZTq1hB7Oj
	D6D++WzGtmExSlGL8eZ9scBQw6zeVEpGWFQhlIXjhLNOay9lcX4D0ZocG+tBHofFVqHBlYgPjYECV
	qgnqh9vUZ25bLKp7QpaLfbxUO6ih6Lyd+zNhLCUthtNJ9LATLcj5OhMauEFHBqOcdj3qoUBxznd4+
	b5P3FQ3XYgSxL028xC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piqbi-00Bq2E-0Q;
	Sun, 02 Apr 2023 05:50:26 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piqbc-00Bq09-04
	for linux-riscv@lists.infradead.org;
	Sun, 02 Apr 2023 05:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1680414605;
	bh=+2VkKad1zNOp7RZJOwjGql3kO2qtYFT1yF6Q/Ss6mQE=;
	h=From:To:Cc:Subject:Date;
	b=Mevy8bs77VA55QB3o8EAhLG83JDbH5N1BW+OVsWux1UXVP7O89rYGPCGfPHYvrIaZ
	 XKJAQrZPNWv6XSx/2r7vol2GG9veaSxaWX63l2wKFpjeYZG7yxop7f/wU2USesoapX
	 P5okfTl1VHqp53c8YnZCDZcS1UBzGEByzuA7hLuE=
Received: from localhost.localdomain ([163.125.248.140])
	by newxmesmtplogicsvrszc1-0.qq.com (NewEsmtp) with SMTP
	id C5D8EAE7; Sun, 02 Apr 2023 13:49:29 +0800
X-QQ-mid: xmsmtpt1680414569tl06qa9fa
Message-ID: <tencent_A8A256967B654625AEE1DB222514B0613B07@qq.com>
X-QQ-XMAILINFO: MA8XoCze+OMloc3LJ+j56qNc+lsKyf/4UpnGIfTEPgjOND6jaukEetN7ZHqPD4
	 KxSSHKu+IhGf+zZvsfePwUmrnT31NNE50WZ0Xz6nGnMnvt8C63rcFmFQ7ijNmzQnTDNvp82zvL01
	 lz8qVtT55u0hX0Tu0xDUCKA5wWrQ5aw1LKMHQGz9llI9D8yat+lKYetb24CgnL6/bjIYr9Ys6GfI
	 osdHpXqzAdn0xV8LD2nOvAZ+dRG16FBFjYveunnETepKrreptvWScC9OmOOXjDLPVfNzK+MlydSj
	 mSQ1g7LILlNediNfSJcx+RgStqVEHoUahC5LjbyEy4HsG5xJpZJ2ujIFQdUskiERzPP5zPAbpq8E
	 1dF+eu4lhGvW8vxocm6ourFISdL5M5mgv+RbJ2VEqi4DkTnAcwOcDbXYQOb2hFjt5c8qhuDxjaz0
	 ZO8nBNA26Fa3ZFFw8APMsOjd4Q4HxpezuDejKTexWo3rxK7w69WN2YmpaJNnishqiw4Qz/TaB5M0
	 COSy6H3knZtc0d26OO4DCqrMdCSjbFwcB/GJYN5NfqRLDHML+Rb7iaYAayv8lN4vwZaDM5Z1NhPJ
	 C16N7zg7qAzaWRzdaFwdyEPqxGgTWtngv/TSkMi4N9mjLYYrl/zjPiCherr7bPH4gACR7Xwl+Qrt
	 +hncktAlk/6H0OF50h8Sq46pZAlQwCOru/4WFAjb6tbMoKCclqX/VHe8/TU5HVG+M/bYqr5gEibq
	 wBdtKeCn2BE56DLdL0zxUQs5My9byicDAstrpBDP/d0SF2myVSqpzfgd9Ozn1HRYHuRv5PGWcwFO
	 0TuTPbxdlVUyZUvHEEivQbIzB6b0WEonDU+IDbmb/v2FPITBdylj4urbx4UY5uSX5v1JeWbZyP1y
	 zBdDeRgUeq8w47yRYK/k8I5IqET05hKBELFLzUZWa8S/ViLF2SFTnilE3f8GerVqt7rBptY/vsFb
	 5it4cro2MBaZljxDxXK7F3cPCRiOmSfS3URZGi2ZeMdUrVXO8/4H7gtn9KBeDYDhWMsTCYYhvmo1
	 0EfagEoWm6eiG7uFZKsqcBVe349PeuldOQhz/cRQ==
From: forrestniu@foxmail.com
To: peterz@infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: falcon@tinylab.org,
	forrestniu@foxmail.com,
	suagrfillet@gmail.com,
	bmeng@tinylab.org,
	wangliming@walimis.org,
	jpoimboe@kernel.org,
	christophe.leroy@csgroup.eu
Subject: [RFC PATCH] riscv: Add static call implementation
Date: Sun,  2 Apr 2023 13:49:27 +0800
X-OQ-MSGID: <20230402054927.138259-1-forrestniu@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_225021_031178_82465452 
X-CRM114-Status: GOOD (  19.45  )
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

From: ForrestNiu <forrestniu@foxmail.com>

Add the riscv static call implementation. For each key, a permanent 
trampoline is created which is the destination for all static calls 
for the given key.  

The trampoline has a direct jump which gets patched by static_call_update() 
when the destination function changes.

The "inline" version is under development.

Signed-off-by: Falcon <falcon@tinylab.org>
Signed-off-by: ForrestNiu <forrestniu@foxmail.com>
---
 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/static_call.h |  30 +++++++
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/static_call.c      | 117 +++++++++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S      |   1 +
 5 files changed, 150 insertions(+)
 create mode 100644 arch/riscv/include/asm/static_call.h
 create mode 100644 arch/riscv/kernel/static_call.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5b182d1c196c..06f541c6d824 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
+	select HAVE_STATIC_CALL
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/include/asm/static_call.h b/arch/riscv/include/asm/static_call.h
new file mode 100644
index 000000000000..617c00adf45c
--- /dev/null
+++ b/arch/riscv/include/asm/static_call.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_STATIC_CALL_H
+#define _ASM_STATIC_CALL_H
+#include <linux/ftrace.h>
+
+#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name,insns)			\
+	asm(".pushsection .static_call.text, \"ax\"		\n"	\
+	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
+	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
+		insns "						\n"	\
+	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
+	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    ".popsection								\n")
+
+#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
+	__ARCH_DEFINE_STATIC_CALL_TRAMP(name,"la t0,"#func";jalr t1,0(t0);")
+
+#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
+	__ARCH_DEFINE_STATIC_CALL_TRAMP(name,"ret;")
+
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)			\
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name,__static_call_return0;)
+
+#define ARCH_ADD_TRAMP_KEY(name)					\
+	asm(".pushsection .static_call_tramp_key, \"a\"		\n"	\
+	    ".long " STATIC_CALL_TRAMP_STR(name) " - .		\n"	\
+	    ".long " STATIC_CALL_KEY_STR(name) " - .		\n"	\
+	    ".popsection					\n")
+
+#endif /* _ASM_STATIC_CALL_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..3d86edfedb7e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -44,6 +44,7 @@ obj-y	+= setup.o
 obj-y	+= signal.o
 obj-y	+= syscall_table.o
 obj-y	+= sys_riscv.o
+obj-y	+= static_call.o
 obj-y	+= time.o
 obj-y	+= traps.o
 obj-y	+= riscv_ksyms.o
diff --git a/arch/riscv/kernel/static_call.c b/arch/riscv/kernel/static_call.c
new file mode 100644
index 000000000000..58bf86f0ac00
--- /dev/null
+++ b/arch/riscv/kernel/static_call.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/static_call.h>
+#include <linux/memory.h>
+#include <linux/bug.h>
+#include <asm/patch.h>
+#include <linux/ftrace.h>
+
+#define RISCV_INSN_JALR 0x00000067U
+#define RISCV_INSN_ADDI 0x00000013U
+#define RISCV_INSN_AUIPC 0x00000017U
+#define AUIPC_T0_MASK	0x00000280U
+#define JALR_T1_T0_MASK	0x00028300U
+
+enum insn_type {
+	CALL = 0, /* site call */
+	NOP = 1,  /* site cond-call */
+	JMP = 2,  /* tramp / site tail-call */
+	RET = 3,  /* tramp / site cond-tail-call */
+};
+
+static void __ref __static_call_transform(void *insn, enum insn_type type, void *func,bool modinit)
+{
+	u32 call[2]={0};
+	u32 jump_code = (*(u32*)(insn+sizeof(call[0])) & GENMASK(6,0));
+
+	switch (type) {
+	case CALL:
+		break;
+	case NOP:
+		break;
+	case JMP:
+		if(jump_code == RISCV_INSN_ADDI )
+		{
+			/*
+			 * When the trampoland is initialized, three instructions are as follows:
+			 * "auipc t0,imm20"
+			 * "addi t0,imm12"
+			 * "jalr t1,0(t0)"
+			 * First, use the "jalr t1,imm12(t0)" replace the "addi t0,imm12"
+			 * To ensure that two instructions are caused in the case of multiple nuclear
+			 * conditions to lead to unknown errors.
+			*/
+			make_call_t0(insn, func, call);
+			patch_text_nosync(insn+sizeof(call[0]), &call[1], sizeof(call[1]));
+
+			/*
+			 * After the last dynamic adjustment, the instructions are as follows:
+			 * "auipc t0,imm20"
+			 * "jalr t1,imm12(t0)"
+			 * "jalr t1,0(t0)"
+			 * The first two instructions have guaranteed that the third instruction will
+			 * not be ordered, so the third instruction can be updated.After the update is completed,
+			 * the second instruction can update to make the third jump instruction take effect.
+			 * Use the "auipc t0,imm20" replace "jalr t0,imm12",the third jump instruction will take effect
+			*/
+			make_call_t0(insn+sizeof(call[0]), func, call);
+
+			patch_text_nosync(insn+sizeof(call), &call[1], sizeof(call[1]));
+			patch_text_nosync(insn+sizeof(call[0]), &call[0], sizeof(call[0]));
+		}
+		else if( jump_code == RISCV_INSN_AUIPC )
+		{
+			/*
+			 * After the last dynamic adjustment, the instructions are as follows:
+			 * "auipc t0,imm20"
+			 * "auipc t0,imm20"
+			 * "jalr t1,imm12(t0)"
+			 * The first auipc instruction will not take effect and can be updated easily.
+			 * After updating the first auipc instruction, update the second auipc instruction
+			 * to the jalr instruction.
+			 */
+			make_call_t0(insn, func, call);
+			patch_text_nosync(insn, &call[0], sizeof(call[0]));
+			patch_text_nosync(insn+sizeof(call[0]), &call[1], sizeof(call[1]));
+		}
+		else if( jump_code == RISCV_INSN_JALR )
+		{
+			/*
+			 * After the last dynamic adjustment, the instructions are as follows:
+			 * "auipc t0,imm20"
+			 * "jalr t1,imm12(t0)"
+			 * "jalr t1,imm12(t0)"
+			 * This looks like "jump_code == RISCV_INSN_ADDI".
+			 */
+			make_call_t0(insn+sizeof(call[0]), func, call);
+
+			patch_text_nosync(insn+sizeof(call), &call[1], sizeof(call[1]));
+			patch_text_nosync(insn+sizeof(call[0]), &call[0], sizeof(call[0]));
+		}
+		break;
+	case RET://If func is NULL, the upgrade is not performed
+		break;
+	}
+}
+
+static inline enum insn_type __sc_insn(bool null, bool tail)
+{
+	/*
+	 * Encode the following table without branches:
+	 *
+	 *	tail	null	insn
+	 *	-----+-------+------
+	 *	  0  |   0   |  CALL
+	 *	  0  |   1   |  NOP
+	 *	  1  |   0   |  JMP
+	 *	  1  |   1   |  RET
+	 */
+	return 2*tail + null;
+}
+
+void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
+{
+	mutex_lock(&text_mutex);
+	__static_call_transform(tramp, __sc_insn(!func, true), func,false);
+	mutex_unlock(&text_mutex);
+}
+EXPORT_SYMBOL_GPL(arch_static_call_transform);
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 53a8ad65b255..1b06ac1a511d 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -48,6 +48,7 @@ SECTIONS
 		ENTRY_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
+		STATIC_CALL_TEXT
 		_etext = .;
 	}
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
