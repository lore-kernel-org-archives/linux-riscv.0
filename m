Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF00ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IhLDMRPxhm4oF1ERvO8XEYGG8oZ3Z4LTGqKqbQ9ccuI=; b=M8M
	i7Ijvx5zZvSA9O4d8oSi6CNmB31l5+V9y/VIeUOTSdOpMxo3bTyMAkUBP3hz5Y8QNgu1CKEtltAqn
	ld5BawSh4LT8W3xy4/BPHQ/8WG0nvoQzBv+MGOQvzcZO1c70cHthBU4+ihR1EJvehXIsbRpc0QExs
	JsoZxz7x+d+/Y/pvsfsokr/xrWG0Y7+Yik5+/TniazgVGvWhOYJONw/fgmCiZQneX0k7P46orUEA+
	QJdGvNnedIEmbXDaQTCtPXFbXakuyHFhhYoFkFzNXp61cIRSJ69yUK6d/LLAQ7Qxy3KaCk8GkqLv7
	47jjIXuTtrazLkx5XdzTdDyYT+Hxjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZn2-002Y0j-CI; Tue, 20 Sep 2022 09:43:40 +0000
Received: from smtp.h3c.com ([60.191.123.56] helo=h3cspam01-ex.h3c.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZlM-002Wwo-Vb
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 09:41:59 +0000
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 28K9dsDj085705;
	Tue, 20 Sep 2022 17:39:54 +0800 (GMT-8)
	(envelope-from wang.binglei@h3c.com)
Received: from DAG2EX10-IDC.srv.huawei-3com.com (unknown [172.20.54.133])
	by mail.maildlp.com (Postfix) with ESMTP id ED25722BE810;
	Tue, 20 Sep 2022 17:40:56 +0800 (CST)
Received: from localhost.localdomain (10.99.222.162) by
 DAG2EX10-IDC.srv.huawei-3com.com (172.20.54.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 20 Sep 2022 17:39:55 +0800
From: Binglei Wang <wang.binglei@h3c.com>
To: <paul.walmsley@sifive.com>
CC: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <l3b2w1@gmail.com>, "wang.binglei" <wang.binglei@h3c.com>
Subject: [PATCH] rethook: add riscv rethook implementation.
Date: Tue, 20 Sep 2022 17:36:30 +0800
Message-ID: <20220920093630.32085-1-wang.binglei@h3c.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.99.222.162]
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG2EX10-IDC.srv.huawei-3com.com (172.20.54.133)
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 28K9dsDj085705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_024157_398255_7F8A0DCB 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: multipart/mixed; boundary="===============5522535772944708018=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5522535772944708018==
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: "wang.binglei" <wang.binglei@h3c.com>

Most of the code copied from
arch/riscv/kernel/probes/kprobes_trampoline.S

Signed-off-by: wang.binglei <wang.binglei@h3c.com>
---
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/kernel/probes/Makefile             |  1 +
 arch/riscv/kernel/probes/kprobes.c            |  7 ++
 arch/riscv/kernel/probes/rethook.c            | 24 +++++
 arch/riscv/kernel/probes/rethook_trampoline.S | 94 +++++++++++++++++++
 5 files changed, 127 insertions(+)
 create mode 100644 arch/riscv/kernel/probes/rethook.c
 create mode 100644 arch/riscv/kernel/probes/rethook_trampoline.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4..c5cae0825 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -97,6 +97,7 @@ config RISCV
        select HAVE_KPROBES if !XIP_KERNEL
        select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
        select HAVE_KRETPROBES if !XIP_KERNEL
+       select HAVE_RETHOOK if !XIP_KERNEL
        select HAVE_MOVE_PMD
        select HAVE_MOVE_PUD
        select HAVE_PCI
diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/M=
akefile
index 7f0840dcc..ee345e7e9 100644
--- a/arch/riscv/kernel/probes/Makefile
+++ b/arch/riscv/kernel/probes/Makefile
@@ -3,4 +3,5 @@ obj-$(CONFIG_KPROBES)           +=3D kprobes.o decode-insn.=
o simulate-insn.o
 obj-$(CONFIG_KPROBES)          +=3D kprobes_trampoline.o
 obj-$(CONFIG_KPROBES_ON_FTRACE)        +=3D ftrace.o
 obj-$(CONFIG_UPROBES)          +=3D uprobes.o decode-insn.o simulate-insn.=
o
+obj-$(CONFIG_RETHOOK)          +=3D rethook.o rethook_trampoline.o
 CFLAGS_REMOVE_simulate-insn.o =3D $(CC_FLAGS_FTRACE)
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/=
kprobes.c
index e6e950b7c..2c1847921 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -345,6 +345,7 @@ int __init arch_populate_kprobe_blacklist(void)
        return ret;
 }

