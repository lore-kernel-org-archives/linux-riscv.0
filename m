Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2426C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:22:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409F661969
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409F661969
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kQCl1jwXp7DEu0g2RGOFM/eJ0UuQmAkdvFMGvY84DHY=; b=SW0N+PmKWzTMhLfwZQIZPsu4B
	JT6Z2FW4izQTBsY9gaUevBNVXrGy3sgYhLAF+ufBXefhtc7Y05vI3kdO369SKvvBeHXzeWs1ngsqQ
	M54g+ID8PIXuYl62MjiWg7TjFWtbBE/6f+cO5bcfTlyJuEOnFfsLCD2shEesX+Z5tdVuXFFsiVrr3
	fuf3kbt7hZFsEJ50HKaCr154GUMTyS9S5IRLJau8HYJuxYtd1xpf0Yn15gBuKxSjwnZOvlpdGHNSJ
	0zCS1UKVRVba+v38ghtaenvkmVojVtWikGbUQGYGz2pss9HB0NfHeV20+aayU/u8lKZmZ+ClOmach
	IqG7bzUEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAZr-003Bz8-I6; Tue, 30 Mar 2021 09:22:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAZn-003ByH-25
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 09:22:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF7236024A;
 Tue, 30 Mar 2021 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617096137;
 bh=uDfFMsetRa84Y+TVUQV9pEFfOKCsf9PIepiuOFlvhUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ItwDsKq5s0Tqu1E4H9sjbwyjediMnllkizLTx8/OluZVtW+Sm7d9XzHOe3dZ/upKK
 wW9JsfyqBD9R3oCMJbNrXHjINjeXH8Z2xu9Kw1QjJltIChjlCGZDu1r026hTmYDjI+
 EILJTAqKPOsRPZK+yXImN3nLz4aiXT1Zyzg+Usu16nwjiVbFuP7g0Um38UsMs5OBsV
 nt2kH+eoGaM5HY0lUgvP/t7oSmGwXC60yZMYry7MZmkdPfm7zkqHH0mTJuXoIMtbvT
 4y8xKB3K4iG9P1H+L+h0wLnhaqgsVUQ7SnmE9NhcArki9AlIsUD+ogyPZ3p/s2eRLH
 UAi0ymSJGXqZA==
Date: Tue, 30 Mar 2021 18:21:56 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] samples/kprobes: Add riscv support
Message-Id: <20210330182156.d2cd8680e99cfe1a75068732@kernel.org>
In-Reply-To: <20210330020416.129505e6@xhacker>
References: <20210330020416.129505e6@xhacker>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_102219_406182_D639A00A 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, 30 Mar 2021 02:04:16 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add riscv specific info dump in both handler_pre() and handler_post().
> 

Looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks!

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  samples/kprobes/kprobe_example.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
> index 331dcf151532..c495664c0a9b 100644
> --- a/samples/kprobes/kprobe_example.c
> +++ b/samples/kprobes/kprobe_example.c
> @@ -47,6 +47,10 @@ static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
>  	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
>  		p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
>  #endif
> +#ifdef CONFIG_RISCV
> +	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, status = 0x%lx\n",
> +		p->symbol_name, p->addr, regs->epc, regs->status);
> +#endif
>  #ifdef CONFIG_S390
>  	pr_info("<%s> pre_handler: p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
>  		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
> @@ -80,6 +84,10 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
>  	pr_info("<%s> post_handler: p->addr = 0x%p, cpsr = 0x%lx\n",
>  		p->symbol_name, p->addr, (long)regs->ARM_cpsr);
>  #endif
> +#ifdef CONFIG_RISCV
> +	pr_info("<%s> post_handler: p->addr = 0x%p, status = 0x%lx\n",
> +		p->symbol_name, p->addr, regs->status);
> +#endif
>  #ifdef CONFIG_S390
>  	pr_info("<%s> pre_handler: p->addr, 0x%p, flags = 0x%lx\n",
>  		p->symbol_name, p->addr, regs->flags);
> -- 
> 2.31.0
> 
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
