Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF3BECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09473205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JGE2FClj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KlApc4hN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09473205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnYWn9JoejeqlVocW4pOYWBthc06djI70GK04Dy4TS8=; b=JGE2FClj1fFPsv
	pLgXgSAxTzSIUCBDwxYgL2YBZq7mAhWOHkQAKN1/b2dueO05yY3m/PokuM9AOXWtALYZKrBsIBV9v
	nd5R+kHFD3tbI9jGAfcL2uZCYq27AgIg3eMz6N6aYUchiCfkyNZ73+7RyHQSN6hnUsCnRf/rpFyuB
	JD9/k6UZoahZNrwDnfPjBXPeXT9CEbj1cB8TwsX/0HyU6TH2IItwTRGxlj6Hss517uwALpy9wGu37
	dzqLPo/oumu79poWLQXYWKMBxbxDEi++dmdyiKEPUPdq+29zRHEmnOF1ubdxvgULGVgVYAVjaSduE
	8BYUEFCM1gl81PdhQuJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFPxn-0002P8-Bd; Wed, 24 Oct 2018 20:41:11 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFPxg-0002LE-6f
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 20:41:07 +0000
Received: by mail-pg1-x541.google.com with SMTP id n10-v6so2151691pgv.10
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=haJQGN66g9cqBvgn1IgWSupU39+1LrZjNGcE4HlkRC4=;
 b=KlApc4hNRgCFad3JuNRcITA4keljxUC+I1dkX2zclz7ddrvw1eo7lRYk25wmQvVpFt
 XN6Q2Dt30vdUoCG2SIBX2Wlf+y2EdLcTUVf2jVZaWbP/UIas/CJY8/Rz9ycANwB5y5ug
 1VzgP+9UWBD2EPIIKZcCJhfqaTKm+43qGpwRXO8RHdyoRRanfQb7QpsZA6km8cNGDjNt
 4o36EDa/zXD0XXKdq9hBEy1uPj5+y7QunpLI4fJGnHxlMOEWRL35j0cHmAmkpu9nXMzs
 X/VxuNcFVy1nFhb3HSDn6HLTmg7D1BPQjoWUPshbf4OSdBqg4yc3U1WnWLsfFiLuoT+g
 pBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=haJQGN66g9cqBvgn1IgWSupU39+1LrZjNGcE4HlkRC4=;
 b=oKMPxpgEt+Q2nFW2deKVLxc9m/Y0JYAdyO0OLvhPLHHMuVVJSVIrBXZHG9xs9v6KXP
 M1M3hPZEZ2eL6JXtFUHO5hoB/sqWSbJ1xu5Bxn4RqtNy+yDXi72SXDMNYNVdozaGZDsf
 hM8EJ5k61Gqj4KrosPSWR5ZOULu9JLtW3FCpkXQHOvuHqwLV5jyfQXrxAylCJmiOJlzE
 gc7LgaU1UFhqtUnC79EHbofVN7NemfC8vD7kXNXcSypZLekNagd2a6/aM4uXJs+335+J
 thwv6Bu9J+JrXmnwtYZ6R/rcdrZjBvBDv+xDhiZN1EAFVzya4c8pbIiUVcB7kbdrPkhB
 oC3Q==
X-Gm-Message-State: AGRZ1gJcHIaJm/Na1MCCGhmalZWFgW0EUaHA3Zf2UyRSOM/GucSsuT9e
 1RvRHff8rcJw45NZdDRiZ4R3EA==
X-Google-Smtp-Source: AJdET5dUvpN4PWgG/uZ3iVBHn7yFFk9bzgmhhoTVoUh+qxGBybOtxPE62VdC6X+6QIFa8y6nmrfgJQ==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr3955772pgd.344.1540413653552; 
 Wed, 24 Oct 2018 13:40:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h5-v6sm6922729pgh.42.2018.10.24.13.40.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 13:40:52 -0700 (PDT)
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
Date: Wed, 24 Oct 2018 13:40:36 -0700
Message-Id: <20181024204036.8799-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181024204036.8799-1-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_134104_262295_EDEC381A 
X-CRM114-Status: GOOD (  16.34  )
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 paul@paul-moore.com, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, eparis@redhat.com, luto@amacapital.net,
 dhowells@redhat.com, linux-audit@redhat.com, pombredanne@nexb.com,
 david.abdurachmanov@gmail.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, keescook@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024204036.zK80qmVbXRwZkQYqZN4IpBBw3tVTzYGHw-X8bYxQoPw@z>

From: "Wesley W. Terpstra" <wesley@sifive.com>

This is a fairly straight-forward implementation of seccomp for RISC-V
systems.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig                   | 18 ++++++++++++++++++
 arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
 arch/riscv/include/asm/syscall.h     |  6 ++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 include/uapi/linux/audit.h           |  1 +
 5 files changed, 36 insertions(+)
 create mode 100644 arch/riscv/include/asm/seccomp.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..28abe47602a1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -28,6 +28,7 @@ config RISCV
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
@@ -214,6 +215,22 @@ menu "Kernel type"
 
 source "kernel/Kconfig.hz"
 
+config SECCOMP
+	bool "Enable seccomp to safely compute untrusted bytecode"
+
+	help
+	  This kernel feature is useful for number crunching applications
+	  that may need to compute untrusted bytecode during their
+	  execution. By using pipes or other transports made available to
+	  the process as file descriptors supporting the read/write
+	  syscalls, it's possible to isolate those applications in
+	  their own address space using seccomp. Once seccomp is
+	  enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
+	  and the task is only allowed to execute a few safe syscalls
+	  defined by each seccomp mode.
+
+	  If unsure, say Y. Only embedded should say N here.
+
 endmenu
 
 menu "Bus support"
@@ -243,3 +260,4 @@ menu "Power management options"
 source kernel/power/Kconfig
 
 endmenu
+
diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
new file mode 100644
index 000000000000..c1b4407f1038
--- /dev/null
+++ b/arch/riscv/include/asm/seccomp.h
@@ -0,0 +1,10 @@
+/* Copyright 2018 SiFive, Inc. */
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_SECCOMP_H
+#define _ASM_RISCV_SECCOMP_H
+
+#include <asm/unistd.h>
+
+#include <asm-generic/seccomp.h>
+
+#endif /* _ASM_RISCV_SECCOMP_H */
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d25f8904c00..d24f774f39df 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -19,6 +19,7 @@
 #define _ASM_RISCV_SYSCALL_H
 
 #include <linux/sched.h>
+#include <uapi/linux/audit.h>
 #include <linux/err.h>
 
 /* The array of function pointers for syscalls. */
@@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
 }
 
+static inline int syscall_get_arch(void)
+{
+	return AUDIT_ARCH_RISCV;
+}
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f8fa1cd2dad9..374973dc05c6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -80,6 +80,7 @@ struct thread_info {
 #define TIF_RESTORE_SIGMASK	4	/* restore signal mask in do_signal() */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
 #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
+#define TIF_SECCOMP		7	/* seccomp syscall filtering active */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 818ae690ab79..c16fa1a76659 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -399,6 +399,7 @@ enum {
 /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
 #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV	(EM_RISCV)
 #define AUDIT_ARCH_S390		(EM_S390)
 #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_SH		(EM_SH)
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
