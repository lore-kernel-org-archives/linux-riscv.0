Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C7CF34C49
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wHWUgqNcwVOue1a8R2YwHcW5QaZavXcyyuLtVKTyC64=; b=rlan28QgkkfaqW
	MjIfBF/WFxUDEwOKL0IPpbbiL+ZHJpVGIB7nQMQR2fmP4ZdpjPWhMjCDlaKk5WbSSYrC8qVOjmoK3
	7k0jdwk+OriaZrTMClrU6W/EOG7Y2sX2oABd7L5BeXXJaDhHLOcKFiJplkeiTw7K9AOVeNOOCIEEL
	0r+zwBZPFi4KKS4py38kmBR26N3TIE/fR2gElXTYcQKS8/Jm5h5vlYxNs4gfwvJ5oe+hBnx4d/60d
	eEjWv/CY5CulDk+8s/OUt4io7foGrzwru7/neaIWABSVSOhfi0Oh+oKo0Mt1/THaZ4JBz9cHU3IbC
	9Xz7XqVvOv/LZAtPFmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHDR-0000000FjJY-41me;
	Mon, 13 Apr 2026 13:20:37 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHDN-0000000FjJ6-38BU
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 13:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776086429; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=35mq4DCXAG68ToHhPfpuKoqcRBSAR6Ns/WoqgT52LeY=;
	b=kD0qFVY+S8DSW9vyGMebV8m7MOf0XQceK7jE+VyGiDgTrS3BRJ41HA4e0UtV+CfR4esLYaomxUA5ppXbFNlKZaWBhsUqDwRYP/ZfIbZwHjGfUeh0o2KR4sonEcW6mxJffUNLEd2T3esRXqpVBXX1TjLViq9mJsaEGQFn3fL0N6g=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X0xIp8p_1776086410;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X0xIp8p_1776086410 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 13 Apr 2026 21:20:27 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	anup@brainfault.org,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v2] riscv: smp: Align secondary_start_sbi to 4 bytes
Date: Mon, 13 Apr 2026 21:20:09 +0800
Message-ID: <20260413132009.133752-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_062034_540224_76E73862 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

From: Chen Pei <cp0613@linux.alibaba.com>

During SMP boot, the secondary_start_sbi address is passed to the
slave core via sbi_hsm_hart_start. In OpenSBI, this address is
written to STVEC in sbi_hart_switch_mode.

According to the privileged specification, the BASE field of STVEC
must always be aligned on a 4-byte boundary. However, System.map
reveals that secondary_start_sbi is not a 4-byte aligned address.

For example, the address of secondary_start_sbi is
0xffffffff80001066, and the disassembly is as follows:

Dump of assembler code from 0xffffffff80001052 to 0xffffffff8000107a:
   0xffffffff80001052 <_start+4178>:    c.nop   -11
   0xffffffff80001054 <_start+4180>:    auipc   gp,0x1a1f
   0xffffffff80001058 <_start+4184>:    addi    gp,gp,84
   0xffffffff8000105c <_start+4188>:    csrw    satp,a2
   0xffffffff80001060 <_start+4192>:    sfence.vma
   0xffffffff80001064 <_start+4196>:    ret
   0xffffffff80001066 <_start+4198>:    csrw    sie,zero
   0xffffffff8000106a <_start+4202>:    csrw    sip,zero
   0xffffffff8000106e <_start+4206>:    li      t0,2
   0xffffffff80001070 <_start+4208>:    csrw    scounteren,t0
   0xffffffff80001074 <_start+4212>:    auipc   gp,0x1a1f
   0xffffffff80001078 <_start+4216>:    addi    gp,gp,52

When writing to STVEC at address 0xffffffff80001066, the actual
write address is 0xffffffff80001064, corresponding to the address
of the previous ret instruction. This is unexpected, and if an
interrupt occurs at this point, it will cause unpredictable results.

However, secondary_start_sbi immediately masks all interrupts and
updates STVEC, so no problems occurred.

In summary, it is more reasonable to make secondary_start_sbi
satisfy 4-byte alignment.

Changes in v2:
 - Place `.align 2` inside `#ifdef CONFIG_SMP`, above the tag.
 - Add two Reviewed-by tags.
 - Based on Linux 7.0.

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..9f33be6260e1 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -127,6 +127,7 @@ relocate_enable_mmu:
 #endif /* CONFIG_MMU */
 #ifdef CONFIG_SMP
 	.global secondary_start_sbi
+	.align 2
 secondary_start_sbi:
 	/* Mask all interrupts */
 	csrw CSR_IE, zero
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
