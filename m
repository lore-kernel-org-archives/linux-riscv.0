Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87FBCCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 00:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPIPwunuphZokaMmSExkz4Fo0HGuY5SV5x71RbAdk3s=; b=L/K/ZbUO/uMbcNWGHuCWy2IfQ8
	H7HIBMbVaWlEzAHbKsibZaVjB+vDRBMC3R6xrucoElpg2mj1fhg+tZdRHTE3FcF/cvTFoxUn5EtRq
	s7fcgiHbq2e+ltdIIhx6Ch17v2wUksvHnzfwSiIos57aOafWUBlTdWHw/M44aq7uxfXuhQD/pVYrc
	kNhteABgcDgvDYaXnkAdhQZMMc2fNIae/Znv9F1+3LnEo6/L0Vvo0lQl0MZtUfouVDV9ysYCMolCY
	EYVsCcOOtWreKegUMONEHpHpgTCMG0nFMSgws2SxcVIiieUj0C+o10+BmnAZ08cYajB7I6RzmKylM
	T3MeBi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBjLN-00000004gQy-1njd;
	Thu, 23 Oct 2025 00:38:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBjLK-00000004gPZ-3Siu
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 00:38:16 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-273a0aeed57so18876275ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761179894; x=1761784694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZi117J1vBiwIo/cXocfBctHwFPx8c3ht9q0WpKQcrI=;
        b=VEjx3Y1okJZs4EXYGFaIu8bxA8hDQ7LjmNxKcBFdGXhEmCHJKqce8OH74MldsDMPJ+
         /7QZOXCgOvZFmu0oHvRO4JgwGortNBNS8UYYNBNVl0iCwvH2Y3CBwvHefCBOj6SCP92t
         uxGChIRgOdjk2iOGJayytApqee2kU3ckFDlu0brkA1qWCkdLh9HqYMjScml4aZSgNrMl
         O/87Z56z50KVd0KtYqaRMujlER+Hsm8bsQAWSmjQ4qwwaypZfS0mYW2wf+Pss2WLA7S5
         7RWIsSK9HJ+lalbBvHWZ6Mtbr0dnEm/qYvrSvjdLAf46xHtWZNCnwYt6sjOY0x2/xuNJ
         6HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761179894; x=1761784694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZi117J1vBiwIo/cXocfBctHwFPx8c3ht9q0WpKQcrI=;
        b=d1fEdioBDfMrpgyHRFDRMpoZccZF1XDkR/1EPkJ0BMchEL07jkaFMrxK+8D4gk8yas
         /7zD1JZJp54OgohC7B6ep698AcwHI3BhyWjFYy35sdw+X8hOXTnkceJQ9GM7r9QcLI/L
         KzgwPaZsaRWkTFh3japxwN3T0tT2dfIvrXUZEgfqaoDo18fqD8ZmDIZMLHVw2ljPqsAd
         SPkeGP4oupsuySNdhkiflF5ELcpoPcuG/36HSTn423AHhExmDIETR16NZtFokWDb2qnI
         R9N2IlZRZHRsE0OBdeRmCdtAhta5zw0jCzEFSwEUJ9GnjobfbfH2mkuUyF8ZNsZcA43e
         jQ2Q==
X-Gm-Message-State: AOJu0Yxb//f34HYBixd+p7J6sS8B8DmADtxWSgFY9MEIWt020rsistPI
	txprdXGiH/CxFyDL8CumN+sbz2HokF0Jy75SdwEGEoF/HJ2d2jgW3z3XevlqgEReFDY=
X-Gm-Gg: ASbGncuqyrThFEQgLre3YFLOV3vSLe4tRV5jbsM72vYrhOaXAtnxc7l+tAieRyVjESe
	0DiQKJnGBJ7Bhri9P0VnzshXMKgBn96B4zgfaFCNyUYgxQngHTbtQ/ZnaB4OLJuS+3RAMrID1WF
	PdPXwfORCRWVgy8rV1K7yZ+MBzrDPVGEwlW8SL/QmoOf94bwEhTpb6NP58LruLESzg7GYrbI88Q
	kf3edMgwI++yz1Hzajf9I18jBVeq/ZJI5a7RpEmfw8xnzGWwB2uyDp4mJMJEQO7g1boX+A2P/Ti
	+8ZfSPzSGd9DlCqJDol7/4L7NOuS+ziY+Loo604emc4sRmnKirYNk7GRT9+GCIvkD7bDV1kwD/v
	6N7gF9BoZu95z6+TifvFWVuAkb7Nm3bLdnUjgj3DwScVWMXJ7LyIcuqUoWuGMJ4oR/pNZAEwI3i
	BVea4YOU8YCXzEUMpfzDtu
