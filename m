Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88863C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96YkBAuCGawhZSSnVUs2jscm8IJaIiX58wkBO1Gbggc=; b=e7nCel44c/WQYP
	Ik6aLnNUPjtWOrkDd1VNSb1ca8N9kESyxmVPUOW20IFBMoQGMNJ1fp0BNaylY9NnhsR9gs5IRqYFD
	ooY7nP/UkOR1Tf45XGTrxlkwiKIzfWqEOdWyOlRxcPTxOwCNzgkmlvLdshO0uwe7pKuty0CwbjrFh
	V3upHU4QknmjEITMijAL6DbCjNpo5/p8K8ExbaFbmtuq/xtLmh7jaICIk4d2GsuFBIBybzgcR6jAo
	wU1jl21lH/z76deEbr6kAKYOi7g8vluI5UIntiIWwZOq073tpJB4pkBHrjCweHAG8i5IJrHSa7ALi
	zOqeB+LJzauZxyIKlhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypMp-00AxxJ-2v;
	Fri, 03 Nov 2023 08:17:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypMk-00Axv7-3B
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 08:17:23 +0000
Date: Fri, 3 Nov 2023 09:17:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698999432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETbouZ+CrQgEz7EJjJRMHaZjihGSRuRwMcQKg7+EB6w=;
	b=L78CKellLOrHdHfFpmtlbGzQbrsaXzor1nLEeMM9y/eych7qLKIsW39/t1V3DbqCe/ILuz
	o4rJ2W8GbEpjYBcEZfNw9EDA5VPG83SQzypbbv47HRJSEph+Y1DyT5LsMXGIPkg1aYsOTv
	l8YNJUPa7RQFZ686C/LKQs6jRuRbO1N0+9fVZ4dDuvjpb2S6TcA+0lbp7U2PENh4CG9KYf
	nQ9FgtfIQMfvPIQnUjDDEA1FUrlqULoRkSvVozxJ3VWVRuC7JXkyyJLJBfpZpsMqTZEbWk
	m/D6hyxHXTdhuKhtLRB4IfvxfXBZ1TfapOD2d7xcU1Q9hP2+VydqDJH/ezq4Iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698999432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETbouZ+CrQgEz7EJjJRMHaZjihGSRuRwMcQKg7+EB6w=;
	b=K/Qb4FBw244S5mpKEVyOqUKv0isnGN3SCJQr+6auMeBMktfkmBb7zJqF7C7A/3wfANLPdJ
	XM7RjSZQMe04YKBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org,
	tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231103081711.Vp2nQhf6@linutronix.de>
References: <20231102155423.SyuAibSe@linutronix.de>
 <mhng-e4437055-dc5b-4105-859c-02297f54d0bd@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e4437055-dc5b-4105-859c-02297f54d0bd@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_011719_167299_337875F7 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

On 2023-11-02 14:37:05 [-0700], Palmer Dabbelt wrote:
> On Thu, 02 Nov 2023 08:54:23 PDT (-0700), bigeasy@linutronix.de wrote:
> > On 2023-11-02 12:31:15 [+0000], Conor Dooley wrote:
> > > [    1.130384] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> > > [    1.130418]
> > > [    1.130414] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
> > > [    1.130971] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
> > > [    1.130978]   alloc_workqueue+0x96/0x6de
> > > [    1.131005] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
> > > [    1.131010]   kmem_cache_init_late+0x1c/0x36
> > > [    1.131038] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+0x12/0x1a
> > > [    1.131046]   start_kernel+0x204/0x7e6
> > > [    1.131082] irq event stamp: 822
> > > [    1.131071] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1de/0x790
> > > [    1.131093] hardirqs last  enabled at (821): [<ffffffff80bd75b0>] default_idle_call+0xfa/0x152
> > > [    1.131111] [<ffffffff800fd3a0>] generic_smp_call_function_single_interrupt+0xe/0x1a
> > > [    1.131124] hardirqs last disabled at (822): [<ffffffff80bd52a0>] do_irq+0x16/0xa6
> > 
> > Without the patch check_unaligned_access_boot_cpu() ->
> > check_unaligned_access() is okay. The SMP/IPI variant (the patch imho)
> > is bad. There must be no memory allocation from IRQ-off region - the
> 
> Ya, sorry I didn't catch it.  I'm just going to drop Evan's patch, it'd
> missed the batch I was going to send tomorrow anyway.

The bring up of the secondary CPUs still has the memory in IRQ-off
path, only the primary CPU is fine.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
