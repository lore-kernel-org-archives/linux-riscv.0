Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7DCC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJalv23J2UdP6n/sX16v7eHpIyzw6DrDMtczF0ozafc=; b=YUnIJLsVz3i3oT
	Yc/DjeZxMnG8QQl0PdTs+zkOcsJmyZExtCfMmWeEkVrhiVq7/fXPpOJGPdIw0JJdHi/NTqAJ0RC9s
	yCGuEelp0+Mtxz8TZu3q4a1b9Qnsph6FMjgnPwMwSEzZUWGwB9I/hWtq/WR1NXtyzZLPFInkVlBHE
	GD+t/O1e4rOrkt2Xs5qjpoH24w9Af8Auns5PJMj/Rt8mngA8yNzIJc3dILI0NsEKMgINYAC7f50Ns
	yunFz0lAt3xROzasLw8lVx7iF77XtX+//6xJJbiIci6A+EPADRxrtO+7zTj1wpVZs/o4oCKr9xvAo
	aQ+zP521A3R7ObcEcGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD71G-00000001euQ-34oY;
	Thu, 08 May 2025 19:34:58 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD71E-00000001eu2-1NZ4
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 19:34:58 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so921593a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746732895; x=1747337695; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZ44o+q7/+m0UEn2HMO1rfRkSr213UfSD0BElkfuwOU=;
        b=mAvZiTKp9fVybE9QRGu9Zr1/6AqqZbYLUGSnfoAJPYaJilmLX/GZ75X6p+im1mpkAM
         Oy2NYhR/B3l8UtlTPazhVyU4JSf5XxvZuPNDXD/7njuHXzOOHeLCTNEeMM0fZs5fxBKU
         Ti+4dkVc8PSgaNFSm2+0CGIhJrdP37KP3ayUMG4kpg/8SyGbUDF0YKk+G1yq+zMVL36n
         5LsVz9hzSfaXWhI0cwYoLmvIBe1ZrSM/nNNPnQS7L5w/FDahl63WDIciKh7jOZXffBn4
         Rqmoe/T+pYf8AsNreWCLOrf+FQdnej8Y2Xj+eLysKb5gFFaETNdffTu/BH0iPzzy3W0o
         H/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746732895; x=1747337695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ44o+q7/+m0UEn2HMO1rfRkSr213UfSD0BElkfuwOU=;
        b=nPmw798nR4MmBM1DGOEfGqJh6g+s4foK1ddlD0HP1cxV+jhVah/7JxPxVuRfLJxWNs
         VCmez+GahP6ed5nr8ZUBeByjpaIplpyXKLfiLBziJrdJM/Hwq5nBz2IbATAKpbFwBr63
         wc+OTSTeXZdiHlL8Y7SqGB2wwMiCXTuluxeUr5kGiw4XLzTpBG4koaL1RX63x3NVsmrJ
         Gop55Rs508MZvirk2YOnco6jF//SAI5VgLjOSkPlAWURc2pjqq4Tqpfis9XqsP6NyrGb
         GHha3+FhngT6awxMyltl1liu7R8Hdn24etxMWmZQDUIVS0Fj574moOcTvK0bXpIqeJ74
         uudw==
X-Gm-Message-State: AOJu0YyzsBRKFWeY+Cxw3SSLlB2CoNI1KZ9ejHfX6q9fOEaA8qhzyWEF
	hvufodFanLXleO2yTidMNkFh1lMHvM1Bt0vnO6lIW2zQLdWKxG8kYpm3gNzxPi8=
X-Gm-Gg: ASbGncsZfes6OJyVsTZAghjEO85q2uefztFRWSsEfhQJHQi3tYj33ZjiVOV4tZFM++P
	YrADusXOMmyif2CJjSzQUJvIOfRUM9w/c0BHm6NXdatHhhcgyerHvQ1ksIGRDk3OHNTrmhsmxY1
	g8CV/Qz5qqBkkS97In7HtgClHO5KD+0XBvug/HnvkdkZ/HZfZuw4y9JPzD7V68R1/1fyBPNHk/g
	NxWN1S25500Bo0oxUh7l+HovUTfBqxZfy+fB4MPd+7oA0OxMsPmUZHE1b5W9VrjQr91TmXRFWSg
	jvVeGqDxe4SnmIIzVRJ953M7/wr6S5BoAzc=
X-Google-Smtp-Source: AGHT+IHTPx7T9l6k4TRqIQMtaCB1xcUyJtbhOgvLPrdR9JpDbal+18vVjOKPxT+Q2KeQn29Fpb8rcA==
X-Received: by 2002:a17:90b:1e53:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-30c3d64d90amr1013425a91.30.1746732895389;
        Thu, 08 May 2025 12:34:55 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:4b9:4737:ae71:4501])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39de72d9sm381921a91.21.2025.05.08.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:34:54 -0700 (PDT)
