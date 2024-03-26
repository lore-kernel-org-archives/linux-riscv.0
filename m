Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F2C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HC1A0fwxnEpK1Q7F3ErR5aSrU4xAt07vvSBPekXPimo=; b=UV78ssXjE27NCX
	Yz3V5R0CL76ez8aSCcJP3oAwrgXVu7wmHaLcC2OSdqbvGRgtRnYpIl2jnguTXW9lYBq3zVqPAgoTG
	NG9e7Z4oHETF2LlnxaIgJUGLp8ImbEEX3GzT5MHgDvLCL2WjPdUMgLZjuYdlndMUDSJRB69AWfKew
	EpuefI9DpVmQ4hcxJ6AIjPu2SLzd193k58FOwkr0Sq+TiwMsYHCn3hPdWn6EIjf1ei9WFbOXuiBBd
	Cx81S9KdHzKZuOO6QHrxlUDDVp8qvOAVAoOJyly9BBRufRpCxZJoHZRdr58TIyq34hynA+08sCVQy
	o8z1KuoHWxNnfOa+UTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1round-00000002VlE-1CMY;
	Tue, 26 Mar 2024 00:36:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rounZ-00000002Vjr-2I54
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 00:36:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10B2BCE12CD;
	Tue, 26 Mar 2024 00:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B26C433C7;
	Tue, 26 Mar 2024 00:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711413374;
	bh=xE992nxnooOSMpHEL8KfQyXIz2aD8fuvJwriFo5N6/c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=H1VRJNiNWYhI+4V6opqODUgwJ+FQYQs04FpCcw+FrvrHpJ05AeCr3C9moPTNC7M2M
	 m1KITlz+y004QgwfaB4Tf5lbe9P+5n6ezFqDLiF1oH5XAVlR5AadOCOqYMyZ9htdDe
	 qnBZk3yrBc4aLzBsODzKiQ+xzoWFTMUK1tlLQ9EuS4kZgqepcIOTs4jDMcd8zVhNk1
	 ge7eWjVY6BzZo/JezXcB3/Qcr95DG9OQdU3clrvSKh/sJT80q9ZOZHx0nqLPDxVf5F
	 EFyJwk+5J96QRWGkPnlA4Lcnv7U7EEwt6oMEHw2KFLwijoDe6E0+6nHWPsLh2f4CvW
	 /2K4kfpHeS+gw==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 02:36:10 +0200
Message-Id: <D039EOFEEV74.3U6K3816DEQ28@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Masami Hiramatsu" <mhiramat@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <D036AJAEAOUF.34494O217N0RI@kernel.org>
 <20240326085037.0142d7dadc702e3b49a3251e@kernel.org>
In-Reply-To: <20240326085037.0142d7dadc702e3b49a3251e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_173617_774319_BD43DAE7 
X-CRM114-Status: GOOD (  20.02  )
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

On Tue Mar 26, 2024 at 1:50 AM EET, Masami Hiramatsu (Google) wrote:
> On Tue, 26 Mar 2024 00:09:42 +0200
> "Jarkko Sakkinen" <jarkko@kernel.org> wrote:
>
> > On Mon Mar 25, 2024 at 11:55 PM EET, Jarkko Sakkinen wrote:
> > > +#ifdef CONFIG_MODULES
> > >  	if (register_module_notifier(&trace_kprobe_module_nb))
> > >  		return -EINVAL;
> > > +#endif /* CONFIG_MODULES */
> > 
> > register_module_notifier() does have "dummy" version but what
> > would I pass to it. It makes more mess than it cleans to declare
> > also a "dummy" version of trace_kprobe_module_nb.
>
> That is better than having #ifdef in the function.
>
> > 
> > The callback itself has too tight module subsystem bindings so
> > that they could be simply flagged with IS_DEFINED() (or correct
> > if I'm mistaken, this the conclusion I've ended up with).
>
> Please try this.
>
> -----
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 70dc6179086e..bc98db14927f 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -2625,6 +2625,7 @@ static void remove_module_kprobe_blacklist(struct module *mod)
>  	}
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Module notifier call back, checking kprobes on the module */
>  static int kprobes_module_callback(struct notifier_block *nb,
>  				   unsigned long val, void *data)
> @@ -2675,6 +2676,9 @@ static int kprobes_module_callback(struct notifier_block *nb,
>  	mutex_unlock(&kprobe_mutex);
>  	return NOTIFY_DONE;
>  }
> +#else
> +#define kprobes_module_callback	(NULL)
> +#endif
>  
>  static struct notifier_block kprobe_module_nb = {
>  	.notifier_call = kprobes_module_callback,
> @@ -2739,7 +2743,7 @@ static int __init init_kprobes(void)
>  	err = arch_init_kprobes();
>  	if (!err)
>  		err = register_die_notifier(&kprobe_exceptions_nb);
> -	if (!err)
> +	if (!err && IS_ENABLED(CONFIG_MODULES))
>  		err = register_module_notifier(&kprobe_module_nb);
>  
>  	kprobes_initialized = (err == 0);

OK, thanks for the suggestion WFM.

I'll give this also a spin with VisionFive2 RISC-V SBC before sending
v6.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
