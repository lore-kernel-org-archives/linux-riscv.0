Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F299EC44520
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FD7o5UCeAAs7kJO/pAaqw1FnpmDY0SThdQ9h68NY92M=; b=iESq7yYmGAqQQS
	CxoYPqTIjhcEqB7Gzrjk2d2+OtOb6udWQqbdf/wDWpX4pagUS7BGjvL02PNGcPdmrbi7DGefd6rYm
	QF21s/HxLW2Y1ToysFJdYxSNOI1O42u1h/QZfJImTIpUN1cNQQx6LncAmqM3q9BbLIO8ZHkpQmXqD
	v9Sgu8HOUlBvK3SErhNdnjuB1GCrAufgZ40QvnsZs8SuiI4Onl5EmaQrpBZE2kBKDX0SfHvoUfgT8
	TaqlNQOKfqDfXABiJrZiuWXr7YJTRUVNIXFL/DywBTsXF9KA/EulD3iZUbl9G44+BQIHS4Dq/asBm
	9Lw2sGe687An0xah6CWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX8-00000002GdY-2rGN;
	Fri, 17 Jul 2026 12:19:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhX2-00000002GZa-4Bti
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:19:10 +0000
Date: Fri, 17 Jul 2026 14:19:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784290747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I31HBW//W1lUI7EXFhR98G0N5VlhYGpzvAUIsWeW1hM=;
	b=YVbtpmcNj7gLkZxsSAMG2Q/p3FDap8WpuARlcGUdKkIjxykiGAE/86xaf1hhV+qdH/9hA2
	JbMSA5ywjWCDerCYXbPhvo2zkRof49x3WO706vqyAKmFZJi2WFzfINnj32BXkpHAg1i259
	Qg0cG4o8CMqgAYfECVU2q5Gm2PvXAUvub1GjdGILbqyP9vVCDqsIWNHp3xMcnpXhQ26Rou
	M7CyY5IJVHuPd0Uys2bydALucQP1fpPSbJWMH/rsHG1IKDuMW/yLfnfR4A4elt4PqMCsC4
	+VUZtc78r2Gs41JNRUDnGdgE24cYHboXu+5pRBeTV5AXKbvZJRO0RzH5H6UNqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784290747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I31HBW//W1lUI7EXFhR98G0N5VlhYGpzvAUIsWeW1hM=;
	b=a62xPgcxddtT7yQTc1QFCbYmTB0t606YujCsPPo6VmO0vs9ZjUtuejPLvmcb6EgdjE5RBQ
	5uezr2PqtoT2zWAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 2/5] riscv: compat_vdso: Allow *.c source files
Message-ID: <20260717141802-ff4ebc0b-91bb-485a-b8cc-2bc3f7dd14e1@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <dab4d35efa5e62293efb7dd7af000edc9cc745e9.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dab4d35efa5e62293efb7dd7af000edc9cc745e9.1784274927.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_051909_186764_96396895 
X-CRM114-Status: UNSURE (   7.10  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 10:06:35AM +0200, Nam Cao wrote:
> Extend to support building *.c files. This allows adding futex.c in a
> follow-up commit.
> =

> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

> ---
>  arch/riscv/kernel/compat_vdso/Makefile | 1 +
>  1 file changed, 1 insertion(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
