Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C3CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLq64ye+TMgLgoAIlMXwZz96C8LCC0T5TcN4MkmsJSk=; b=vOoK65EmZG4bHp
	+6z6iQGP0BlJZaU2RiefAMBBgwIRNrSgHd86edFMGDgB/lXc6mBH/gvuwJMVbhIWsqxSKqBGQjPEq
	V6HRwuWGuRFPGp57O9I7rXoFi43/QPI+UpWiJbQf2GJjIAYHSRj20wDS8vqmTwjpjajRRzhAsxXKE
	JKCpltrtPQ6FfbKTFLJFFCtjw+mQfELnYnPKN700FqsYYkFLrHkLRz/137+2rVzKqnStpZ9swCR1z
	zt+GKaA8n51pvXHnxiSIAZ0zKRh1CZtMtp5sQqofi8/5YdglVUMOddC8hDq6DyPM6JKA4ilfTbQ/d
	qBtRcI9p3Ci6O7fpXikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwUS-006BxP-2A;
	Mon, 08 Jan 2024 20:44:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwUP-006Bwt-1W
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 20:44:54 +0000
Date: Mon, 8 Jan 2024 21:44:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1704746689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFJeHLw9GqQjgm3FgM7p7sOy93Z0Ypb7HjJTBpJG3O4=;
	b=bzt7U+/W2wueF3ZyEvkRbDnY9Xe1TPDS/cu37+INvXFswbDOZ9DJAmKTgBNj7O1TtS7xbP
	q5nJSKzZ69fjbrX+nE9v46voHIVDbS7bV67LO5YvJ4t2b2gZREQOa3iUiVtjtsvZh4Rs0l
	3lVTImw/fw98wwmHPAk1uhlhkjirXUOAJ0ytCr8YY6iSi1bxo89GPmuUKEvKEMschzoJ4U
	crp1o5Ar7GKTV+nkBoNy2md9a4fPtpYJCloyUVVDKg9bPGzv2YfaOWSTjlreHFOwnhe4GO
	qURQz+qCcAKfd2uBaGmeKRv/v+6LUQyvhAeIgNG9oRy5yW4F/dhHhThW11j5ZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1704746689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFJeHLw9GqQjgm3FgM7p7sOy93Z0Ypb7HjJTBpJG3O4=;
	b=UkgPg0VuU9/DJID5oFyG5SAC8mwxbwH9zoayBjaH1aPk1owx29WmNSIHFu5RQYR6X7Uq9u
	sC2u8FaismFOZzCQ==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng
 Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
Message-ID: <20240108214448.025977ac@namcao>
In-Reply-To: <20240108214346.5fd93127@namcao>
References: <20240108193640.344929-1-alexghiti@rivosinc.com>
	<20240108214346.5fd93127@namcao>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_124453_655344_34CA20B8 
X-CRM114-Status: GOOD (  16.57  )
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

On Mon, 8 Jan 2024 21:43:46 +0100 Nam Cao <namcao@linutronix.de> wrote:

> On Mon,  8 Jan 2024 20:36:40 +0100 Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> > Allow to defer the flushing of the TLB when unmapping pages, which allows
> > to reduce the numbers of IPI and the number of sfence.vma.
> > 
> > The ubenchmarch used in commit 43b3dfdd0455 ("arm64: support
> > batched/deferred tlb shootdown during page reclamation/migration") that
> > was multithreaded to force the usage of IPI shows good performance
> > improvement on all platforms:
> > 
> > * Unmatched: ~34%
> > * TH1520   : ~78%
> > * Qemu     : ~81%
> > 
> > In addition, perf on qemu reports an important decrease in time spent
> > dealing with IPIs:
> > 
> > Before:  68.17%  main     [kernel.kallsyms]            [k] __sbi_rfence_v02_call
> > After :   8.64%  main     [kernel.kallsyms]            [k] __sbi_rfence_v02_call
> > 
> > * Benchmark:
> > 
> > int stick_this_thread_to_core(int core_id) {
> >         int num_cores = sysconf(_SC_NPROCESSORS_ONLN);
> >         if (core_id < 0 || core_id >= num_cores)
> >            return EINVAL;
> > 
> >         cpu_set_t cpuset;
> >         CPU_ZERO(&cpuset);
> >         CPU_SET(core_id, &cpuset);
> > 
> >         pthread_t current_thread = pthread_self();
> >         return pthread_setaffinity_np(current_thread,
> > sizeof(cpu_set_t), &cpuset);
> > }
> > 
> > static void *fn_thread (void *p_data)
> > {
> >         int ret;
> >         pthread_t thread;
> > 
> >         stick_this_thread_to_core((int)p_data);
> > 
> >         while (1) {
> >                 sleep(1);
> >         }
> > 
> >         return NULL;
> > }
> > 
> > int main()
> > {
> >         volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
> >                                          MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> >         pthread_t threads[4];
> >         int ret;
> > 
> >         for (int i = 0; i < 4; ++i) {
> >                 ret = pthread_create(&threads[i], NULL, fn_thread, (void *)i);
> >                 if (ret)
> >                 {
> >                         printf("%s", strerror (ret));
> >                 }
> >         }
> > 
> >         memset(p, 0x88, SIZE);
> > 
> >         for (int k = 0; k < 10000; k++) {
> >                 /* swap in */
> >                 for (int i = 0; i < SIZE; i += 4096) {
> >                         (void)p[i];
> >                 }
> > 
> >                 /* swap out */
> >                 madvise(p, SIZE, MADV_PAGEOUT);
> >         }
> > 
> >         for (int i = 0; i < 4; i++)
> >         {
> >                 pthread_cancel(threads[i]);
> >         }
> > 
> >         for (int i = 0; i < 4; i++)
> >         {
> >                 pthread_join(threads[i], NULL);
> >         }
> > 
> >         return 0;
> > }
> > 
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> > Tested-by: Jisheng Zhang <jszhang@kernel.org> # Tested on TH1520  
> 
> Before:
>     real 0m36.674s
>     user 0m0.173s
>     sys  0m36.493s
> After:
>     real 0m18.016s
>     user 0m0.125s
>     sys  0m17.885s
> 
> Tested-by: Nam Cao <namcao@linutronix.de>

I forgot to mention: this is for Starfive's Visionfive 2 board.

Best regards,
Nam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
