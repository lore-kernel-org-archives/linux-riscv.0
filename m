Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34311C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5KAoOI83WLawyJgW8r3IH7Z5vzyZzpgKRCiYrI56N4=; b=qZk2lKE0wCwWs4
	r6ibFVy1j98cF2ETpTW26KfG2SQ+jirucHHxrMaLrMQltj9yiVdL6wmKCKRDHHl0rUqEXTSNR1m0S
	Q721XHpBChNVPfEQeX/T8mNM1KxiBIyf43k0IZQeqsZl6wncp2qsKqoU56PSd4oP+Z9728QOMjh+x
	o7FGzV5iRl8OrHsHS5kgIasNWGPFxftSqdCy3syIsedE7pg/4D3pU+NNE+Qp0p8Zf6MZPVsBFKyGQ
	F/SWiNn1w8YLObmU7HyfETpP+dzyRue5ow1JQPRiscnFuk0Ad6T52sy40v49EkrSPzrO9wUvLK5Qx
	vcLZyok/R7B/B2Jaxt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZa7-0000000E7Xh-0Gtz;
	Mon, 24 Feb 2025 14:37:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ74-0000000E1WL-1ivQ
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 14:07:15 +0000
Date: Mon, 24 Feb 2025 15:07:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740406031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yi/UGbRIzBeO5oSPUsDf5E1KE9ikPRD3nsEqz8hQd6k=;
	b=TV9fnMs/yr1UwZw94lvVsC8kVLC/rl3eG02N2o8p0HxGUQhixOYga6CENfi0FPn9+ZZzM9
	bCUkCGNxZDBq4xVjbMjb6u9pBjltaOeuLWcBahyKAwc9+55GKbSLhYhGlcKwg2wYc2BzTQ
	9dpY+HG1ojkPse+Sr2HWq5LzSwD8EzwLCVbpOZghvNFy3EVckoad97iHX1jwGwrlg6nSi+
	TTxT4UUp7BhIuDCus0p8zGkEBuuUDybLIIvnAZCqF1MSGcvL7bMdwev9Yme2bjRvnv1fdV
	Q1U4jPlfo/CnMd1dDHvG0kYmYT+nJPylzIsXTw6rjXtzMC+/immYZ/xO4kA/ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740406031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yi/UGbRIzBeO5oSPUsDf5E1KE9ikPRD3nsEqz8hQd6k=;
	b=waaf8LNo5DT7x8hql4NYeB7kUqJ5lsSIuidG+6b5GkUxFcezAf1b6Q5cv4m0eAUyFwS4kp
	BCLVUywKKGc7gJAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: vDSO: Wire up getrandom() vDSO implementation
Message-ID: <20250224150345-46f09b09-3d94-41bf-850c-6188d21750bb@linutronix.de>
References: <20250224122541.65045-1-xry111@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224122541.65045-1-xry111@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060714_604029_549AD82E 
X-CRM114-Status: GOOD (  14.74  )
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

Hi!

On Mon, Feb 24, 2025 at 08:25:41PM +0800, Xi Ruoyao wrote:
> Hook up the generic vDSO implementation to the LoongArch vDSO data page

LoongArch?

"to the generic vDSO getrandom implementation"

> by providing the required __arch_chacha20_blocks_nostack,
> __arch_get_k_vdso_rng_data, and getrandom_syscall implementations. Also
> wire up the selftests.
> =

> The benchmark result:
> =

> 	vdso: 25000000 times in 2.560024913 seconds
> 	libc: 25000000 times in 40.960524767 seconds
> 	syscall: 25000000 times in 40.380651864 seconds
> =

> 	vdso: 25000000 x 256 times in 171.830655321 seconds
> 	libc: 25000000 x 256 times in 2913.107080132 seconds
> 	syscall: 25000000 x 256 times in 2692.084323377 seconds
> =

> Note that it depends on Thomas Wei=DFschuh's vDSO generic data storage
> implementation (now in the timers/vdso branch of tip).

The note should be below a "---" line, so it doesn't end up in the commit.

> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/riscv/Kconfig                            |   1 +
>  arch/riscv/include/asm/vdso/getrandom.h       |  30 +++
>  arch/riscv/kernel/vdso/Makefile               |   7 +-
>  arch/riscv/kernel/vdso/getrandom.c            |  10 +
>  arch/riscv/kernel/vdso/vdso.lds.S             |   1 +
>  arch/riscv/kernel/vdso/vgetrandom-chacha.S    | 244 ++++++++++++++++++
>  .../selftests/vDSO/vgetrandom-chacha.S        |   2 +
>  7 files changed, 294 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
>  create mode 100644 arch/riscv/kernel/vdso/getrandom.c
>  create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index aa8ea53186c0..6fdd63e15fb4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -213,6 +213,7 @@ config RISCV
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select UACCESS_MEMCPY if !MMU
> +	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO

Broken alphabetical ordering.

>  	select USER_STACKTRACE_SUPPORT
>  	select ZONE_DMA32 if 64BIT

<snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
