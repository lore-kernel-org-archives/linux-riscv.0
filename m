Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BCFC531DE
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 00:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oemIRTF49tlFLYjQO3CRhjvR9o7AP5/gGFnsJ/rGk3E=; b=yMuFTWpqeZUrwF
	bVt3FBzZ5YRAe8Y/krcviqTw1j/NxW3H3H0pFbWTDpRp0bi5jV00DUmMlNsAuvGCSkYm6204yjtOL
	UN0VJayVI/5PvLKKWIAWwD3WufYeSaeRhqovKIT1iJ6BDpZqmzAgbN2NjuBFSgRoLXdqgiiiN8eQc
	PtdFGb3AobhpWPVR4AAiVdwNDIKCpkgGayHC7n6bjcSt/m63+g2NfKK8MQRCOr0swKQXATS4lCaJb
	BbuR01qdl8nE8DGlzFgiH0cTHCWCYgmezD6VRlxRnZqOWgLVgkVR9mLXnh5NCSmaC2CG0eGC2C+L2
	FBAOjk7hf27VgY6SCxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seORi-00000008eZz-1KWO;
	Thu, 15 Aug 2024 00:34:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seORf-00000008eYu-1bDk
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 00:34:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso2117925e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 17:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723682065; x=1724286865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYBBp8MdgJpDzmzKWf0FPivxU2t9lT+77YiFk2ooOxQ=;
        b=hiDT2bciELcl+ftuFmPJ2sNLIM6FhPcTg5aodSmqo4IuqLqns+VwUp107bgr1rrkDs
         6SNYg/bSTYCRfeRepAzUjhV4+wU+ddXM9/EzOsKbEQHL2EAF+Ota3+/7pyW+tJ9CH4yz
         3EhSzi8gIox6U/UzMidDQcSUXU9S7n3+bWQsic+yJ6fH+vWoweIUqo6WW5tq0i+yO8ia
         avttt9fuXNNgeOg3c/mjKrNtm/BZoZUsxF2lxDrEtgpqcOrwOaLZhP72Sy0Spa1mgUZF
         aBM8iQj4NA7FIuM0qVdsFvo4lyahf/k+lRrqWnIVEu2PFfozQAtaLeKHrhp/eIF5XeMl
         rMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723682065; x=1724286865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYBBp8MdgJpDzmzKWf0FPivxU2t9lT+77YiFk2ooOxQ=;
        b=vYZhaRVGJB8tuZiz/USNYvwb+qf/gIOXR/pgCRYNGMAVspJw8SLaTYqkduto2jY0cJ
         7pgcXz2SuU1UyR9CcoDV+3XsmtGcbgNKG3XgUBCswxD+PJMBIaKGXnZwQhRKmuZ6Mxrs
         0sc8K02TvVdoL2sEQ/92fPlKAeaHT8GNbcEjVkfW4LcjJbbN7sJxTNnJ2mX63sZorXFD
         inMlyjvbcDldxdBX0bX5P5mGydI5hvBMkCc2BsNgumBnWlDrRvbO8WBHVjY10gw77+n9
         H5O0MKW0RIXW9UhB0HoU9twnZoNIIL7a9HjJEOI7p+Z2+Q3QsWzBY+f7Y6CFOaTCOocA
         6I/g==
X-Forwarded-Encrypted: i=1; AJvYcCWxg7bTEHqmRxtBmzqrFwkeUw9HZvWH/PzrL6IQm+UGt9lRXN1a925anayQ2QRtlQ7xLmmlOdd8u+4PCx888jxMuEum7qFLTdQGLW+1aBTN
X-Gm-Message-State: AOJu0YwwD5lxpkZY4XsatyytzFyTvgs7/l0rSrdPLmjl7O2fG/TLhABh
	RDrbkZyH9GMdp8l98xtdxN9Ma9JwLzjIUfTJ0pbxgZAZe+SkxY8R
X-Google-Smtp-Source: AGHT+IElhjGJFHAjb3pDkCKnDLfu6WM/NR0TgZhQutcTk8dyPGJvZ5qmOb2PW6YXLSFWnrJpHzgUMA==
X-Received: by 2002:a05:600c:4f45:b0:428:2502:75b5 with SMTP id 5b1f17b1804b1-429dd238160mr26205455e9.11.1723682064361;
        Wed, 14 Aug 2024 17:34:24 -0700 (PDT)
