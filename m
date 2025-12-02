Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1237D1171A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgqRkQ14q+E4SrI349khScCxLuz4haUiuBF4oaSHh7Q=; b=M7m0jOxLOPWY8m
	I7ldQXzAdgPCc7d0njFAmn9hLBBObG0PKbHv0Mm8yFJHIL5fOdz/a1agIVpGwbh5HKH4uaOhbrCMa
	mKzd0K6Nmh/kZZItmGvbtvvC253XLqCiTCYSA19L3itLeBoDuee8It5TxgV5cpGXOjQxxzcg4yf15
	0eyblU1NfF6+pFA4bs32wragU9Fka+yixTIoM0Ik0nbKlPvtpdqUyTm7vZDfjKxpMNXrrvEvVvIVT
	KxhOwwpfOAILd0g1mJ70P/+LM4n6ZmlRQJejhTxRkrEdyqwSD777TeHuTofg4eGz+9yqXoywSNCrE
	bUYyGXo/s9s88H90qY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUFX-00000005fh1-36tr;
	Tue, 02 Dec 2025 17:33:15 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUFU-00000005fgP-1FWE
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 17:33:14 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7F2603F79C
	for <linux-riscv@lists.infradead.org>; Tue,  2 Dec 2025 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764696788;
	bh=npAR0oGmQjrt81QJVaV64JkEJWSh+ruulPNiCllHN9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=s3dK1DAtWzUtWhyFEzoh+72qv3aCg1UuGaN2YrLU3xDE4xgplqMeFq7wGlU5KVMdm
	 5BsHIhdPWK2I3vD7M35KDgVvshBdIFEK35pgi2Uror3snQm8UCMDxq2PZE34Wnbgv4
	 /TfFrPFPdQHNTK7wDvKfSS5ETaf1iYofWocftMYa8AKrz6a6JMMWY3Qpnxtjok58Xd
	 9Awm+YA/aXsLsF1zU23hFjaLEvk48+0hkBfRB/umBVGBUB3bUNeboMWZcz1icXkVZ/
	 EkgrcoJuSoz0nzWR5HjEiwiSCrhicuUtPV3JGb8l5rsluCg5gSRIJ6uGS3NDuN24Kx
	 nlRLwBxtL4gxCIu/uvpumC0QporhJLyYRKcaYuG9fXkOVuPNuQaGwnlx4jskZg6Q7p
	 QaoRkJkdMBuTobf9gO+X77tXFH8Kpo2F2EIT0KnbP1+KFtdo5nxkicpLUJnXnY6fQV
	 0JHBULY0WKAe7geVPjq7rDSO+oY/by8NNagv8R5dlgcU4HMjgRQ7L1Oq2HpxwjFyn6
	 Tyuw6rl7Ea0iuQXMy7nkJxmkcQCxOeZ47LAt8/mZWFjcF0Y8Eji6lmu5rlt576grB6
	 Q6m0vROqNjLlle1Sz26lf0SrNeKga5+vIdhAHiUvKLu7GhZEgYOyOKrSJ+HGautT/s
	 esEor1o7IS1v/1KK+e/5WIZA=
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b9d73d57328so6375067a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Dec 2025 09:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764696787; x=1765301587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npAR0oGmQjrt81QJVaV64JkEJWSh+ruulPNiCllHN9A=;
        b=oPHF4iUSAaIwYzzSXILPhoPlqBhJJ316c+AVYRJmhA/F9X8NcsGPqrqfdNIyxdwspV
         0EncqFo9YBYxdmeR0O7AqDK9NnrFrvp+sRXW+78yBIc5SEIL9mnRKiJCA0solVJZDH5P
         97Vvu2AqUKpNKkNNS0ttltQhrRrqYhlKfWnRqr/WVLeI6GN0RFtd7KbYOGFB2UIQoVcS
         2Q7zg0pNjqciXFWhrNc8o9Cv7IXKFnBLup3vWmQBH1j+9kXofKGKvjqhIYoGvON3zfSn
         xbBhtt3qiCHHtZKhxbod4TnoBZuwZLibsx0iYVs+z2EdG92zYOdYka6OMJ+u7mEtUksw
         5Dtw==
