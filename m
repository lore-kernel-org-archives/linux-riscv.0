Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CC4CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPsGMU4Rw7Z/rzRmdTdfq9IvJ8fTQV0DLBWzxKkzAt8=; b=bfFPXFaCMWV7pB
	8RNGb968lck62APahmqJ0VMG2NkZ45FGJqAAlv1XQRIsKQTAxkAQFGEJaQZ+AOfKCQ0o0zEBi1TNy
	CUymnFI+te63pBYGpbcEay9chPYpVSxQdd7eqX7I7O38dO00peUYMq6w1waOZcDSWFD9QAhfC/k+T
	AkfI1+zzCAlfdl1eO6ogGrq9xu4uB36q8+yiDtBlfNILEBL984ubYPHCpqX2zg/ptcHkkdFLnSMFJ
	EI5LbwG9RncEQFs+3IlVnWvp1G6DL5kR/Q4GM8fca8BDMNG5Ti0WsKtu7IiIsyUBSzJ+VRVFm7YwB
	lxNdcoRaWSsVcDWhJ0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAJK-0000000GjNR-2Dvt;
	Tue, 21 Oct 2025 11:13:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAJH-0000000GjMt-3uGa
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 11:13:49 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2EBDB3FCD3
	for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761045221;
	bh=ikcIzK7s67FNHE582ucGZVht5ku4GdzRhtqL5nJR72A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=ozrili83MOwGu1KD6t8xIBCRAXZMfm2aet2ETIZYI4ho8CiNiAZakhQPuOqSj2xHK
	 Ikt6dpU1ukrOQWVweij1hHyQlktUk9nY6bKh25LlxaB+WOy3EPcZKKxa+T0CDz3/xw
	 miOiORAzMZGBrYlR08JeTfGADHgZWe+i3Vqee5/XuRHQswl/bG0DMWL1S5PzwREC4x
	 z1osOODr6bzA35L8KtcexBtGgvRQxUdgO8g5hk1/eL6jMC8j7ybPelB1EDOw+ODo6k
	 OYfJawD+4uqb7XTiKip6ILJaaRDHSl231UwfZt+A1E15vHjKwEvP+OPWRR/9HO+pcm
	 gX+Fd13Qu8jsjinmP39K2SLhSUxGmzY9XrXTyYF44NjrYevUYooWQQJOftrKAcoI7/
	 GwEhey8Jda6h6dbHldvmjsXn7UYMINQfjuP5pZqJ0hooHz/lCmaGqAADuDLM19oEzG
	 W8qlV8mnAh1qyZ9NLYBvInBFORmalAaGytQAP8uMytdO+Fr00kuWR8JZ+u9G6Udik6
	 2NQWwBg0qlnILmvMTJt2nSVEacvm186eqP4I2qWmkn6o/PTDA8mjPI7avNccgTpiex
	 8sNm2ySRexSd102MYVL8nBcwir1JZigB+KkknV0ypQG4gHWt8h1FmJ5tIpNVGMMfPe
	 V1k9xzyBd7E0+v0TAC5iGOzE=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47107fcb257so76958655e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 04:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761045220; x=1761650020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikcIzK7s67FNHE582ucGZVht5ku4GdzRhtqL5nJR72A=;
        b=RlvJj5onWhTNApUKX0PhX7ew+USaoKhKryFiSMjgBDVFi1xX5bY6Vfdn0SU+5D93Y8
         oDQoGgiFYq3TRELQH4ilDUSV+to81XFWPpU93coQGu4erBJttUeOhICbcDsNTsWdQyyM
         5MJMz3XTRsrYBXVvSdI+DP47bQsyxAR+LM/e7BlW+S2oOeyMSeAR23XC7BZ0xkTHJKLj
         gPv1aNM9T+g3KZ+5IApKH9EKELvikFoF5cc5ILvycA32zxltmUmKQQYgLl2dS7TuZ/TC
         HUjnD269kxAaWAHkm/hTYNxr3cWEh6dRQrQeFH+ngTsEEOPtI0hARnUUdNIzbMSVMnMf
         l3Jw==
X-Gm-Message-State: AOJu0Yxy2/hsQDhQuwnbXqsOBpAUeFnfGCExFVCunZhwNThbosaiNqE0
	tmRvQblgCiTNxMD0hC4n9wzTykhauGYtTlXCC2Fp5pRWu9NqB9l2SJb7AQIK9WCCV9C75eVSq0t
	5uBsj1XEAEK+BSiRsHzzHC5Cvel5KQu3+J+JTwF/oFqa7ZcRiP+Zo04jwXozcRVxYkE4JHjcChP
	9hu/K5pmArrw==