Received: from andrea ([151.76.20.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19670sm33932685e9.9.2024.08.14.17.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 17:34:23 -0700 (PDT)
Date: Thu, 15 Aug 2024 02:34:19 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Eagerly flush in flush_icache_deferred()
Message-ID: <Zr1NC7GBQHfqqplf@andrea>
References: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
 <20240813-fix_fencei_optimization-v1-2-2aadc2cdde95@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240813-fix_fencei_optimization-v1-2-2aadc2cdde95@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_173427_443006_C91A4C40 
X-CRM114-Status: GOOD (  20.65  )
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

> <---- Thread 1 starts running here on CPU1
> 
> <---- Thread 2 starts running here with same mm
> 
> T2: prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_ON, PR_RISCV_SCOPE_PER_PROCESS);
> T2: <-- kernel sets current->mm->context.force_icache_flush to true

Mmh, TBH, I'm not sure how this patch is supposed to fix the race in
question:

For once, AFAIU, the operation

T2: cpumask_setall(&current->mm->context.icache_stale_mask)

(on CPU2?) you've added with this patch...


> T2: <modification of instructions>
> T2: fence.i
> 
> T1: fence.i (to synchronize with other thread, has some logic to
>              determine when to do this)
> T1: <-- thread 1 is preempted
> T1: <-- thread 1 is placed onto CPU3 and starts context switch sequence
> T1 (kernel): flush_icache_deferred() -> skips flush because switch_to_should_flush_icache() returns true

... does _not_ ensure that T1: flush_icache_deferred() on CPU3 will
observe/read from that operation: IOW,

T1: cpumask_test_and_clear_cpu(cpu, &mm->context.icache_stale_mask)

may still evaluate to FALSE, thus preventing the FENCE.I execution.

Moreover, AFAIU, ...


> 				     -> thread has migrated and task->mm->context.force_icache_flush is true
> 
> T2: prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_PROCESS);

... moving the operation(s)

T2: set_icache_stale_mask()
	T2: cpumask_setall(&current->mm->context.icache_stale_mask)

before the following operation...  (per patch #1)


> T2 (kernel): kernel sets current->mm->context.force_icache_flush = false
> 
> T1 (kernel): switch_to() calls switch_to_should_flush_icache() which now
> 	     returns false because task->mm->context.force_icache_flush
> 	     is false due to the other thread emitting
> 	     PR_RISCV_CTX_SW_FENCEI_OFF.

... does not ensure that T1: switch_to_should_flush_icache() on CPU3
will observe

T1: cpumask_test_cpu(<cpu3>, &task->mm->context.icache_stale_mask) == true

in fact, T1 may evaluate the latter expression to FALSE while still
being able to observe the "later" operation, i.e.

T1: task->mm->context.force_icache_flush == false


Perhaps a simplified but useful way to look at such scenarios is as
follows:

  - CPUs are just like nodes of a distributed system, and

  - store are like messages to be exchanged (by the memory subsystem)
    between CPUs: without some (explicit) synchronization/constraints,
    messages originating from a given CPU can propagate/be visible to
    other CPUs at any time and in any order.


IAC, can you elaborate on the solution proposed here (maybe by adding
some inline comments), keeping the above considerations in mind? what
am I missing?


> T1 (back in userspace): Instruction cache was never flushed on context
> 			switch to CPU3, and thus may execute incorrect
> 			instructions.

Mmh, flushing the I$ (or, as meant here, executing a FENCE.I) seems
to be only half of the solution: IIUC, we'd like to ensure that the
store operation

T2: <modification of instructions>

originated from CPU2 is _visible_ to CPU3 by the time that FENCE.I
instruction is executed, cf.

[from Zifencei - emphasis mine]

A FENCE.I instruction ensures that a subsequent instruction fetch on
a RISC-V hart will see any previous data stores _already visible_ to
the same RISC-V hart.


IOW (but assuming code is in coherent main memory), imagine that the
(putative) FENCE.I on CPU3 is replaced by some

T1: LOAD reg,0(insts_addr)

question is: would such a load be guaranteed to observe the store

T2: <modification of instructions>  #  STORE new_insts,0(insts_addr)

originated from CPU2? can you elaborate?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
