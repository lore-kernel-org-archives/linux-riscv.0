Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860E5CD98F2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhfKJI8nybWmKvlG4Fh+szk6iDyRxHRHCvk9v/eSrRM=; b=m0sd/uIEYe80JU
	g+nlVGmRZwFiTG0mZyFLF8Orb0mwJFjgin46Y4nd6tXNUV6ksdFoZTVG/JP/HTlIbEmAMtWeHnXAE
	UChRz1aRFWJ7agSaNUbQjiIAup/ZgwBxuNfwpHmB2keok7FMP/9viX4J2K7kTylw8Kw6p2B1TgjxA
	LO2FExBs1u6B1GhMlOCr1wkxiL7vsI5jWXdNIicIS5l4lyD9x/JyMZOp0tkgwseqb9Yix9eQSfWfR
	7V5KxPiQCbJblrClD7iBaziIFfSU4Vu0huavsrHA1RlckJSvTcxWzRdK5wB5tf1gOQnlKAVkufQ7C
	97pLZ45+eh0QbJrcLTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbj4a-00000005HoB-2959;
	Mon, 22 Jun 2026 18:08:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbj4X-00000005Hnq-46zu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 18:08:39 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782151713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0RAcSN4Jyp8r6M0x8JyWR8gtgPSXUUxipoPgGSKt5is=;
	b=3xmxTP8sdaIJBm0i8KnU66mKd/STCYGyFd0ubOGffdrYoH1h2gI1KBGC4AgMg2+Cxlf/5F
	OcA4XhmK8EuWuXE56cf+Xc5bDBPtbs3upPcw0dDQZpYb87s6V6YjqbFj/B8U3gjD4gY+od
	9xeBkLIldlXe5Wl06QtlbEwYiX6T4lFx/cZ8Ckq6hFax1yKdPIqPLgMJEQpSbVX4LwroBz
	4fxWDTK2DhYxv8D/v+u2UrxVbk3hp23ZXVN11AY7UYlsrv+HzS29CuMNz+DwwSlz34zy8m
	H7hJYYM0fwXOgTePte+WxxOUX5HpOUQWosdF5OKWrzS4MrvTCtfw0f/SLpobfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782151713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0RAcSN4Jyp8r6M0x8JyWR8gtgPSXUUxipoPgGSKt5is=;
	b=+jfxFsaLB3ytIXGCVUnAlf8WfyPLSZSDlIOTZBUuDbvsq5fnQiMMJPAE3XLgBRT4/dWrly
	NhKiVwXs1z5tWqBA==
To: Rui Qi <qirui.001@bytedance.com>, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: Rui Qi <qirui.001@bytedance.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix frame pointer in call_on_irq_stack for RV32
In-Reply-To: <20260603035305.564823-1-qirui.001@bytedance.com>
References: <20260603035305.564823-1-qirui.001@bytedance.com>
Date: Mon, 22 Jun 2026 20:08:31 +0200
Message-ID: <87h5muv468.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_110838_172654_732E75B5 
X-CRM114-Status: UNSURE (   6.16  )
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

"Rui Qi" <qirui.001@bytedance.com> writes:
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -383,7 +383,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
>  	REG_S	ra, STACKFRAME_RA(sp)
>  	REG_S	s0, STACKFRAME_FP(sp)
> -	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
> +	addi	s0, sp, STACKFRAME_SIZE

Doesn't this break the calling convention? The ABI specifies that "After
the prologue, the frame pointer register will point to [...] the stack
pointer value on entry to the current procedure". The frame pointer is
already correct here.

It is the storage locations of ra and fp that are broken. The ABI says
"This puts the return address at fp - XLEN/8, and the previous frame
pointer at fp - 2 * XLEN/8".

Or am I confused?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
