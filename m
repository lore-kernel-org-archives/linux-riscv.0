Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5666AECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 18:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24EBC20652
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 18:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mH+OvdYV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiwgUEp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24EBC20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbucG6xrBUhMhD0dOY/NCctQTd4mRXk4BzgbuYaKM84=; b=mH+OvdYVlgkieb
	KVIEnxVfrDlYvw9kdXYd60f9foMwI/vvUPb8Qa4K1KrQbm51994apja/pFrHnrdNeNeDFjjz4NVnD
	P+VzHlyocd6sisa0WGf0IR+eqd5jq5GrCjHVMs4jeCusSY2GPhG4xb/Q1r1juf3F4Kodf4yrkwA7/
	VK1FQ0DQOEGFxZgJ9gKaO54/KWHiP/q+IUAxq/Tz8qoLbYpH27BFQRB2l9fta47L1+mlQHSXwmcfb
	JJGdDdXSJoodCBKcZDIsueDm6a0gHqUfzhmkDdKYiE9/5i+AVCMPtFykG1v8PtTPwcQ0AP13semzZ
	vHa1fjn6zc9Ig/XDRy2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFkQF-0003Q7-Qf; Thu, 25 Oct 2018 18:31:55 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFkQC-0003PJ-RE
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 18:31:54 +0000
Received: by mail-ot1-x341.google.com with SMTP id o14so10112890oth.4
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfjtPSAijY6Gt7tDlP0pZ0Tlv3K77Ct2zufRrXAFtRE=;
 b=EiwgUEp3LVsmNvHLgTr5scPY/AvC3aMSSV7qiBBr8nMLWWMx58Jq0WO7ZXy9grFfXh
 GhdQiSH6F3HwXyoVkntmUdD/sWqV/RbZw97NYXAwe+z8iwNveBBoVw9sPX8mVw2TRWns
 ZV+GZcM66pC3I4YromTYwnTc/z7hyVhwsaiCmNu1ppNsOO5RPtwOE17Argf24L2N+agD
 cL67txkycY9RnsNqjxr6JV6pJLuKiSRBAoEp5ULZPFVQY27n70zqmK6LT5t0D8EObss/
 fM6eISeZzhq5dOD476i17vqs/AFQgK3SXhnUE3+YxNDdf/WvRTlv2ymFS9pjSFJv0j67
 OvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfjtPSAijY6Gt7tDlP0pZ0Tlv3K77Ct2zufRrXAFtRE=;
 b=KMln7UCTPXJ65s2wyfITb76+atieJQwORLObZQcd15/PsPGb+ro5LwayB1HsbqGtlA
 xOB2zDXvtszcnEazAJ6v3hFdD4uAcYOiau10WCLvtDmP9NWt5odH/1BDHordphXELop/
 cgxSDhelvy5V28mHJ1gyrsXBncMGHrjDpGbJ7Lxdtw25yNUUV7nUgwTmz3mJKvjkSXGY
 8TCyYqG4AdeUbx29Fp7K1YNHcB87uOy+XGhBYXgihpAb6axQBjAupSN2afbmQ0WuP5ST
 IYVa+fzk9zMlOaCFDbePxq7PAtFamv/ri7RGd73808iAelvCEBzKK/mGOsNd2wicaa1L
 9q5Q==
X-Gm-Message-State: AGRZ1gL/yitE7yLRwK2VVrIHNjSPaiL0Tf8rtaptTU39HO6O540NcqGX
 5lZLU4QIb+OpWkI4lhjuC6J/W8hleWmtEdnqZ3g=
X-Google-Smtp-Source: AJdET5dk6IO9dU4QDr1+tOUkc8A8kKzTb7yU9NPKL8uvTaEVOq0IgLHJOqUUNprzDz93orTMtO72QRXf1avolVYEDwI=
X-Received: by 2002:a9d:7285:: with SMTP id t5mr214795otj.345.1540492301375;
 Thu, 25 Oct 2018 11:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
In-Reply-To: <20181024204036.8799-3-palmer@sifive.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 25 Oct 2018 20:31:30 +0200
Message-ID:
 <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_113152_892698_788A890F 
