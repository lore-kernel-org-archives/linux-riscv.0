Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A085BEDB7CF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aV8s6tb98mjBKH77lgIYuyXT93JF1/sWlM+r1l4ZSk=; b=n9B/uUZTd27hmM
	RSbqdvW2Si8zTNLfxCNbBQuxKpgYSqN3nprQSd5hW1P411OmRmdzYvBrRSqYhERH30qbdvBebmSRk
	qj1nMLhS9/W3fQQRR826KtHEilvqM37fePiy4NcpUak5oCbIUVEN3ymku1sc/owwp7geKzI/D97uE
	pM7GjMxojzt7F0muSZS2/ic+864DtmCyrGXqC2+lPzL6Z8LbuMLQpxUoN34xxbOYLIsuW9kzx8VLh
	F+aHFWt+oIQmIIGHCpQf6xl2N+wNhd4JwrCo9M8pUQ21w6ayOCn9u7M0tTLhkho8by5oWxwBuIrLM
	BzAYuXmIGm/HBrOktjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA23k-00000006BGT-3ZNI;
	Tue, 07 Apr 2026 08:45:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA23i-00000006BG2-1vZD
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:45:19 +0000
Date: Tue, 7 Apr 2026 10:45:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775551516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LEfzsxUfzdUUGylZzTw2wQa+j6mJ97fK5QE1yMShJpo=;
	b=4lF0LJn0E/D6w3OMdsrD6ZM3ZlTozhhkFeJFjuierm+0D+9MqJea4t8HSRUCoSTOSOuOgm
	NU4fiC6dvbjMErDsgI02cN2xHEOrokPJvv+IxDvllf/zrKw6ExDX57zf6ESpQbfoxRD17k
	79D8/VBkOYVTrteFZXkJEA9zVpl+DeongFt2TKNrROEVCcfd0ImsTLVhjTLhbY6RUGGcHz
	lSWVChmkKE0i06JFJgA/z7IxkvH87qVWmKm4WVEKHJ3T3mw41Yu2zJSQ2cZfNQ1h5MDDXU
	ze7bXEiSk1BRGfz0ObjeMUp5YR+ksen1jlD02HWyIuCyMYZepDUNFLV/iBg/UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775551516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LEfzsxUfzdUUGylZzTw2wQa+j6mJ97fK5QE1yMShJpo=;
	b=V5Owf4+1QKB3hSAApsCZSLG7ExDYWskhNVU1Wp8CdY/uvtDvTnhtSlBtL1obOOOUFpvk/4
	jRsvNOLM51edmTDQ==
From: Nam Cao <namcao@linutronix.de>
To: Adriano Vero <litaliano00.contact@gmail.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add WFI to secondary hart spinwait loop
Message-ID: <20260407084514.syOsks4D@linutronix.de>
References: <20260407074534.59179-1-litaliano00.contact@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407074534.59179-1-litaliano00.contact@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_014518_686403_3B6E7E3D 
X-CRM114-Status: GOOD (  18.42  )
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

On Tue, Apr 07, 2026 at 09:45:34AM +0200, Adriano Vero wrote:
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

Which interrupt is supposed to wake these CPUs up?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