X-Forwarded-Encrypted: i=1; AJvYcCUIMHnA3I9BedMFv5ywSIgZNPyoazsUV7HfuHcy23tGp15QM7e9Y1aHaTPF+ftB8w1J3RQrvHUA1MS8Bg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DGYRt+1MF1NlLv0UjsC2bXfyNWCtt0C+agFT5ex+CnqnFS+s
	DGs7wVFdQaS9iX/vMZNbnfPGH/zBER11hR7CjelwUxve21KFFjWOe3mQjfaKTXmfz207GdNX1Uc
	YkTrywLLcg2hLINV1zNVSqmFF/8yLbkjLfWIzZMMX6q+B6tK79+klzUh6gtU66dpienvX2HWMVM
	1SvCKir3j2qKM917tKO6aS5bxq3oHoPOvsDEMybGrzHXLiZfcw2iinvYe+0z6y
X-Gm-Gg: ASbGncuwNTMatAH6lW1oKRCsxqDzS3EAhmdQl/r0iEFwUyFmOb//Z/7V0CCTDjCKJDW
	A9AIxWeL5xrvlspNQMJ2l8NIYMsJg381oOGFNPHbB082JVfN/RkNzD0kXAnIQIWWFHlwQn9czCx
	L/vJ7MkszcIOqoO46ltrGdIswgpSqnbv5idDHCTCedNhMML8UCfaSXTwRGgvjKDtF6
X-Received: by 2002:a05:7301:9c91:b0:2a4:4f86:822a with SMTP id 5a478bee46e88-2a941887a80mr12870597eec.33.1764696786857;
        Tue, 02 Dec 2025 09:33:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG179kyf4Mm4EZn9RyKrnN/DxnneyLSsedMspzlE6CZ3Ky4wwtL8+2G/uOMzpk2ZH6Ndd7dM7KovwJMOMXT4d4=
X-Received: by 2002:a05:7301:9c91:b0:2a4:4f86:822a with SMTP id
 5a478bee46e88-2a941887a80mr12870574eec.33.1764696786411; Tue, 02 Dec 2025
 09:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
 <418119d5-4892-4697-a0ab-6a76302fea77@canonical.com> <aPl48xlYTohtI648@debug.ba.rivosinc.com>
 <22b5f8d0-c2c1-4072-b311-5750c8c6a045@canonical.com>
In-Reply-To: <22b5f8d0-c2c1-4072-b311-5750c8c6a045@canonical.com>
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Date: Tue, 2 Dec 2025 18:32:54 +0100
X-Gm-Features: AWmQ_blrzMcFMK1lQ3N7zx2u_eMkcnC08x_E3cyCK8g9mRec8_cl7vSSpI94IL4
Message-ID: <CAPEPrSOQLEjrDLm-yM1MwLsTwwbWLLyw70=GiAX6ZnE++0HAhw@mail.gmail.com>
Subject: Re: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kito.cheng@sifive.com, charlie@rivosinc.com, 
	atishp@rivosinc.com, alexghiti@rivosinc.com, cleger@rivosinc.com, 
	zong.li@sifive.com, jesse.huang@sifive.com, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_093312_748622_02F3BA13 
X-CRM114-Status: GOOD (  35.02  )
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

Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>

