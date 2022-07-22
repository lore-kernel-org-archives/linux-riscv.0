Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C62C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TVu8DK8iyFRbxta/DUs9hnNaFciAmANOAbkGlqFraGo=; b=ZOUFj+gcQesfhpvLsgaHNsmJN+
	paFEzEBodHa0kx23COf3Rc6NJznrUEm9nx8Nlw34ZWNUv9yQvIFwLBuMKxop1WA/jTgWxc/jEsy1w
	u92D67gsgkvv+nwHxDlD31GeKOT+07jy3Lpfsaq1COK/CNUxJX8mewitR6syLBobhuDmmb1FFBuIN
	KWDPj7LHAISW34+qYIEE/LIpKlGwr+WSopHFO5CONicmMFf+cJ0OiMJ5wg+Ilrsp3kIG4tnwOBQLj
	UCNcpP7IKjI065qHFVZtLs2aNw5i6SlMWfTFR8BGJWB1gLIy+DFZ4O4TiAaMpvFuNMAHac6o0VfYB
	mPGoz6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEgG9-00DjLJ-EI; Fri, 22 Jul 2022 00:11:13 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEgG6-00DjGl-26
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 00:11:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id p6-20020a17090a680600b001f2267a1c84so5080883pjj.5
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 17:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=PqbUV51qi52lrKQhfCf/gzD84m8gLhls7/B6ZdVqa/M=;
        b=ZTVeoyJ2YXiZu5jk15o9L1VobOx0d0pdDXua+aewXF/XkkApabUZE/5ZQ3TU+HUMZL
         EyBJ5rXuSCDN19gvV87EvXMAclujYjRBFFA7x/W9G258vZ3zmrL80a6RaR7yac1hz7e3
         wgDtuY0VvR/ZPdHb4/0aF7p0iygOc8Cly0ssFBHjlrIWWoSOulPh+Fqh02QP8xwhQmio
         kyOZDr2q0Hpeqk1OW26DohM+xN4/HxIdmoGvBzI4VDD1voJcWlXnwdOtxTs46tix4/nD
         SaGS5bBCoGmZ5SoyZS/Ic82U5DSrUJ8SwnlFqJICxKl+MGearAs63k7bI5XGQrSCmdr3
         E4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=PqbUV51qi52lrKQhfCf/gzD84m8gLhls7/B6ZdVqa/M=;
        b=Jo694mYkBQHCyU8hBiy7WW73bE0qQFrbhrdKYDIBC+JsnLyXWkNcm4XoyLWIOFPOb8
         pIKRY/bdPH6soXm1/GjTxSs80Rvb50XXInFwX9f81Jcf7eWlNn3Qrx61jsGv2Rfh4EdC
         fi5IxV6Xpc8L9W32KP0UTdBgEk2vxqPD/8uGBemzTCVaZdLaFerzFAHcyicRlT2cvEeN
         VNJ1m4rJluLOknKBpLo2g+UQrKVtuR/On9eGs30G64QcCGBhxZPiJlYD6uEfA8Fx0ZK7
         NdJtGqaiF22TJP1TRaKnqo8bx4l6H/KDB/vn+1cTmLwjwgKcQ121Iyt59hYG9o3Ijfco
         IiXw==
X-Gm-Message-State: AJIora8b5+kLAc5k24yU680q5JDCS0NspB68hHfKNCrF5LtBucmOT0IJ
	7mc6rzPw9owhasoQoww6Cs1COQ==
X-Google-Smtp-Source: AGRyM1tXcBNLCwVKHbHbV7qjxyfn5Jjq2ISRTnE50I9Ilhew1GrpnrmxmKsZ28ecr1pCNFjI8UVxVQ==
X-Received: by 2002:a17:903:41c2:b0:16c:52f8:9240 with SMTP id u2-20020a17090341c200b0016c52f89240mr931214ple.161.1658448666805;
        Thu, 21 Jul 2022 17:11:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s29-20020a63215d000000b0041166bf9ca8sm2088739pgm.34.2022.07.21.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 17:11:06 -0700 (PDT)
Date: Thu, 21 Jul 2022 17:11:06 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Jul 2022 16:52:31 PDT (-0700)
Subject: Re: [RESEND PATCH v2] RISC-V: Add fast call path of crash_kexec()
In-Reply-To: <20220606082308.2883458-1-xianting.tian@linux.alibaba.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  wangkefeng.wang@huawei.com, philipp.tomsich@vrull.eu, ebiederm@xmission.com, heiko@sntech.de,
  vitaly.wool@konsulko.com, tongtiangen@huawei.com, guoren@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, xianting.tian@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: xianting.tian@linux.alibaba.com
Message-ID: <mhng-c42cbd7f-4935-4d16-9150-5504fd06aedd@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_171110_320405_21FE5E74 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, 06 Jun 2022 01:23:08 PDT (-0700), xianting.tian@linux.alibaba.com wrote:
> Currently, almost all archs (x86, arm64, mips...) support fast call
> of crash_kexec() when "regs && kexec_should_crash()" is true. But
> RISC-V not, it can only enter crash system via panic(). However panic()
> doesn't pass the regs of the real accident scene to crash_kexec(),
> it caused we can't get accurate backtrace via gdb,
> 	$ riscv64-linux-gnu-gdb vmlinux vmcore
> 	Reading symbols from vmlinux...
> 	[New LWP 95]
> 	#0  console_unlock () at kernel/printk/printk.c:2557
> 	2557                    if (do_cond_resched)
> 	(gdb) bt
> 	#0  console_unlock () at kernel/printk/printk.c:2557
> 	#1  0x0000000000000000 in ?? ()
>
> With the patch we can get the accurate backtrace,
> 	$ riscv64-linux-gnu-gdb vmlinux vmcore
> 	Reading symbols from vmlinux...
> 	[New LWP 95]
> 	#0  0xffffffe00063a4e0 in test_thread (data=<optimized out>) at drivers/test_crash.c:81
> 	81             *(int *)p = 0xdead;
> 	(gdb)
> 	(gdb) bt
> 	#0  0xffffffe00064d5c0 in test_thread (data=<optimized out>) at drivers/test_crash.c:81
> 	#1  0x0000000000000000 in ?? ()
>
> Test code to produce NULL address dereference in test_crash.c,
> 	void *p = NULL;
> 	*(int *)p = 0xdead;
>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Tested-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
> Changes from v1:
> - simplify the commit message
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
>  	ret = notify_die(DIE_OOPS, str, regs, 0, regs->cause, SIGSEGV);
>
> +	if (regs && kexec_should_crash(current))
> +		crash_kexec(regs);
> +
>  	bust_spinlocks(0);
>  	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
>  	spin_unlock_irq(&die_lock);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
