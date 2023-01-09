Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64361C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+9SdKOepDfWzas3co5+eS1oR4M/8b+wuIp7q1s2qCs=; b=PsNxaPoF+wzj5c
	9QQ0jyJNwMnjvxCFQ/eJRP3M5eeDENq/fHBuDn5b3UC34upL9sbRcaOLCZ/3e6JQX4MEdVabXhNx3
	Ipih+O4TFIIgKJSACtZ2Q9H2HD0s7nqKQnhC5kTrBbLrjG2tpL8CbOi4xXvLPCRrR0s6jRGBnMJsC
	7eCRqTBHzc401CQw8ry/VSgl0GpU3lFKps+toDn6XyFsYlJR8w/tJzpeTmafIYJXFCmh3Wt3dhYiY
	ZlLVWzdLYRd+aw008B981frDuD+VO3nZ/ckQonC3iEPb7oCWykVe2H4NKejZqgqVWLPRqTHIV1dQh
	dfU+4dtjlqM4c2wiosqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzCz-0041jZ-0G; Mon, 09 Jan 2023 20:57:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzAm-0040dH-VX
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 20:55:15 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1673297709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QtBImeerWqPbZp6EK7tFNjHJVrZNpD+SilDk05oqvCs=;
	b=W8EX8KUkOiJUCEBol4TyA4Mu8Wg6t/S9Qz3eIBTrQil77AwbF3rNePtwiIbUwS7WH0c9pv
	7oXiOpGqwTLG8M7b7IQ1x54fnKy+k4wSUUiONTbpOAY9OudzOYuwqaLp7TkhpGvsebMG0M
	PzunNy2dDldo8XXUhGtfE3hmIABwEMP1Jk8WPbYMh4Z5WzDWwTAveBpKSvKcGfWBR1gGIk
	ssSQ8TS1B6zQ+DHpS2cxDvKoi7hKhQo3xuuLHORZyjV84Ww7R8cAtcki9Gh0d09s12vI0p
	ZSgR/G+4pLDCxnTW3ugPwEyej0teoZ+YC4nWUZnoxrXOzr9DZ4DaFtxJpUIYsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1673297709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QtBImeerWqPbZp6EK7tFNjHJVrZNpD+SilDk05oqvCs=;
	b=42LcaGX/RTqEr417RNiI5wDQpG7HDbzqohNSYZfEdyoTrP85SSL2O5tGhiUOHjrRGUZtbf
	/4WKRRt6UYjjUxBw==
To: Yann Sionneau <ysionneau@kalray.eu>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Christian Brauner
 <brauner@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Clement
 Leger <clement.leger@bootlin.com>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>, Julien Villette
 <jvillette@kalray.eu>, Marius Gligor <mgligor@kalray.eu>
Subject: Re: [RFC PATCH 12/25] kvx: Add system call support
In-Reply-To: <20230103164359.24347-13-ysionneau@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <20230103164359.24347-13-ysionneau@kalray.eu>
Date: Mon, 09 Jan 2023 21:55:08 +0100
Message-ID: <87pmbnjumr.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125513_363700_1CDB1527 
X-CRM114-Status: UNSURE (   9.86  )
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

On Tue, Jan 03 2023 at 17:43, Yann Sionneau wrote:
> +/***********************************************************************
> +*                  Common exception return path
> +***********************************************************************/
> +/**
> + * Restore registers after exception
> + * When entering this macro, $sp must be located right before regs
> + * storage.
> + */
> +EXCEPTION_ENTRY(return_from_exception)
> +#ifdef CONFIG_DEBUG_EXCEPTION_STACK
> +	ld $r1 = 0[$sp]
> +	;;
> +	sbfd $r1 = $r1, $sp
> +	;;
> +	cb.deqz $r1, _check_ok
> +	;;
> +	make $r2 = panic
> +	make $r0 = stack_error_panic_str_label
> +	;;
> +	icall $r2
> +	;;
> +_check_ok:
> +	addd $sp = $sp, STACK_REG_SIZE
> +	;;
> +#endif
> +	get $r11 = $sr
> +	/* Load sps value from saved registers */
> +	ld $r6 = PT_SPS[$sp]
> +	;;
> +	/* Disable interrupt to check task flags atomically */
> +	disable_interrupt $r60
> +	;;
> +	/* Check PL bit of sps, if set, then it means we are returning
> +	 * to a lower privilege level (ie to user), if so, we need to
> +	 * check work pending. If coming from kernel, directly go to
> +	 * register restoration */
> +	cb.even $r6? _restore_regs
> +	ld $r1 = TASK_TI_FLAGS[$r11]
> +	;;
> +	/* Do we have work pending ? */
> +	andd $r5 = $r1, _TIF_WORK_MASK

Please use the generic entry code to handle pending work, tracing etc.

All over the place....

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
