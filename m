Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F43C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F39F20821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A4WyLmPK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzbrB6QZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F39F20821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpkm5NOo8f6s17MCGd0H4xgNamG6atdWaSF80TAOOU4=; b=A4WyLmPKHNpXzI
	EkrnDZDhXqc+TP4m69dFY1/JE0PzAY0gZW+CADbCoOg/3/1IJHwpGuNyK5m5JhY64keZdfh20eKCU
	ChXcLLemYvHXxnT4CyubTSpcOeCx7YaY0d98Mzvk1nnH4Cic0KiZgVR4fsrZRfWU8+qAQtDm5PlK5
	TNG1zVwBKHjUs5GyRYa/bqQldcgVCWZLP7f3A3RbNBFSmpQq17tZPBsIKYAKkcLz5zu6SoffhND2M
	mjD3WS8ic+x97m7hEXGgF9vD9XWU3tlHtIfB3/12x0mWml+nJaqVqqwSF3NM6Ss/Mqmq0cznfZw4I
	tkpMfeWGhXK/ZQymGFZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSPd-0007Jx-7F; Mon, 10 Dec 2018 20:44:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSPX-00070G-H8
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 20:44:17 +0000
Received: by mail-wm1-x341.google.com with SMTP id a62so34628wmh.4
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 12:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAFBhCoIWdPJwhjOTKbWPt1miTzrc/kQ35Vv8Rxycpw=;
 b=nzbrB6QZoZNwzaVqsOn6BnssQ3je8K5Yjd+Jb0TaOisD04FZ0gjJu1EieOos7mrfK7
 iSRGrtaOMXww8d6EVjcGhJ2cFVvmGnNp0m/T5sk2LUisr8eMpAtQMib59gX7Md6J20sn
 zQdByUZT2Du+1B5qTjV0zNWJEbPcQkEYOYeRDJE6ujwXoxN1F0dhnSliLp6eL0TuPt7t
 jXWcW+jKisOCf3+d6PvZx9F56fMOb+6fR28D4PU/07CgAFG8/nTBTzF0YhXOlZOKokrW
 paYeQ2gqURl8IldmgE4qIQLHWLzFxXUlSPFA+UyNGy1wi1u8PI7R5a+7dOM334CMMRh/
 cqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAFBhCoIWdPJwhjOTKbWPt1miTzrc/kQ35Vv8Rxycpw=;
 b=dvfxBiAnBkaxYRNUeLDwvSN8V83JcenIkSLGJKpktVt7bzzY3gfsEdTfypQ6QeyCGf
 yoif2xS7QEhwdXjSgcOFHxxSf4GgbPwaTA2t+2urnKfn4eZsYIpHc10DoJNbGbLECKdo
 78iUq8uyyht3vGdiV3h1dWXTWWusbXpteV5/z+AGR49j0Z1rxMJKkpR4LU+KV9rJbs+x
 mf2IS/OGDPgRW0xkpqWiOon6cvKM04wRGeVe8Q58m/vKNOJbIVKVkQZ/22VoNTJMuGqf
 nBjHeyH9pgzDnq4gFy8A6pTukvfj2mrfXQ5v7oMDPUqnl+zNjD4qmNZtMfy2DndTFl79
 AvXQ==
X-Gm-Message-State: AA+aEWZxkXWbwuYLXqZT/r0XuqlclkAZbJPxg/FEhMQcDZ7MKLdBHwFV
 iOqyUky7fzH+3wuIdtvqjg4=
X-Google-Smtp-Source: AFSGD/W21idbVG3TaM3xUmJchLOEr24PJWhpFRDf8/n10P4+sF7VSdcEnyndffOKUptoI07YlMxWMA==
X-Received: by 2002:a1c:e90c:: with SMTP id q12mr7428413wmc.12.1544474643758; 
 Mon, 10 Dec 2018 12:44:03 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id b131sm26985wma.21.2018.12.10.12.44.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 12:44:03 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: define CREATE_TRACE_POINTS in ptrace.c
Date: Mon, 10 Dec 2018 21:43:55 +0100
Message-Id: <20181210204355.3483-3-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181210204355.3483-1-david.abdurachmanov@gmail.com>
References: <20181210204355.3483-1-david.abdurachmanov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_124415_597735_0154B788 
X-CRM114-Status: GOOD (  10.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Define CREATE_TRACE_POINTS in order to create functions and structures
for the trace events. This is needed if HAVE_SYSCALL_TRACEPOINTS and
CONFIG_FTRACE_SYSCALLS are enabled, otherwise we get linking errors:

[..]
  MODPOST vmlinux.o
kernel/trace/trace_syscalls.o: In function `.L0 ':
trace_syscalls.c:(.text+0x1152): undefined reference to `__tracepoint_sys_enter'
trace_syscalls.c:(.text+0x126c): undefined reference to `__tracepoint_sys_enter'
trace_syscalls.c:(.text+0x1328): undefined reference to `__tracepoint_sys_enter'
trace_syscalls.c:(.text+0x14aa): undefined reference to `__tracepoint_sys_enter'
trace_syscalls.c:(.text+0x1684): undefined reference to `__tracepoint_sys_exit'
trace_syscalls.c:(.text+0x17a0): undefined reference to `__tracepoint_sys_exit'
trace_syscalls.c:(.text+0x185c): undefined reference to `__tracepoint_sys_exit'
trace_syscalls.c:(.text+0x19de): undefined reference to `__tracepoint_sys_exit'
arch/riscv/kernel/ptrace.o: In function `.L0 ':
ptrace.c:(.text+0x4dc): undefined reference to `__tracepoint_sys_enter'
ptrace.c:(.text+0x632): undefined reference to `__tracepoint_sys_exit'
make: *** [Makefile:1036: vmlinux] Error 1

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Fixes: b78002b395b4 ("riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig")
---
 arch/riscv/kernel/ptrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 60f1e02eed36..32a374a1b31a 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -24,6 +24,8 @@
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 #include <linux/tracehook.h>
+
+#define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
 enum riscv_regset {
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
