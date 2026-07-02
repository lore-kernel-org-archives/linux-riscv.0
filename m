Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410F6C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwOSoCzK10gaIyYhxYo04Q5jbmvo8wc5YNmwU4xIT68=; b=QMOyh3vT/UKkdY
	gQzrg25otk49cVcgm3oVuliwTQawP3QXzYuj4ILGzviofPh6vheUBCA3wGlcCOdogg69tkL2xSs0Y
	jMGhTkl/bY2AOj9/HdNdHc7npA0bNinSIeyEZ4/fC9irhcpKezMS0A4nleImlMDghRS6QZjT6wU0i
	3GSTo8g7Nysoo8fn4Z0926sVLvbT5YlZNASlZJ5dyH61gnoPNGaPGe9JdY/EL0DhErPA2BwItX3HM
	YO3mSQvC4OeD4a6XQOoL9MJM11APs1+aEe6cdMFixBHcpmQpTZO3FmA6jKjA5GHqEN64vgY+noWwB
	jG0Jnh5TjTIAjza0Y5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCt1-00000003tC1-1QNd;
	Thu, 02 Jul 2026 08:35:07 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCsx-00000003tAo-41hR
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 08:35:06 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnANSnIkZqB76GFg--.9178S2;
	Thu, 02 Jul 2026 16:34:47 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: namcao@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	dev.mbstr@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	qirui.001@bytedance.com,
	samuel.holland@sifive.com,
	xujiakai2025@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH v4] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Thu,  2 Jul 2026 08:34:47 +0000
Message-Id: <20260702083447.845741-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87ik6xvmsf.fsf@yellow.woof>
References: <87ik6xvmsf.fsf@yellow.woof>
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnANSnIkZqB76GFg--.9178S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW8tr4xtF13Cr15Cw4fGrg_yoW8JFykpF
	4kKa13ua17K34F9ry7ZFZ5Xr95GFs5Jr1akr47tFyUZrn8KF1Fk3y5CFZIqw4xCryjva17
	ZFyxJws3Aa98Ja7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUopBTUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBgUQCWpF8+aprQAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013504_371246_B1919F71 
X-CRM114-Status: GOOD (  10.69  )
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

Hi! Thanks for your review!

> > +	if (sp >= (unsigned long)task_stack_page(task) &&
> > +	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
> > +		high = (unsigned long)task_pt_regs(task);
> > +	} else if (task != current) {
> > +		pr_warn("%s: sp (%lx) is not in task stack of %s\n",
> > +			__func__, sp, task->comm);
> > +		return;
> > +	}
> > +#ifdef CONFIG_VMAP_STACK
> > +	else {
> > +		unsigned long ovf_base =
> > +			(unsigned long)this_cpu_ptr(overflow_stack);
> > +
> > +		if (sp >= ovf_base && sp < ovf_base + OVERFLOW_STACK_SIZE)
> > +			high = ovf_base + OVERFLOW_STACK_SIZE;
> > +	}
> > +#endif
> 
> Looks functionally correct to me. But this #ifdef goes against the
> kernel's coding style. See:
> https://docs.kernel.org/process/coding-style.html
> 
> Can we
>     else if (IS_ENABLED(CONFIG_VMAP_STACK))
> just like the irq stack thing?

You are right, that is my mistake. I will fix this.

I will wait a couple of days to see if there are any other suggestions 
from others. If not, I will submit a v5 with this change.

Thanks for the review!

> 
> > +	if (IS_ENABLED(CONFIG_IRQ_STACKS) && !high) {
> > +		unsigned long irq_base =
> > +			(unsigned long)this_cpu_read(irq_stack_ptr);
> > +
> > +		if (sp >= irq_base && sp < irq_base + IRQ_STACK_SIZE)
> > +			high = irq_base + IRQ_STACK_SIZE;
> > +	}

Regards,
Jiakai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
