Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B810C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90dSKbyw59l3T9bJ1i2pvk9UDpO5MpvVCP75KPh9BY0=; b=hsNNK0UujCm42a
	KC1+ufbaPNiv/Ptvlw7tg7CwVzaD6bb+Aey+c1uWze/SHt31E9RI3fiIhSD0uH5ZtMv6ic6ueYFFO
	tHnkdcqZkg94TQLrLST3oATdY+TO+TBhHe9dah9avblIC0quTF217WpFtxBJAswzZwwlwmaj7z0Ym
	lETcldDeMHSZIBL7Ws1pSAzFIxS6W+OUFszx0++NvM4t5gHa3RgbNkTllc4OeekxNdwgQDN2dTKlQ
	ELrSXkf1xVcxqS2x7GHKVPxQ2CQ4v71Gtzm84MwCTCYbsEq3iBVZUToTurdul0GxgTC2OIkRoBM7X
	eArFfodK3aUw0ynxnhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zmr-005dhT-10;
	Tue, 28 Nov 2023 15:14:09 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zmo-005dfc-1D
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 15:14:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a0f49b31868so311864666b.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701184442; x=1701789242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=46tcgfy6lnmrLL8kkdcy+Z6fG3y3/u6FFjLbf+5xvvU=;
        b=f9P1GpWEs9sm40uOIPd3t7KFMW+F0OsEGB93zEaGtVV7QQD104MPBELodRsi7NFAW6
         CXHKqSFWtjEvoEZ80pl1G3m6btP1YYEIFbeE6hh4yczhNJ9F+SColyfFXmlONg/epsTe
         JkkRDTSEikfpJdX4xoLU1XhBXcywRB/dSoL+ogWxrhR/gtFnon+9lTrRbQV3wZcgqzPE
         oL0JgtOw4nc+JVS/FPc4x4peiTAc381lokRH8glCPv/5oL1AFJoNPuCNwnnoS1SNfAIR
         1lfDLVXCqGrXe0J7drl7ZFADU8/z5dK4VJLqshNVJX/ZRIc5qh2Sf3yvjI2U/ojoSjgA
         lwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701184442; x=1701789242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46tcgfy6lnmrLL8kkdcy+Z6fG3y3/u6FFjLbf+5xvvU=;
        b=qEFQmBKDtUytq9w9yI7oYbz0DKrSEqrZ7H7wOKs8N9xx0sGwoNI5tzadUjCtSWP+KC
         cN9tDNsJggcXrBDan1xRGXXIOCrJyjNnqNk7jw1VPqoG6S4MJAB4iArPu0b0zfhLQ6sD
         WOP1gpg0WLiTFpDunHpqRCn0XkrR3MkU9LJWMp+9rU5By6+Rj7Z2VMqLmpYqSoLe6SiJ
         6BZYhjKW+NVnzdeFBFqka7Q0RJJ2VREL9jR7Pb7y1EPOrEqBakw9PxJK1uIpoEjFYemY
         DG4BAmv2wDN7+kSqxlK0vuoEoejSQPezfeCmbuJ7/OfzvnXkmaI/IB+CobEofoOj1SwD
         OYUQ==
X-Gm-Message-State: AOJu0Ywh8dEzzAdeqpZ0kpJP8eZIO5TQQmd7X6u2hSygXlojHoaa72MS
	ExHTT0RJAQ9XqWQWIT4hJuc=
X-Google-Smtp-Source: AGHT+IFbUScR/k5tl/U453JuBeHhEOnSud8Dr0NLfnh4zrPWNsGB250PbuA0m/cUFhgT753SiZSsfQ==
X-Received: by 2002:a17:906:7396:b0:a10:f9a8:bfe1 with SMTP id f22-20020a170906739600b00a10f9a8bfe1mr3397704ejl.16.1701184441892;
        Tue, 28 Nov 2023 07:14:01 -0800 (PST)
Received: from andrea ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id bq23-20020a170906d0d700b00a0d02cfa48bsm3551751ejb.213.2023.11.28.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:14:01 -0800 (PST)
Date: Tue, 28 Nov 2023 16:13:56 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Message-ID: <ZWYDtB/otYvTMZWd@andrea>
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
 <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_071406_416082_4A43AD05 
