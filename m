Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C74C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkhRNRfRrmHBdwlaieqyWExvLg0pFKW8eDQS5iu7mTQ=; b=41xWt4Igt9F5/y
	bwhCWf/amQfZXFJXq3ozLcaZryJ/sp4obSYGOvPxK+o9QgRbHifyX5rkeXX8wV/OJQ073do4Mlj33
	Ane4PtJEGecG1T2dOwmESSvr4BhO9pa//cPEm08FKLj+kIBFSoHxSDKPzcL7FNS+NIXcUXOLNNxS7
	d12QPf1WEBWmu6O/bcIwEFJT6VWoldubko9jhWO/gI9JIn2YTZJ6iLFvuLd47wQMWhfMPvqi3kwVj
	GkAMXmz4SjYt0VcII+Kd2AYDvuYj5Yb6dSAx3htCH4k4EhMDPm+huQZU/6l1+0iG6RA6iKBGGW3lO
	NPQoZ5yzwTFWeloq02Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IEu-00E5lo-Do; Thu, 23 Jun 2022 08:31:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IEr-00E5kx-N9
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 08:30:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BA8561C3A
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 08:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C79C341C7
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655973056;
	bh=F5UR30hB3x0X8hdoOCoBr2Sxf6O6bd2Ool5zcZGjk54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PITc58SLVQX6+OIXxpvKXrYmMz5ioJtqqdMDq/mVS+wq9Hzrq6vbceIYxwei51e1H
	 1bdhOQCXXfEuASliJ4yB4KQmj2/mwGVZgrlmWJS9w4oBz2cOVaMl5Fy6dxtZfsxqd4
	 YgzL1mzesjUDMGc9pcRSfQqqOsGl0I8FXMbaAn5S90V7AVFbOBOepEwh9dBSTnTgK9
	 7jjxoEXSmqmAu6AbEG3Ud8tj36I332As0K24M005Q2St/6chODoHoB1XuFZsAnfMEj
	 GBM3z+2FX4WIFolnXQfxmjsbCoy8+efqx0WNgq1sMSPsJcOqoJUeP/F51YqlttrjKU
	 4r3NirXf2rqjw==
Received: by mail-vs1-f44.google.com with SMTP id z66so4795284vsb.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 01:30:56 -0700 (PDT)
X-Gm-Message-State: AJIora9MDxjSbddJVNXbJ8VZYjyuSiIsoF0At6uKt6MDEsCypu2XB247
	47Wx+7CDEH7aYqTbNfitTAsduqH/r2qZNfztrUw=
X-Google-Smtp-Source: AGRyM1verVHsmB1e+p9XI5PjTAf8+ZIMXrCBSK8X3iGprjf7BgWHigdYt49CgBd/v4JodAETXNH9E5JaqCTKyF3/LUk=
X-Received: by 2002:a05:6102:f8b:b0:354:57e8:4c1b with SMTP id
 e11-20020a0561020f8b00b0035457e84c1bmr4477837vsv.8.1655973055484; Thu, 23 Jun
 2022 01:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220623074315.3814826-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220623074315.3814826-1-xianting.tian@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Jun 2022 16:30:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS0SW6GDmLb0iLv3Lux-jHv0EiN0pTErbBCFDB5G70SuQ@mail.gmail.com>
Message-ID: <CAJF2gTS0SW6GDmLb0iLv3Lux-jHv0EiN0pTErbBCFDB5G70SuQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: use __smp_processor_id() instead of smp_processor_id()
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>, 
	Liao Chang <liaochang1@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_013057_896823_2DCDCDA2 
X-CRM114-Status: GOOD (  20.19  )
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

