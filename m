Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6EC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 21:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRMasFnmGJv26y0ufKtShx8QLpzTZN7/RrS2sUO/96Y=; b=mONObcbZPEcwQ4
	hUFgWewZUHAGU7Japfj4qgaqzqhRSy/ZyUuCaCJVuxV+byHPGt9rDRyr8LcOHaciCp6E6IGoyTkOS
	vasGSKrpAet7JBU0px6pTZWqoPetLIhbek7aDN0SaANey961Y/HBPzaGhOYJvUEg35DwLbFyBKopw
	1jXPi0bFONpPHkQChA+wbJGdVKpjp11Lz8PHhmQEe4xejKYQNk+nAHyIZHGwBudJbvS4mF5evlpHU
	zxOoge0/C/WZUbk4sZpLXygwoCznWA9jUgw510LtJ5x3oBzGpObeuLylv8qYUb0y6zs9Y9QQPh/mh
	f9Jpo2snJG9Y8WgCUyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmNU-0000000Gnuu-3flq;
	Wed, 07 May 2025 21:32:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmNR-0000000GnuI-36cV
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 21:32:31 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b07d607dc83so193074a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746653548; x=1747258348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFGRMash8A7LD509JYKnhMgwpOv6oeLiiO3InY3LVWU=;
        b=znJT3ZQsC+tGEHDUUk6YULm464nbXfcZkA0ukMImh4Ovvs0upKZTPjw+FlHVkqZ+RF
         WDh1PQpekD1Ri8JUNwxiUDzNKIjE8jIFeOdP4aazvcqnygefj47yK1XSlcCZlpRgC27y
         hDcvyzu+62928HI/C/aBFYrxrZfciqrMUiPNvsuhMgbKnOZYtv4H/3hikwt2XAhmCn2K
         ZVDYU0OoaEbttKIBDOouqhIvCl93NP+ZkTv9StSYrosOmgVrkQnkUH0i804y8dqPKnxC
         KQvAVBS8h/xvz2+Gq66q9Z7aFNbXozSWUuWtgLAB0lOsztg3CklCuXyjzZ1DXhMd6ctI
         eJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653548; x=1747258348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFGRMash8A7LD509JYKnhMgwpOv6oeLiiO3InY3LVWU=;
        b=ArByxulrO3769MIaMSNFe4DPJBYr5zCojuX0TuueuEKFQy0H+hZipBJxEL8eGE5z5g
         hC6tipSg8zdTZEGW1WFCp7tH8XWJjsTK6NUCtRYMV9OzzzP3fsm+VoMvLh3lz+fGOASl
         uy18DtKUDJwlhpJbTZuTbvqwvXDLzz301+422LMJ7RV5NUt524RCvedqczpCZTJi1Zbx
         qqh/Xs0GwFZzZhbHRQi3w2FazqO8ATzEcuTu1tRI37Gu9spGYvHzRCtuZt1XgvqtJ7aI
         bJOF8tQQa3RmKbnAG6JVd5n4IdtjWzNAXEnr6tmDFjwtj0klkvOITEEaDz6OrEdvlKpp
         29Zw==
X-Gm-Message-State: AOJu0Yxpppwc7SeiBNnSLBAv7ASXafR0a0Atf+zvd1cAZmrmrxczQGPj
	eII9wV8dmWnZDbjMGU2ZhpqKyC34VsHBiWW5naa7o36MwtLh1Rqbvqigv+MdSBM=
X-Gm-Gg: ASbGnctvZIQEEz4iMjhX4CLa3hcjQ/qave1bFNyiJaWjn6iAZ7rwp+qnNhp6wXTDejP
	cCEpaZfW64LLWkfLFHY5IWQaT2tRzvKwQf2iKg2cYlYRVvx8yGhytaN8HWmCMt9LyksF1r3x9dx
	Fbo+srd40cLx4AYNhiEH+o71dUEkagglTdgFRKVTW56zYroxqe0zHmnBrZqKBHtkMwUgAJwutlY
	tIHNaVFk5omiEyCLf67Psm9xMok6mHDLdCnZSAte0VVnF6JIqvc0MDf0sjiKrrI6/BG5flgjzDN
	EGgUJ21vx0sjit5WjEnCZVv91DWvxOQAcchZ
X-Google-Smtp-Source: AGHT+IFuckCQJA/Z1pGhl1AI2gxo6NDr1aYdEtjiV2Vr+hBxmBoSDhDeRiMuUCjcDiKYsW/jJlGhrg==
X-Received: by 2002:a17:90b:3947:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-30b3a6d2ee0mr865751a91.22.1746653548300;
        Wed, 07 May 2025 14:32:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:a06c:2581:5189:32ce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4b40eb3sm736231a91.17.2025.05.07.14.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:32:27 -0700 (PDT)
Date: Wed, 7 May 2025 14:32:25 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aBvRacm66QK_UHXF@ghost>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com>
 <aBltPLLrvUNKR857@ghost>
 <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_143230_056420_34AC594C 