Date: Thu, 8 May 2025 12:34:52 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aB0HXDweWAagCofs@ghost>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com>
 <aBltPLLrvUNKR857@ghost>
 <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
 <aBvRacm66QK_UHXF@ghost>
 <57f163bb-1b4e-4f57-8f93-aee6ce1bd317@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57f163bb-1b4e-4f57-8f93-aee6ce1bd317@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_123456_569529_8B189C02 
X-CRM114-Status: GOOD (  51.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 08, 2025 at 05:24:42PM +0530, Himanshu Chauhan wrote:
> On 5/8/25 03:02, Charlie Jenkins wrote:
> > On Wed, May 07, 2025 at 04:58:56PM +0530, Himanshu Chauhan wrote:
> > > Hi Charlie,
> > > =

> > > On 5/6/25 07:30, Charlie Jenkins wrote:
> > > > On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
> > > > > RISC-V hardware breakpoint framework is built on top of perf subs=
ystem and uses
> > > > > SBI debug trigger extension to install/uninstall/update/enable/di=
sable hardware
> > > > > triggers as specified in Sdtrig ISA extension.
> > > > > =

> > > > > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > > > > ---
> > > > >    arch/riscv/Kconfig                     |   1 +
> > > > >    arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
> > > > >    arch/riscv/include/asm/kdebug.h        |   3 +-
> > > > >    arch/riscv/kernel/Makefile             |   1 +
> > > > >    arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++=
++++++++
> > > > >    arch/riscv/kernel/traps.c              |   6 +
> > > > >    6 files changed, 996 insertions(+), 1 deletion(-)
> > > > >    create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
> > > > >    create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> > > > > =

> > > > ...
> > > > =

> > > > > diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kerne=
l/hw_breakpoint.c
> > > > > new file mode 100644
> > > > > index 000000000000..7787123c7180
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/kernel/hw_breakpoint.c
> > > > > +
> > > > > +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> > > > > +static int __init arch_hw_breakpoint_init(void)
> > > > > +{
> > > > > +	unsigned int cpu;
> > > > > +	int rc =3D 0;
> > > > > +
> > > > > +	for_each_possible_cpu(cpu)
> > > > > +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> > > > > +
> > > > > +	if (!dbtr_init)
> > > > > +		init_sbi_dbtr();
> > > > > +
> > > > > +	if (dbtr_total_num) {
> > > > > +		pr_info("%s: total number of type %d triggers: %u\n",
> > > > > +			__func__, dbtr_type, dbtr_total_num);
> > > > > +	} else {
> > > > > +		pr_info("%s: No hardware triggers available\n", __func__);
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	/* Allocate per-cpu shared memory */
> > > > > +	sbi_dbtr_shmem =3D __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbt=
r_total_num,
> > > > > +					PAGE_SIZE);
> > > > > +
> > > > > +	if (!sbi_dbtr_shmem) {
> > > > > +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
> > > > > +		rc =3D -ENOMEM;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	/* Hotplug handler to register/unregister shared memory with SB=
I */
> > > > > +	rc =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > > > When using this, only hart 0 is getting setup. I think instead we w=
ant
> > > > the following to have all harts get setup:
> > > > =

> > > > 	for_each_online_cpu(cpu)
> > > > 		arch_smp_setup_sbi_shmem(cpu);
> > > > =

> > > > 	/* Hotplug handler to register/unregister shared memory with SBI */
> > > > 	rc =3D cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> > > cpuhp_setup_state() install the callbacks and invoke the @startup cal=
lback
> > > (if not NULL) for all online CPUs. So there is no need to call
> > > "arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug
> > > handler.
> > That's what I thought as well, but when testing that is not what was
> > happening.
> =

> I see the initialization happening on all the CPUs. I am using OpenSBI
> Top-of-line.
> =

> Linux kernel is from https://github.com/ventanamicro/linux.git [branch:
> dev-upstream]

The patch in that branch is different! In this series there is:

#if __riscv_xlen =3D=3D 64
#define MEM_HI(_m)	((u64)_m >> 32)
#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
#elif __riscv_xlen =3D=3D 32
#define MEM_HI(_m)	(((u64)_m >> 32) & 0x3)
#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
#else
#error "Unknown __riscv_xlen"
#endif

static int arch_smp_setup_sbi_shmem(unsigned int cpu)
{
	struct sbi_dbtr_shmem_entry *dbtr_shmem;
	unsigned long shmem_pa;
	struct sbiret ret;
	int rc;

	dbtr_shmem =3D per_cpu_ptr(sbi_dbtr_shmem, cpu);
	if (!dbtr_shmem) {
		pr_err("Invalid per-cpu shared memory for debug triggers\n");
		return -ENODEV;
	}

	shmem_pa =3D __pa(dbtr_shmem);

	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
			(!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_pa)),
			(!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_pa)),
			 0, 0, 0, 0);

But in the Ventana branch there is:


