Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24BDC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=668m3YTgLYyxv50CXdGiMozugphvpYsE7AUPKKdTuVc=; b=DCKPHceNJ46pnX
	OUaS+JZpiJMe26MSqPoPNIKF9aGadySuXatoTfp4lxilHHzPLSpFjUPISGRwcEOSpxXzg7B8+aWbG
	9V+l6ZPMuAoqZ7vbhKSpLFz3H4WEx2G4d2OaC3bbqOIf74lIudUkHWyNlxrRAATrMOV2lluOnLgYt
	D8CpxrZ8KrfSG2h4mWN8Ji7+4myVvLDo64ANKYufj1y0xJNI8cdVMt7DZ4yjnP4yQO2xOeJcL2FM1
	4RgFQ5r7og2jZ/ATDbs+EvLPmkk7vrraWpS0ghXnG+MAeYRj2Y0xOyojwnHcNq/l53y853Xog2nZU
	D7sukzeEH5oNeACrxNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCQo-00000003npd-3rIX;
	Thu, 02 Jul 2026 08:05:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCQm-00000003npD-3iG8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 08:05:58 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782979553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apPfLj+gjuzmcrLfZV7sgRMeKt4CRcU2qNQMbTTFI9U=;
	b=j2AJN2M3bKrt/J26eTY3rOSeGSjeFRbqlq7tSXIxoOQNIF6FsAQXYkaQGO4X3RO/IhSOWc
	79ylhfi33BYdjD2jNMAY+doU1cD42JEyxujjDRvF0JM/+W3h5bcmjLqXX2o+TbpfNO6/N3
	GKCLJcmguuoi3qCysFiBGY2WAMhswhBNSFlqHHAgEh9BbFbUwVKWw8tT/edfojB8BExllL
	PtGPXvI2e0M4DaOfWg+NbOHSNS0WdNzyOzS8KyWMGe0KWqhZl6r2bEXFBqFFLFySkspRsL
	firnjo/5y2JOwtbhR2bv7vN84bLO0zV1LFgcS7cfi0dyfibYDccZk2QULruL+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782979553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apPfLj+gjuzmcrLfZV7sgRMeKt4CRcU2qNQMbTTFI9U=;
	b=anAp3VxZ8/TKdcujyX1qfRn0SKjeCQmsUPw+RQnPm6A3UWauqfE3VHUWYz3RZvy4cokTBS
	FQdxDHNBFHjfr4Cw==
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Jiakai Xu
 <xujiakai2025@iscas.ac.cn>, Matthew Bystrin <dev.mbstr@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rui Qi
 <qirui.001@bytedance.com>, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
In-Reply-To: <20260630090535.4103888-1-xujiakai2025@iscas.ac.cn>
References: <20260630090535.4103888-1-xujiakai2025@iscas.ac.cn>
Date: Thu, 02 Jul 2026 10:05:52 +0200
Message-ID: <87ik6xvmsf.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_010557_079509_637CA439 
X-CRM114-Status: UNSURE (   6.43  )
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

Jiakai Xu <xujiakai2025@iscas.ac.cn> writes:
> +	if (sp >= (unsigned long)task_stack_page(task) &&
> +	    sp < (unsigned long)task_stack_page(task) + THREAD_SIZE) {
> +		high = (unsigned long)task_pt_regs(task);
> +	} else if (task != current) {
> +		pr_warn("%s: sp (%lx) is not in task stack of %s\n",
> +			__func__, sp, task->comm);
> +		return;
> +	}
> +#ifdef CONFIG_VMAP_STACK
> +	else {
> +		unsigned long ovf_base =
> +			(unsigned long)this_cpu_ptr(overflow_stack);
> +
> +		if (sp >= ovf_base && sp < ovf_base + OVERFLOW_STACK_SIZE)
> +			high = ovf_base + OVERFLOW_STACK_SIZE;
> +	}
> +#endif

Looks functionally correct to me. But this #ifdef goes against the
kernel's coding style. See:
https://docs.kernel.org/process/coding-style.html

Can we
    else if (IS_ENABLED(CONFIG_VMAP_STACK))
just like the irq stack thing?

> +	if (IS_ENABLED(CONFIG_IRQ_STACKS) && !high) {
> +		unsigned long irq_base =
> +			(unsigned long)this_cpu_read(irq_stack_ptr);
> +
> +		if (sp >= irq_base && sp < irq_base + IRQ_STACK_SIZE)
> +			high = irq_base + IRQ_STACK_SIZE;
> +	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
