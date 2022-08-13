Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3A3C19F2D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/9bDM4dHF5OT/MDKeNeXysGQDKVKxOyCBuIyB2SfV4=; b=Z0c1GeEecsn3eh
	XwXhEZgJ3J71CdoJrs9v0HKYsBUwA8PDCNGjCHmwYiQC3eCV588WnadxTZYvDuzHGN0PSBDnoPEDk
	rEYOoFkDhi4Ss7NgDmqhzdM1q+LVgKRdLpzCE1ZCYOj7CmT74atwgf3jI2nUUEN9KWDvTupTHdyoJ
	RXHrxcq5T+RyCWlnzZGhK2c+RlMrh+vRM+tfDCuibQCgSe2WKpailqMO1PHzQJgl43G/3oTRMfAgf
	cGm54+qPjAuFFdA1r5lJBYmq2nBQ+1ufg6oyYoQAQdTS9QQ4BQKaFKKjnufNH8SEeDWd7a53whkhW
	hlJMku1jF4CCGVQV/Gew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtXQ-00FfYR-G0; Sat, 13 Aug 2022 15:59:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtXN-00FfVa-Es
	for linux-riscv@lists.infradead.org; Sat, 13 Aug 2022 15:58:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id s206so3167397pgs.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Aug 2022 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=R+HtbE+Obmk9Grpr2Je9B00sbY1w2vVuGg8nOysmTjU=;
        b=W8ttGyJnexXSrSBO8CBxFM8GzK6e8kvmeDgrtkXXnZOgz2DFDHjjrYWdNZttEd4RMQ
         xBUzRsm6ZCqtD7WE0zIAG4tn1Yowv2uZV7Od8/2fMuc+sBB9b84W3I/tkJaE/CMIvpbN
         WE4K4sUbVwlkf4Oegs0x8+lN41Dt43jI68g5KhjCW+Nh4+siotvQvnO8KLEVIcvz/pvi
         aIZAXnHkKyzUMVuKuBN/kEB8y1TdnR1tMezQYJn8cauNGHLUGcOzL5X4rNLALtBjNOkU
         qGJsNNXlT8lKfGqp2WeSiEZV/tNk7L60GaKynfS3whld1XacJ09ZqU7pLOF19NYl84om
         Lotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=R+HtbE+Obmk9Grpr2Je9B00sbY1w2vVuGg8nOysmTjU=;
        b=fL/vKfoRBwdfPSJnIyUzs2idb2yleHSb306EPy28jcapm8OFWTBMWrSZBwPMB3LS9I
         ICYXQ/Nqt78ZC/PbiOTBVmVG8qTDpHCBYh9jQBINzJIYN3Qg7vKMyiIxEyJso/FyhlRv
         Fl0GwdJfbW3s7RHQXDoF+SVJQ3px8DnbauKljpF7O4aV76Ru8ofbU8nNRE5IYhJAYV4p
         2KT//xhM5kLJ80YtC3tc+y+pbZFpNI3F4N6N367Wq3vFM6JVynLIBZMu/mIMiIVvFTFi
         1fzkq+7OpHjgpdWhMFLZhWjer+zys8hIVWJXdstmY7LuyCR0Qcz1FjAgPNPIyn7oQdGX
         Jq+w==
X-Gm-Message-State: ACgBeo1mKJUOl68lQ+wksgXdk1+pPybaHcArWAZ05SV3aFIunVCFD70O
	Zp/NDhWrQi55zdPLu9pV2z0=
X-Google-Smtp-Source: AA6agR5mRAtnYz/6hBl4e3Q7lkxnhg+grG8P7Bw7/tDWMHMuQdEM28NcJTA/2C6XZv8Uq9BoaJ3sdA==
X-Received: by 2002:a05:6a00:181f:b0:52d:87ef:f9bb with SMTP id y31-20020a056a00181f00b0052d87eff9bbmr9187138pfa.70.1660406334838;
        Sat, 13 Aug 2022 08:58:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f85-20020a623858000000b0052e27fe53b2sm3712099pfa.82.2022.08.13.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 08:58:53 -0700 (PDT)
