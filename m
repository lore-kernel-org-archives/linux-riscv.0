Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FE5C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxokOupKL8lPvRk4MLq0QIyaFP+nVBYEMUFGFZVjvp8=; b=Mg5iiQcAfX4T4F
	JBxKJCkvGMxcJJyaBzYYfAV9sLENtUdl20pZ537VMC0lxEm/ZyPKa5TiI+xW2l71ATZp5dE46E5FY
	7ja6/CtXUQc7F9A6RMC8ZSUBsYyNcN/5LBaM2qikQ7Y44KiziCr3hW+rM6curdpDQ3lMLPYr9b3Od
	SqXkVeX6UHivRiS4TLc0l3K4uuiXzgh27GbbJC+gTeXsyIaWKT/zY8t8j4ZpOOwg4kiZnw6A7mKwe
	5P8VEsIdZrQiWpI42kKUpjxvdUsJh7BmJO8I5+Pah11p7PUvL1pe8ZE5TwIiAmBv5Oly1zLstXi8O
	3SXALUrkb7L4vH5gvg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaH5Q-00BvSr-OP; Mon, 19 Sep 2022 13:45:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaH5P-00BvSN-86
	for linux-riscv@bombadil.infradead.org; Mon, 19 Sep 2022 13:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bjogngX1F/JZwA+k9RfkZhp88x9yf+GaiFwl+CZH6hg=; b=d4nxG+MzP54k7yWbKFQHdqhuGv
	ozyorpIIgc4NNC9rIw994EZtM6mjs1hztVHSPVx0bIG5bf2wtTh988madhgQtJGM3ytUd3pLN6Nsf
	7MzV3Npvn+edwN/xTN4XEAVPVUU/tfjGeKs4EHIMgdaiynn5Lt8FqTIye5owf8vMn4xpy0CeeUAK8
	TSbFhnqlzFxMKabPlf5uh6Mt5IdwNJxhvHB8gah14SkZun2E10bmeyq3usOtPdHhKLFgRNPd9qiwd
	Fm/2Z/pCv+mydapcnpDMHXuSw5tGuGQyjepzNCFwihAkcNWhF7zJWpe3a69ymybUjV/sPZAPOYsUa
	PQSlWAOA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaH5L-004k8i-9t; Mon, 19 Sep 2022 13:45:19 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1CA95300202;
	Mon, 19 Sep 2022 15:45:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED5F02BAC75BE; Mon, 19 Sep 2022 15:45:14 +0200 (CEST)
Date: Mon, 19 Sep 2022 15:45:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mark.rutland@arm.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-ID: <Yyhyap+Xi3UtV+T0@hirez.programming.kicks-ass.net>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-9-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918155246.1203293-9-guoren@kernel.org>
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

On Sun, Sep 18, 2022 at 11:52:43AM -0400, guoren@kernel.org wrote:

> +ENTRY(call_on_stack)
> +	/* Create a frame record to save our ra and fp */
> +	addi	sp, sp, -RISCV_SZPTR
> +	REG_S	ra, (sp)
> +	addi	sp, sp, -RISCV_SZPTR
> +	REG_S	fp, (sp)
> +
> +	/* Save sp in fp */
> +	move	fp, sp
> +
> +	/* Move to the new stack and call the function there */
> +	li	a3, IRQ_STACK_SIZE
> +	add	sp, a1, a3
> +	jalr	a2
> +
> +	/*
> +	 * Restore sp from prev fp, and fp, ra from the frame
> +	 */
> +	move	sp, fp
> +	REG_L	fp, (sp)
> +	addi	sp, sp, RISCV_SZPTR
> +	REG_L	ra, (sp)
> +	addi	sp, sp, RISCV_SZPTR
> +	ret
> +ENDPROC(call_on_stack)

IIRC x86_64 moved away from a stack-switch function like this because it
presents a convenient exploit gadget.

I'm not much of an exploit writer and I've no idea how effective our
inline stategy is, perhaps other can comment.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
