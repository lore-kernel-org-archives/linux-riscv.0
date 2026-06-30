Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE626C43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjFXTnD59vpa1ufvlH6IfKnVIyb18KXquAC79xvHykY=; b=hQZ80qevagKBYN
	pTDF5I+2sc5EuvWeEKaVv8WnyWIAYkFV2xau7sK4nrdwPCwIYMxXlYK7T9ezL0MvXBmcoBolBlKAo
	bf4WHX1Fy0qby243a6BKbkEolB/fQEjPvnZFNpfzuFbS3YHMYlsdEw5Y5/ceasRQyHDjQysgpTK3i
	BzcdrbmZr+nm+Le78COdtZ4YnT7yeWjLJjwnINjzCnhcaSe9a3ZW1ghlTLpb0JZZBcZZU5B+nV4yn
	o2kwsdn62LzSdXOZv2adKBNxmAbOXI9d6dZb2kk5M6PeS1l6MyRKB1v8vxBapEvsPTwB1s3Pu+fFz
	MXUlS6dk4lhU2X6FcvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU6F-0000000GIMp-0KMF;
	Tue, 30 Jun 2026 08:45:47 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU6C-0000000GIJC-17Fn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:45:45 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADHNeksgkNq8_YnFg--.9174S2;
	Tue, 30 Jun 2026 16:45:32 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: namcao@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	dev.mbstr@gmail.com,
	jiakaiPeanut@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	qirui.001@bytedance.com,
	samuel.holland@sifive.com,
	xujiakai2025@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH v3] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Tue, 30 Jun 2026 08:45:32 +0000
Message-Id: <20260630084532.4039411-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87zf0g42k1.fsf@yellow.woof>
References: <87zf0g42k1.fsf@yellow.woof>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADHNeksgkNq8_YnFg--.9174S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWUXr4fCF4kZrW5ur43trb_yoWDtwb_Za
	nrAF1UWanrtrZYvF1xu3s3XrW0k3s0q3WkJF4UZryavrykArW5Zan7Zw1DWF1xC3Z0kFy3
	Za1qka47u3ya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1UDG5UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAQOCWpDfrsN6gAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_014544_688594_3431A20A 
X-CRM114-Status: GOOD (  10.86  )
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

> Jiakai Xu <xujiakai2025@iscas.ac.cn> writes:
> > +#ifdef CONFIG_IRQ_STACKS
> > +DECLARE_PER_CPU(ulong *, irq_stack_ptr);
> > +#endif
> 
> Instead of this, shouldn't we
>   #include <asm/irq_stack.h>
> ?
> 
> > +	if (sp >= (unsigned long)task_stack_page(task) &&
> > +	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
> > +		high = (unsigned long)task_pt_regs(task);
> > +	} else if (IS_ENABLED(CONFIG_IRQ_STACKS)) {
> > +		high = (unsigned long)this_cpu_read(irq_stack_ptr) +
> > +		       IRQ_STACK_SIZE;
> 
> I suspect this fails to build if CONFIG_IRQ_STACKS=n, which would be
> resolved if we do the suggested #include above.
> 
> > +	} else {
> > +		high = (unsigned long)task_pt_regs(task);
> 
> We only get to this branch if the stack pointer is broken, right? If so,
> I think printing a warning and returning is more appropriate.

Thanks for the review!  All three points make sense. I'll switch to
#include <asm/irq_stack.h>, and change the fallback else branch to
warn and return instead of silently using task_pt_regs().  Will send
a v4 with these fixed.

Jiakai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
