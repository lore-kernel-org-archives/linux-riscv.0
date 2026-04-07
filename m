Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3A5EDB7CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I2NTFS3pvGSvP/Yma5sPRROg8Zt/lLWs+HvYP0KPDM=; b=OIWo5DzHTWsKhj
	d6Obee5qjKN6rxBdG45tEOLSYSIQkF4YTD16ts/h7iumcNE8wnLkREGUsEWf9Qc467KLUf343FXiH
	dgffHNNTwNR1i13cf32GcRe6M/pJ/r+485qeK1REezG82bVcOWNto7XOA+ckKBkBysd/W4TowcrBz
	u5ymlGVipxl6DIvCYN7VJ3m9EsgY44ndxgHZbgzNfs4v8Ml1R7WisiR/QE0S5Ft4wj8fSQTwywzfj
	feFudayZA6B//eOO4+nvbl44nTEIzHYzh3fmIpJTpUfsGm6fk5OYmR298ugRtkee/iycZBoiafMMu
	Y1xO5BVvljP6dpQg4WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1z1-00000006Auu-0lnW;
	Tue, 07 Apr 2026 08:40:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1yy-00000006AuD-1oyV
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:40:25 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775551217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3P6sppRCZ532nysjXQBZ63OmSOENOJ3gK1ZnNiYlpPk=;
	b=q+BYRs/6LyZS484YvYqzyuGbHATpi84PID9SKYhbvA40mfLLH0r8YQjwWPdvqdPRgqF4qR
	uL5LNmdjAc0Wordcc5bh4E5mJAAXmhH++wpfkxBu3JWHgeTnvAStxyeyeXLDzDspIWXDOC
	q4uoHaXn8k5eZq4EvitInM5M5B5i/0WatI4AWVeFSv1+q2jfs4+pHVY62fwWQqJ0It6F45
	KLZnWDox8Xclw6Wrc/BsgnvzeLr1GN3g9WvO6+S49V1rWDouvN7ixv1om5of8AifT9ovtN
	uB6q3id5k3tAWMko427kBAkQ4oErNZYVUQ8hfAfEmfQ6xwuyx3FcMYjGG8SJHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775551217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3P6sppRCZ532nysjXQBZ63OmSOENOJ3gK1ZnNiYlpPk=;
	b=tQZ6/KOgxlfpxOcdBdbkzz0fEFFuJxOFWFN32mUoIjcJ7zsDQ/WCe85CxMJNpSpff4GDHd
	IOEa1g2h3A3VumAQ==
To: Adriano Vero <litaliano00.contact@gmail.com>, palmer@dabbelt.com,
 pjw@kernel.org, aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Adriano Vero <litaliano00.contact@gmail.com>
Subject: Re: [PATCH] riscv: Add WFI to secondary hart spinwait loop
In-Reply-To: <20260407074534.59179-1-litaliano00.contact@gmail.com>
References: <20260407074534.59179-1-litaliano00.contact@gmail.com>
Date: Tue, 07 Apr 2026 10:40:17 +0200
Message-ID: <87pl4bw4cu.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_014024_633987_DF37DD0B 
X-CRM114-Status: GOOD (  18.02  )
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

Adriano Vero <litaliano00.contact@gmail.com> writes:

> The .Lwait_for_cpu_up loop in the RISCV_BOOT_SPINWAIT path busy-polls
> __cpu_spinwait_stack_pointer and __cpu_spinwait_task_pointer, burning
> power on all non-boot harts while they wait for the primary hart to
> complete early boot setup.
>
> Add a WFI instruction before each polling iteration to allow the
> hardware to enter a low-power state while waiting. Per the RISC-V
> privileged specification, WFI wakes on any pending interrupt even
> with global interrupts disabled (SIE=0), and implementations are
> permitted to treat it as a NOP, so this is safe in all contexts.
>
> The same pattern is already used in .Lsecondary_park in the same
> file.
>
> Signed-off-by: Adriano Vero <litaliano00.contact@gmail.com>
> ---
>  arch/riscv/kernel/head.S | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6..ca208da7c 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -385,7 +385,14 @@ SYM_CODE_START(_start_kernel)
>  	 * get far enough along the boot process that it should continue.
>  	 */
>  .Lwait_for_cpu_up:
> -	/* FIXME: We should WFI to save some energy here. */
> +	/*
> +	 * Wait for the boot hart to populate the stack and task pointers.
> +	 * Use WFI to avoid burning power in a busy-wait loop. Per the
> +	 * RISC-V privileged spec, WFI wakes on a pending interrupt even
> +	 * with global interrupts disabled (e.g. SIE=0), and implementations
> +	 * are permitted to treat it as a NOP, so this is always safe.
> +	 */
> +	wfi
>  	REG_L sp, (a1)
>  	REG_L tp, (a2)
>  	beqz sp, .Lwait_for_cpu_up
> -- 
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
