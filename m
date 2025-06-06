Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129EDC5B559
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4b3gsqX9SdnrQvHpsnUJMROiGszusSvXDcgDeBFRVPU=; b=tdzYKgZ9VZbmtl
	IMgZTka9I+ouXLtUd/PjFqlMdoN0+NbbLv6MFrWKO67vUzHhZmidL3cEG0qHgnyyfr5thpoWrV9Lq
	sCgab5pkF2xWLGJ9RzUu9X+L73i+jwUVy2Npo6DarN+nzaRRxEGpzSrXn/HzBZhx50YwSlb44wa94
	KFduG0eIKlncS8g+n3QUXvYXlEjCa/JvJr9MBFEb0DPHUWbwJJ+gBUEcbIl96hOmvsqPsc9EFvwz/
	HeAf5VD6bjLNAkIv0xUrtrj+Bd+FcP5g0SwKOE21NyjQoUHneoCzH48XaLy5z4soC/4uTxmie8lpg
	FDANVGy+yLpRnKTDDwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTnJ-0000000Hacc-15tl;
	Fri, 06 Jun 2025 09:55:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTiU-0000000Ha5p-0W2i
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 09:50:27 +0000
Date: Fri, 6 Jun 2025 11:50:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749203421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLSdIgeVQP7vdahEotSJRsbMUWrTn+A4o1VzdMavb+Q=;
	b=qfI9canoTrdbiweyImkK8+XQqUokGbKt6yF73hV5xAPELJjJCwXWYMaClVYXCpgoRJQLdn
	uxngu1G/tD3VZ8m8GD4GT5FwACvglpJj7uHIsXi19E3UyFja1IlyTcK1IfIY02Epv2B2TU
	FCy4xQMKM+Dfez69y+W3b7XyaPZz4CneNK0Ysr+Lqml13Tccp6+XBCgnhPsAP4lXRhsUAG
	8bozl8DE6wKKHeYwNxNdpJNbDhJR2Kp11QD9I2BKtZrE1jpwNpqCWnNDYHZPjRvaw8higO
	rv0EFtRUEPi3/5aWI1qRlw519K8/5HazlwQeDbUhEsnDhtxRtv+GU24rmR8ukw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749203421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLSdIgeVQP7vdahEotSJRsbMUWrTn+A4o1VzdMavb+Q=;
	b=GIm3ZBAV/7x2LRtcycM/uSg7k41ZFVb9zA79HjVHngC7UurtpeqbV+h+P/KogITcjgi8lX
	D2Wb+zEjr8Bv8uCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
Message-ID: <20250606112858-abbbff06-c6cb-4c23-b58b-c69b0719e1a7@linutronix.de>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606092443.73650-2-xry111@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_025026_302248_6C031CB5 
X-CRM114-Status: GOOD (  18.63  )
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

On Fri, Jun 06, 2025 at 05:24:44PM +0800, Xi Ruoyao wrote:
> As recently pointed out by Thomas, if a register is forced for two
> different register variables, among them one is used as "+" (both input
> and output) and another is only used as input, Clang would treat the
> conflicting input parameters as undefined behaviour and optimize away
> the argument assignment.
> =

> Per an example in the GCC documentation, for this purpose we can use "=3D"
> (only output) for the output, and "0" for the input for that we must
> reuse the same register as the output.  And GCC developers have
> confirmed using a simple "r" (that we use for most vDSO implementations)
> instead of "0" is also fine.

The wording is a bit confusing. Maybe this is better:

	Instead use "=3Dr" (only output) for the output parameter and "r" (only in=
put)
	for the input parameter.
	While the example from the GCC documentation uses "0" for the input parame=
ter,
	this is not necessary as confirmed by the GCC developers and "r"
	matches what the other architectures' vDSO implementations are using.

> Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d=
12d6dfbdd0@linutronix.de/
> Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variab=
les.html
> Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
> Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

In any case, thanks and

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> =

> v1 -> v2: Keep using "r" for buffer to follow the existing convention
> (that the GCC developers have confirmed fine).
> =

>  arch/riscv/include/asm/vdso/getrandom.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include=
/asm/vdso/getrandom.h
> index 8dc92441702a..c6d66895c1f5 100644
> --- a/arch/riscv/include/asm/vdso/getrandom.h
> +++ b/arch/riscv/include/asm/vdso/getrandom.h
> @@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(void *=
_buffer, size_t _len, uns
>  	register unsigned int flags asm("a2") =3D _flags;
>  =

>  	asm volatile ("ecall\n"
> -		      : "+r" (ret)
> +		      : "=3Dr" (ret)
>  		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
>  		      : "memory");
>  =

> =

> base-commit: dc5240f09bca7b5fc72ad8894d6b9321bce51139
> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
