Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52836E73150
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:Subject:Cc:Message-Id
	:Date:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZcxzbMssH/dKAZcNqdvZUpC/l+2o1IDt3MaRgR+cuzw=; b=aUiD8mQRcKj8WC
	VXLsjnW8ogRvXp7Y4g3e6rKXdpsteV6WR0+CLU0t88XyD4eDv62NNu0+nPPMgr8Xsus3VNrLJPo/d
	H8FIqduGR2qSqFh3PCm+9oBfVTpi3Z3HkueCO196KfX8GeWzl/QmLXCqjuGz6y3/tSpoDtHoNzX/S
	mSNCqKHL7DOjpYJSUu3R1T30BMXdPEROnrBl912aphtBCSmMp8Fbd5/PffTtShYPRNBV6oQPP9o4r
	PUVhNSApcMvaVPaYhrRb+mSd4xCW+0bJu7Tz06dni2vDNs3FxpWuxQ8gzrTGRrVQpk61KdnfKsmBH
	6bBL7+CI2UJue3mLtceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqS6-00000004jL7-3Jue;
	Mon, 02 Feb 2026 09:42:38 +0000
Received: from sg-1-105.ptr.blmpb.com ([118.26.132.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqS3-00000004jJB-3dIk
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 09:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1770025335; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=CixEHNZ+yVLBGfbMvIESwy7kUtGWgF6cLrpSlMLvomg=;
 b=B3ONIYjfUE5j49SxApzTw6XtjTF4IWbZYvFZhRMgrN7iuc4YlcPZhNPppgziit1nQFhXPB
 mvTle1ZlmkOAUhx7F9KhKLpFoLtqpjPU3tNiAXF5IRLP9tSUgIsSJaEzE0/TDqzbu6sJLj
 2QyMYjNgGpOq5ARO4dyVBi+WYnGGpxZ6jVSUIAe7HloCyKhW5eI6YYnDmcfF8k8xWu8A3v
 6wiIh5ZEo/OJqfBLx0nXyvx3L5FB/slakq7+6MT54oK2JedykRngG6sLzVoHDC24d4Fozd
 /dI85efawLe6a5bvikiLRqIfokIl/jj88y+lEZVGkwd/dRqwP8/U/01qeA5gtQ==
To: <linux-riscv@lists.infradead.org>
Date: Mon,  2 Feb 2026 17:42:00 +0800
Message-Id: <20260202094200.53735-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+269807175+5f2aa8+lists.infradead.org+qirui.001@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v1] riscv: add hardware error trap handler support
X-Mailer: git-send-email 2.52.0
From: "\"$(name)\" <$(mail address)>" <qirui.001@bytedance.com>
Mime-Version: 1.0
X-Original-From: "$(name)" <$(mail address)>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_014236_313704_3CB67AD3 
X-CRM114-Status: UNSURE (   8.22  )
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

From: Rui Qi <qirui.001@bytedance.com>

adds support for handling hardware error traps (exception code 19)
in the RISC-V architecture. The changes include:

- Add do_trap_hardware_error function declaration in asm-prototypes.h
- Add hardware error trap vector entry in entry.S exception vector table
- Implement do_trap_hardware_error handler in traps.c that generates
  SIGBUS with BUS_MCEERR_AR for hardware errors

This enables proper handling of hardware error exceptions that may occur
in RISC-V systems, providing appropriate error reporting and signal
generation for user space processes.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/asm-prototypes.h | 1 +
 arch/riscv/kernel/entry.S               | 1 +
 arch/riscv/kernel/traps.c               | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 41ec5cdec367..5b90ba5314ee 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -40,6 +40,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs);
 #define DECLARE_DO_ERROR_INFO(name)	asmlinkage void name(struct pt_regs *regs)
 
 DECLARE_DO_ERROR_INFO(do_trap_unknown);
+DECLARE_DO_ERROR_INFO(do_trap_hardware_error);
 DECLARE_DO_ERROR_INFO(do_trap_insn_misaligned);
 DECLARE_DO_ERROR_INFO(do_trap_insn_fault);
 DECLARE_DO_ERROR_INFO(do_trap_insn_illegal);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 60eb221296a6..d011fb51c59a 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -498,6 +498,7 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_trap_unknown /* cause=16 */
 	RISCV_PTR do_trap_unknown /* cause=17 */
 	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
+	RISCV_PTR do_trap_hardware_error /* hardware error (19) */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 5fb57fad188a..7cdb5b26d03d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -165,6 +165,8 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
 
 DO_ERROR_INFO(do_trap_unknown,
 	SIGILL, ILL_ILLTRP, "unknown exception");
+DO_ERROR_INFO(do_trap_hardware_error,
+	SIGBUS, BUS_MCEERR_AR, "hardware error");
 DO_ERROR_INFO(do_trap_insn_misaligned,
 	SIGBUS, BUS_ADRALN, "instruction address misaligned");
 DO_ERROR_INFO(do_trap_insn_fault,
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
