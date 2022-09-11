Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A112ECAAD5
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Sep 2022 00:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtyIOWnDuQfVz3E50CsOlNZuuArRSpljWsmmCj3siE4=; b=oViCeK4kGLrusT
	n2X1n08dJ6GmhYyQwv4uzKjzaDLFflEdMw1vmzHCblSvHjeck6TrXy5slBZnw/xdkX+oNoNZCAx1F
	ofk5MK89aSYAprX5HxnBIogLqKJA6e2BVkx8/g2MthA/2dlXBhoMlGAWMl9jisETECLsYJgtzJfrd
	7IBMkPKx/94T4j8rTe6h2NlE9kSuSIayadFC/bHe1w6Va8ZqdANWh4np1EVVnk/KhoNQcK5nw/zRu
	+Gw6JVEBGCh1BvzRgq9dp56WJOaoHcNcwiTG1Jja9nhASVwlOBApYKEPq4Q6MQt0OmNsSxVRO5Ihz
	I6xJJO2wmTk4sKHq1hUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXB73-00Eq2O-PD; Sun, 11 Sep 2022 00:46:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXB71-00Eq1e-8O
	for linux-riscv@lists.infradead.org; Sun, 11 Sep 2022 00:46:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EC9060EF4
	for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 00:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1053EC4347C
	for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 00:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662857172;
	bh=egFE5bc3jJed2LPjs3SzwOeonR5PE+KCyUTwartSPdo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g/JYwG8363Y2WZzxZfaG2GDIHL5M5svtO/O/cdlzyFziIObEHuOtXm2VkD6KvAfRI
	 BHgvZ6PNaGrew+wG+2Je1ZQRFs5qoIYCGBO0JW61bc/psEhB7s0hj+poWtJ6PHzjDq
	 p/BZ/r88ILyk6Nv4J928SsFVsK2Uj9c9edn6/jMRAKofDx0WRdvHTAjvYEig46lc6n
	 agcmiUpdjoOyHfF5fzr3fYzcEPqaeKT/ptg6yozHetemWlZ9aSgTW63D3NHoHsjBxs
	 gGqzkYiO+3GdI9HusKdTfmiSEk16XtA9tExy05DU1EMcE0wTz40QATH1halKNJgiZD
	 bTu+v0ikZkLEA==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-127d10b4f19so13994620fac.9
        for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 17:46:11 -0700 (PDT)
X-Gm-Message-State: ACgBeo1GFuoY9bg+F7y3rH2tI+tvN7K55EaR04KDBZ1vSCOXGxg91/sI
	Vab/8StAEi0ySC9OTVSR/dZyDkKvt3rSFh14PNo=
X-Google-Smtp-Source: AA6agR74cG50V8jrijbMpgwAUxcejt9uQFhcLDrFpKyhqA55p7eImIIzJKi9r2NpJN+cbS3X+evaLeq2vuLDs2Dci5A=
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr6206055oiw.19.1662857171122; Sat, 10
 Sep 2022 17:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220909094230.252031-1-zouyipeng@huawei.com>
In-Reply-To: <20220909094230.252031-1-zouyipeng@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 11 Sep 2022 08:45:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhUFBGb7yXJ71=soGxXgNRXzBz6Da-EaXQYR9Y-FS2kw@mail.gmail.com>
Message-ID: <CAJF2gTQhUFBGb7yXJ71=soGxXgNRXzBz6Da-EaXQYR9Y-FS2kw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix TRACE_IRQFLAGS call points in entry.S
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	frederic@kernel.org, nsaenzju@redhat.com, paulmck@kernel.org, 
	liaochang1@huawei.com, chris.zjh@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_174615_393254_B3AAA59A 
X-CRM114-Status: GOOD (  18.71  )
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

I think it would be fixed by GENERIC_ENTRY. You could have a try.

https://lore.kernel.org/linux-riscv/20220908022506.1275799-1-guoren@kernel.org/