On Thu, Jun 23, 2022 at 3:43 PM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
>
> Use __smp_processor_id() to avoid check the preemption context when
> CONFIG_DEBUG_PREEMPT enabled, as we will enter crash kernel and no
> return.
>
> Without the patch,
> [  103.781044] sysrq: Trigger a crash
> [  103.784625] Kernel panic - not syncing: sysrq triggered crash
> [  103.837634] CPU1: off
> [  103.889668] CPU2: off
> [  103.933479] CPU3: off
> [  103.939424] Starting crashdump kernel...
> [  103.943442] BUG: using smp_processor_id() in preemptible [00000000] code: sh/346
> [  103.950884] caller is debug_smp_processor_id+0x1c/0x26
> [  103.956051] CPU: 0 PID: 346 Comm: sh Kdump: loaded Not tainted 5.10.113-00002-gce03f03bf4ec-dirty #149
> [  103.965355] Call Trace:
> [  103.967805] [<ffffffe00020372a>] walk_stackframe+0x0/0xa2
> [  103.973206] [<ffffffe000bcf1f4>] show_stack+0x32/0x3e
> [  103.978258] [<ffffffe000bd382a>] dump_stack_lvl+0x72/0x8e
> [  103.983655] [<ffffffe000bd385a>] dump_stack+0x14/0x1c
> [  103.988705] [<ffffffe000bdc8fe>] check_preemption_disabled+0x9e/0xaa
> [  103.995057] [<ffffffe000bdc926>] debug_smp_processor_id+0x1c/0x26
> [  104.001150] [<ffffffe000206c64>] machine_kexec+0x22/0xd0
> [  104.006463] [<ffffffe000291a7e>] __crash_kexec+0x6a/0xa4
> [  104.011774] [<ffffffe000bcf3fa>] panic+0xfc/0x2b0
> [  104.016480] [<ffffffe000656ca4>] sysrq_reset_seq_param_set+0x0/0x70
> [  104.022745] [<ffffffe000657310>] __handle_sysrq+0x8c/0x154
> [  104.028229] [<ffffffe0006577e8>] write_sysrq_trigger+0x5a/0x6a
> [  104.034061] [<ffffffe0003d90e0>] proc_reg_write+0x58/0xd4
> [  104.039459] [<ffffffe00036cff4>] vfs_write+0x7e/0x254
> [  104.044509] [<ffffffe00036d2f6>] ksys_write+0x58/0xbe
> [  104.049558] [<ffffffe00036d36a>] sys_write+0xe/0x16
> [  104.054434] [<ffffffe000201b9a>] ret_from_syscall+0x0/0x2
> [  104.067863] Will call new kernel at ecc00000 from hart id 0
> [  104.074939] FDT image at fc5ee000
> [  104.079523] Bye...
>
> With the patch we can got clear output,
> [   67.740553] sysrq: Trigger a crash
> [   67.744166] Kernel panic - not syncing: sysrq triggered crash
> [   67.809123] CPU1: off
> [   67.865210] CPU2: off
> [   67.909075] CPU3: off
> [   67.919123] Starting crashdump kernel...
> [   67.924900] Will call new kernel at ecc00000 from hart id 0
> [   67.932045] FDT image at fc5ee000
> [   67.935560] Bye...
>
> Fixes: 0e105f1d0037 ("riscv: use hart id instead of cpu id on machine_kexec")
> Co-developed-by: Guo Ren <guoren@kernel.org>

- Co-developed-by: Guo Ren <guoren@kernel.org>
+ Reviewed-by: Guo Ren <guoren@kernel.org>

Thx

> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index df8e24559035..86d1b5f9dfb5 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -171,7 +171,7 @@ machine_kexec(struct kimage *image)
>         struct kimage_arch *internal = &image->arch;
>         unsigned long jump_addr = (unsigned long) image->start;
>         unsigned long first_ind_entry = (unsigned long) &image->head;
> -       unsigned long this_cpu_id = smp_processor_id();
> +       unsigned long this_cpu_id = __smp_processor_id();
>         unsigned long this_hart_id = cpuid_to_hartid_map(this_cpu_id);
>         unsigned long fdt_addr = internal->fdt_addr;
>         void *control_code_buffer = page_address(image->control_code_page);
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
