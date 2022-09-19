Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D699ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZyI9RhPXFHitwkyeLvgOYm5h57m5+iVCxiWyB8PZNw=; b=tNEpHsAZMz9T1s
	CTM985Fif7jneCZ7DOEu5Hv82vvBHIpZu50zHtyuS6ThSCaMR2Bci5la0mH3xMfQYcFCfi74iXfhu
	nUCzeOrx7tBy6RgooodKKFgz3sMUcE/JQEX46Ik+dAndG3/NHWs4HX0WYO3rypEZ3kSAKyn0ta6Xv
	LQJ8OcchNLr52EotPodn6bo8RbhwUpESVK/QfWQtmZv896sAsjgpwqWSoqiyLop5+6horEkCuEO7H
	DtrZb+G2uEOOUTqCS9Peqx5LsRF2kCAnB8KUBzD9tVX9pMveeR2DV/ntSIXXIoUiWLSWgNOnUPqDs
	ZjVnwMlszAeaCdtyRp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaFQk-00BcpO-Fm; Mon, 19 Sep 2022 11:59:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaFQe-00BcnO-9m
	for linux-riscv@bombadil.infradead.org; Mon, 19 Sep 2022 11:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mNJykaajNGSUnYywN9R7hRPV8WnJzioOZeSYuIwMLL8=; b=v4IYEVZn1r6bcOev3ZKb2JWvyz
	OsrznONVcuJ76ILzsbOsHS9mT3IChSB+4qYaOLtmdSzT2DAz86f5FH3/A6eRcNsxf7s5pTaTdvdgG
	fXMa4qDQRbbMJsX5XaH//Kf3VJUjEAuVI4LGU6QQL7rrnD2B9PQPJGGPNmb7cdW7fpglGcsTGyNFU
	66eCvvgOih3TqaYkKrsyze0xGc034DPpaSnTkHjvFcmW3DnIuAqpPH8yworjJXq0Bq1ZlRJac/s03
	W3kVntIhxuOId3a0QtXfXvODTWhRG7OV5OrT2+uRQkQQwAghXZyRuH6u+3BU48Q0z946P4nBwI+4l
	Xwq2MAIA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaFQU-004fuR-3e; Mon, 19 Sep 2022 11:59:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 26912300202;
	Mon, 19 Sep 2022 13:58:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 39FC02BA49034; Mon, 19 Sep 2022 13:58:53 +0200 (CEST)
Date: Mon, 19 Sep 2022 13:58:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mark.rutland@arm.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 06/11] entry: Prevent DEBUG_PREEMPT warning
Message-ID: <YyhZfUi17TEaOLWv@hirez.programming.kicks-ass.net>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-7-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918155246.1203293-7-guoren@kernel.org>
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

On Sun, Sep 18, 2022 at 11:52:41AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When DEBUG_PREEMPT=y,
> 	exit_to_user_mode_prepare
> 	->tick_nohz_user_enter_prepare
> 	  ->tick_nohz_full_cpu(smp_processor_id())
> 	    ->smp_processor_id()
> 	      ->debug_smp_processor_id()
> 		->check preempt_count() then:
> 
> [    5.717610] BUG: using smp_processor_id() in preemptible [00000000]
> code: S20urandom/94
> [    5.718111] caller is debug_smp_processor_id+0x24/0x38
> [    5.718417] CPU: 1 PID: 94 Comm: S20urandom Not tainted
> 6.0.0-rc3-00010-gfd0a0d619c63-dirty #238
> [    5.718886] Hardware name: riscv-virtio,qemu (DT)
> [    5.719136] Call Trace:
> [    5.719281] [<ffffffff800055fc>] dump_backtrace+0x2c/0x3c
> [    5.719566] [<ffffffff80ae6cb0>] show_stack+0x44/0x5c
> [    5.720023] [<ffffffff80aee870>] dump_stack_lvl+0x74/0xa4
> [    5.720557] [<ffffffff80aee8bc>] dump_stack+0x1c/0x2c
> [    5.721033] [<ffffffff80af65c0>]
> check_preemption_disabled+0x104/0x108
> [    5.721538] [<ffffffff80af65e8>] debug_smp_processor_id+0x24/0x38
> [    5.722001] [<ffffffff800aee30>] exit_to_user_mode_prepare+0x48/0x178
> [    5.722355] [<ffffffff80af5bf4>] irqentry_exit_to_user_mode+0x18/0x30
> [    5.722685] [<ffffffff80af5c70>] irqentry_exit+0x64/0xa4
> [    5.722953] [<ffffffff80af52f4>] do_page_fault+0x1d8/0x544
> [    5.723291] [<ffffffff80003310>] ret_from_exception+0x0/0xb8
> 
> (Above is found in riscv platform with generic_entry)
> 
> The smp_processor_id() needs irqs disable or preempt_disable, so use
> preempt dis/in protecting the tick_nohz_user_enter_prepare().
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  kernel/entry/common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index 063068a9ea9b..36e4cd50531c 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -194,8 +194,10 @@ static void exit_to_user_mode_prepare(struct pt_regs *regs)
>  
>  	lockdep_assert_irqs_disabled();

    Observe ^^^^

>  
> +	preempt_disable();
>  	/* Flush pending rcuog wakeup before the last need_resched() check */
>  	tick_nohz_user_enter_prepare();
> +	preempt_enable();

This makes no sense; if IRQs are disabled, check_preemption_disabled()
should bail early per:

	if (irqs_disabled())
		goto out;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