+#ifndef CONFIG_KRETPROBE_ON_RETHOOK
 void __kprobes __used *trampoline_probe_handler(struct pt_regs *regs)
 {
        return (void *)kretprobe_trampoline_handler(regs, NULL);
@@ -357,6 +358,12 @@ void __kprobes arch_prepare_kretprobe(struct kretprobe=
_instance *ri,
        ri->fp =3D NULL;
        regs->ra =3D (unsigned long) &__kretprobe_trampoline;
 }
+#else
+void __kprobes *trampoline_probe_handler(struct pt_regs *regs)
+{
+       return NULL;
+}
+#endif

 int __kprobes arch_trampoline_kprobe(struct kprobe *p)
 {
diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/=
rethook.c
new file mode 100644
index 000000000..47853bc36
--- /dev/null
+++ b/arch/riscv/kernel/probes/rethook.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic return hook for riscv.
+ */
+
+#include <linux/kprobes.h>
+#include <linux/rethook.h>
+
+/* This is called from arch_rethook_trampoline() */
+unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs=
)
+{
+       return rethook_trampoline_handler(regs, regs->s0);
+}
+NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
+
+void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, =
bool mcount)
+{
+       rhn->ret_addr =3D regs->ra;
+       rhn->frame =3D regs->s0;
+
+       /* replace return addr with trampoline */
+       regs->ra =3D (u64)arch_rethook_trampoline;
+}
+NOKPROBE_SYMBOL(arch_rethook_prepare);
diff --git a/arch/riscv/kernel/probes/rethook_trampoline.S b/arch/riscv/ker=
nel/probes/rethook_trampoline.S
new file mode 100644
index 000000000..aa79630ac
--- /dev/null
+++ b/arch/riscv/kernel/probes/rethook_trampoline.S
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rethook trampoline.
+ * Copied from arch/riscv/kernel/probes/kprobes_trampoline.S
+ */
+#include <linux/linkage.h>
+
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+
+       .text
+       .altmacro
+
+       .macro save_all_base_regs
+       REG_S x1,  PT_RA(sp)
+       REG_S x3,  PT_GP(sp)
+       REG_S x4,  PT_TP(sp)
+       REG_S x5,  PT_T0(sp)
+       REG_S x6,  PT_T1(sp)
+       REG_S x7,  PT_T2(sp)
+       REG_S x8,  PT_S0(sp)
+       REG_S x9,  PT_S1(sp)
+       REG_S x10, PT_A0(sp)
+       REG_S x11, PT_A1(sp)
+       REG_S x12, PT_A2(sp)
+       REG_S x13, PT_A3(sp)
+       REG_S x14, PT_A4(sp)
+       REG_S x15, PT_A5(sp)
+       REG_S x16, PT_A6(sp)
+       REG_S x17, PT_A7(sp)
+       REG_S x18, PT_S2(sp)
+       REG_S x19, PT_S3(sp)
+       REG_S x20, PT_S4(sp)
+       REG_S x21, PT_S5(sp)
+       REG_S x22, PT_S6(sp)
+       REG_S x23, PT_S7(sp)
+       REG_S x24, PT_S8(sp)
+       REG_S x25, PT_S9(sp)
+       REG_S x26, PT_S10(sp)
+       REG_S x27, PT_S11(sp)
+       REG_S x28, PT_T3(sp)
+       REG_S x29, PT_T4(sp)
+       REG_S x30, PT_T5(sp)
+       REG_S x31, PT_T6(sp)
+       .endm
+
+       .macro restore_all_base_regs
+       REG_L x3,  PT_GP(sp)
+       REG_L x4,  PT_TP(sp)
+       REG_L x5,  PT_T0(sp)
+       REG_L x6,  PT_T1(sp)
+       REG_L x7,  PT_T2(sp)
+       REG_L x8,  PT_S0(sp)
+       REG_L x9,  PT_S1(sp)
+       REG_L x10, PT_A0(sp)
+       REG_L x11, PT_A1(sp)
+       REG_L x12, PT_A2(sp)
+       REG_L x13, PT_A3(sp)
+       REG_L x14, PT_A4(sp)
+       REG_L x15, PT_A5(sp)
+       REG_L x16, PT_A6(sp)
+       REG_L x17, PT_A7(sp)
+       REG_L x18, PT_S2(sp)
+       REG_L x19, PT_S3(sp)
+       REG_L x20, PT_S4(sp)
+       REG_L x21, PT_S5(sp)
+       REG_L x22, PT_S6(sp)
+       REG_L x23, PT_S7(sp)
+       REG_L x24, PT_S8(sp)
+       REG_L x25, PT_S9(sp)
+       REG_L x26, PT_S10(sp)
+       REG_L x27, PT_S11(sp)
+       REG_L x28, PT_T3(sp)
+       REG_L x29, PT_T4(sp)
+       REG_L x30, PT_T5(sp)
+       REG_L x31, PT_T6(sp)
+       .endm
+
+ENTRY(arch_rethook_trampoline)
+       addi sp, sp, -(PT_SIZE_ON_STACK)
+       save_all_base_regs
+
+       move a0, sp /* pt_regs */
+
+       call arch_rethook_trampoline_callback
+
+       /* use the result as the return-address */
+       move ra, a0
+
+       restore_all_base_regs
+       addi sp, sp, PT_SIZE_ON_STACK
+
+       ret
+ENDPROC(arch_rethook_trampoline)
--
2.17.1

