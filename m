Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FE5FA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 19:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rqm/OX3vv0zRanie5FtpTr4A/wb+1fVbkOPjeQDSTH4=; b=jNhPAiedhWbI5o
	+BM4d7s47Nb58ZTiGfJB0SJuBC2UHvYOZilbbDMiQYerhhfdidxf/hISFDjFeW8BHq2UXyLGAb5mB
	s3h6m4do5gX5U1NLxCoGjtXo8GqS3jZMmigwW0lO7PumD3PzsfQb2DrsCjoERmORWT4FZ4t5/1EiP
	+qWfun7SQi3SmxFYCddUvxbb9IQoZtYNcPSVkHTzgMrMoJucKQBscyp5TTuCh6ZDKsNj0ekY/2Kpi
	nTJSip+LnBt+EyOFqJFZqeCag7gEeZ18V7QTYJenjGuCA4fdxNmHno074E/qmiVDCn0N1ILQyNPTV
	HngrkIPZaqdrVOk/9D5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaEj-00E92B-57; Mon, 31 Oct 2022 19:14:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaEf-00E91S-NK
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 19:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAFF761425;
	Mon, 31 Oct 2022 19:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AB9C433C1;
	Mon, 31 Oct 2022 19:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667243651;
	bh=80lqoPPKDQ+glCPrCeg2E0gbOPazZmUenJWu7c2v11s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XixhbcpmCWhV7gKONpioTcsPjwo2dubUfERuxu+IC1URA6AThPGAW1QT8pM76DbZc
	 TuL61Mc0yVscRfNbtfO7fxI2Aeel+eKLGOvfmRdbYLHIGrGTsoeXghxXtjbOvNFzwC
	 u+bMsgr6u06r/u3PMYjW6EHQVf+L+e+vKAE1wkqeIsGMjL0097ckG9WYjbZslkJieL
	 l33yQRsao15+j07391m/ub1t8lg3ZkhsAr8cyy/XYlmfFewsWa3btuFAAmuSZ0dEZJ
	 PWjuZiPd7Kf3jFMP3ArpS0tEdzqiH1qeD/K0zn7t9PONKFzB4oqXhYVD+OkAlzW5/a
	 TCEYD90sRgRWA==
Date: Mon, 31 Oct 2022 19:14:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: fix kernel info leakage
Message-ID: <Y2AefvfMgZDoQUto@spud>
References: <20221029113450.4027-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029113450.4027-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_121413_839214_1E19C38A 
X-CRM114-Status: GOOD (  18.15  )
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

On Sat, Oct 29, 2022 at 07:34:50PM +0800, Jisheng Zhang wrote:
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

Should this not be carrying a R-b from Guo Ren from that series?
https://lore.kernel.org/linux-riscv/CAJF2gTSdVyAaM12T+7kXAdRPGS4VyuO08X1c7paE-n4Fr8OtRA@mail.gmail.com/
> 
>  arch/riscv/kernel/process.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..52002d54b163 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -164,6 +164,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  	unsigned long tls = args->tls;
>  	struct pt_regs *childregs = task_pt_regs(p);
>  
> +	memset(&p->thread.s, 0, sizeof(p->thread.s));
> +
>  	/* p->thread holds context to be restored by __switch_to() */
>  	if (unlikely(args->fn)) {
>  		/* Kernel thread */
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