X-Gm-Gg: ASbGncsNMyTP7WdSepDlSuthuVJu57BpdlFhvtzCwWvaSVkox1UT48i48xE7LqiXAWd
	to4YP7QPwvMHX9FASBItF3gNGVErmD2mOr6xC4uF5t9PBD8Vtj0IKjQjxVb/PliJ4BF2itesmZM
	CnXZ/45nZt8uDR1ZuZhc+xe2EpNKf4Pg74eki6nWXpRkZYlYIWpy9A1MFDeLkeKXy0M9VSjS07Y
	E4ZnB3sMhn7LAST5SUGKx/3TUuzCcQ8d/35wnSubmqcvPWtgST4T25T27LAu7tfzoXrzwotqNUE
	Yi5HiXx5uRT/JiA4VW7q7KGuoos49VzvWsao4YEo81/60RCJZWw1N6LAENOk6lj77vKUbXHzhMQ
	fNnLC8+djgChcNitkgYjCiVTiNzKm4jZVn8VeLSW3BQeE+48FFedEju7v9hOIKnGYWSQ=
X-Received: by 2002:a05:600c:468b:b0:46e:4cd3:7d6e with SMTP id 5b1f17b1804b1-47117876a24mr123878515e9.9.1761045220283;
        Tue, 21 Oct 2025 04:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF12WpfWrU8b5X405jb6W3VuO4hxrcKC71Wzb1g7mzM71B00ZT2riB3oMBV7+2D+0OPaXkcSg==