---------------------------------------------------------------------------=
----------------------------------------------------------
=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0=D0=C2=BB=AA=C8=FD=BC=
=AF=CD=C5=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=B7=A2=CB=CD=
=B8=F8=C9=CF=C3=E6=B5=D8=D6=B7=D6=D0=C1=D0=B3=F6
=B5=C4=B8=F6=C8=CB=BB=F2=C8=BA=D7=E9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=C6=E4=CB=
=FB=C8=CB=D2=D4=C8=CE=BA=CE=D0=CE=CA=BD=CA=B9=D3=C3=A3=A8=B0=FC=C0=A8=B5=AB=
=B2=BB=CF=DE=D3=DA=C8=AB=B2=BF=BB=F2=B2=BF=B7=D6=B5=D8=D0=B9=C2=B6=A1=A2=B8=
=B4=D6=C6=A1=A2
=BB=F2=C9=A2=B7=A2=A3=A9=B1=BE=D3=CA=BC=FE=D6=D0=B5=C4=D0=C5=CF=A2=A1=A3=C8=
=E7=B9=FB=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC=C7=EB=C4=FA=C1=A2=
=BC=B4=B5=E7=BB=B0=BB=F2=D3=CA=BC=FE=CD=A8=D6=AA=B7=A2=BC=FE=C8=CB=B2=A2=C9=
=BE=B3=FD=B1=BE
=D3=CA=BC=FE=A3=A1
This e-mail and its attachments contain confidential information from New H=
3C, which is
intended only for the person or entity whose address is listed above. Any u=
se of the
information contained herein in any way (including, but not limited to, tot=
al or partial
disclosure, reproduction, or dissemination) by persons other than the inten=
ded
recipient(s) is prohibited. If you receive this e-mail in error, please not=
ify the sender
by phone or email immediately and delete it!


--===============5522535772944708018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5522535772944708018==--
