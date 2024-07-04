Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E6FC3271F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8ncty7bK+M6iGKyzmVdrrtFJSmCgLQVvHrqpeF/7Fc=; b=IbsUFFdGRuroY6onB3tLDRyCj2
	S3+qQG8b47JY25O9LEuo45ym0L00fNgdOJizWPIsRxkOlv5pzBRWWDYtByg09VYKRFA4UvKIRwtk6
	sFxQKyCBe2TJtsx0gbXAeWh0BcCMKpEv8Ub0Gw7QFP0B9p+mei+doKNoYBqb05plR5zHEK3NRM2kN
	GXTXEnu3ZgR5Kwdwa/wRBG2B8sHEUOZ/5cNT088WejFclnu4+Y9pbDaJwB+A8YDgAz1XuCg2vW/8S
	fJWVOxrNYZ56uyJfi/H2iagT67XWjl/mAMVzjsBRZgGkQkYEwD7XAGtsj2BQK5HAdO7VqdCglXWKB
	MaWUlbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQcZ-0000000E4vW-2dIg;
	Thu, 04 Jul 2024 17:51:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQcW-0000000E4ur-2bAE
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 17:51:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89A7FCE34CD;
	Thu,  4 Jul 2024 17:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843A0C3277B;
	Thu,  4 Jul 2024 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720115505;
	bh=QmNtYETo+LSMjDpgpqGtzayLtLBpJJhN0N8w0nwzzSQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=TZBKdqndvghJgB+e9TdfXQ0zB/3q3A23PgJezT3r2rmkRq6Qb+Zxt9dSg5XSClKCS
	 Ws1SgCydHVphcjKZ7LJZmnz8+KoDspbpZi51FwUoogoxOCx9jdcET75KZPWSMu3pfQ
	 HQg3FWK5ZYGW95IMYi0c8jfEjkPpXDjCieJUh3mnDc8fQm7hMsfrcxr0HeFl4EOKQY
	 y6IStVppYD9mOjnoOj6NWhjg4HoVJhXwtVuLjZMQZQ8+SURhLZFFyhKf1cX7G0AP9Z
	 ZJ6Ug372/MvLH9yTJut4Okkuwr3+fvn/piVoRv8uMqRDh5UPwUn+TvWXs0WeDwoboP
	 xXpZ8SV/tVPeQ==
Date: Thu, 4 Jul 2024 18:51:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <drew@pdp7.com>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: thead: add git tree
Message-ID: <20240704-zesty-audio-4774bf482048@spud>
References: <20240704174921.2514921-1-drew@pdp7.com>
MIME-Version: 1.0
In-Reply-To: <20240704174921.2514921-1-drew@pdp7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_105148_854084_A314CF9D 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: multipart/mixed; boundary="===============5668951613221137647=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5668951613221137647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="umQ9gQCL/QRKdSiN"
Content-Disposition: inline


--umQ9gQCL/QRKdSiN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 10:49:21AM -0700, Drew Fustini wrote:
> Add git tree for T-Head device tree files and, in the future, drivers for
> the T-Head TH1520 SoC.
>=20
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 120351e41ef7..d60b066d5880 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19322,6 +19322,7 @@ M:	Guo Ren <guoren@kernel.org>
>  M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
> +T:	git https://github.com/pdp7/linux.git
>  F:	arch/riscv/boot/dts/thead/

Could you squash in
diff --git a/MAINTAINERS b/MAINTAINERS
index 691f98fe8ed3..2bb4796d3e12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19513,6 +19513,7 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 X:	arch/riscv/boot/dts/sophgo/
+X:	arch/riscv/boot/dts/thead/
=20
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>

please to avoid it being confusing to have 2 different git trees
covering the same platforms?

Cheers,
Conor.


--umQ9gQCL/QRKdSiN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobhLgAKCRB4tDGHoIJi
0mYzAP9UUP8jq+98LnIdqdhqMvezMSCLAkgxFIsrHAgt9iB9DwEApUT0igPzr577
4VbVRzeRjNwXgoLCxCcyoWY8u6+mZAE=
=2kX8
-----END PGP SIGNATURE-----

--umQ9gQCL/QRKdSiN--


--===============5668951613221137647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5668951613221137647==--

