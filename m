Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88047C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC5c4Fk5lj3UdgLDcYeJjNWtGUXCXpaJ35rxeAsGUYw=; b=Jcwc9odnsSfSBe
	7otfT7lPsWs0eplFg/paIgG+L/saB5DW0jXir1CJHewayvgxhN71SLIaTH8RHebFi/CHGjvbGOJsM
	8BzDvfGt2sM2uO76nFYfa0F8JN8qUht7vel/ZDXAZq/PUSnZ+62IawxKMsZhvW7+uvlC/bU84RomI
	dakLd6/pz6uklDrSaXH8ZsimytGtZcBlOa+QcXGThkgCRFnkNBmozYgEv27X8yyLCAoDOE3u9XoMJ
	3jmdpy58fMSqVx8DvhI/OkMO+FIB+eOQFoVFNLjVAkKxe/97JnDGdQkqHX0e/zmNF5B/19h1dWvxH
	Uc8EwbAUy3mxpmdbsTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4qJ-0000000EvTB-2Uxv;
	Thu, 05 Jun 2025 07:16:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4pC-0000000EvDk-1YZ3
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 07:15:45 +0000
Date: Thu, 5 Jun 2025 09:15:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749107738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umTS7/wxwJGZ/2nVekjYJpD6hur1aVjvLdCfSnqSTYU=;
	b=cdQvLKjkv3D1G2gKqvV4B3QBUO+wOWe7TkECPamTTWyc2+Hj0YZo5lKUSPqpMezodLf9LC
	P8VModRaY59790cYs9rxFdwq7Nb/jkTnwZk7syHafuFMQyIZNNaFKbHW6aBFdWsnmsjZkF
	hfMeLglQPzd4qwY/DOmCoQrvy5CKX+mNB90lOFfE1jFVMdiP+LpEuJxN48otO5rjdjQFLl
	oR7cznjKUQ35/HWUMRA+iIKtuYYNNJhoKRMMdqfT/aAptu8eM52h8ZYa1qPpm5uYdJIzWn
	L+o0ZY6D7mogXi4K0sDvVrqhK4GstaExO2lBO9h6t1Y580HoiZ4uqcyNBasC1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749107738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umTS7/wxwJGZ/2nVekjYJpD6hur1aVjvLdCfSnqSTYU=;
	b=Ll0Txor30Y+PWfzfK/UtImbmkgW7nNqiQS6WFGjTZWIhCwuSH5LkB5CTqgZdzpSXylUUv0
	s9PcEnt2MwwW18CQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: vDSO: Correct inline assembly constraints in the
 getrandom syscall wrapper
Message-ID: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
References: <20250411024600.16045-1-xry111@xry111.site>
 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
 <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
 <0f0eb024d7ed062141a8aa048017e6f7ef7c1fd4.camel@xry111.site>
 <57a1ced6-406b-4197-96ca-6b83d99ca1a0@ghiti.fr>
 <5065dcf8fe1995859874196aa9ea5c0bff056ae3.camel@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5065dcf8fe1995859874196aa9ea5c0bff056ae3.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_001542_549751_74FC1CCD 
X-CRM114-Status: GOOD (  20.47  )
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

Hi Xi,

On Wed, Jun 04, 2025 at 11:09:52PM +0800, Xi Ruoyao wrote:
> As recently pointed out by Thomas, if a register is forced for two
> different register variables, among them one is used as "+" (both input
> and output) and another is only used as input, Clang would treat the
> conflicting input parameters as undefined behaviour and optimize away
> the argument assignment.

Good catch, I forgot to check the getrandom() implementations.
 =

> Per an example in the GCC documentation, for this purpose we can use "=3D"
> (only output) for the output, and "0" for the input for that we must
> reuse the same register as the output.  I'm not sure if using a simple
> "r" for the input is safe or not here, so just follow the documentation.

This looks good in general. However the usage of the "0" constraint now dif=
fers
from the "r" constraint used by all other vDSO implementations, even the RI=
SC-V
gettimeofday() itself.
I'd like to hold off applying this commit and wait for the conclusion of the
discussion linked below and then implement the result of that everywhere.

> Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d=
12d6dfbdd0@linutronix.de/
> Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variab=
les.html
> Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/riscv/include/asm/vdso/getrandom.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include=
/asm/vdso/getrandom.h
> index 8dc92441702a..0d84a38e79da 100644
> --- a/arch/riscv/include/asm/vdso/getrandom.h
> +++ b/arch/riscv/include/asm/vdso/getrandom.h
> @@ -18,8 +18,8 @@ static __always_inline ssize_t getrandom_syscall(void *=
_buffer, size_t _len, uns
>  	register unsigned int flags asm("a2") =3D _flags;
>  =

>  	asm volatile ("ecall\n"
> -		      : "+r" (ret)
> -		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
> +		      : "=3Dr" (ret)
> +		      : "r" (nr), "0" (buffer), "r" (len), "r" (flags)
>  		      : "memory");
>  =

>  	return ret;
> =

> base-commit: dc5240f09bca7b5fc72ad8894d6b9321bce51139
> -- =

> 2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