X-CRM114-Status: GOOD (  30.30  )
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

> I am concerned about the possibility that this change lacks two barriers in the
> following scenario:
> 
> On a transition from uthread -> uthread on [CPU 0], from a thread belonging to
> another mm to a thread belonging to the mm [!mm -> mm] for which a concurrent
> membarrier sync-core is done on [CPU 1]:
> 
> - [CPU 1] sets all bits in the mm icache_stale_mask [A]. There are no barriers
>   associated with these stores.
> 
> - [CPU 0] store to rq->curr [B] (by the scheduler) vs [CPU 1] loads rq->curr [C]
>   within membarrier to decide if the IPI should be skipped. Let's say CPU 1 observes
>   cpu_rq(0)->curr->mm != mm, so it skips the IPI.
> 
> - This means membarrier relies on switch_mm() to issue the sync-core.
> 
> - [CPU 0] switch_mm() loads [D] the icache_stale_mask. If the bit is zero, switch_mm()
>   may incorrectly skip the sync-core.
> 
> AFAIU, [C] can be reordered before [A] because there is no barrier between those
> operations within membarrier. I suspect it can cause the switch_mm() code to skip
> a needed sync-core.
> 
> AFAIU, [D] can be reordered before [B] because there is no documented barrier
> between those operations within the scheduler, which can also cause switch_mm()
> to skip a needed sync-core.
> 
> We possibly have a similar scenario for uthread->uthread when the scheduler
> switches between mm -> !mm.
> 
> One way to fix this would be to add the following barriers:
> 
> - A smp_mb() between [A] and [C], possibly just after cpumask_setall() in
>   prepare_sync_core_cmd(), with comments detailing the ordering it guarantees,
> - A smp_mb() between [B] and [D], possibly just before cpumask_test_cpu() in
>   flush_icache_deferred(), with appropriate comments.
> 
> Am I missing something ?

Thanks for the detailed analysis.

AFAIU, the following barrier (in membarrier_private_expedited())

	/*
	 * Matches memory barriers around rq->curr modification in
	 * scheduler.
	 */
	smp_mb();	/* system call entry is not a mb. */

can serve the purpose of ordering [A] before [C] (to be documented in v2).

But I agree that [B] and [D] are unordered /missing suitable synchronization.
Worse, RISC-V has currently no full barrier after [B] and before returning to
user-space: I'm thinking (inspired by the PowerPC implementation),

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de61342..f63222513076d 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -323,6 +323,23 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	if (unlikely(prev == next))
 		return;
 
+#if defined(CONFIG_MEMBARRIER) && defined(CONFIG_SMP)
+	/*
+	 * The membarrier system call requires a full memory barrier
+	 * after storing to rq->curr, before going back to user-space.
+	 *
+	 * Only need the full barrier when switching between processes:
+	 * barrier when switching from kernel to userspace is not
+	 * required here, given that it is implied by mmdrop(); barrier
+	 * when switching from userspace to kernel is not needed after
+	 * store to rq->curr.
+	 */
+	if (unlikely(atomic_read(&next->membarrier_state) &
+		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
+		      MEMBARRIER_STATE_GLOBAL_EXPEDITED)) && prev)
+		smp_mb();
+#endif
+
 	/*
 	 * Mark the current MM context as inactive, and the next as
 	 * active.  This is at least used by the icache flushing
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a708d225c28e8..a1c749fddd095 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6670,8 +6670,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 		 *
 		 * Here are the schemes providing that barrier on the
 		 * various architectures:
-		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC.
-		 *   switch_mm() rely on membarrier_arch_switch_mm() on PowerPC.
+		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
+		 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
+		 *   on PowerPC.
 		 * - finish_lock_switch() for weakly-ordered
 		 *   architectures where spin_unlock is a full barrier,
 		 * - switch_to() for arm64 (weakly-ordered, spin_unlock

The silver lining is that similar changes (probably as a separate/preliminary
patch) also restore the desired order between [B] and [D] AFAIU; so with them,
2/2 would just need additions to document the above SYNC_CORE scenario.

Thoughts?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
