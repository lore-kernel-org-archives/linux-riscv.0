Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33365EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpiu8DJEv9irz5bF7K1rCD8d6Q/gYNc8qLvc9YhZ4/Y=; b=I/rQAgcmncjj/rZVFWlzsJNm0G
	V9I2MifY4DSbY+KMKI2cfYf/jljmdbi2Pyl9VYeiwyv89FUQHSMBrnumCDq+C+KNmytywOncP77DX
	C70aAVOYYrWWgtAjyJ+RPt0L8wskDfVYS963mU5A3ZNjKxm3VPfJEDHMl7Xycw2LmpAAZogIllE+B
	iKks5IzXRAFm8wxxkHrcllFHQwo7ivsBhYtuJJSasTn9sXES1mr8zTBaJawxNPNeU/ZATygVNjY1y
	eZJ6EuBEC5eep/Dm9CLnvM1vwL4si/sHUXOsAPULu+M1pUpViLZZmrBBJxGFdWbfmWX8P2oKdKHyx
	6mEIOXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZRS-009io0-1n;
	Thu, 03 Aug 2023 14:36:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZRP-009ilc-12
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:36:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91F6261DCC;
	Thu,  3 Aug 2023 14:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6476C433C8;
	Thu,  3 Aug 2023 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691073398;
	bh=64umwzmMHvF5T4akxhCYwvfOtoV/FtgrTaDvUmJNgls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tR/5zwP7IAunmfklGyp1wkqqNaZpP9pLY0LblcLh7I0b9B6UT80UmK1+AqBGa8Gbo
	 yBgixmj27zu4MTbsZ8ttd8oLkjm3yeie8cE9zE2ZC/WM0TQOSr+KKH4F1lUa3r1mxR
	 ZfRtvAsR2my4Yx4WFoZLOqix7fZGGaXhNMsuNrZlsK7ZeksrZfqL1iepc8NOaljBWq
	 Hp1DtvZoeUgkTV2mPdAUtPTi1iyeN16lfxkvTgDj2ZEtbO9gwtNvhOSKQzU6yVGYUj
	 craQfKcmvOszSUjI/QYSofpUKYPpUDtU3MYCFtgSe0cjunm3hMF0hLTX7F3GWNHlgN
	 oiWoSfnw320dw==
Date: Thu, 3 Aug 2023 15:36:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: Fix local irq restore when flags indicates
 irq disabled
Message-ID: <20230803-curtly-sandbox-9ff8c7aafb85@spud>
References: <20230803132818.2092166-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230803132818.2092166-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_073639_409517_07E86DE3 
X-CRM114-Status: GOOD (  22.29  )
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
Content-Type: multipart/mixed; boundary="===============4551398132662427229=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4551398132662427229==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ah5lt3gn3k7k1TBd"
Content-Disposition: inline


--Ah5lt3gn3k7k1TBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Aug 03, 2023 at 09:28:18PM +0800, Xu Lu wrote:
> When arch_local_irq_restore() is called with flags indicating irqs
> disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
> implementation based on csr_set() function only sets SR_IE bit of
> CSR_STATUS when SR_IE bit of flags is high and does nothing when
> SR_IE bit of flags is low.
>=20
> This commit supplies csr clear operation when calling irq restore
> function with flags indicating irq disabled.
>=20
> Fixes: 6d60b6ee0c97 ("RISC-V: Device, timer, IRQs, and the SBI")
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---

There's no changelog or explanation, so what is the reason for the
resend?

Cheers,
Conor.

>  arch/riscv/include/asm/irqflags.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/i=
rqflags.h
> index 08d4d6a5b7e9..7c31fc3c3559 100644
> --- a/arch/riscv/include/asm/irqflags.h
> +++ b/arch/riscv/include/asm/irqflags.h
> @@ -49,7 +49,10 @@ static inline int arch_irqs_disabled(void)
>  /* set interrupt enabled status */
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> -	csr_set(CSR_STATUS, flags & SR_IE);
> +	if (flags & SR_IE)
> +		csr_set(CSR_STATUS, SR_IE);
> +	else
> +		csr_clear(CSR_STATUS, SR_IE);
>  }
> =20
>  #endif /* _ASM_RISCV_IRQFLAGS_H */
> --=20
> 2.20.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--Ah5lt3gn3k7k1TBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMu7cgAKCRB4tDGHoIJi
0j1cAQDxSyszd+g0BfkWsXDmOvMud8yXRe1U4rQjPKB0AMEAuQEA6pCd1rxfAu+0
aXDbSnV/PG41bwAkzhmd1SbHuIktkQo=
=PKfK
-----END PGP SIGNATURE-----

--Ah5lt3gn3k7k1TBd--


--===============4551398132662427229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4551398132662427229==--

