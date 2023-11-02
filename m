Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF3FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Xq4srpr/roikEXsACx3Vero7wFkbf/HhDa8qzLPWEQ=; b=dhWseh96EM9Zbd
	q0pzqa9wJ+vIyEMdmOFJ3cIdVFaLEeZVviE7ZlsRadLjftgWEWlcoJ1UFIpqzYbvlQA+zVUThR9da
	y5KLOL/qJfgpfmbKo/ffpSDILupvFfxn9mnnPD/Vs/KeMZEKpEZVxfoTiSDEVDYbq5BDZNXBS3UR7
	PzMpDqDe8ntiiAym9SxY5ibBSW33VVTWjEbZ99QLS8ME5QLaZrbRDR6aMAySe/00F/RT/axiPxKSb
	WNVBRuIzjD/BmjuYTAMQ6KhpDDMILtf4wpmKNBdc+mSIHWAgd+IdMTcRP07juzi9ojDX/rXVoIEnf
	TA4Jz+On63yrnYK6pfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qya1k-009oLU-20;
	Thu, 02 Nov 2023 15:54:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qya1e-009oKl-04
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:54:34 +0000
Date: Thu, 2 Nov 2023 16:54:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698940464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcGUxKwzxjjiIdQwaOyaEjsv5TkvykfYcG8k4+vGThM=;
	b=AuqsIChDgwctURruN5sybOMNlkvgc5xCAOOWyDVYltR/jdCsAUaJSTW/4WXvrZBQAJY+fp
	pRBqV4gxLjS606njLBcBur+yxROJvy9VEmcFrSqqc5fmHwDonybxF/9qQZeqJ+otLtAZLq
	N5V0Rpi5GzZZXIgN6Npd1DpXzyeoM7c0/eB6fCD+EsoLxZtQmaZY1kYykYRK6NUaOvbqYO
	jdwc7Y5+d++T2E1qvoHCJrMlixWEPV79EpESROWHho4t1DVmWZokyIJn4hKNzjVT24XT7I
	uXfvH+TmAO22pX6le2EeOQd2kpstNAvfsg0DFwKnletVddhXTkfkGnY/gUDPzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698940464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KcGUxKwzxjjiIdQwaOyaEjsv5TkvykfYcG8k4+vGThM=;
	b=RyrM7M1GF0sMowa0RmBMPKKAJIRwtPmNCok7hhWlzX0CIM3yM4BGv7AF7W3GDr2Um4rtrs
	hJ8Jc7ij+IXteDBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231102155423.SyuAibSe@linutronix.de>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
 <20231102-spearman-overcrowd-a86bfb958609@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102-spearman-overcrowd-a86bfb958609@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_085430_216125_3BF00405 
X-CRM114-Status: UNSURE (   6.25  )
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

On 2023-11-02 12:31:15 [+0000], Conor Dooley wrote:
> [    1.130384] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> [    1.130418]
> [    1.130414] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
> [    1.130971] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
> [    1.130978]   alloc_workqueue+0x96/0x6de
> [    1.131005] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
> [    1.131010]   kmem_cache_init_late+0x1c/0x36
> [    1.131038] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+0x12/0x1a
> [    1.131046]   start_kernel+0x204/0x7e6
> [    1.131082] irq event stamp: 822
> [    1.131071] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1de/0x790
> [    1.131093] hardirqs last  enabled at (821): [<ffffffff80bd75b0>] default_idle_call+0xfa/0x152
> [    1.131111] [<ffffffff800fd3a0>] generic_smp_call_function_single_interrupt+0xe/0x1a
> [    1.131124] hardirqs last disabled at (822): [<ffffffff80bd52a0>] do_irq+0x16/0xa6

Without the patch check_unaligned_access_boot_cpu() ->
check_unaligned_access() is okay. The SMP/IPI variant (the patch imho)
is bad. There must be no memory allocation from IRQ-off region - the
smp-function call in this case.

Would it be okay if I delay it until this solved? If you have something,
then I could apply the two patches plus the fixup for this.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
