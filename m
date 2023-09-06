Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC71AEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nb5Fkcqy2MamBwsUPo+q+yqDOiJf1ibYdRFi5QcrhgA=; b=A2qsn1KL99zhO29+aucDi6CKVw
	RQA5CKcXusgolbf+NYmfIgaaFoq2Aig220GOZagR1ibglSwijX69vI8gj3BYYd4Y5hzMZ89oxQlGt
	OZDEjDH31jd343XtvplZTbGU24n9m7lxbFxHcsUZGtws3IcL50dniUooAPABwiI9H/Ts+fQJpwfkd
	zUU4Q3RhsI2QiO0MSKRb0rblx2XGK3iz989ObRR6clwUCn6lFB74E77UYqxrO86cgQW9sJQs5Vh9K
	6yHPdi2fEfxBtdYR2DkMJNrcziRp2ffi9VgUS9s/P6FdyFMuJEGlr9BNEj2CMlluiDmXeUxd0anwE
	XFIAMIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoII-007oYV-0H;
	Wed, 06 Sep 2023 08:53:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoIF-007oWY-1V
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 08:53:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE89E60F77;
	Wed,  6 Sep 2023 08:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE238C433C8;
	Wed,  6 Sep 2023 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693990423;
	bh=5wNOSjCIX53yHAgpQLo0J4zmOqYAVrchHwwqh30SC7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1y29nBsWXmlMVHy3xSgWYEygjSdrTYSz9K4QQPTZdIAqPF90X1ZXjE6nnX0xBujU
	 r8C7aA3vvbH7pYGfT9ijqp8SgMPdeVrxaT+RVt1yS6COeGb84eA0EsSxRiZ+ynxFyr
	 PR1e8xepjVNkTLvrEYN9NqIea5exCdW4roBOhcRdDIRhqpUvILk+oXeSwzXVd0Mzpp
	 /7jWcjLIEoaPcZEanwh2kKbbwMrbiWZaLQDg9UOoHpJbaCPSCq7JpZxJpVNY6ZhvpM
	 zMGwwd/IX2U4p9BktldU77x7rTxSXXbylXRhXF+qzI3/2JoEI7eWChJ3YhDvSyCD1e
	 0fmlAKwFxdd8g==
Date: Wed, 6 Sep 2023 09:53:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiexun Wang <wangjiexun@tinylab.org>
Cc: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, falcon@tinylab.org,
	jszhang@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH] modify CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK in riscv irq.c
 file
Message-ID: <20230906-b33d3ce6a85d5cf0493c031a@fedora>
References: <20230906062414.254602-1-wangjiexun@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230906062414.254602-1-wangjiexun@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_015347_612240_0ED2C26B 
X-CRM114-Status: GOOD (  21.97  )
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
Content-Type: multipart/mixed; boundary="===============7260363291252427526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7260363291252427526==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GuWpPX9xt59am0gl"
Content-Disposition: inline


--GuWpPX9xt59am0gl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 02:24:14PM +0800, Jiexun Wang wrote:

$subject: modify CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK in riscv irq.c file

Please use a subject line that matches others used by the subsystem.
I guess in this case it would be something along the lines of:
RISC-V: Fix use of non existent CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK

> If configuration options SOFTIRQ_ON_OWN_STACK and PREEMPT_RT=20
> are enabled simultaneously under RISC-V architecture,
> it will result in a compilation failure:
>=20
> arch/riscv/kernel/irq.c:64:6: error: redefinition of 'do_softirq_own_stac=
k'
>    64 | void do_softirq_own_stack(void)
>       |      ^~~~~~~~~~~~~~~~~~~~
> In file included from ./arch/riscv/include/generated/asm/softirq_stack.h:=
1,
>                  from arch/riscv/kernel/irq.c:15:
> ./include/asm-generic/softirq_stack.h:8:20: note: previous definition of =
'do_softirq_own_stack' was here
>     8 | static inline void do_softirq_own_stack(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~
>      =20
> After changing CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK to CONFIG_SOFTIRQ_ON_OWN_=
STACK,
> compilation can be successful.
>=20
> Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>

What commit does this fix? Please add a Fixes tag pointing to it.

Thanks,
Conor.

> ---
>  arch/riscv/kernel/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index a8efa053c4a5..a86f272ae2c3 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -60,7 +60,7 @@ static void init_irq_stacks(void)
>  }
>  #endif /* CONFIG_VMAP_STACK */
> =20
> -#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
> +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
>  void do_softirq_own_stack(void)
>  {
>  #ifdef CONFIG_IRQ_STACKS
> --=20
> 2.34.1
>=20

--GuWpPX9xt59am0gl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPg+DAAKCRB4tDGHoIJi
0skmAPoD9GzpHpslzuAmWSRHYROTN2Bqb8oxwJdw+C1CZAfLjQEA+jtxEH9f9xJP
XUP7VsZ6Ewv8Z4/KePbod37z0xBbtgU=
=pGJA
-----END PGP SIGNATURE-----

--GuWpPX9xt59am0gl--


--===============7260363291252427526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7260363291252427526==--

