Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672FCC76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FgJ+uW5XtyAZWGHLp9h+oG7q0UUtGGxwsY80Q7+3JCQ=; b=qY4n2hIosEmG+z
	75ICcZueYEWUVG/C5qBgz+2eljAUs/3ZscMZOnpvVoHMU2xo10YtPb7vCOk7TM2/16mJ65PJKH6BF
	iwurCxd78KlPtdlBUd3NBCWtEvofaUV64q079qoHlD5HWeyqo8GOaaYoQMFJUTMtG4WSbDp5FxBzE
	GzdYwkfGQIM+iGYb+3NQNP+vcp+IONuBHcxsgBtDtwsD+BuRsjD/pmrK6mzxt8axaZp3Mrfa3AaWd
	i1tu13Mn2FM1yH9FdlVWjS36kxvxakF1DLJVpzPJTdSBhInfJi0ATE0I6uqGvlPyAfOIi+ZkoEm2e
	Bs/2R0Ej1EFyMZM0WI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglUk-00AoEa-1m;
	Mon, 27 Mar 2023 11:58:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglUh-00AoDN-1J
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 11:58:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id j13so7449236pjd.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1679918310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LV9la5f2Alty6EKhNfpDearvf5tbwwgFKDMkwlyKPtE=;
        b=GiLwRJUOrKqj5W/x6KqK8UEqfjHXn/4U7CcAA3l7VEKUrLnhhrYxJXxqRd0Ub583gH
         wldPDbWqqe15vuPBf/SoYxURgxtdxIVl1avGkwN9PMj+vGfEEBuEV7Ev7OBIKR+ITanF
         PGto16BPPgcDSUjFniOtA94AjsxPmRGxlAR/i8AD8sYIbZseVkQYk1236f3wQZQx3Qov
         tlH6cXS3OZqXjXwSqKzK39kWqryHCFK43SxGiOYylmXfcSxB0zLgyhbM0dJHLO5Jb0AK
         f1N0nLfDLq1++CnyON6lKm4PmB1NGt4CSRJfpvCevoYgDONvfCRW9Sj1VAYrzljj6Wsr
         /SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679918310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LV9la5f2Alty6EKhNfpDearvf5tbwwgFKDMkwlyKPtE=;
        b=sC9zlk5nW7Aa+DypUmH5URUieU7tAnbAnzXjDiM4vDPhSjtdT8LV+Xv2WQVa7VkcEM
         nD02Mn+zuxr6OwjFolOXIaE++9momrwZb7mLa0qeNcfuRj4ufjHiw4/t0xngaJEkotyS
         1MncXzsCOLB5Lm4O/Yw3eCha/Ltt7YBp6IxqKzooXHKyiCeCg7YHA2hpEpvZHKCDnPdK
         mVJChmTk0PELwijK+uY4o07DKEnonn5d+xe5BH25yKewhPBm6CNCBlNmJVXd8LNG6NyF
         4GMGaDC1pFL/5vFPecNPrGciRUURgo329RGwTWHn4/uNgRcsvdhjJFyHqhUYoz2R8ra7
         B1Ww==
X-Gm-Message-State: AAQBX9d4sQsw2G3MM/8bFm+JBn/Ptdcg14Lwj7m3xpfmRjLaIF35UCqn
	V7PZOdpQZHMSkMsfukpOnCuSTA==
X-Google-Smtp-Source: AKy350Zva3pWuTyJ13bSraEd0rO2c/BK8g8uliYwap6yoKykNA2lwCZFLn8j/hfhi+yYc+1RHoFB8w==
X-Received: by 2002:a17:90b:38d2:b0:234:dc4:2006 with SMTP id nn18-20020a17090b38d200b002340dc42006mr13442400pjb.4.1679918310187;
        Mon, 27 Mar 2023 04:58:30 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([2408:8606:1800:501::2:2])
        by smtp.gmail.com with ESMTPSA id t8-20020a63dd08000000b00502ecb91940sm17959536pgg.55.2023.03.27.04.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 04:58:29 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv/fault: Dump user opcode bytes on fatal faults
Date: Mon, 27 Mar 2023 19:56:42 +0800
Message-Id: <20230327115642.1610-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_045835_733183_B4DF7F12 
X-CRM114-Status: GOOD (  11.53  )
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

We encountered such a problem(logs are below). We are more curious about
which instruction execution caused the exception. After dumping it
through show_opcodes(), we found that it was caused by a floating-point
instruction.

In this way, we found the problem: in the system bringup , it is
precisely that we have not enabled the floating point function.

So when an exception occurs, it is necessary to dump the instruction
that caused the exception, like x86/fault (ba54d856a9d8).

Logs:
[    0.822481] Run /init as init process
[    0.837569] init[1]: unhandled signal 4 code 0x1 at 0x000000000005e028 in bb[10000+5fe000]
[    0.932292] CPU: 0 PID: 1 Comm: init Not tainted 5.14.0-rc4-00048-g4a843c9043e8-dirty #138
[    0.932949] Hardware name:  , BIOS
[    0.933399] epc : 000000000005e028 ra : 000000000007c7c4 sp : 0000003fffd45da0
[    0.933855]  gp : ffffffff816ea2d8 tp : 0000000000000000 t0 : 0000000000000000
[    0.934303]  t1 : 0000003fffd35df0 t2 : 0000000000000000 s0 : 0000000000000000
[    0.934734]  s1 : 0000000000000000 a0 : 0000003fffd36190 a1 : 0000003fffd45e18
[    0.935200]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[    0.935622]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
[    0.936073]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
[    0.936495]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
[    0.936947]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[    0.937487]  s11: 0000000000d14980 t3 : 0000000000000000 t4 : 0000000000000000
[    0.937954]  t5 : 0000000000000000 t6 : 0000000000000000
[    0.938510] status: 0000000200000020 badaddr: 00000000f0028053 cause: 0000000000000002

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bug.h |  1 +
 arch/riscv/kernel/process.c  | 30 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c    |  1 +
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index d3804a2f9aad..77655dd10a2c 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -86,6 +86,7 @@ struct pt_regs;
 struct task_struct;
 
 void __show_regs(struct pt_regs *regs);
+void show_opcodes(struct pt_regs *regs);
 void die(struct pt_regs *regs, const char *str);
 void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..759dc74fe160 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,6 +83,36 @@ void show_regs(struct pt_regs *regs)
 		dump_backtrace(regs, NULL, KERN_DEFAULT);
 }
 
+static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
+		     unsigned int nbytes)
+{
+	if (!user_mode(regs))
+		return copy_from_kernel_nofault(buf, (u8 *)src, nbytes);
+
+	/* The user space code from other tasks cannot be accessed. */
+	if (regs != task_pt_regs(current))
+		return -EPERM;
+
+	return copy_from_user_nofault(buf, (void __user *)src, nbytes);
+}
+
+void show_opcodes(struct pt_regs *regs)
+{
+	u8 opcodes[4];
+
+	switch (copy_code(regs, opcodes, regs->epc, sizeof(opcodes))) {
+	case 0:
+		pr_info("Opcode: %4ph", opcodes);
+		break;
+	case -EPERM:
+		pr_err("Unable to access userspace of other tasks");
+		break;
+	default:
+		pr_err("Failed to access opcode");
+		break;
+	}
+}
+
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0a98fd0ddfe9..a6f6851e4e87 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -68,6 +68,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
 		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
 		pr_cont("\n");
 		__show_regs(regs);
+		show_opcodes(regs);
 	}
 
 	force_sig_fault(signo, code, (void __user *)addr);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