On Fri, Sep 9, 2022 at 5:46 PM Yipeng Zou <zouyipeng@huawei.com> wrote:
>
> TRACE_IRQFLAGS need trace all {Enable,Disable} hard interrupts points
> in entry.S.
> We miss a path(work_notifysig) that cause an WARN as shown below.
>
> [   50.362431] ------------[ cut here ]------------
> [   50.363607] DEBUG_LOCKS_WARN_ON(!lockdep_hardirqs_enabled())
> [   50.367229] WARNING: CPU: 3 PID: 74 at kernel/locking/lockdep.c:5510 check_flags+0x10a/0x1e0
> [   50.368905] Modules linked in:
> [   50.369440] CPU: 3 PID: 74 Comm: rcS Tainted: G
> [   50.370225] Hardware name: riscv-virtio,qemu (DT)
> [   50.370632] epc : check_flags+0x10a/0x1e0
> [   50.371015]  ra : check_flags+0x10a/0x1e0
> [   50.371751] epc : ffffffff808e2670 ra : ffffffff808e2670 sp : ff20000000c3bca0
> [   50.372721]  gp : ffffffff817e2188 tp : ff60000002fe1800 t0 : ffffffff8162a2a8
> [   50.373321]  t1 : 0000000000000001 t2 : 2d2d2d2d2d2d2d2d s0 : ff20000000c3bcc0
> [   50.373903]  s1 : ffffffff817e3340 a0 : 0000000000000030 a1 : ffffffff81693fa8
> [   50.374476]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 : 083151a422b8df00
> [   50.375039]  a5 : 083151a422b8df00 a6 : ffffffff8006891e a7 : 083151a422b8df00
> [   50.376028]  s2 : ffffffff817e54e0 s3 : ffffffff81695070 s4 : ff600000027d7800
> [   50.376978]  s5 : ffffffff80c22770 s6 : 0000000200000022 s7 : ffffffffffffffff
> [   50.377779]  s8 : ffffffff82301ed0 s9 : 0000000000001000 s10: 00000000001a9905
> [   50.378335]  s11: 000000000014f3e8 t3 : ffffffff822d714f t4 : ffffffff822d714f
> [   50.378955]  t5 : ffffffff822d7150 t6 : ff20000000c3ba98
> [   50.379783] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [   50.380810] [<ffffffff808e27be>] lock_is_held_type+0x78/0x14e
> [   50.381477] [<ffffffff8003e850>] __might_resched+0x26/0x22c
> [   50.382006] [<ffffffff8003ea92>] __might_sleep+0x3c/0x66
> [   50.382477] [<ffffffff8002324e>] get_signal+0xaa/0x912
> [   50.382947] [<ffffffff80005368>] do_notify_resume+0x82/0x434
> [   50.383839] [<ffffffff80003bec>] ret_from_exception+0x0/0x10
>
> Fixes: 3c4697982982 ("riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT")
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> ---
>  arch/riscv/kernel/entry.S | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..f4d23995a4f1 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -370,16 +370,20 @@ resume_kernel:
>
>  work_pending:
>         /* Enter slow path for supplementary processing */
> -       la ra, ret_from_exception
>         andi s1, s0, _TIF_NEED_RESCHED
>         bnez s1, work_resched
>  work_notifysig:
> +#ifdef CONFIG_TRACE_IRQFLAGS
> +       call __trace_hardirqs_on
> +#endif
> +       la ra, ret_from_exception
>         /* Handle pending signals and notify-resume requests */
>         csrs CSR_STATUS, SR_IE /* Enable interrupts for do_notify_resume() */
>         move a0, sp /* pt_regs */
>         move a1, s0 /* current_thread_info->flags */
>         tail do_notify_resume
>  work_resched:
> +       la ra, ret_from_exception
>         tail schedule
>
>  /* Slow paths for ptrace. */
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
