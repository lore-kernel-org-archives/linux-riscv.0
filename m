Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A1FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2coJ07WUeweWpuXjphC7kMAlQAcY0qpNF98cBIwZtQ=; b=Sph9VPNx124zYQP0qmwc0PxzqO
	1EsrW8R+Fg7HHnDRNv/ZTZSeR6ckMI04FqenC7YfkYWPQyNvTM/t/BZCWcIVjwQVLI1Y4ZiJA0N6T
	tybw4cn5RfDxzoIr3wsHSXfYrvvNukCHTOWo7aJTSU6cTNfGCem7xbZUGUrhLTzK6zovi5PvhfE7V
	IS4JZ4CWRtF6BWXsDxS+g/z4EIHf4p/EcYprdeO5rGr/+NJcjy+7wwtiFf4BKQsMnB1VSQ9IJtOCj
	zZjB5np5aieVX4Kgklb2PiCB7peZrTWa4mMxSiVWoRc8aKaPNH1Z9PPXupejexGgJAqPkt3NQwuYm
	h2DZc7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFlD-009DLM-11;
	Mon, 20 Mar 2023 13:41:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFlB-009DK9-3D;
	Mon, 20 Mar 2023 13:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XVIhqwupsCSIASuPWW/g1ZTWC9CuDnU3GgC3RmY/al4=; b=DyrT4N/uIV1zb4wSFRvXBisMpT
	ZDJO+Hl76OYJCGCRkXIWaKCg1M1T8ON1O2OZSvCVnwNfjTQixx5xqMFjKDUGj+43DDc4t5sXY7Ih6
	2lwK+ZkRLYYqOk0AZAhxQxTARi/ntWSed1U4QgYqM6Xr9/LWskNl2fJb+UZz5WXtb/ID8JeoLykDe
	dTW96Yom5kvXiluKwH2GMzHsPiOVeRnCEu3V6LGYzEh7PTcOJwimmTie6DXcvaBBGUoSW+zxoV1BB
	y+EI/NyW44Eb86DY+RJdFEVZSucsGjEmLE0BNxuaDzAXxukpTWXOGUAyU4fIkkhf2PaaLd+INhvfv
	bEEMaSRA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFl7-003vLY-0r;
	Mon, 20 Mar 2023 13:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679319669; x=1710855669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPnzWermFoHYGXf1sxs5wBc7KDaOYQlXVtZo5m+F6X4=;
  b=GFq4k6uaZGZikJdrmAnoA2YggaN7pfpEvm5mEmvmblt6GhGjYFWw5etc
   spxkkxVOk1I53FNqxV/yPiWRV0fvVGVbRbX8aSkGs0QHzYH3UXIYmU8nY
   m54C0HNuBGuCVbQ9XtovK4lJdBqop8WkJzr9Puwk9TxmvquJ8QdH8DREz
   +TxaPivzkwmdZeWk3H2ILi7fwlTDyhge6G4c7hEH8cbHyNpCMjOBAkGzi
   gEV5sGqeI/F0Ql9LL445VbIYQ3/UTbDrh5KR62hl6t68A8pOesi9uMnPN
   /2FuusX1q5cDL8enbz8fItjxaHHc/xsEe9wSarZDXi9hj1E60Myl7boav
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="206286060"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 06:41:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 06:41:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 06:40:58 -0700
Date: Mon, 20 Mar 2023 13:40:28 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>, Guo Ren
	<guoren@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Bresticker
	<abrestic@rivosinc.com>
Subject: Re: [PATCH -next v15 15/19] riscv: signal: validate altstack to
 reflect Vector
Message-ID: <3d5f165c-d6d2-46b9-80c6-7f159d67019c@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-16-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230317113538.10878-16-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_134110_039175_1E7A4100 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Type: multipart/mixed; boundary="===============3644363369887360522=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3644363369887360522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yxPk4TWfP8/Ronq"
Content-Disposition: inline

--1yxPk4TWfP8/Ronq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 11:35:34AM +0000, Andy Chiu wrote:
> Some extensions, such as Vector, dynamically change footprint on a
> signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
> RV64V implementation with vlen =3D 512 may occupy 2K + 40 + 12 Bytes of a
> signal frame with the upcoming support. And processes that do not
> execute any vector instructions do not need to reserve the extra
> sigframe. So we need a way to guard the allocation size of the sigframe
> at process runtime according to current status of V.
>=20
> Thus, provide the function sigaltstack_size_valid() to validate its size
> based on current allocation status of supported extensions.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/signal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index d2d9232498ca..b8ad9a7fc0ad 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
>  	 */
>  	signal_minsigstksz =3D get_rt_frame_size(true);
>  }
> +
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +bool sigaltstack_size_valid(size_t ss_size)
> +{
> +	return ss_size > get_rt_frame_size(false);

btw, thanks for using a clearer function name w/ the s/cal/get/ change &
for the expansion on the commit message.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +}
> +#endif /* CONFIG_DYNAMIC_SIGFRAME */
> +
> --=20
> 2.17.1
>=20
>=20

--1yxPk4TWfP8/Ronq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhiTAAKCRB4tDGHoIJi
0i/qAQCfSzdB6WuFomcawZNe+09WjIDBQ/KE/QkzDqCJA3c5dAD7B5CUylj8niQp
8qv18v+LkX8krcxGEFGlhlm8E76emwY=
=NT4n
-----END PGP SIGNATURE-----

--1yxPk4TWfP8/Ronq--


--===============3644363369887360522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3644363369887360522==--

