Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82768C44520
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ityyvG35O2/pZsaxE4f3iXzMmCNJP+kM5TUIs8sUZM=; b=XJgqCJMT6uSYMS
	ETGhBGoSyBHabgGU82oYZs9WFLAPFCXfomY/lMmiMoj0OCbC39DcInjtlndkJJq8PeM1R1JZUukoZ
	0NXROxSHYL5OvOPcJbspWdVwk4aZ5BfonbtgW+2a7C3hhb6uDmbxklpttSXY91CG1hGRabIMH8Lvj
	TkKqud+msqgLt4YwgD2tLoSocUBXk+0bKgRdBler3WDSaN0aPMjtvs06VrwuvY5CgUTa+V5ogJzJ8
	aeQ/6Mh7X33T0pcWhqknRlKskxHeiVAw11LWI9EX5rw0rxd8/pxRKpT2KNAwCHhRzW0pXATDK2Lw6
	Cn6a2DP7T7si1eLibsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhbk-00000002HWW-2SYD;
	Fri, 17 Jul 2026 12:24:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhbi-00000002HVv-2Yyd
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:23:59 +0000
Date: Fri, 17 Jul 2026 14:23:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784291036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO8EJDNLQXYZNX5WvmlZoaYlYz+UKBjxvIw9pB5Jw2c=;
	b=YwxKdLuqKo8h3mTU2CzbFobooTLMrRXd8zoUpwXRy75/M7vcbPOFwC2eWYsVj7cnVcOFlO
	SUcS+bN8vXBAE/2p0S0NWNXFmW0/3aS8VZscJrAxfje26LfmWu7lzxP6w+3bfm2JUP06XG
	SpdnMQmkemNZfIVKFwoPJiwHyJU+6npbKepo7oDqZefYDit4kqrSY7RnmYlFduXLE276jF
	+ziOhGNL/XRj58X3fPAeqEpN684x6SPI4Z778cOqh0wO02ud3aiQ3J6Mk5yObW9P8cO+BS
	UYPGBDvrNwwi9cxFdFOJdUMybfU2eqRLvaYbyH4suLmn6FSxmuiUf89cgbKsuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784291036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO8EJDNLQXYZNX5WvmlZoaYlYz+UKBjxvIw9pB5Jw2c=;
	b=nZlovhQ/t8Fy847gao/4rZlYETZJ0iCf3LLLtbs23w2y5KabiYk4nHz/QPQNSRbmdCoiKI
	BWFaP6pEcGJwJOBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 4/5] riscv: compat_vdso: Build with zacas if available
Message-ID: <20260717142102-54acd82c-7635-4b85-a7f4-642eff8ced55@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_052358_821096_6068A078 
X-CRM114-Status: GOOD (  12.02  )
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

On Fri, Jul 17, 2026 at 10:06:37AM +0200, Nam Cao wrote:
> The compat vdso Makefile does not enable zacas, disallowing source
> files from using zacas instructions. This is an obstacle to adding
> robust __vdso_futex_robust_list32_try_unlock() in a follow-up commit.

"obstacle" is a bit hard. It prevents using the optimized variant.

> Build with zacas, if compiler supports it.
> =

> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

> ---
>  arch/riscv/kernel/compat_vdso/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/c=
ompat_vdso/Makefile
> index 63580b33e3ce..ffbf84aeb081 100644
> --- a/arch/riscv/kernel/compat_vdso/Makefile
> +++ b/arch/riscv/kernel/compat_vdso/Makefile
> @@ -18,6 +18,10 @@ else
>  	COMPAT_MARCH :=3D rv32imafd
>  endif
>  =

> +ifneq ($(call cc-option,-mabi=3Dilp32 -march=3Drv32ima_zacas),)
> +COMPAT_MARCH :=3D $(COMPAT_MARCH)_zacas
> +endif

Could be :

ifeq ($(call cc-option-yn,-mabi=3Dilp32 -march=3Drv32ima_zacas),y)

> +
>  COMPAT_CC_FLAGS :=3D -march=3D$(COMPAT_MARCH) -mabi=3Dilp32
>  =

>  COMPAT_LD_FLAGS :=3D -melf32lriscv
> -- =

> 2.47.3
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