X-Google-Smtp-Source: AGHT+IEWvdRIwpMP7FE0poYA69FglLzAR95069yydOr55gWBS8crCeiRws1bpCRtRXDuSgOcw3P9bA==
X-Received: by 2002:a17:902:d509:b0:269:8eba:e9b2 with SMTP id d9443c01a7336-292ffc97bfamr69040425ad.29.1761179894025;
        Wed, 22 Oct 2025 17:38:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda793esm4088985ad.5.2025.10.22.17.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 17:38:13 -0700 (PDT)
Date: Wed, 22 Oct 2025 17:38:11 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com,
	alexghiti@rivosinc.com, cleger@rivosinc.com, zong.li@sifive.com,
	valentin.haudiquet@canonical.com, jesse.huang@sifive.com,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
Message-ID: <aPl48xlYTohtI648@debug.ba.rivosinc.com>
References: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
 <418119d5-4892-4697-a0ab-6a76302fea77@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <418119d5-4892-4697-a0ab-6a76302fea77@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_173814_869802_33D95F99 
X-CRM114-Status: GOOD (  18.20  )
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

Hi Hienrich,


On Tue, Oct 21, 2025 at 01:13:36PM +0200, Heinrich Schuchardt wrote:
>On 10/20/25 20:18, Deepak Gupta wrote:
>>x86 has proc/<pid>/status to see various runtime characteristics
>>of running task. Implement same for riscv. This patch implements
>>status for shadow stack and landing pad state.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>This is just a one patch but sending it as RFC with cover letter to seek
>>feedback. x86 has `arch_proc_pid_thread_features` to enumerate status of
>>arch thread specific features on runtime. This can be done using prctl
>>as well but from quick/script perspective `cat /proc/<pid>/status` is more
>>desirable. In this patch, simply `arch_proc_pid_thread_features` is implemented
>>for riscv which queries shadow stack and landing pad state and reports back.
>>Thus it is dependent on riscv user cfi enabling series.
>
>Hello Deepak,
>
>This looks like a valuable addition.
>
>Shouldn't architecture specific fields be in
>/proc/<pid>/arch_status and not in /proc/<pid>/status?