Date: Sat, 13 Aug 2022 08:58:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: enable Docker requirements in defconfig
Message-ID: <20220813155851.GA187510@roeck-us.net>
References: <20220608000251.55271-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608000251.55271-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_085857_567725_C5BC8B63 
X-CRM114-Status: GOOD (  12.53  )
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

On Wed, Jun 08, 2022 at 02:02:51AM +0200, Heinrich Schuchardt wrote:
> The defconfig kernel should be able to run Docker.
> 
> Enable the missing settings according to [1].
> make savedefconfig eliminates CONFIG_STACKTRACE
> which is enabled by default.
> 
> Many of the settings are also needed to run a defconfig kernel
> on default distro installations or to run snaps.
> 
> [1] https://github.com/moby/moby/blob/master/contrib/check-config.sh
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

This patch results in (or exposes) the following boot warning with all
riscv32 and riscv64 qemu boots.

[   12.278014] DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled())
[   12.278218] WARNING: CPU: 0 PID: 140 at kernel/locking/lockdep.c:5510 check_flags+0xe2/0x1c2
[   12.278446] Modules linked in:
[   12.278623] CPU: 0 PID: 140 Comm: S01syslogd Tainted: G                 N 5.19.0-14184-g69dac8e431af #1
[   12.278791] Hardware name: riscv-virtio,qemu (DT)
[   12.278931] epc : check_flags+0xe2/0x1c2
[   12.279024]  ra : check_flags+0xe2/0x1c2
[   12.279092] epc : ffffffff80a8ea50 ra : ffffffff80a8ea50 sp : ff200000107f3cb0
[   12.279180]  gp : ffffffff819fec50 tp : ff600000049895c0 t0 : ffffffff81833520
[   12.279287]  t1 : 0000000000000001 t2 : 2d2d2d2d2d2d2d2d s0 : ff200000107f3cd0
[   12.279395]  s1 : ffffffff81a00130 a0 : 0000000000000030 a1 : ffffffff818925e8
[   12.279502]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 : 0000000000000000
[   12.279608]  a5 : 0000000000000000 a6 : ffffffff80066d80 a7 : 0000000000000038
[   12.279714]  s2 : ffffffff81a024e0 s3 : ffffffff818935b0 s4 : ff200000107f3e28
[   12.279825]  s5 : ffffffff80e27708 s6 : 0000000200000022 s7 : ffffffffffffffff
[   12.279932]  s8 : ffffffff8249da18 s9 : 0000000000001000 s10: 0000000000000001
[   12.280037]  s11: 0000000000000001 t3 : ffffffff824740af t4 : ffffffff824740af
[   12.280142]  t5 : ffffffff824740b0 t6 : ff200000107f3aa8
[   12.280227] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[   12.280382] [<ffffffff80a8eba8>] lock_is_held_type+0x78/0x14a
[   12.280505] [<ffffffff8003d648>] __might_resched+0x26/0x232
[   12.280608] [<ffffffff8003d892>] __might_sleep+0x3e/0x66
[   12.280690] [<ffffffff8002262c>] get_signal+0xa6/0x8f6
[   12.280771] [<ffffffff800051da>] do_notify_resume+0x68/0x418
[   12.280863] [<ffffffff80003af4>] ret_from_exception+0x0/0x10
[   12.280978] irq event stamp: 2900
[   12.281041] hardirqs last  enabled at (2899): [<ffffffff80a9761c>] _raw_spin_unlock_irqrestore+0x54/0x62
[   12.281176] hardirqs last disabled at (2900): [<ffffffff8000812c>] __trace_hardirqs_off+0xc/0x14
[   12.281303] softirqs last  enabled at (1860): [<ffffffff80a98092>] __do_softirq+0x3e2/0x51c
[   12.281435] softirqs last disabled at (1843): [<ffffffff80016fc8>] __irq_exit_rcu+0xb4/0xdc
[   12.281564] ---[ end trace 0000000000000000 ]---
[   12.281735] possible reason: unannotated irqs-on.
[   12.281815] irq event stamp: 2900
[   12.281875] hardirqs last  enabled at (2899): [<ffffffff80a9761c>] _raw_spin_unlock_irqrestore+0x54/0x62
[   12.282004] hardirqs last disabled at (2900): [<ffffffff8000812c>] __trace_hardirqs_off+0xc/0x14
[   12.282125] softirqs last  enabled at (1860): [<ffffffff80a98092>] __do_softirq+0x3e2/0x51c
[   12.282242] softirqs last disabled at (1843): [<ffffffff80016fc8>] __irq_exit_rcu+0xb4/0xdc

