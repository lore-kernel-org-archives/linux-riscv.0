Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB2DCD98F6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsxD5dwBebdUPJ81gimkEof5Kr/LnqdsVHC3Rw4p+tU=; b=C3nbVbXc7mW2ZS
	XGK5C7o547k2M01oQtLk3Ltc9PeOW/O2mLRna0gv7zFsiFnTuNFxgJLDTU5sEFNMBRii9TDbsxT6p
	usOS9WRPCir1OCscvFwdVMxtavmFoQIl9UhFiZXLy57rjruedPIHaY5eMUMNY/SacOVOYi7zevVum
	U4qRJ0/gfsOiBuZ6OLFDLh+e9NbCDP3837sMOV0JB7kNjVXpuLFkUeigcqwhe62bEGmIuRnAIsvYo
	Xai1TtX3eJZlZELFLR7kNVPZq7XD0gSDuOSqE7db7xh8yorhXlSsE0oF1WfDQ0OzI8ecDz6X4Z4B2
	E87suZwswLRtjfvZgMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVss-00000002FK8-1x6r;
	Fri, 19 Jun 2026 09:51:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVso-00000002FJq-3wRV
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 09:51:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781862688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WZ1IagdnVV5TSo0RVKP9IMzKUX1buvpUmeHeQfapSPA=;
	b=tilpw6YoUZOSNHkMtcJp95Mc7b4AyNNFqqjoL0ggMK7knjoxriZ7ghkk5KPbC7FanKEWR5
	faZKWOcXZA8ylgLDkx2wCNh6Ke0lkgN/ojq+qGwjGVRi6ADe+5IQkoas1IaRortZg6e/Tj
	+ejdFB0aTNhfXNqGGr+9GxAahX/KVt3l1FjxgBq6h0M/N3Bdd9/GlBma6pSYKPKhhru1+J
	1jPCKH1gRApzE+L0hZBhqz5i9I3/5TPzK8lJoKXxzHDYCJrQu1/uwGHTtJ3HBptaP2Ixx5
	h6Jj5F4L3i9oAwgi8Xr8qnmWdNZdQT4jAvB66tLNtoYAKjkggCfs+cEr7UKVUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781862688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WZ1IagdnVV5TSo0RVKP9IMzKUX1buvpUmeHeQfapSPA=;
	b=+wI9V3MrwlaBhrA0/QNwdvQtkI9F1r4hmxAOk6jkUp2N+XlJcveUYnY/iGoQfVZZSb4RRw
	4syuW7tr9cF1esBA==
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Jiakai Xu
 <xujiakai2025@iscas.ac.cn>, Matthew Bystrin <dev.mbstr@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Samuel
 Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
In-Reply-To: <20260517143704.659416-1-xujiakai2025@iscas.ac.cn>
References: <20260517143704.659416-1-xujiakai2025@iscas.ac.cn>
Date: Fri, 19 Jun 2026 11:51:28 +0200
Message-ID: <87zf0q504f.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_025131_729028_74CA4920 
X-CRM114-Status: UNSURE (   4.11  )
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
> +	if (!task)
> +		task = current;
> +
> +	high = (unsigned long)task_pt_regs(task);

I am concerned when CONFIG_IRQ_STACKS=y and we are on the irq stack,
wouldn't this "high" be the wrong one?

I haven't validated it, we probably need something like

if (on_thread_stack()) {
	if (!task)
        	task = current;
	high = (unsigned long)task_pt_regs(task);
} else {
	high = per_cpu(irq_stack_ptr, smp_processor_id()) + IRQ_STACK_SIZE/sizeof(ulong);
}

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
