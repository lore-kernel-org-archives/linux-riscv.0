Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C0DC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11B5721534
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+CfjUjS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1JRzHPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11B5721534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jGqSRFHOBihKwvCirW5/r4TWkMbCnrKUY3Q6CLzJeHc=; b=W+CfjUjSPQrpwFvvHbkCdlN4o
	r661vps82Zx8QHznlmu6n4OmzkKl5FRZ4/waiff8AePWcox7vjfKT8fPZclqU2o03NHC5M5INDEdV
	FUBNCC7l47gdZR93ZRZSEPxiuw1eaq2MzLw9Nmfpva4Du8N+UYvFwNMlaZTPCD3jTH5B4jwDC2O5C
	FWd9BccktaEAdiFEY0pYinjtDMW0CJLVgKCrMcJGSZtjFMd7UPcG6sZO1fnIWVPvF3VuJYXPU+6YN
	swit/X8AZuPjgQ5Xc2T9hQEJBPSfzBmRK84YplVFWoNklxUzz1B/8MmwjALJKOjfiFmEHvJD/xeZ8
	yLqCi3Gyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwcv-0007cB-3S; Tue, 03 Nov 2020 13:45:33 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwck-0007WO-8c
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:24 +0000
Received: by mail-qk1-x744.google.com with SMTP id i21so13869868qka.12
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=es+7eu/1JIS0u6NUqnkeBJLaNZv/3XzsgPMcIjCfPvw=;
 b=G1JRzHPGQrx/xpiw57sn8HU7v/308dFEf/ILepEmaZjyWnlEsJ7Jt8m85wS0ZL7hAX
 XJeTMJwilfEZakFun1JP0oOz/kjVO7ntj0lbqnvdowtp9Sjnb4O57j6xGZ2A2TDRxJ5E
 4hyVqojJ8zyBb4O4e8FxEZk0ckMCMU3mtuanjys2GXmepYyg59GuQpOTy/c3oAXZmE4r
 zn17hosEuRctElxq5KH0mRPs2x9n7TVfGejNrQeTj7gxbeRUVtnODP8Albhmr3L5TIw9
 um6WfN/bCe4QtVClrP0rodIxZuduSktya09MfYs5Ip8/wx86oaN0d6GJOt+Tk6mRBi/J
 YDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=es+7eu/1JIS0u6NUqnkeBJLaNZv/3XzsgPMcIjCfPvw=;
 b=lT35RspC6bWqbu3rVibZXSCgzwpupGOmgjRGXBIBrkEvWVDhrQyut5tAfQK9pJMHoB
 Y9nzD1eod98PS9ZiDvIyR5N03xJW3kd3YCaEyxDLC7i0kVGpkM/8AoFzUlZjRsLlp8hF
 brG3957numYZgYoMVd+6nMiP+bL90ScWv4+sevM7Ef/FG7KhT4k/x6jiLMSyElWeZjN+
 ZLEuEXU6kDphAX9JFjsHkWTNOWvw0z9n2Z9DQCTvvxVwn4KkMSk0NCDQxLruH9Pmij79
 I3p8qwr0Jo+/IqlZwvdrZ4ZauJOXzmqaU6dq+MgMPzkg5CWGSTlQKk+omiKhwdLv0X93
 +w/g==
X-Gm-Message-State: AOAM532p1S3rLyE0Xfr1ewiaTA3T4MjLRCDEn+7UXtsj0RgLYCv8k4++
 Jm1VcfwMfiHpTfbZSSxjfWM=
X-Google-Smtp-Source: ABdhPJzUUsDjnuEHVk6XCSkkESwGkcTgkeydQBunRI0YUoWla6WErrBjgwkAC8sVvIMrobSGWNFG7g==
X-Received: by 2002:a37:7e82:: with SMTP id
 z124mr19653601qkc.107.1604411120584; 
 Tue, 03 Nov 2020 05:45:20 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:19 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 8/8] seccomp/cache: Report cache data through
 /proc/pid/seccomp_cache