Reverting this patch fixes the problem. Bisect log attached.

Guenter

---
# bad: [69dac8e431af26173ca0a1ebc87054e01c585bcc] Merge tag 'riscv-for-linus-5.20-mw2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
# good: [6614a3c3164a5df2b54abb0b3559f51041cf705b] Merge tag 'mm-stable-2022-08-03' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect start 'HEAD' '6614a3c3164a'
# bad: [24cb958695724ffb4488ef4f65892c0767bcd2f2] Merge tag 's390-5.20-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
git bisect bad 24cb958695724ffb4488ef4f65892c0767bcd2f2
# good: [a3b5d4715fd5a839857f8b7be78dff258a8d5a47] Merge tag 'asoc-v5.20-2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
git bisect good a3b5d4715fd5a839857f8b7be78dff258a8d5a47
# good: [1d239c1eb873c7d6c6cbc80d68330c939fd86136] Merge tag 'iommu-updates-v5.20-or-v6.0' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect good 1d239c1eb873c7d6c6cbc80d68330c939fd86136
# good: [4cfa6ff24a9744ba484521c38bea613134fbfcb3] powerpc/64e: Fix kexec build error
git bisect good 4cfa6ff24a9744ba484521c38bea613134fbfcb3
# good: [ea0c39260d0c1d8e11d89c9d42ca48e172d1c868] Merge tag '9p-for-5.20' of https://github.com/martinetd/linux
git bisect good ea0c39260d0c1d8e11d89c9d42ca48e172d1c868
# bad: [d77771c926671e0362af3fe792391be66072b242] Merge tag 'mips_6.0' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
git bisect bad d77771c926671e0362af3fe792391be66072b242
# good: [3f1901110a89b0e2e13adb2ac8d1a7102879ea98] RISC-V: Add fast call path of crash_kexec()
git bisect good 3f1901110a89b0e2e13adb2ac8d1a7102879ea98
# good: [d3164e2f3b0ac003c401d419cda2da0571724352] MIPS: Remove VR41xx support
git bisect good d3164e2f3b0ac003c401d419cda2da0571724352
# good: [534ea58b3ceb41d668adf18c4e68a846e770a6c8] Revert "MIPS: octeon: Remove vestiges of CONFIG_CAVIUM_RESERVE32"
git bisect good 534ea58b3ceb41d668adf18c4e68a846e770a6c8
# bad: [ba6cfef057e1c594c456627aad81c2343fdb5d13] riscv: enable Docker requirements in defconfig
git bisect bad ba6cfef057e1c594c456627aad81c2343fdb5d13
# good: [9c2ea4a36364bfb5cf068c6fbea5c40292b119a5] riscv: convert the t-head pbmt errata to use the __nops macro
git bisect good 9c2ea4a36364bfb5cf068c6fbea5c40292b119a5
# good: [f4361718f7654f31fee6bf323147e7062d825599] riscv: Add macro for multiple nop instructions
git bisect good f4361718f7654f31fee6bf323147e7062d825599
# first bad commit: [ba6cfef057e1c594c456627aad81c2343fdb5d13] riscv: enable Docker requirements in defconfig

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
