Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB58C52D7D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jR5V3AC6tBpDhPbLHfAbHI0QpM36hZfg56LEJZpusQ=; b=rkZn2KMBx0pS3p
	OnO8t0OGvDCtvhtPsYGbJM40PtUvWnVegFVgACE5xXTupN1wD6KUT0U4UIXvW4id1elgJqmNpREr+
	SJNH/l70Dv6dO4S6V/CaZ6S331Et2ROVqehalBJDXckvSShk8OZTJ450ZjZsiXuGJ4T7pMCQ1QVSB
	15CiIj57OMTPZQnhNnRA/+LzIRG3/MqqhH5QEDwBHv/Em3fTx5hrKqU7e+z+B85oDux6EirTYX7+W
	2lNf/VdndMVSnFQ1KR8VWogyXER8/d/jqWhiUkoYM8z3/bGlqilwXGW1jQUTgBzcKcqGGIY90dq95
	k178sKnAm7pln/aB2J8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sejiv-0000000BH84-0QFK;
	Thu, 15 Aug 2024 23:17:41 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sejir-0000000BH77-38rm
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 23:17:39 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-712603f7ba5so1185216b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723763856; x=1724368656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ghkt9m/LIz/Pd2d6NsDv/D7jJIsY8Apg1elvUmSjLc=;
        b=I5FtYbzg84h77dcAv+U5i8SlBOu5aePOsHFtWSPu7h95VIvK1YAeUXQEKvdB0dkHib
         usEEMhulp/uRXOzaelprXouXMnJHG257c13Fp4TQ2CaxPbYlOAXf0lXGFFxDvYZYEwhZ
         5PeQ12IoIlEelyYXGA1JDa0ifrZilGcIvk00OFEPzReNvkxjiADiJdsu5tSEpfnU0crW
         ZnrycFuGxQBstTqo4x34FLoYoKRxUBXu9Qhq4HQO8OLF/eWZH+9KrCjHwZfsta6cs51j
         ti+3K6b4hKcNU+Y1vPCkrPyNbqtaCzh5Cd5qBw/09zFY+3tf0MtfMklbgxpxkl7KJuc9
         er7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723763856; x=1724368656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ghkt9m/LIz/Pd2d6NsDv/D7jJIsY8Apg1elvUmSjLc=;
        b=WDFN73wAdgMFAhQEIHPS3OCw1T9FJrHR0GJrmpYhnqUTjNf7SwdrH1kdQ7vAslRYr7
         qnbS+mXTxUga6RIL0cJchevtkGiAVs83X8rPWvivvgIqk9mKIaeC7SZ5IpcSW4TgtcBp
         M2wR2vJK/rhVKeFF7B8uGWB0pf05eFq45VWJIztT/18R3wpa/N6JXf60cVJ29DJ0b4JN
         ONnjSoT7DNsYdV4zo3tCljLQt7Y29RiFD1mOYlZDFjLn398gwRnCD3UUyteOr+hlJFDi
         eW4tUXnUnUGGr4Cr3vI3lejFfS8SIbZEdnBTLPOj9EC4G/ZYtkMgZpOixPSJQqk8d15X
         kUVA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0rvm7AJ8PZksozfSk/ckYR1n9hiLcW/N4O2gdBJKOrv2ykKafyV+ySBsidXwHh2M/Eh/Op+EE7n0JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKQwO+OXKw1kds4jfi6KHzThy3Ym5vB6ThcQCLSRN5R9j4u40x
	3nmxT5ODW1rwunaR7ebYZ9cpmdFGc01mmOR3ve2anbFS8gdFoMZjrLcB86fOi80=
X-Google-Smtp-Source: AGHT+IEbiS4cKfNLups+uIVORTTdJZsxR0nqvF5y+/KsWLZUQjbqc+uxmY8XOe/8UdRZkQH8ntUQcg==
X-Received: by 2002:a05:6a21:318b:b0:1c6:fb07:381e with SMTP id adf61e73a8af0-1c90506a9b2mr1469116637.44.1723763856168;
        Thu, 15 Aug 2024 16:17:36 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae0756dsm1517187b3a.47.2024.08.15.16.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 16:17:35 -0700 (PDT)
Date: Thu, 15 Aug 2024 16:17:33 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Eagerly flush in flush_icache_deferred()
Message-ID: <Zr6MjWLD5VQAQHAV@ghost>
References: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
 <20240813-fix_fencei_optimization-v1-2-2aadc2cdde95@rivosinc.com>
 <Zr1NC7GBQHfqqplf@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zr1NC7GBQHfqqplf@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_161738_014493_F8B9B6B3 
X-CRM114-Status: GOOD (  42.81  )
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