X-CRM114-Status: GOOD (  22.20  )
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
 paul@paul-moore.com, gregkh@linuxfoundation.org, wesley@sifive.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, luto@amacapital.net,
 dhowells@redhat.com, linux-audit@redhat.com, pombredanne@nexb.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, keescook@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025183130.ek9KkxnQmndYVF3VdOsxCu4hnUBC02RJ1cErefHYc08@z>

On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> This is a fairly straight-forward implementation of seccomp for RISC-V
> systems.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
>  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
>  arch/riscv/include/asm/syscall.h     |  6 ++++++
>  arch/riscv/include/asm/thread_info.h |  1 +
>  include/uapi/linux/audit.h           |  1 +
>  5 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/include/asm/seccomp.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a344980287a5..28abe47602a1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>         select GENERIC_STRNLEN_USER
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> +       select HAVE_ARCH_SECCOMP_FILTER
>         select HAVE_MEMBLOCK
>         select HAVE_MEMBLOCK_NODE_MAP
>         select HAVE_DMA_CONTIGUOUS
> @@ -214,6 +215,22 @@ menu "Kernel type"
>
>  source "kernel/Kconfig.hz"
>
> +config SECCOMP
> +       bool "Enable seccomp to safely compute untrusted bytecode"
> +
> +       help
> +         This kernel feature is useful for number crunching applications
> +         that may need to compute untrusted bytecode during their
> +         execution. By using pipes or other transports made available to
> +         the process as file descriptors supporting the read/write
> +         syscalls, it's possible to isolate those applications in
> +         their own address space using seccomp. Once seccomp is
> +         enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
> +         and the task is only allowed to execute a few safe syscalls
> +         defined by each seccomp mode.
> +
> +         If unsure, say Y. Only embedded should say N here.
> +
>  endmenu
>
>  menu "Bus support"
> @@ -243,3 +260,4 @@ menu "Power management options"
>  source kernel/power/Kconfig
>
>  endmenu
> +
> diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
> new file mode 100644
> index 000000000000..c1b4407f1038
> --- /dev/null
> +++ b/arch/riscv/include/asm/seccomp.h
> @@ -0,0 +1,10 @@
> +/* Copyright 2018 SiFive, Inc. */
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_SECCOMP_H
> +#define _ASM_RISCV_SECCOMP_H
> +
> +#include <asm/unistd.h>
> +
> +#include <asm-generic/seccomp.h>
> +
> +#endif /* _ASM_RISCV_SECCOMP_H */
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 8d25f8904c00..d24f774f39df 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -19,6 +19,7 @@
>  #define _ASM_RISCV_SYSCALL_H
>
>  #include <linux/sched.h>
> +#include <uapi/linux/audit.h>
>  #include <linux/err.h>
>
>  /* The array of function pointers for syscalls. */
> @@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
>         memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
>  }
>
> +static inline int syscall_get_arch(void)
> +{
> +       return AUDIT_ARCH_RISCV;
> +}
> +
>  #endif /* _ASM_RISCV_SYSCALL_H */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index f8fa1cd2dad9..374973dc05c6 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -80,6 +80,7 @@ struct thread_info {
>  #define TIF_RESTORE_SIGMASK    4       /* restore signal mask in do_signal() */
>  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
>  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
> +#define TIF_SECCOMP            7       /* seccomp syscall filtering active */
>
>  #define _TIF_SYSCALL_TRACE     (1 << TIF_SYSCALL_TRACE)
>  #define _TIF_NOTIFY_RESUME     (1 << TIF_NOTIFY_RESUME)
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 818ae690ab79..c16fa1a76659 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -399,6 +399,7 @@ enum {
>  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
>  #define AUDIT_ARCH_PPC64       (EM_PPC64|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_PPC64LE     (EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_RISCV       (EM_RISCV)
>  #define AUDIT_ARCH_S390                (EM_S390)
>  #define AUDIT_ARCH_S390X       (EM_S390|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_SH          (EM_SH)

Palmer,

Half of the patch seems to touch audit parts. I started working on audit
support this morning, and I can boot Fedora with audit traces.

[root@fedora-riscv ~]# dmesg | grep audit
[    0.312000] audit: initializing netlink subsys (disabled)
[    0.316000] audit: type=2000 audit(0.316:1): state=initialized
audit_enabled=0 res=1
[    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
terminal=? res=success'
[    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
res=success'
[..]

I am still working on audit user-space support for better testing.

I suggest we first implement audit and then seccomp.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
