Return-Path: <SRS0=itc2=NH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC01C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 06:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14A220843
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 06:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3SrM+FR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mfwSAJuf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14A220843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=SMBMQgNuOXNsd012lksdsAi30ABDggHCQGyyKoDoi5A=; b=r3SrM+FRBMyyqC8oYr1iuiugv
	LBLNQfVwR55WtEi221N9EThcc+ey05sJxtdT6t1hsWRcVuQMtyLdN8N/jBliZpKq2VxLI2Qf2R3DD
	zENBcm5odkSLNX8oi5Z6YHlI6EAIY+VQVg7ikPd+h4/exOAMAL0CWUepMgoZaVJEscmmJkRHk32wY
	IzA9uo1n929vppVpexjxgcBeNuVOe3vhGXsnI4lE9C2syHtsZh58oLkPqmNR9crAulv+07SjJx5R1
	azTV1kdiyKbVzcb6vNulLipzEvfRHTd/qIUzqKdJ472Qu2QnFm6VuFEFirifdEk6/ZC/N7OFgnMOI
	n4xYhBBfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGHku-0005h0-21; Sat, 27 Oct 2018 06:07:28 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGHkq-0005g4-IR
 for linux-riscv@lists.infradead.org; Sat, 27 Oct 2018 06:07:26 +0000
Received: by mail-pg1-x542.google.com with SMTP id a5-v6so1468879pgt.13
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 23:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sczwW8B+pPyBZ1qmKbBegzuoM/j/WmamFwZgX+JMnh4=;
 b=mfwSAJufxxxk2JwgmZCJ7dz+U/ydiEEjkTeVKMqCjJVau5RJTOyv4v+sRohbCx3evZ
 nmZ/X9PB0H2zr+LBYsMYVAPxNvGYimifgq6qAFnSZ69gELuqUL7Kaa2mRViZJm+uxB9A
 4tKVLAMPh8ji+7k3v1UTMjnKSYZRlp+tQ4z72yKrsKUz2Crtd8fhDic1+sHd8pWBnGg0
 RwgvkMDupHawRhGbOf9oU71W4aVYiMu+dJQdvXCgeRZxURHG2roSNNSJyUcSngWXPg69
 m3xCBpANF5CzOtawt3WYzPF8C9I/k+Ec6ao1ajYC7EN42IhuGu2ZJTi1lJV/OaxjLM2g
 5edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sczwW8B+pPyBZ1qmKbBegzuoM/j/WmamFwZgX+JMnh4=;
 b=XHK9iAAsuuSj00tJKecgJPE01Veb6FE5OSh6+BOOn4D4oNYTzN1gYEdjtregHTnWRf
 q5y4NMiSTFc2b3aJkvlMKNXvrFK/JyNCWSYhKK4q90bvrYvcLJMwLnJY0T/fPNsrqR3m
 kURrrQnaonIc4k1fCWfJJaokOjzh8X4DtoHoJ2CrEywygiRIMVA+Q+/6jY3h14PVasxZ
 FogmHkBDS3zz43fkg3BYPDtyxEzlojzc2hJcmpW9R/gjno9u2K902otRvYL1OIH24kTe
 PPx6SdxqdONU7IZA7CIqcD2wCLJUIWnnbaBDfnCjEGzzrt7yCIvVF2KhIV7VrVpOJ44X
 2lXQ==
X-Gm-Message-State: AGRZ1gLVCO2TbZjvnMiBiNH+DV2WFJ8X9wQAsM/kJkahJ5DPEXLjzqjj
 +FKvQs7WgoE0epZYEzr19LieOFqEFBc=
X-Google-Smtp-Source: AJdET5cIVAgYokGIFLWsNTg3FsQjU7PS2j4cEJDDNiaSmvMiH/5WxFtqkvOi3fAY6pL7rreaGZXYWw==
X-Received: by 2002:a63:77ce:: with SMTP id s197mr6093007pgc.89.1540620432916; 
 Fri, 26 Oct 2018 23:07:12 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id e9-v6sm15800833pgl.44.2018.10.26.23.07.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Oct 2018 23:07:11 -0700 (PDT)
Date: Fri, 26 Oct 2018 23:07:11 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Oct 2018 22:53:14 PDT (-0700)
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-4bae5431-dfdc-4376-9f7a-6c75b91c1eaa@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181026_230724_646299_61824650 
X-CRM114-Status: GOOD (  19.43  )
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
 Wesley Terpstra <wesley@sifive.com>, linux-kernel@vger.kernel.org,
 eparis@redhat.com, luto@amacapital.net, dhowells@redhat.com,
 linux-audit@redhat.com, pombredanne@nexb.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, keescook@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181027060711.L88Agq7elSwafs2wp4gPqiqz-SbxVDCBIuQwoTuKF-k@z>