X-CRM114-Status: GOOD (  40.66  )
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

On Wed, May 07, 2025 at 04:58:56PM +0530, Himanshu Chauhan wrote:
> Hi Charlie,
> 
> On 5/6/25 07:30, Charlie Jenkins wrote:
> > On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
> > > RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
> > > SBI debug trigger extension to install/uninstall/update/enable/disable hardware
> > > triggers as specified in Sdtrig ISA extension.
> > > 
> > > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > > ---
> > >   arch/riscv/Kconfig                     |   1 +
> > >   arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
> > >   arch/riscv/include/asm/kdebug.h        |   3 +-
> > >   arch/riscv/kernel/Makefile             |   1 +
> > >   arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
> > >   arch/riscv/kernel/traps.c              |   6 +
> > >   6 files changed, 996 insertions(+), 1 deletion(-)
> > >   create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
> > >   create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> > > 
> > ...
> > 
> > > diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> > > new file mode 100644
> > > index 000000000000..7787123c7180
> > > --- /dev/null
> > > +++ b/arch/riscv/kernel/hw_breakpoint.c
> > > +
> > > +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> > > +static int __init arch_hw_breakpoint_init(void)
> > > +{
> > > +	unsigned int cpu;
> > > +	int rc = 0;
> > > +
> > > +	for_each_possible_cpu(cpu)
> > > +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> > > +
> > > +	if (!dbtr_init)
> > > +		init_sbi_dbtr();
> > > +
> > > +	if (dbtr_total_num) {
> > > +		pr_info("%s: total number of type %d triggers: %u\n",
> > > +			__func__, dbtr_type, dbtr_total_num);
> > > +	} else {
> > > +		pr_info("%s: No hardware triggers available\n", __func__);
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* Allocate per-cpu shared memory */
> > > +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
> > > +					PAGE_SIZE);
> > > +
> > > +	if (!sbi_dbtr_shmem) {
> > > +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
> > > +		rc = -ENOMEM;
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* Hotplug handler to register/unregister shared memory with SBI */
> > > +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > When using this, only hart 0 is getting setup. I think instead we want
> > the following to have all harts get setup:
> > 
> > 	for_each_online_cpu(cpu)
> > 		arch_smp_setup_sbi_shmem(cpu);
> > 
> > 	/* Hotplug handler to register/unregister shared memory with SBI */
> > 	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> 
> cpuhp_setup_state() install the callbacks and invoke the @startup callback
> (if not NULL) for all online CPUs. So there is no need to call
> "arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug
> handler.

That's what I thought as well, but when testing that is not what was
happening.

> 
> If you are running this on QEMU, could you please share the qemu command you
> are invoking? I will test at my end and update you.

This is my qemu command:

qemu-system-riscv64 -nographic -m 1G -machine virt -smp 4 \
    -kernel arch/riscv/boot/Image -bios /home/charlie/opensbi/build/platform/generic/firmware/fw_dynamic.bin \
    -append "root=/dev/vda rw earlycon console=ttyS0" \
    -drive file=/home/charlie/buildroot/output/images/rootfs.ext2,format=raw,id=hd0,if=none \
    -cpu rv64,zicond=true \
    -device virtio-blk-device,drive=hd0 -gdb tcp::1234

- Charlie

> 
> Regards
> 
> Himanshu
> 
> > 
> > 
> > However, I am testing against tip-of-tree opensbi and am hitting an
> > issue during the setup on all harts:
> > 
> > [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
> > [    0.202794] CPU 0: HW Breakpoint shared memory registered.
> > 
> > Additionally, this seems like it should be a fatal error, but it
> > continues on to print that the shared memory is registered because there
> > is no check before printing this seemingly successful message.
> > 
> > I know I am reviving an old thread, but do you have any insight into
> > what might be happening?
> > 
> > - Charlie
> > 
> > > +			       "riscv/hw_breakpoint:prepare",
> > > +			       arch_smp_setup_sbi_shmem,
> > > +			       arch_smp_teardown_sbi_shmem);
> > > +
> > > +	if (rc < 0) {
> > > +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
> > > +		free_percpu(sbi_dbtr_shmem);
> > > +		return rc;
> > > +	}
> > > + out:
> > > +	return rc;
> > > +}
> > > +arch_initcall(arch_hw_breakpoint_init);
> > > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > > index a1b9be3c4332..53e1dfe5746b 100644
> > > --- a/arch/riscv/kernel/traps.c
> > > +++ b/arch/riscv/kernel/traps.c
> > > @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
> > >   	if (probe_breakpoint_handler(regs))
> > >   		return;
> > > +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> > > +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
> > > +	    == NOTIFY_STOP)
> > > +		return;
> > > +#endif
> > > +
> > >   	current->thread.bad_cause = regs->cause;
> > >   	if (user_mode(regs))
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
