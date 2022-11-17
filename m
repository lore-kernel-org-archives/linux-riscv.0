Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7C2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 01:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TYqjt6gCoxgXcnvCl3Kz2poB5vWxHXTlWzjMLrRtag=; b=PCoRGx02CW/pgG
	XOUcWYNJkBY1wau+XJhS+3ggxmEzq6eFFOdFL29lMMRXysLMTxHmESUnmRvYNx7SLWT7asFFBXKXM
	xCLXvl7D70kx+1RNVpBAnBxIkiVqgwD7YORpCxCt6bfwLd+if/h5ZElDPHEnbWHKBfSYPCGGAcEoI
	NQgNiB/RPZGllTN7f41oyqbc7UXHfBBo3G9XU40dRLZOmIjpKx1x5mjbzdxez85OSvYgA2dDMHz4/
	TnMPqpjDFD/y8YTsKwxZ4X0TqzKmjdesRSz4x48id2IqMyqgwUnBxJLx1zZPiJqugAM6jL9kZP8aY
	9AxIqf3pWWC0GhP/qUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovTes-009K6s-10; Thu, 17 Nov 2022 01:25:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovTeo-009K4m-8D
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 01:25:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 75F47CE1D24;
	Thu, 17 Nov 2022 01:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115AEC433D7;
	Thu, 17 Nov 2022 01:25:24 +0000 (UTC)
Date: Wed, 16 Nov 2022 20:25:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mingo@redhat.com, sfr@canb.auug.org.au, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, liaochang1@huawei.com, Peter Zijlstra
 <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 2/8] riscv/kprobe: Allocate detour buffer from module
 area
Message-ID: <20221116202521.6c528955@gandalf.local.home>
In-Reply-To: <20221106100316.2803176-3-chenguokai17@mails.ucas.ac.cn>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
	<20221106100316.2803176-3-chenguokai17@mails.ucas.ac.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_172534_528188_B8C60594 
X-CRM114-Status: GOOD (  12.79  )
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

On Sun,  6 Nov 2022 18:03:10 +0800
Chen Guokai <chenguokai17@mails.ucas.ac.cn> wrote:

> @@ -84,6 +85,30 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  }
>  
>  #ifdef CONFIG_MMU
> +#if defined(CONFIG_OPTPROBES) && defined(CONFIG_64BIT)
> +void *alloc_optinsn_page(void)
> +{
> +	void *page;
> +
> +	page = __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR,
> +				    MODULES_END, GFP_KERNEL,
> +				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +	if (!page)
> +		return NULL;
> +
> +	set_vm_flush_reset_perms(page);
> +	/*
> +	 * First make the page read-only, and only then make it executable to
> +	 * prevent it from being W+X in between.
> +	 */
> +	set_memory_ro((unsigned long)page, 1);
> +	set_memory_x((unsigned long)page, 1);

FYI, the above combination is going to be going away:

  https://lore.kernel.org/all/Y10OyLCLAAS6rsZv@hirez.programming.kicks-ass.net/

-- Steve


> +
> +	return page;
> +}
> +#endif
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
