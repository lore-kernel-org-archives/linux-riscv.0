Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1332C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwhAsfTxRvZJE3mljtDSLT8VCp9KEOzsCY4DbF3hJk4=; b=T8OVIT1xUBjyLUj5GZKKnvXY8/
	2oKtZQ6mhfiRZUjuVnw8J53JtFRn3X4wizzUoilb45r/J6ObVIqLHeFzkZ3LNqhbd2nXfSoRmMv9O
	J0pM/byaSEy3ZVB3+Q6fMZfkleJWxEIW49W4sUhJrAH6QLR/rrj1PjEGG/PWqgkP3IL3sEzHg0HRI
	yEPYdctP9jKDq60bUywOMytuVQACiwI1LdJKwp11QneQg3bk1Hn2wC5sA2RWjz04702ncZJ5DcM7R
	9HrFzdQlXQ401t4UM2pNMlMwfXTz01A/daTv5z1KvnaAyEHEeUqCBFZ/fxee+JQWaoM6IbR1LeFIY
	V1wsx1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaoX-009jAn-2X;
	Wed, 26 Jul 2023 09:28:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaoU-009j99-1w
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 09:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690363690; x=1721899690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWI8BN0I0gaWnWPq+rnd1lL/hQZJEhkF2KexTcF60WY=;
  b=bcFHyxZ90KDwvHYtzXcaj0SIznqh3l4PA/Il0Y0mqhX2CrzommT24TYE
   zYpNvXEGT0j29icrs1+OfJlfFc8oZmzGBKxhKO1gB3H+HwoZEJP9teF9m
   FyWzQe7fwYlA4PHOA0/Gvv/ED7KA5cdcWtk6CJDYqyc0RAmE1YE6tpqOB
   ApyOfYXniYOiGLYDxirc0xAUo3tnyUTbE+Npw+EOPTGt5SzA3xzeANEGN
   rQin8Mi0K2E4htraPG0imDdH2lhcQqFH2L1azLQEfOK5sf5Or9OZTlLJn
   4WD1TqMCe0MeG9j16xpAu7bB52Tg/ibK6q6z5LsbDDPr3j41Y4cGKt1ZV
   g==;
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="asc'?scan'208";a="225284568"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2023 02:28:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Jul 2023 02:28:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 26 Jul 2023 02:28:07 -0700
Date: Wed, 26 Jul 2023 10:27:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: wang_yang <wang_yang6662023@163.com>
CC: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Wang Yang
	<yangwang@nj.iscas.ac.cn>
Subject: Re: [PATCH] RISC-V: Use GCC __builtin_prefetch() to implement
 prefetch()
Message-ID: <20230726-washing-scoreless-12f0cca83365@wendy>
References: <20230726074732.32981-1-wang_yang6662023@163.com>
MIME-Version: 1.0
In-Reply-To: <20230726074732.32981-1-wang_yang6662023@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_022810_757812_D185ECBB 
X-CRM114-Status: GOOD (  21.84  )
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
Content-Type: multipart/mixed; boundary="===============8224244275090585577=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8224244275090585577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7z2nzsGN1jDIioBs"
Content-Disposition: inline

--7z2nzsGN1jDIioBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 26, 2023 at 03:47:32PM +0800, wang_yang wrote:
>  GCC's __builtin_prefetch() was introduced a long time ago, all supported=
 GCC
>  versions have it.So this patch is to use it for implementing the prefetc=
h.
>=20
>  RISC-V Cache Management Operation instructions has been supported by GCC=
 last
>  year.you can refer to
>  https://github.com/gcc-mirror/gcc/commit/3df3ca9014f94fe4af07444fea19b4a=
b29ba8e73

This should be in a Link: tag.

>  It is worth noting that CPU based on RISC-V should support Zicbop extens=
ion.

How do you intend determining whether the CPU supports Zicbop?

>  This has been already done on other architectures (see the commit:
>  https://github.com/torvalds/linux/commit/0453fb3c528c5eb3483441a466b24a4=
cb409eec5).

That's not how to describe commits, please see how that is done
elsewhere in the git history.

>=20
> Signed-off-by: Wang Yang <yangwang@nj.iscas.ac.cn>

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars p=
er line)
#6:=20
 GCC's __builtin_prefetch() was introduced a long time ago, all supported G=
CC

ERROR: Missing Signed-off-by: line by nominal patch author 'wang_yang <wang=
_yang6662023@163.com>'

> ---
>  arch/riscv/include/asm/processor.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index c950a8d9edef..f16d4c85ca5b 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -70,6 +70,17 @@ extern void start_thread(struct pt_regs *regs,
> =20
>  extern unsigned long __get_wchan(struct task_struct *p);
> =20
> +#define ARCH_HAS_PREFETCH
> +static inline void prefetch(const void *ptr)
> +{
> +	__builtin_prefetch(ptr, 0, 3);

As far as I can tell, this does not do anything and will be removed by
the compiler. Please take a look at how other extensions are implemented.

Also, why 3? (Your answer should be in the commit message)

Thanks,
Conor.

> +}
> +
> +#define ARCH_HAS_PREFETCHW
> +static inline void prefetchw(const void *ptr)
> +{
> +	__builtin_prefetch(ptr, 1, 3);
> +}
> =20
>  static inline void wait_for_interrupt(void)
>  {
> --=20
> 2.34.1
>=20

--7z2nzsGN1jDIioBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMDnBQAKCRB4tDGHoIJi
0im4AP4zuaPEjwNldgorLZ7XQnAcFueQvdQrx0h7e6ZAN6oYzwD/eO+uxgIz3j5r
iG/Dye9EddOEg2EZ5jMAWCkWn+jHFgk=
=kzQ1
-----END PGP SIGNATURE-----

--7z2nzsGN1jDIioBs--


--===============8224244275090585577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8224244275090585577==--