#if __riscv_xlen =3D=3D 64
#define MEM_HI(_m)	0
#define MEM_LO(_m)	((u64)_m)
#elif __riscv_xlen =3D=3D 32
#define MEM_HI(_m)	((u64)_m >> 32)
#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
#else
#error "Unknown __riscv_xlen"
#endif

static int arch_smp_setup_sbi_shmem(unsigned int cpu)
{
	struct sbi_dbtr_shmem_entry *dbtr_shmem;
	unsigned long shmem_pa;
	struct sbiret ret;
	int rc;

	dbtr_shmem =3D per_cpu_ptr(sbi_dbtr_shmem, cpu);
	if (!dbtr_shmem) {
		pr_err("Invalid per-cpu shared memory for debug triggers\n");
		return -ENODEV;
	}

	shmem_pa =3D __pa(dbtr_shmem);

	ret =3D sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);


I suppose this was causing the shmem setup to fail and preventing the
kernel from bringing up the other harts.

Can you send a version 2 that reflects the version in the Ventana tree?

- Charlie

> =

> Part of boot log:
> =

> [=A0=A0=A0 0.267250] arch_hw_breakpoint_init: total number of type 6 trig=
gers: 2
> [=A0=A0=A0 0.268108] CPU 0: HW Breakpoint shared memory registered.
> [=A0=A0=A0 0.268835] CPU 1: HW Breakpoint shared memory registered.
> [=A0=A0=A0 0.269932] CPU 2: HW Breakpoint shared memory registered.
> [=A0=A0=A0 0.270468] CPU 3: HW Breakpoint shared memory registered.
> [=A0=A0=A0 0.276554] sse: SBI SSE extension detected
> [=A0=A0=A0 0.308172] HugeTLB: allocation took 0ms with
> hugepage_allocation_threads=3D1
> [=A0=A0=A0 0.309682] HugeTLB: registered 2.00 MiB page size, pre-allocate=
d 0 pages
> =

> Can you please send me your config and bootlog?
> =

> Regards
> =

> Himanshu
> =

> =

> > > If you are running this on QEMU, could you please share the qemu comm=
and you
> > > are invoking? I will test at my end and update you.
> > This is my qemu command:
> > =

> > qemu-system-riscv64 -nographic -m 1G -machine virt -smp 4 \
> >      -kernel arch/riscv/boot/Image -bios /home/charlie/opensbi/build/pl=
atform/generic/firmware/fw_dynamic.bin \
> >      -append "root=3D/dev/vda rw earlycon console=3DttyS0" \
> >      -drive file=3D/home/charlie/buildroot/output/images/rootfs.ext2,fo=
rmat=3Draw,id=3Dhd0,if=3Dnone \
> >      -cpu rv64,zicond=3Dtrue \
> >      -device virtio-blk-device,drive=3Dhd0 -gdb tcp::1234
> > =

> > - Charlie
> > =

> > > Regards
> > > =

> > > Himanshu
> > > =

> > > > =

> > > > However, I am testing against tip-of-tree opensbi and am hitting an
> > > > issue during the setup on all harts:
> > > > =

> > > > [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter =
(18446744073709551611)
> > > > [    0.202794] CPU 0: HW Breakpoint shared memory registered.
> > > > =

> > > > Additionally, this seems like it should be a fatal error, but it
> > > > continues on to print that the shared memory is registered because =
there
> > > > is no check before printing this seemingly successful message.
> > > > =

> > > > I know I am reviving an old thread, but do you have any insight into
> > > > what might be happening?
> > > > =

> > > > - Charlie
> > > > =

> > > > > +			       "riscv/hw_breakpoint:prepare",
> > > > > +			       arch_smp_setup_sbi_shmem,
> > > > > +			       arch_smp_teardown_sbi_shmem);
> > > > > +
> > > > > +	if (rc < 0) {
> > > > > +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
> > > > > +		free_percpu(sbi_dbtr_shmem);
> > > > > +		return rc;
> > > > > +	}
> > > > > + out:
> > > > > +	return rc;
> > > > > +}
> > > > > +arch_initcall(arch_hw_breakpoint_init);
> > > > > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > > > > index a1b9be3c4332..53e1dfe5746b 100644
> > > > > --- a/arch/riscv/kernel/traps.c
> > > > > +++ b/arch/riscv/kernel/traps.c
> > > > > @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
> > > > >    	if (probe_breakpoint_handler(regs))
> > > > >    		return;
> > > > > +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> > > > > +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTR=
AP)
> > > > > +	    =3D=3D NOTIFY_STOP)
> > > > > +		return;
> > > > > +#endif
> > > > > +
> > > > >    	current->thread.bad_cause =3D regs->cause;
> > > > >    	if (user_mode(regs))
> > > > > -- =

> > > > > 2.34.1
> > > > > =

> > > > > =

> > > > > _______________________________________________
> > > > > linux-riscv mailing list
> > > > > linux-riscv@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