On Thu, 25 Oct 2018 11:31:30 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> From: "Wesley W. Terpstra" <wesley@sifive.com>
>>
>> This is a fairly straight-forward implementation of seccomp for RISC-V
>> systems.
>>
>> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
>>  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
>>  arch/riscv/include/asm/syscall.h     |  6 ++++++
>>  arch/riscv/include/asm/thread_info.h |  1 +
>>  include/uapi/linux/audit.h           |  1 +
>>  5 files changed, 36 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/seccomp.h
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index a344980287a5..28abe47602a1 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -28,6 +28,7 @@ config RISCV
>>         select GENERIC_STRNLEN_USER
>>         select GENERIC_SMP_IDLE_THREAD
>>         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
>> +       select HAVE_ARCH_SECCOMP_FILTER
>>         select HAVE_MEMBLOCK
>>         select HAVE_MEMBLOCK_NODE_MAP
>>         select HAVE_DMA_CONTIGUOUS
>> @@ -214,6 +215,22 @@ menu "Kernel type"
>>
>>  source "kernel/Kconfig.hz"
>>
>> +config SECCOMP
>> +       bool "Enable seccomp to safely compute untrusted bytecode"
>> +
>> +       help
>> +         This kernel feature is useful for number crunching applications
>> +         that may need to compute untrusted bytecode during their
>> +         execution. By using pipes or other transports made available to
>> +         the process as file descriptors supporting the read/write
>> +         syscalls, it's possible to isolate those applications in
>> +         their own address space using seccomp. Once seccomp is
>> +         enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
>> +         and the task is only allowed to execute a few safe syscalls
>> +         defined by each seccomp mode.
>> +
>> +         If unsure, say Y. Only embedded should say N here.
>> +
>>  endmenu
>>
>>  menu "Bus support"
>> @@ -243,3 +260,4 @@ menu "Power management options"
>>  source kernel/power/Kconfig
>>
>>  endmenu
>> +
>> diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
>> new file mode 100644
>> index 000000000000..c1b4407f1038
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/seccomp.h
>> @@ -0,0 +1,10 @@
>> +/* Copyright 2018 SiFive, Inc. */
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_RISCV_SECCOMP_H
>> +#define _ASM_RISCV_SECCOMP_H
>> +
>> +#include <asm/unistd.h>
>> +
>> +#include <asm-generic/seccomp.h>
>> +
>> +#endif /* _ASM_RISCV_SECCOMP_H */
>> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
>> index 8d25f8904c00..d24f774f39df 100644
>> --- a/arch/riscv/include/asm/syscall.h
>> +++ b/arch/riscv/include/asm/syscall.h
>> @@ -19,6 +19,7 @@
>>  #define _ASM_RISCV_SYSCALL_H
>>
>>  #include <linux/sched.h>
>> +#include <uapi/linux/audit.h>
>>  #include <linux/err.h>
>>
>>  /* The array of function pointers for syscalls. */
>> @@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
>>         memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
>>  }
>>
>> +static inline int syscall_get_arch(void)
>> +{
>> +       return AUDIT_ARCH_RISCV;
>> +}
>> +
>>  #endif /* _ASM_RISCV_SYSCALL_H */
>> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> index f8fa1cd2dad9..374973dc05c6 100644
>> --- a/arch/riscv/include/asm/thread_info.h
>> +++ b/arch/riscv/include/asm/thread_info.h
>> @@ -80,6 +80,7 @@ struct thread_info {
>>  #define TIF_RESTORE_SIGMASK    4       /* restore signal mask in do_signal() */
>>  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
>>  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
>> +#define TIF_SECCOMP            7       /* seccomp syscall filtering active */
>>
>>  #define _TIF_SYSCALL_TRACE     (1 << TIF_SYSCALL_TRACE)
>>  #define _TIF_NOTIFY_RESUME     (1 << TIF_NOTIFY_RESUME)
>> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
>> index 818ae690ab79..c16fa1a76659 100644
>> --- a/include/uapi/linux/audit.h
>> +++ b/include/uapi/linux/audit.h
>> @@ -399,6 +399,7 @@ enum {
>>  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
>>  #define AUDIT_ARCH_PPC64       (EM_PPC64|__AUDIT_ARCH_64BIT)
>>  #define AUDIT_ARCH_PPC64LE     (EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> +#define AUDIT_ARCH_RISCV       (EM_RISCV)
>>  #define AUDIT_ARCH_S390                (EM_S390)
>>  #define AUDIT_ARCH_S390X       (EM_S390|__AUDIT_ARCH_64BIT)
>>  #define AUDIT_ARCH_SH          (EM_SH)
>
> Palmer,
>
> Half of the patch seems to touch audit parts. I started working on audit
> support this morning, and I can boot Fedora with audit traces.
>
> [root@fedora-riscv ~]# dmesg | grep audit
> [    0.312000] audit: initializing netlink subsys (disabled)
> [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
> audit_enabled=0 res=1
> [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> terminal=? res=success'
> [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> res=success'
> [..]
>
> I am still working on audit user-space support for better testing.
>
> I suggest we first implement audit and then seccomp.

Works for me.  I'll drop my patch set for now.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