Date: Tue,  3 Nov 2020 07:43:04 -0600
Message-Id: <6bf174724c135a880fb8cbe602b665f613bab58e.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084522_614092_132C029C 
X-CRM114-Status: GOOD (  23.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: YiFei Zhu <yifeifz2@illinois.edu>

Currently the kernel does not provide an infrastructure to translate
architecture numbers to a human-readable name. Translating syscall
numbers to syscall names is possible through FTRACE_SYSCALL
infrastructure but it does not provide support for compat syscalls.

This will create a file for each PID as /proc/pid/seccomp_cache.
The file will be empty when no seccomp filters are loaded, or be
in the format of:
<arch name> <decimal syscall number> <ALLOW | FILTER>
where ALLOW means the cache is guaranteed to allow the syscall,
and filter means the cache will pass the syscall to the BPF filter.

For the docker default profile on x86_64 it looks like:
x86_64 0 ALLOW
x86_64 1 ALLOW
x86_64 2 ALLOW
x86_64 3 ALLOW
[...]
x86_64 132 ALLOW
x86_64 133 ALLOW
x86_64 134 FILTER
x86_64 135 FILTER
x86_64 136 FILTER
x86_64 137 ALLOW
x86_64 138 ALLOW
x86_64 139 FILTER
x86_64 140 ALLOW
x86_64 141 ALLOW
[...]

This file is guarded by CONFIG_SECCOMP_CACHE_DEBUG with a default
of N because I think certain users of seccomp might not want the
application to know which syscalls are definitely usable. For
the same reason, it is also guarded by CAP_SYS_ADMIN.

Suggested-by: Jann Horn <jannh@google.com>
Link: https://lore.kernel.org/lkml/CAG48ez3Ofqp4crXGksLmZY6=fGrF_tWyUCg7PBkAetvbbOPeOA@mail.gmail.com/
Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/Kconfig            | 15 +++++++++++
 fs/proc/base.c          |  6 +++++
 include/linux/seccomp.h |  7 +++++
 kernel/seccomp.c        | 59 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..6e2eb7171da0 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -514,6 +514,21 @@ config SECCOMP_FILTER
 
 	  See Documentation/userspace-api/seccomp_filter.rst for details.
 
+config SECCOMP_CACHE_DEBUG
+	bool "Show seccomp filter cache status in /proc/pid/seccomp_cache"
+	depends on SECCOMP
+	depends on SECCOMP_FILTER && !HAVE_SPARSE_SYSCALL_NR
+	depends on PROC_FS
+	help
+	  This enables the /proc/pid/seccomp_cache interface to monitor
+	  seccomp cache data. The file format is subject to change. Reading
+	  the file requires CAP_SYS_ADMIN.
+
+	  This option is for debugging only. Enabling presents the risk that
+	  an adversary may be able to infer the seccomp filter logic.
+
+	  If unsure, say N.
+
 config HAVE_ARCH_STACKLEAK
 	bool
 	help
diff --git a/fs/proc/base.c b/fs/proc/base.c
index 0f707003dda5..d652f9dbaecc 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3261,6 +3261,9 @@ static const struct pid_entry tgid_base_stuff[] = {
 #ifdef CONFIG_PROC_PID_ARCH_STATUS
 	ONE("arch_status", S_IRUGO, proc_pid_arch_status),
 #endif
+#ifdef CONFIG_SECCOMP_CACHE_DEBUG
+	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
+#endif
 };
 
 static int proc_tgid_base_readdir(struct file *file, struct dir_context *ctx)
@@ -3590,6 +3593,9 @@ static const struct pid_entry tid_base_stuff[] = {
 #ifdef CONFIG_PROC_PID_ARCH_STATUS
 	ONE("arch_status", S_IRUGO, proc_pid_arch_status),
 #endif
+#ifdef CONFIG_SECCOMP_CACHE_DEBUG
+	ONE("seccomp_cache", S_IRUSR, proc_pid_seccomp_cache),
+#endif
 };
 
 static int proc_tid_base_readdir(struct file *file, struct dir_context *ctx)
diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index 02aef2844c38..76963ec4641a 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -121,4 +121,11 @@ static inline long seccomp_get_metadata(struct task_struct *task,
 	return -EINVAL;
 }
 #endif /* CONFIG_SECCOMP_FILTER && CONFIG_CHECKPOINT_RESTORE */
+
+#ifdef CONFIG_SECCOMP_CACHE_DEBUG
+struct seq_file;
+
+int proc_pid_seccomp_cache(struct seq_file *m, struct pid_namespace *ns,
+			   struct pid *pid, struct task_struct *task);
+#endif
 #endif /* _LINUX_SECCOMP_H */
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index d8cf468dbe1e..76f524e320b1 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -553,6 +553,9 @@ void seccomp_filter_release(struct task_struct *tsk)
 {
 	struct seccomp_filter *orig = tsk->seccomp.filter;
 
+	/* We are effectively holding the siglock by not having any sighand. */
+	WARN_ON(tsk->sighand != NULL);
+
 	/* Detach task from its filter tree. */
 	tsk->seccomp.filter = NULL;
 	__seccomp_filter_release(orig);
@@ -2335,3 +2338,59 @@ static int __init seccomp_sysctl_init(void)
 device_initcall(seccomp_sysctl_init)
 
 #endif /* CONFIG_SYSCTL */
+
+#ifdef CONFIG_SECCOMP_CACHE_DEBUG
+/* Currently CONFIG_SECCOMP_CACHE_DEBUG implies SECCOMP_ARCH_NATIVE */
+static void proc_pid_seccomp_cache_arch(struct seq_file *m, const char *name,
+					const void *bitmap, size_t bitmap_size)
+{
+	int nr;
+
+	for (nr = 0; nr < bitmap_size; nr++) {
+		bool cached = test_bit(nr, bitmap);
+		char *status = cached ? "ALLOW" : "FILTER";
+
+		seq_printf(m, "%s %d %s\n", name, nr, status);
+	}
+}
+
+int proc_pid_seccomp_cache(struct seq_file *m, struct pid_namespace *ns,
+			   struct pid *pid, struct task_struct *task)
+{
+	struct seccomp_filter *f;
+	unsigned long flags;
+
+	/*
+	 * We don't want some sandboxed process to know what their seccomp
+	 * filters consist of.
+	 */
+	if (!file_ns_capable(m->file, &init_user_ns, CAP_SYS_ADMIN))
+		return -EACCES;
+
+	if (!lock_task_sighand(task, &flags))
+		return -ESRCH;
+
+	f = READ_ONCE(task->seccomp.filter);
+	if (!f) {
+		unlock_task_sighand(task, &flags);
+		return 0;
+	}
+
+	/* prevent filter from being freed while we are printing it */
+	__get_seccomp_filter(f);
+	unlock_task_sighand(task, &flags);
+
+	proc_pid_seccomp_cache_arch(m, SECCOMP_ARCH_NATIVE_NAME,
+				    f->cache.allow_native,
+				    SECCOMP_ARCH_NATIVE_NR);
+
+#ifdef SECCOMP_ARCH_COMPAT
+	proc_pid_seccomp_cache_arch(m, SECCOMP_ARCH_COMPAT_NAME,
+				    f->cache.allow_compat,
+				    SECCOMP_ARCH_COMPAT_NR);
+#endif /* SECCOMP_ARCH_COMPAT */
+
+	__put_seccomp_filter(f);
+	return 0;
+}
+#endif /* CONFIG_SECCOMP_CACHE_DEBUG */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
