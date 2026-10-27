Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106AF606A31B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YRAZ6ov6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NGCBUMdX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rXn4b5ERiMoACOAnn+bXqrPbrb0trlF0q51P66OJRtw=; b=YRAZ6ov6OB5Vn238EgBHEIdq3m
	0z50aSZxPWNS0qv5DDrgj97VHtbY2m+cFtTvGvSKZOvIdoF6dscfRur2vG0cWr+KgPSdEz/4n8qks
	PK0/C/ZAmoBId/TToiTBJzqF3dtJZRhILPeaqh2z/lblrKI496wP9r6ofwCF+SJo4CsdD1rK2RaUA
	clBDuSv0rVqAsSbURyQxH4Yz8XHY583ZlmIPrWCBu0D3QQZkSdzngi6WfWgNLZU935UcpOoAxAfGT
	0iiNOW7C6DXaxnOWXqQb0sHjPV2QfvVyrwfpz9t5TIB1wSf1eoh8b5KLPL2YsxxlLQvX8TWWtLYfp
	SSzcMTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe6u-00000004GOc-0Lwm;
	Tue, 27 Oct 2026 10:08:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe6s-00000004GNz-0zoS;
	Tue, 27 Oct 2026 10:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qiaO6NvHT131FFl120scy8yJd6FUUFlCG1Hv9v54ahE=; b=NGCBUMdXdJFVTJj/z7nivuoX+x
	CSbKmBIGQqxpLcFazgufw9fMYp0JyrILLrWQDML7QuHtBndH792b+RdtE3kRq9V6oT2HgvEso/rad
	JYDY8nBxqwqzCP5uDMP88K/QyIf1xMX38sEUkKKWpEpcHPOe1ZYVEoaIoyM4RxKwd+rXOdDhKw9JB
	w5W3VXGbtLBDiS3xEhiiLGnyvycGD/C8FQOgfy+JyKc+Oh0fVP6DNAKuwICnx9RGFlU+M28hW+hE7
	CU48hgn6IuCXWODpk2UPqQtPHcKrWwzqOso/g5h3RX/7JsDBEIWEGbm6yW/c0q/k5lFCQBzEl60Ng
	ITd03XIA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe6m-0000000CuBU-48NO;
	Tue, 27 Oct 2026 10:08:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08E3A300DB9; Tue, 27 Oct 2026 11:08:44 +0100 (CET)
Date: Tue, 27 Oct 2026 11:08:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Down <chris@chrisdown.name>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS
 is disabled
Message-ID: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name>
 <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 02:36:09PM +0800, Chris Down wrote:
> With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
> CPU lacks pointer authentication. scs_release() already checks
> scs_is_enabled() before it looks at the shadow stack since commit
> 9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
> schedule_debug() does not.
> 
> With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
> unused shadow stack on every context switch. That is harmless right now,
> but the check is redundant and costs a load from an unrelated cache line
> in __schedule().
> 
> So, let's guard on scs_is_enabled(). It is a static branch, and it folds
> to true when CONFIG_DYNAMIC_SCS is not set.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158de..fc269fd10192 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
>  	if (task_stack_end_corrupted(prev))
>  		panic("corrupted stack end detected inside scheduler\n");
>  
> -	if (task_scs_end_corrupted(prev))
> +	if (scs_is_enabled() && task_scs_end_corrupted(prev))
>  		panic("corrupted shadow stack detected inside scheduler\n");

How about you push that scs_is_enabled() into task_scs_end_corrupted(),
this makes less noise here, and also keeps the next patch saner, no?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