Just following what x86 did. I believe shadow stack and landing pad are there
in arm64, x86 and riscv. So probably /proc/<pid>/status is best place.
>
>Please, add a documentation patch adding the RISC-V specific fields to
>"3.12  /proc/<pid>/arch_status - Task architecture specific information"
>in Documentation/filesystems/proc.rst.
>
>Should you stick to /proc/*/status, please, add the documentation to 
>Documentation/arch/riscv/.

Will do.

>
>>
>>If this patch itself is self-standing and good enough, I can roll this patch
>>as part of riscv user cfi enabling series.
>>
>>OR
>>
>>If there is ask for other riscv thread specific features that could be
>>enumerated in similar fashion, we will need it to be done as separate series
>>(with `thread_features` added to `thread_info`)
>>
>>Example output below.
>>
>>Name:   cat
>>Umask:  0022
>>State:  R (running)
>>Tgid:   133
>>Ngid:   0
>>Pid:    133
>>PPid:   129
>>TracerPid:      0
>>Uid:    0       0       0       0
>>Gid:    0       0       0       0
>>FDSize: 256
>>Groups: 0 10
>>NStgid: 133
>>NSpid:  133
>>NSpgid: 133
>>NSsid:  129
>>Kthread:        0
>>VmPeak:    10788 kB
>>VmSize:    10788 kB
>>VmLck:         0 kB
>>VmPin:         0 kB
>>VmHWM:      1400 kB
>>VmRSS:      1400 kB
>>RssAnon:             116 kB
>>RssFile:            1284 kB
>>RssShmem:              0 kB
>>VmData:       92 kB
>>VmStk:      8324 kB
>>VmExe:         4 kB
>>VmLib:      2312 kB
>>VmPTE:        40 kB
>>VmSwap:        0 kB
>>HugetlbPages:          0 kB
>>CoreDumping:    0
>>THP_enabled:    0
>>untag_mask:     0xffffffffffffffff
>>Threads:        1
>>SigQ:   0/31771
>>SigPnd: 0000000000000000
>>ShdPnd: 0000000000000000
>>SigBlk: 0000000000000000
>>SigIgn: 0000000000000000
>>SigCgt: 0000000000000000
>>CapInh: 0000000000000000
>>CapPrm: 000001ffffffffff
>>CapEff: 000001ffffffffff
>>CapBnd: 000001ffffffffff
>>CapAmb: 0000000000000000
>>NoNewPrivs:     0
>>Seccomp:        0
>>Seccomp_filters:        0
>>Speculation_Store_Bypass:       unknown
>>SpeculationIndirectBranch:      unsupported
>>Cpus_allowed:   3
>>Cpus_allowed_list:      0-1
>>Mems_allowed:   1
>>Mems_allowed_list:      0
>>voluntary_ctxt_switches:        0
>>nonvoluntary_ctxt_switches:     3
>>riscv_thread_features:  shstk_enabled lpad_enabled
>>riscv_thread_features_locked:   shstk_unlocked lpad_unlocked
>>---
>>  arch/riscv/kernel/Makefile     |  1 +
>>  arch/riscv/kernel/cpu/Makefile |  1 +
>>  arch/riscv/kernel/cpu/proc.c   | 28 ++++++++++++++++++++++++++++
>>  3 files changed, 30 insertions(+)
>>
>>diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>>index f60fce69b725..b32c11667d81 100644
>>--- a/arch/riscv/kernel/Makefile
>>+++ b/arch/riscv/kernel/Makefile
>>@@ -71,6 +71,7 @@ obj-y	+= vendor_extensions.o
>>  obj-y	+= vendor_extensions/
>>  obj-y	+= probes/
>>  obj-y	+= tests/
>>+obj-y	+= cpu/
>>  obj-$(CONFIG_MMU) += vdso.o vdso/
>>  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
>>diff --git a/arch/riscv/kernel/cpu/Makefile b/arch/riscv/kernel/cpu/Makefile
>>new file mode 100644
>>index 000000000000..2b474fb49afe
>>--- /dev/null
>>+++ b/arch/riscv/kernel/cpu/Makefile
>>@@ -0,0 +1 @@
>>+obj-$(CONFIG_PROC_FS)			+= proc.o
>>diff --git a/arch/riscv/kernel/cpu/proc.c b/arch/riscv/kernel/cpu/proc.c
>>new file mode 100644
>>index 000000000000..4661190c43d1
>>--- /dev/null
>>+++ b/arch/riscv/kernel/cpu/proc.c
>>@@ -0,0 +1,28 @@
>>+// SPDX-License-Identifier: GPL-2.0
>>+#include <linux/smp.h>
>>+#include <linux/timex.h>
>>+#include <linux/string.h>
>>+#include <linux/seq_file.h>
>>+#include <linux/cpufreq.h>
>>+#include <linux/proc_fs.h>
>>+#include <asm/usercfi.h>
>>+
>>+#ifdef CONFIG_RISCV_USER_CFI
>>+
>>+void arch_proc_pid_thread_features(struct seq_file *m, struct task_struct *task)
>>+{
>>+	seq_puts(m, "riscv_thread_features:\t");
>>+	if (is_shstk_enabled(task))
>>+		seq_puts(m, "shstk_enabled ");
>
>According to Documentation/arch/x86/shstk.rst, x86 is avoiding the 
>'_enabled' postfix here:
>
>x86_Thread_features: shstk wrss

I can follow same and use `shstk`. We don't have `wrss` because
shadow stack is writeable by right instruction (sspush and ssamoswap) in
riscv.

>
>>+
>>+	if (is_indir_lp_enabled(task))
>>+		seq_puts(m, "lpad_enabled ");

Would you prefer similar here. Just "lpad"?

>>+
>>+	seq_putc(m, '\n');
>>+
>>+	seq_puts(m, "riscv_thread_features_locked:\t");
>>+	is_shstk_locked(task) ? seq_puts(m, "shstk_locked ") : seq_puts(m, "shstk_unlocked ");
>>+	is_indir_lp_locked(task) ? seq_puts(m, "lpad_locked ") : seq_puts(m, "lpad_unlocked ");
>
>Why do we need any entry for an unlocked feature in 
>riscv_thread_features_locked?

absence of "feature_locked" is considered unlocked, then I can drop it.

>
>Best regards
>
>Heinrich
>
>>+	seq_putc(m, '\n');
>>+}
>>+#endif /* CONFIG_RISCV_USER_CFI */
>>
>>---
>>base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>>change-id: 20251017-proc_status-df1aedc85c7c
>>--
>>- debug
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