On Thu, Aug 15, 2024 at 02:34:19AM +0200, Andrea Parri wrote:
> > <---- Thread 1 starts running here on CPU1
> > 
> > <---- Thread 2 starts running here with same mm
> > 
> > T2: prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_ON, PR_RISCV_SCOPE_PER_PROCESS);
> > T2: <-- kernel sets current->mm->context.force_icache_flush to true
> 
> Mmh, TBH, I'm not sure how this patch is supposed to fix the race in
> question:
> 
> For once, AFAIU, the operation
> 
> T2: cpumask_setall(&current->mm->context.icache_stale_mask)
> 
> (on CPU2?) you've added with this patch...
> 
> 
> > T2: <modification of instructions>
> > T2: fence.i
> > 
> > T1: fence.i (to synchronize with other thread, has some logic to
> >              determine when to do this)
> > T1: <-- thread 1 is preempted
> > T1: <-- thread 1 is placed onto CPU3 and starts context switch sequence
> > T1 (kernel): flush_icache_deferred() -> skips flush because switch_to_should_flush_icache() returns true
> 
> ... does _not_ ensure that T1: flush_icache_deferred() on CPU3 will
> observe/read from that operation: IOW,
> 
> T1: cpumask_test_and_clear_cpu(cpu, &mm->context.icache_stale_mask)
> 
> may still evaluate to FALSE, thus preventing the FENCE.I execution.
> 
> Moreover, AFAIU, ...
> 
> 
> > 				     -> thread has migrated and task->mm->context.force_icache_flush is true
> > 
> > T2: prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_PROCESS);
> 
> ... moving the operation(s)
> 
> T2: set_icache_stale_mask()
> 	T2: cpumask_setall(&current->mm->context.icache_stale_mask)
> 
> before the following operation...  (per patch #1)
> 
> 
> > T2 (kernel): kernel sets current->mm->context.force_icache_flush = false
> > 
> > T1 (kernel): switch_to() calls switch_to_should_flush_icache() which now
> > 	     returns false because task->mm->context.force_icache_flush
> > 	     is false due to the other thread emitting
> > 	     PR_RISCV_CTX_SW_FENCEI_OFF.
> 
> ... does not ensure that T1: switch_to_should_flush_icache() on CPU3
> will observe
> 
> T1: cpumask_test_cpu(<cpu3>, &task->mm->context.icache_stale_mask) == true
> 
> in fact, T1 may evaluate the latter expression to FALSE while still
> being able to observe the "later" operation, i.e.
> 
> T1: task->mm->context.force_icache_flush == false
> 
> 
> Perhaps a simplified but useful way to look at such scenarios is as
> follows:
> 
>   - CPUs are just like nodes of a distributed system, and
> 
>   - store are like messages to be exchanged (by the memory subsystem)
>     between CPUs: without some (explicit) synchronization/constraints,
>     messages originating from a given CPU can propagate/be visible to
>     other CPUs at any time and in any order.
> 
> 
> IAC, can you elaborate on the solution proposed here (maybe by adding
> some inline comments), keeping the above considerations in mind? what
> am I missing?

I should have added some memory barriers. I want to have the stores to
task->mm->context.force_icache_flush and
task->mm->context.icache_stale_mask in riscv_set_icache_flush_ctx() from
one hart to be visible by another hart that is observing the values in
flush_icache_deferred() and switch_to_should_flush_icache(). Then also
for the changes to those variables in flush_icache_deferred() and
switch_to_should_flush_icache() to be visible in future invocations of
those functions.

> 
> 
> > T1 (back in userspace): Instruction cache was never flushed on context
> > 			switch to CPU3, and thus may execute incorrect
> > 			instructions.
> 
> Mmh, flushing the I$ (or, as meant here, executing a FENCE.I) seems
> to be only half of the solution: IIUC, we'd like to ensure that the
> store operation
> 
> T2: <modification of instructions>
> 
> originated from CPU2 is _visible_ to CPU3 by the time that FENCE.I
> instruction is executed, cf.
> 
> [from Zifencei - emphasis mine]
> 
> A FENCE.I instruction ensures that a subsequent instruction fetch on
> a RISC-V hart will see any previous data stores _already visible_ to
> the same RISC-V hart.
>

Oh okay so we will need to do a memory barrier before the fence.i in the
userspace program. I don't believe a memory barrier will be necessary in
the kernel though while this prctl is active, will the kernel ensure
memory coherence upon migration?

> 
> IOW (but assuming code is in coherent main memory), imagine that the
> (putative) FENCE.I on CPU3 is replaced by some
> 
> T1: LOAD reg,0(insts_addr)
> 
> question is: would such a load be guaranteed to observe the store
> 
> T2: <modification of instructions>  #  STORE new_insts,0(insts_addr)
> 
> originated from CPU2? can you elaborate?

To give a broader overview, the usecase for the per-mm mode of the prctl
is to support JIT languages that generate code sequences on one hart and
execute the generated code on another hart. In this example, thread 2 is
generating the code sequences and thread 1 is executing them.

The goal here is for Linux to guarantee that CPU migration does not
cause thread 1 to not see the instructions generated by thread 2, if it
was able to see the generated instructions on the CPU it was migrating
from. To hold this guarantee, when thread 1 (or any thread that is in
the mm group) is migrated, its instruction cache is synchronized.
Ideally, it would contain exactly the same contents as it did on the
previous CPU, but instead it must rely on fence.i since that is the only
option.

The stipulation of "if it was able to see the generated instructions on
the CPU it was migration from" is there to say that the thread is
expected to emit fence.i as necessary to cover the case that migration
does not occur.

Another note is that with this prctl, fence.i is emitted by the kernel
whenever any thread in the mm group is migrated, however the described
usecase is that there is one producer of the instructions and one
consumer. An extension to this prctl could be to specify which threads
are consumers and which threads are producers and only flush the icache
when the consumers have migrated but that optimization has not yet be
written.

- Charlie

> 
>   Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
