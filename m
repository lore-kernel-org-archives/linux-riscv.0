Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B7CC38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 00:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHyaOrVklCb7ykBW39GvRSn+XZhep9Pnrsx97CTziyE=; b=rrOyScXT7C/5k6
	AUMh3oBczq8vjRTWvQAW5cd9B6qp/k0OXEjRMV8CkX1gaFm9kGbQMknMCg42UIYmr4EPEL44wlvOD
	gneWEqLDSfDTdCOjloeOMJiaBxI03ffTDy7V0NzwMrBDS7jR+UbT/Cwv1/h90GQFtc6iS9JMgFP3r
	YSKCCbKsaLUdSeVXoLOhrgk0ZNjdpMu5bHtkhD7r6XFnQRL5eX/LsPcQl5TLnAfXsT/io92SII7Qd
	Ek53a+AGZLnQoPofXrD4MuFNtHoHySRCkiYQidpJAicC3xjnekt2sUyj4Gtk52dHR/+D6yxGWgqTJ
	8NV8TppHdpd0Yr/wt1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oovns-00AOaj-N1; Sun, 30 Oct 2022 00:03:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oovnq-00AOY4-M5
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 00:03:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC82EB80D78
	for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 00:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B01C433D7
	for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 00:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667088226;
	bh=N8BoS/M4L7MN742ZawYJ9PH0fLN3a+oJBqMQwatxgWA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R67YY1Gav64QhlE6uoqvYWw7WVMiCUgujQzsj0WitIB76bL2THVR2Vk6/2TpfFrqa
	 puQfQpLcRiO3N2pF7tAfk4IAU/1cXWQR5cDL3iptfwWThnbaPT4nb6iZLz5Khh33WB
	 fQEaxIlijK4X5wAnptBRF85szuartiKcMyeW7lVyLwBByFPllysiXZOC1jwLZG2o1G
	 Cxw7hNLJ6YchlUK1AUfVbWGHWGTrq+V88iMgPdICTr+UwrA+XRbRJzLHE4ebpXnAym
	 gqNtA/y9epgwGn/g5AhbpooiKl0nln5US2i5eTPUH7AyK5dVxNYSFEnM9sUTQh31wI
	 FdGdWtT10S7XA==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13bd2aea61bso10251809fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 17:03:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf0ClNPBO6M63zLpIG3sW4Rv3mF1/Azy3APRhihv+i44cOYBa+YJ
	7h05sL4NYO8hOSowEt0Sh9S/BqMaLdvx++6x1Zg=
X-Google-Smtp-Source: AMsMyM7u7FnY5J/Sn92YX/tmBWBfNwC2I1fvd6MSTja2mLLJiocBWd2dIHfYQgMB6ADsv+9K64aQBQL/1+HvAwmdW+c=
X-Received: by 2002:a05:6870:64a1:b0:13c:d09d:79f9 with SMTP id
 cz33-20020a05687064a100b0013cd09d79f9mr830568oab.112.1667088225682; Sat, 29
 Oct 2022 17:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221029113450.4027-1-jszhang@kernel.org>
In-Reply-To: <20221029113450.4027-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Oct 2022 08:03:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSqUtU77HvEsQi8+akod4Fn1pEe2REH2nae39dK2VsacA@mail.gmail.com>
Message-ID: <CAJF2gTSqUtU77HvEsQi8+akod4Fn1pEe2REH2nae39dK2VsacA@mail.gmail.com>
Subject: Re: [PATCH] riscv: process: fix kernel info leakage
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_170350_890217_0116702D 
X-CRM114-Status: GOOD (  19.08  )
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

On Sat, Oct 29, 2022 at 7:44 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> thread_struct's s[12] may contain random kernel memory content, which
> may be finally leaked to userspace. This is a security hole. Fix it
> by clearing the s[12] array in thread_struct when fork.
>
> As for kthread case, it's better to clear the s[12] array as well.
>
> Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>
> Previously, it's one of the series of "riscv: entry: further clean up
> and VMAP_STACK fix". This is a fix, so I move it out of the series and
> send it separately
>
>  arch/riscv/kernel/process.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..52002d54b163 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -164,6 +164,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>         unsigned long tls = args->tls;
>         struct pt_regs *childregs = task_pt_regs(p);
>
> +       memset(&p->thread.s, 0, sizeof(p->thread.s));
Tested-by: Guo Ren <guoren@kernel.org>

> +
>         /* p->thread holds context to be restored by __switch_to() */
>         if (unlikely(args->fn)) {
>                 /* Kernel thread */
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
