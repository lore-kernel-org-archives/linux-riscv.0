Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1157C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF9G5t57OE7MB2m/o2+9baiirqOija8whVjkQk6xVu8=; b=El1pjgl0/KiM20
	7qCwa4QvSljT3ft4ascbv66RZ4wtIfyUkvQXUr/lLJbLa/LiYjZ2OZfdFpIc7G46Ub6EYqIgiW90S
	fFAw2XG2fUSaYHtmZJtQHoColjjQReaEwp6F5PJm7Y1a5sA3bJUqwOrPHa+NUobhhz/fti9MbyfVt
	GvuEL8tLgnpIyuLD3fbzQ0NGjftMwFr2674/5b1V7cipjLo6IrepTjQG3IuX6q1/OOL5aY/1zq6TF
	aBgwkI9dmR7wCpSzuaHBj9Jj9A9VUk8RDotCsFrfXEWnooqorvXCudGwpOO0jtKi0ekR93vwt0AI8
	fWvVgNpk+Wfgh/63rPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybIf-009xeL-1w;
	Thu, 02 Nov 2023 17:16:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybIc-009xdx-2j
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 17:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 54AC1B81D65;
	Thu,  2 Nov 2023 17:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D15DC433C7;
	Thu,  2 Nov 2023 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698945363;
	bh=6ip5jFLSC8FCEpUg6sXdVCbhK8FxlRCvu6v+mXe5tC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGpmFZXqcQIJxMLF7aQ7gT99CXh+U5EXZK9z8JUwHhHh6gJkywVuIZWbIMa4arUz2
	 r67ecd3kf5Gi/+P7FUfUVDfHI5Xg0OcluXYf2iuKtreoR4BQRuHHfo/w+xgnZzpemn
	 uh8cCps7Pa7abwlXrzGwzWi+tfUIk+JZcTjTylxjGDTItgrWyEy/7TOcKWXdK9fN6z
	 Ag4pK/61zG4qacHPZPUg6JO7tZNg30r3Ju3l9OmVxLOthOfyavmPv4kZ2tHs56Wx+e
	 oTJegzAu+P5Xc+udc2qfvs+NsUncBY5rFXT1nUVrfZcSVDZG7rGPW+Y5gABmA2Lz2I
	 L21tHLBUBtLVQ==
Date: Fri, 3 Nov 2023 01:03:47 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <ZUPWc7sY47l34lV+@xhacker>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
 <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102155423.SyuAibSe@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_101607_057095_BF2E42A9 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, Nov 02, 2023 at 04:54:23PM +0100, Sebastian Andrzej Siewior wrote:
> On 2023-11-02 12:31:15 [+0000], Conor Dooley wrote:
> > [    1.130384] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> > [    1.130418]
> > [    1.130414] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
> > [    1.130971] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
> > [    1.130978]   alloc_workqueue+0x96/0x6de
> > [    1.131005] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
> > [    1.131010]   kmem_cache_init_late+0x1c/0x36
> > [    1.131038] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+0x12/0x1a
> > [    1.131046]   start_kernel+0x204/0x7e6
> > [    1.131082] irq event stamp: 822
> > [    1.131071] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1de/0x790
> > [    1.131093] hardirqs last  enabled at (821): [<ffffffff80bd75b0>] default_idle_call+0xfa/0x152
> > [    1.131111] [<ffffffff800fd3a0>] generic_smp_call_function_single_interrupt+0xe/0x1a
> > [    1.131124] hardirqs last disabled at (822): [<ffffffff80bd52a0>] do_irq+0x16/0xa6
> 
> Without the patch check_unaligned_access_boot_cpu() ->
> check_unaligned_access() is okay. The SMP/IPI variant (the patch imho)
> is bad. There must be no memory allocation from IRQ-off region - the
> smp-function call in this case.
> 
> Would it be okay if I delay it until this solved? If you have something,
> then I could apply the two patches plus the fixup for this.
> 

Hi Sebastian,

you can delay merge the series. I will check it

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
