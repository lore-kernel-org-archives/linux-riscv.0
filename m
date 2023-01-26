Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA19BC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 21:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfh/FcLClgUEaX/0fq0sLxR+rqNP4KfmBEMsKYhRWDc=; b=MygaOCeUAcbG+3cWa6mw+Tlee1
	Ug+kZdOagvyibSKBGnYrH41VR73ZN/o0Hkg3Q2hT9V7ilx1XzhfUouHqgQFrBC04xoVWbIIOvZbb5
	cPof6vbeRrDtBK5CZlbj+S3iJ05sH4YUuJ8e94TYdN6dJWcIMkJBBpeinMRN++9CiwI3oLYke3dlz
	sX4g3yz+nlUww+U9tQK5KPjJ9l900jI0SIEpq8UMCPxKOH17NZwbL/JdbC7p9HSt1ID7MHav4y2lx
	jvsaPh4XoistBi1Pvxfg8LfE8nJhnHgR5FodvHPZ/LaMLDraJr0bJB+hKmmlBKkfjYKHVs4XULmp0
	sFEJQ13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL9Sc-00CaFK-HX; Thu, 26 Jan 2023 21:07:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL9SY-00CaDH-Gc; Thu, 26 Jan 2023 21:07:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 977D261938;
	Thu, 26 Jan 2023 21:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2F0C4339B;
	Thu, 26 Jan 2023 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674767215;
	bh=Ppta7s+cza1Wa3n4i3Lt9bAtYmobvY+8Fx+wlBv7I7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlwzjLANHi+Xj3Y+7+StAUpxHetxmrzs765Gi+9wSHxqiFJ1C2goDeGk6tpUupRd5
	 oyIfcbgkBwstgCcI8h4hXUTso57skhfP5V1QvxQ9ByRUbX86d2ZGDFLTbzD40Ml9sX
	 YNbFdhebW3alSAj0iQ1PEpGCiMQ0vx7BWUgdm/yqGbpjeGv/2s+zmqZoxUYGxG7NiE
	 ZiYDOC+dSifUpoUUuo+cOTXsFzSfwDQaLCurlVzHXI9DXC0v9aWpWif6C3H43ku53y
	 rGr/RLpcTuzhQVO5zHi8mF6qplAe/PErs5z2NlcVdmG7oTTGhvsBM+jlOXWfdQsWJG
	 KORUU+b+sdfyQ==
Date: Thu, 26 Jan 2023 21:06:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH -next v13 06/19] riscv: Introduce Vector enable/disable
 helpers
Message-ID: <Y9LraUk0SZfYWu+O@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-7-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_130702_673043_FA5D17C6 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Type: multipart/mixed; boundary="===============3986500279596012975=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3986500279596012975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zndK4lDP+3zPv3BZ"
Content-Disposition: inline


--zndK4lDP+3zPv3BZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Wed, Jan 25, 2023 at 02:20:43PM +0000, Andy Chiu wrote:
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
>=20
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: create new patch from meshup, introduced asm variant]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andy.chiu: remove calls from asm thus remove asm vaiant]

Again, these chains are odd but a reflection of the series' history I
guess.

> ---
>  arch/riscv/include/asm/vector.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 917c8867e702..0fda0faf5277 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -11,12 +11,23 @@
>  #ifdef CONFIG_RISCV_ISA_V
> =20
>  #include <asm/hwcap.h>
> +#include <asm/csr.h>
> =20
>  static __always_inline bool has_vector(void)
>  {
>  	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTO=
R]);

This likely will need to drop the static branch due to Jisheng's series.
See here for what the equivalent change to has_fpu() was:
https://lore.kernel.org/all/20230115154953.831-1-jszhang@kernel.org/
Hopefully that series has been queued by the time you are resubmitting
this one.

>  }
> =20
> +static __always_inline void rvv_enable(void)

I'm not keen on these function names. IMO, they should be
riscv_v_{en,dis}able() to match other riscv specific functions, like
those of zicbom or sbi stuff.
Other parts of this series use riscv_v_foo & riscv_vfoo. Some of the kvm
bits spell out vector rather than v. Consistent naming of functions etc
would be appreciated.

Thanks,
Conor.


--zndK4lDP+3zPv3BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LraQAKCRB4tDGHoIJi
0mqsAP9Qo6HEuZtRfJkKXx2t6klPzSPuz6ZQJ/dPp3HjDgcnMQEA1QNZBTWJA/d9
dhQCa9qj+NiMhnhvwKGzggrdfRX3iAw=
=Jevm
-----END PGP SIGNATURE-----

--zndK4lDP+3zPv3BZ--


--===============3986500279596012975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3986500279596012975==--