On Thu, 23 Oct 2025 at 10:11, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 10/23/25 01:38, Deepak Gupta wrote:
> > Hi Hienrich,
> >
> >
> > On Tue, Oct 21, 2025 at 01:13:36PM +0200, Heinrich Schuchardt wrote:
> >> On 10/20/25 20:18, Deepak Gupta wrote:
> >>> x86 has proc/<pid>/status to see various runtime characteristics
> >>> of running task. Implement same for riscv. This patch implements
> >>> status for shadow stack and landing pad state.
> >>>
> >>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> >>> ---
> >>> This is just a one patch but sending it as RFC with cover letter to seek
> >>> feedback. x86 has `arch_proc_pid_thread_features` to enumerate status of
> >>> arch thread specific features on runtime. This can be done using prctl
> >>> as well but from quick/script perspective `cat /proc/<pid>/status` is
> >>> more
> >>> desirable. In this patch, simply `arch_proc_pid_thread_features` is
> >>> implemented
> >>> for riscv which queries shadow stack and landing pad state and
> >>> reports back.
> >>> Thus it is dependent on riscv user cfi enabling series.
> >>
> >> Hello Deepak,
> >>
> >> This looks like a valuable addition.
> >>
> >> Shouldn't architecture specific fields be in
> >> /proc/<pid>/arch_status and not in /proc/<pid>/status?
> >
> > Just following what x86 did. I believe shadow stack and landing pad are
> > there
> > in arm64, x86 and riscv. So probably /proc/<pid>/status is best place.
> >>
> >> Please, add a documentation patch adding the RISC-V specific fields to
> >> "3.12  /proc/<pid>/arch_status - Task architecture specific information"
> >> in Documentation/filesystems/proc.rst.
> >>
> >> Should you stick to /proc/*/status, please, add the documentation to
> >> Documentation/arch/riscv/.
> >
> > Will do.
> >
> >>
> >>>
> >>> If this patch itself is self-standing and good enough, I can roll
> >>> this patch
> >>> as part of riscv user cfi enabling series.
> >>>
> >>> OR
> >>>
> >>> If there is ask for other riscv thread specific features that could be
> >>> enumerated in similar fashion, we will need it to be done as separate
> >>> series
> >>> (with `thread_features` added to `thread_info`)
> >>>
> >>> Example output below.
> >>>
> >>> Name:   cat
> >>> Umask:  0022
> >>> State:  R (running)
> >>> Tgid:   133
> >>> Ngid:   0
> >>> Pid:    133
> >>> PPid:   129
> >>> TracerPid:      0
> >>> Uid:    0       0       0       0
> >>> Gid:    0       0       0       0
> >>> FDSize: 256
> >>> Groups: 0 10
> >>> NStgid: 133
> >>> NSpid:  133
> >>> NSpgid: 133
> >>> NSsid:  129
> >>> Kthread:        0
> >>> VmPeak:    10788 kB
> >>> VmSize:    10788 kB
> >>> VmLck:         0 kB
> >>> VmPin:         0 kB
> >>> VmHWM:      1400 kB
> >>> VmRSS:      1400 kB
> >>> RssAnon:             116 kB
> >>> RssFile:            1284 kB
> >>> RssShmem:              0 kB
> >>> VmData:       92 kB
> >>> VmStk:      8324 kB
> >>> VmExe:         4 kB
> >>> VmLib:      2312 kB
> >>> VmPTE:        40 kB
> >>> VmSwap:        0 kB
> >>> HugetlbPages:          0 kB
> >>> CoreDumping:    0
> >>> THP_enabled:    0
> >>> untag_mask:     0xffffffffffffffff
> >>> Threads:        1
> >>> SigQ:   0/31771
> >>> SigPnd: 0000000000000000
> >>> ShdPnd: 0000000000000000
> >>> SigBlk: 0000000000000000
> >>> SigIgn: 0000000000000000
> >>> SigCgt: 0000000000000000
> >>> CapInh: 0000000000000000
> >>> CapPrm: 000001ffffffffff
> >>> CapEff: 000001ffffffffff
> >>> CapBnd: 000001ffffffffff
> >>> CapAmb: 0000000000000000
> >>> NoNewPrivs:     0
> >>> Seccomp:        0
> >>> Seccomp_filters:        0
> >>> Speculation_Store_Bypass:       unknown
> >>> SpeculationIndirectBranch:      unsupported
> >>> Cpus_allowed:   3
> >>> Cpus_allowed_list:      0-1
> >>> Mems_allowed:   1
> >>> Mems_allowed_list:      0
> >>> voluntary_ctxt_switches:        0
> >>> nonvoluntary_ctxt_switches:     3
> >>> riscv_thread_features:  shstk_enabled lpad_enabled
> >>> riscv_thread_features_locked:   shstk_unlocked lpad_unlocked
> >>> ---
> >>>  arch/riscv/kernel/Makefile     |  1 +
> >>>  arch/riscv/kernel/cpu/Makefile |  1 +
> >>>  arch/riscv/kernel/cpu/proc.c   | 28 ++++++++++++++++++++++++++++
> >>>  3 files changed, 30 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> >>> index f60fce69b725..b32c11667d81 100644
> >>> --- a/arch/riscv/kernel/Makefile
> >>> +++ b/arch/riscv/kernel/Makefile
> >>> @@ -71,6 +71,7 @@ obj-y    += vendor_extensions.o
> >>>  obj-y    += vendor_extensions/
> >>>  obj-y    += probes/
> >>>  obj-y    += tests/
> >>> +obj-y    += cpu/
> >>>  obj-$(CONFIG_MMU) += vdso.o vdso/
> >>>  obj-$(CONFIG_RISCV_MISALIGNED)    += traps_misaligned.o
> >>> diff --git a/arch/riscv/kernel/cpu/Makefile b/arch/riscv/kernel/cpu/
> >>> Makefile
> >>> new file mode 100644
> >>> index 000000000000..2b474fb49afe
> >>> --- /dev/null
> >>> +++ b/arch/riscv/kernel/cpu/Makefile
> >>> @@ -0,0 +1 @@
> >>> +obj-$(CONFIG_PROC_FS)            += proc.o
> >>> diff --git a/arch/riscv/kernel/cpu/proc.c b/arch/riscv/kernel/cpu/proc.c
> >>> new file mode 100644
> >>> index 000000000000..4661190c43d1
> >>> --- /dev/null
> >>> +++ b/arch/riscv/kernel/cpu/proc.c
> >>> @@ -0,0 +1,28 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +#include <linux/smp.h>
> >>> +#include <linux/timex.h>
> >>> +#include <linux/string.h>
> >>> +#include <linux/seq_file.h>
> >>> +#include <linux/cpufreq.h>
> >>> +#include <linux/proc_fs.h>
> >>> +#include <asm/usercfi.h>
> >>> +
> >>> +#ifdef CONFIG_RISCV_USER_CFI
> >>> +
> >>> +void arch_proc_pid_thread_features(struct seq_file *m, struct
> >>> task_struct *task)
> >>> +{
> >>> +    seq_puts(m, "riscv_thread_features:\t");
> >>> +    if (is_shstk_enabled(task))
> >>> +        seq_puts(m, "shstk_enabled ");
> >>
> >> According to Documentation/arch/x86/shstk.rst, x86 is avoiding the
> >> '_enabled' postfix here:
> >>
> >> x86_Thread_features: shstk wrss
> >
> > I can follow same and use `shstk`. We don't have `wrss` because
> > shadow stack is writeable by right instruction (sspush and ssamoswap) in
> > riscv.
> >
> >>
> >>> +
> >>> +    if (is_indir_lp_enabled(task))
> >>> +        seq_puts(m, "lpad_enabled ");
> >
> > Would you prefer similar here. Just "lpad"?
>
> That would be consistent with what is done for x86.
>
> Best regards
>
> Heinrich
>
> >
> >>> +
> >>> +    seq_putc(m, '\n');
> >>> +
> >>> +    seq_puts(m, "riscv_thread_features_locked:\t");
> >>> +    is_shstk_locked(task) ? seq_puts(m, "shstk_locked ") :
> >>> seq_puts(m, "shstk_unlocked ");
> >>> +    is_indir_lp_locked(task) ? seq_puts(m, "lpad_locked ") :
> >>> seq_puts(m, "lpad_unlocked ");
> >>
> >> Why do we need any entry for an unlocked feature in
> >> riscv_thread_features_locked?
> >
> > absence of "feature_locked" is considered unlocked, then I can drop it.
> >
> >>
> >> Best regards
> >>
> >> Heinrich
> >>
> >>> +    seq_putc(m, '\n');
> >>> +}
> >>> +#endif /* CONFIG_RISCV_USER_CFI */
> >>>
> >>> ---
> >>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> >>> change-id: 20251017-proc_status-df1aedc85c7c
> >>> --
> >>> - debug
> >>>
> >>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
