Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68AAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8EyapH4mLASE7zAkJBIUEmpYjS4Fw00fSrCNNm3zNA=; b=Uh5fhYSoK25Wos
	9ng7LWHyszHCJd4EDScASMQ/rWe/HspixRoEuIzfhy5tzmVyJmIf1NVTLo3Dl3dC7mXJixBpcR9AW
	ypqzk7R/G3rlFVADnyDIUSIu0hDJN9HXD63I7BOAe0bPIr4h5Eps4TLLTxJi8zzf/IyIhr8GbStxm
	g1bEn3LY4rl1h0u1y98tEDQbxNxbNqnUwr4aeoAmI4GIIqLWsXWDBQAASXZ8kT34jpIeEsU+AJp4z
	PIXiALKkdCJmkKiyYplsCwFwcPF5WonXpXFEh3G+jevFhxFhlnxSOUflPkLUWQypiUSrkpH1QHK+3
	c0NArp06+to9wvyi2WeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUZd-006Fys-0Z; Mon, 16 May 2022 06:51:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUZY-006Fy9-Mz
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:51:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D864160FED
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF027C3411D
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652683874;
 bh=VnhplqP5C1OGrCIayDVu5lClsqFPYcrnV6QF9ztKEzI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rlCBtdsyM1BLOb6pklLk17Li+O4g9Sjs4+g2dOgvnhrrR2V3279c4/CNyFEqjBE7I
 jiHUg7zeXv4A6zC5a0B43hA+WriVHB6peH3CHzbVw/drmh8pXSXNGHEJkTMtzahs0w
 nour/DbCXZ5mmJaelC/946rdADD/JVKchXyUYr+iWr51Dng3BkOTHgMPG+w1Cx+SSu
 vT/K0IWkEQpnK46jVD6cEfaRMjJfP7E+Ulg5DfNxmYA7ep3RCc9DaLQAOvtO+uWBqr
 TBLfhjZsfjGyS6pvI2rivKts2a89BneaWVxymQUpK/Qb727vWoU6Pfp1iV9NQPPZOR
 zyo4WLSVUOmEw==
Received: by mail-vs1-f43.google.com with SMTP id z144so14469576vsz.13
 for <linux-riscv@lists.infradead.org>; Sun, 15 May 2022 23:51:14 -0700 (PDT)
X-Gm-Message-State: AOAM533EPqQHda4nyu36mc75dOu0WYvCKyXPtRH5y08Gk1KapOfNBTwX
 Ul96wZQ5hkCctYvTFrlPfMjbFRRZis3NDEdRj2Q=
X-Google-Smtp-Source: ABdhPJzE0ghTRETFmmFWpTrlU6Xx8/k8CZMycNU4BOY6FtbZ6KEMJI6pw0TcqX4NszTl0oN6BxWhztxrBibIAQzmJ1M=
X-Received: by 2002:a05:6102:390b:b0:32d:5fc3:bd2c with SMTP id
 e11-20020a056102390b00b0032d5fc3bd2cmr5076830vsu.51.1652683873645; Sun, 15
 May 2022 23:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220515131407.946832-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220515131407.946832-1-xianting.tian@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 16 May 2022 14:51:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS6StTP2QgEW65w79UaYLx2LEYLC8HF_VzFkgzRpfvXyw@mail.gmail.com>
Message-ID: <CAJF2gTS6StTP2QgEW65w79UaYLx2LEYLC8HF_VzFkgzRpfvXyw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add fast call path of crash_kexec()
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Vitaly Wool <vitaly.wool@konsulko.com>, rmk+kernel@armlinux.org.uk, 
 "Eric W. Biederman" <ebiederm@xmission.com>, tongtiangen@huawei.co, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_235116_870043_709E1E7C 
X-CRM114-Status: GOOD (  24.04  )
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

Great Job, I think it's a fixup, we should add Fix: and Cc: stable@kernel.org

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sun, May 15, 2022 at 9:14 PM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
>
> Currently, almost all archs (x86, arm64, mips...) support fast call
> of crash_kexec() when "regs && kexec_should_crash()" is true. But
> RISC-V not, it can only enter crash system via panic(). However panic()
> doesn't pass the regs of the real accident scene to crash_kexec(),
> it caused we can't get accurate backtrace via gdb,
>         $ riscv64-linux-gnu-gdb vmlinux vmcore
>         Reading symbols from vmlinux...
>         [New LWP 95]
>         #0  console_unlock () at kernel/printk/printk.c:2557
>         2557                    if (do_cond_resched)
>         (gdb) bt
>         #0  console_unlock () at kernel/printk/printk.c:2557
>         #1  0x0000000000000000 in ?? ()
>
> With the patch we can get the accurate backtrace,
>         $ riscv64-linux-gnu-gdb vmlinux vmcore
>         Reading symbols from vmlinux...
>         [New LWP 95]
>         #0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/virtio/virtio_mmio.c:806
>         806             *(int *)p = 0xdead;
>         (gdb)
>         (gdb) bt
>         #0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/virtio/virtio_mmio.c:806
>         #1  0x0000000000000000 in ?? ()
>
> Test code to produce NULL address dereference,
>         +extern int panic_on_oops;
>         +static struct task_struct *k;
>         +static int test_thread(void *data) {
>         +
>         +       void *p = NULL;
>         +
>         +       while (!panic_on_oops)
>         +               msleep(2000);
>         +
>         +       *(int *)p = 0xdead;
>         +
>         +       return 0;
>         +}
>         +
>          static int __init virtio_mmio_init(void)
>          {
>         +       k = kthread_run(test_thread, NULL, "test_thread");
>         +       if (IS_ERR(k))
>         +               pr_err("Couldn't create test kthread\n");
>         +
>                 return platform_driver_register(&virtio_mmio_driver);
>          }
>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  arch/riscv/kernel/traps.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index fe92e119e6a3..e666ebfa2a64 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -16,6 +16,7 @@
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/irq.h>
> +#include <linux/kexec.h>
>
>  #include <asm/asm-prototypes.h>
>  #include <asm/bug.h>
> @@ -44,6 +45,9 @@ void die(struct pt_regs *regs, const char *str)
>
>         ret = notify_die(DIE_OOPS, str, regs, 0, regs->cause, SIGSEGV);
>
> +       if (regs && kexec_should_crash(current))
> +               crash_kexec(regs);
> +
>         bust_spinlocks(0);
>         add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
>         spin_unlock_irq(&die_lock);
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
