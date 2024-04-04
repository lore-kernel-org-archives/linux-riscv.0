Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95120CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vayjVIJ3kPnlkEcJ40lXtTXROMuakV4i2btJsB5e27U=; b=Dlmgq8aYPIYu6Iqr2fXjjh2EWT
	WFAKBUwucqhmpTizqfmZXocytLYEqKNsns3X1YvoltuTORUbfDjM4RiXrjQy2HQ6UukV3JBnPIzyp
	oDnozUIL7f6OTtwKN9leeqSxfnZTv7dEOycnIi8CbpNajIHkOYEq3syQpyMlprFHmQZa0Z91xSNym
	A05PArY2lQE9mB/dks/64EQBpCfnYRM147QWpurwgn1goudMj+NbQqWiIxp9dJjtU2keF4L4X/0yH
	HKnsnSoxoBtOshDYSxC9bmqyo2nKq0Tm/iLrcJrc2t26EHBrsdgZELfddEgMoar6BpR1PHDW6riez
	7bilZo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPcE-00000003OFY-0X7B;
	Thu, 04 Apr 2024 16:07:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPcA-00000003OEe-1HPQ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 16:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95C10CE20B8;
	Thu,  4 Apr 2024 16:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C05C433F1;
	Thu,  4 Apr 2024 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712246815;
	bh=tm8+FXhH2jeA1ChsBYxkJGWhFcDL7NhzCQe0eMRIEPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twOljwbZ0bR+ovWV+rHBST+6WBcax329s1c/aF3FAK55ayzBQ6d5xqL93JkQGTopf
	 aUYp0f6qVrSsj5lvv5O6W5Zwfq9tI0YXWFwKqjHDKKDvp7QFm0S7v/DG0kS6aEGwjz
	 GvxtNn2jxpbk2Yqe3qWomREMfBm97xJY+z8U9o2edO6DIO4MXFP0QpUXz5kEGf+0Q7
	 spzr+RgscH+ssdcgllP3ckKUZV4eDhOs1nJbhLEHDHyQFbSqQv/tALjSC3OxxlTOdM
	 Nxf6lnC/AWJ/c06DFIIeJ4b3KrdG0z/58VCZRjYrThHWUVzdt5SQMC4nYaBbb+Pihi
	 Hj266/LhZZymw==
Date: Thu, 4 Apr 2024 17:06:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qingfang Deng <dqfext@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 1/2] riscv: thead: Rename T-Head PBMT to MAEE
Message-ID: <20240404-pastime-reassign-2d23a6ea6265@spud>
References: <20240329121414.688391-1-christoph.muellner@vrull.eu>
 <20240329121414.688391-2-christoph.muellner@vrull.eu>
MIME-Version: 1.0
In-Reply-To: <20240329121414.688391-2-christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_090658_551791_8A1A4018 
X-CRM114-Status: GOOD (  16.67  )
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
Content-Type: multipart/mixed; boundary="===============0573491890739931669=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0573491890739931669==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BrV3yln9SR0qE3lm"
Content-Disposition: inline


--BrV3yln9SR0qE3lm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 01:14:13PM +0100, Christoph M=FCllner wrote:
> T-Head's vendor extension to set page attributes has the name
> MAEE (MMU address attribute extension).
> Let's rename it, so it is clear what this referes to.
>=20
> See also:
>   https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadm=
aee.adoc

If there's a resend, make this a Link: tag please.

> Signed-off-by: Christoph M=FCllner <christoph.muellner@vrull.eu>
> ---
>  arch/riscv/Kconfig.errata            |  8 ++++----
>  arch/riscv/errata/thead/errata.c     |  8 ++++----
>  arch/riscv/include/asm/errata_list.h | 20 ++++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 910ba8837add..2c24bef7e112 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -82,14 +82,14 @@ config ERRATA_THEAD
> =20
>  	  Otherwise, please say "N" here to avoid unnecessary overhead.
> =20
> -config ERRATA_THEAD_PBMT
> -	bool "Apply T-Head memory type errata"
> +config ERRATA_THEAD_MAEE
> +	bool "Apply T-Head's MMU address attribute (MAEE)"
>  	depends on ERRATA_THEAD && 64BIT && MMU
>  	select RISCV_ALTERNATIVE_EARLY
>  	default y

Since this defaults to enabled, changing the name should be fair game.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--BrV3yln9SR0qE3lm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg7QGgAKCRB4tDGHoIJi
0gcZAP9ItztlZzPf4E1lK7affDvrYgtHKd4cijE1tFM7HjQ/qgD9FFW82jeSY3G2
3r0w1gIiw/SCsdFNti2fabZZZvI9JAY=
=ibXE
-----END PGP SIGNATURE-----

--BrV3yln9SR0qE3lm--


--===============0573491890739931669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0573491890739931669==--