X-Received: by 2002:a05:600c:468b:b0:46e:4cd3:7d6e with SMTP id 5b1f17b1804b1-47117876a24mr123878215e9.9.1761045219861;
        Tue, 21 Oct 2025 04:13:39 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:7f7c:5941:9cba:d029:72de? ([2a02:3035:6e0:7f7c:5941:9cba:d029:72de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114423862sm279651695e9.1.2025.10.21.04.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 04:13:39 -0700 (PDT)
Message-ID: <418119d5-4892-4697-a0ab-6a76302fea77@canonical.com>
Date: Tue, 21 Oct 2025 13:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com,
 alexghiti@rivosinc.com, cleger@rivosinc.com, zong.li@sifive.com,
 valentin.haudiquet@canonical.com, jesse.huang@sifive.com,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_041348_294733_6B946A97 
X-CRM114-Status: GOOD (  25.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/20/25 20:18, Deepak Gupta wrote:
> x86 has proc/<pid>/status to see various runtime characteristics
> of running task. Implement same for riscv. This patch implements
> status for shadow stack and landing pad state.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
> This is just a one patch but sending it as RFC with cover letter to seek
> feedback. x86 has `arch_proc_pid_thread_features` to enumerate status of
> arch thread specific features on runtime. This can be done using prctl
> as well but from quick/script perspective `cat /proc/<pid>/status` is more
> desirable. In this patch, simply `arch_proc_pid_thread_features` is implemented
> for riscv which queries shadow stack and landing pad state and reports back.
> Thus it is dependent on riscv user cfi enabling series.

Hello Deepak,

This looks like a valuable addition.

Shouldn't architecture specific fields be in
/proc/<pid>/arch_status and not in /proc/<pid>/status?

Please, add a documentation patch adding the RISC-V specific fields to
"3.12  /proc/<pid>/arch_status - Task architecture specific information"
in Documentation/filesystems/proc.rst.

Should you stick to /proc/*/status, please, add the documentation to 
Documentation/arch/riscv/.

> 
> If this patch itself is self-standing and good enough, I can roll this patch
> as part of riscv user cfi enabling series.
> 
> OR
> 
> If there is ask for other riscv thread specific features that could be
> enumerated in similar fashion, we will need it to be done as separate series
> (with `thread_features` added to `thread_info`)
> 
> Example output below.
> 
> Name:   cat
> Umask:  0022
> State:  R (running)
> Tgid:   133
> Ngid:   0
> Pid:    133
> PPid:   129
> TracerPid:      0
> Uid:    0       0       0       0
> Gid:    0       0       0       0
> FDSize: 256
> Groups: 0 10
> NStgid: 133
> NSpid:  133
> NSpgid: 133
> NSsid:  129
> Kthread:        0
> VmPeak:    10788 kB
> VmSize:    10788 kB
> VmLck:         0 kB
> VmPin:         0 kB
> VmHWM:      1400 kB
> VmRSS:      1400 kB
> RssAnon:             116 kB
> RssFile:            1284 kB
> RssShmem:              0 kB
> VmData:       92 kB
> VmStk:      8324 kB
> VmExe:         4 kB
> VmLib:      2312 kB
> VmPTE:        40 kB
> VmSwap:        0 kB
> HugetlbPages:          0 kB
> CoreDumping:    0
> THP_enabled:    0
> untag_mask:     0xffffffffffffffff
> Threads:        1
> SigQ:   0/31771
> SigPnd: 0000000000000000
> ShdPnd: 0000000000000000
> SigBlk: 0000000000000000
> SigIgn: 0000000000000000
> SigCgt: 0000000000000000
> CapInh: 0000000000000000
> CapPrm: 000001ffffffffff
> CapEff: 000001ffffffffff
> CapBnd: 000001ffffffffff
> CapAmb: 0000000000000000
> NoNewPrivs:     0
> Seccomp:        0
> Seccomp_filters:        0
> Speculation_Store_Bypass:       unknown
> SpeculationIndirectBranch:      unsupported
> Cpus_allowed:   3
> Cpus_allowed_list:      0-1
> Mems_allowed:   1
> Mems_allowed_list:      0
> voluntary_ctxt_switches:        0
> nonvoluntary_ctxt_switches:     3
> riscv_thread_features:  shstk_enabled lpad_enabled
> riscv_thread_features_locked:   shstk_unlocked lpad_unlocked
> ---
>   arch/riscv/kernel/Makefile     |  1 +
>   arch/riscv/kernel/cpu/Makefile |  1 +
>   arch/riscv/kernel/cpu/proc.c   | 28 ++++++++++++++++++++++++++++
>   3 files changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f60fce69b725..b32c11667d81 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -71,6 +71,7 @@ obj-y	+= vendor_extensions.o
>   obj-y	+= vendor_extensions/
>   obj-y	+= probes/
>   obj-y	+= tests/
> +obj-y	+= cpu/
>   obj-$(CONFIG_MMU) += vdso.o vdso/
>   
>   obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> diff --git a/arch/riscv/kernel/cpu/Makefile b/arch/riscv/kernel/cpu/Makefile
> new file mode 100644
> index 000000000000..2b474fb49afe
> --- /dev/null
> +++ b/arch/riscv/kernel/cpu/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_PROC_FS)			+= proc.o
> diff --git a/arch/riscv/kernel/cpu/proc.c b/arch/riscv/kernel/cpu/proc.c
> new file mode 100644
> index 000000000000..4661190c43d1
> --- /dev/null
> +++ b/arch/riscv/kernel/cpu/proc.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/smp.h>
> +#include <linux/timex.h>
> +#include <linux/string.h>
> +#include <linux/seq_file.h>
> +#include <linux/cpufreq.h>
> +#include <linux/proc_fs.h>
> +#include <asm/usercfi.h>
> +
> +#ifdef CONFIG_RISCV_USER_CFI
> +
> +void arch_proc_pid_thread_features(struct seq_file *m, struct task_struct *task)
> +{
> +	seq_puts(m, "riscv_thread_features:\t");
> +	if (is_shstk_enabled(task))
> +		seq_puts(m, "shstk_enabled ");

According to Documentation/arch/x86/shstk.rst, x86 is avoiding the 
'_enabled' postfix here:

x86_Thread_features: shstk wrss

> +
> +	if (is_indir_lp_enabled(task))
> +		seq_puts(m, "lpad_enabled ");
> +
> +	seq_putc(m, '\n');
> +
> +	seq_puts(m, "riscv_thread_features_locked:\t");
> +	is_shstk_locked(task) ? seq_puts(m, "shstk_locked ") : seq_puts(m, "shstk_unlocked ");
> +	is_indir_lp_locked(task) ? seq_puts(m, "lpad_locked ") : seq_puts(m, "lpad_unlocked ");

Why do we need any entry for an unlocked feature in 
riscv_thread_features_locked?

Best regards

Heinrich

> +	seq_putc(m, '\n');
> +}
> +#endif /* CONFIG_RISCV_USER_CFI */
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251017-proc_status-df1aedc85c7c
> --
> - debug
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
