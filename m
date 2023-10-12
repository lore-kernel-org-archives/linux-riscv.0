Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A04C46CA1
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNWycGZNRgA3D7WUkrNQ0eZbTjqFwrn3LABjFLyXCrk=; b=DEd/+t18OBQwKBshSw3Zyxz7FT
	NOZGXwWC43Gafi4B5Fm8iKrBxMzyvxh1Fx/sJg6FTic7bKwphusGME5Mx2EdxB/AZiP5ViMxtrVmQ
	soBqpnU+naGYJrocorqONkyQMKt/H/YFkQtC7prbyZk2k8KBfY9zg6VjOoJBbdFFMiJMqObJKF1n3
	1KgzdcqMv8+8TJIen1u/cguY2AN48lqLtzQCEsc82P6cUNf9INfdleusMZScIyeLI7EZuLhYfDjDr
	mMNtIz1pjWkODEBvU0afba0VSS9aCaxAaVcXYieOeVRI4idKMK55Sl/n+Dc0XSo5VVRFNMG7IXKrM
	IQTH1Rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw8P-0017tp-1h;
	Thu, 12 Oct 2023 13:53:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw8M-0017sA-0s
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EF05CB821AE;
	Thu, 12 Oct 2023 13:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E23C433C8;
	Thu, 12 Oct 2023 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697118828;
	bh=hP9GqwZqyjIq4sKb42+P7KV2OLLkworUneW0yBornWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fvefx2oK536ZNorGowLTjMkKHk2k3yD9e2kpZwo98AvIYEICRLyCPhIf29nkwrpnR
	 ZC1i49ZWSBiYvFJ6/0ZYzU2S54KamB0f4SPMskphVOyPBAKN1A8JDu9KO6PCvtdNlt
	 yi2zEb8UTUN79+m3xChbh9GSF4N6oaacZPEK7g9Aq598ePdJvTpyYagwocC/1dmPcP
	 Sc3PNT9OrPQdxGs9Kt52rILdq/kGPe13MzRPepu6K+/E4dXqcS13xR/hQp+CfY6ry3
	 ROD92oxWCLQLu0iowzxF2o5ZsYov+jtFX7+XpSrOA+vVuoJ/Q3v4k2mx9YftGYdc4n
	 NQBummIA63znw==
Date: Thu, 12 Oct 2023 14:53:43 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension reporting
Message-ID: <20231012-matriarch-lunar-819c1d2d7996@spud>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-2-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231011111438.909552-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_065350_600942_9076F13D 
X-CRM114-Status: GOOD (  19.32  )
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
Content-Type: multipart/mixed; boundary="===============4537610619455651574=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4537610619455651574==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xH+tnDUwNUWsuXSn"
Content-Disposition: inline


--xH+tnDUwNUWsuXSn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drew,

On Wed, Oct 11, 2023 at 01:14:26PM +0200, Cl=E9ment L=E9ger wrote:
> Factorize ISA extension reporting by using a macro rather than
> copy/pasting extension names. This will allow adding new extensions more
> easily.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sys_riscv.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 473159b5f303..5ce593ce07a4 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -145,20 +145,18 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>  	for_each_cpu(cpu, cpus) {

We were gonna add a comment here about when it is and is not safe to use
riscv_isa_extension_available() IIRC. Did that ever end up in a patch?

>  		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> =20
> -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBA;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBB;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBS;
> +#define CHECK_ISA_EXT(__ext)							\
> +		do {								\
> +			if (riscv_isa_extension_available(isainfo->isa, __ext))	\
> +				pair->value |=3D RISCV_HWPROBE_EXT_##__ext;	\
> +			else							\
> +				missing |=3D RISCV_HWPROBE_EXT_##__ext;		\
> +		} while (false)							\
> +
> +		CHECK_ISA_EXT(ZBA);
> +		CHECK_ISA_EXT(ZBB);
> +		CHECK_ISA_EXT(ZBS);
> +#undef CHECK_ISA_EXT
>  	}
> =20
>  	/* Now turn off reporting features if any CPU is missing it. */
> --=20
> 2.42.0
>=20

--xH+tnDUwNUWsuXSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf6ZwAKCRB4tDGHoIJi
0m+/AP9ncEcT+S7hTOAm1/bJAmNgKIbBFzM/wJ3YY5BPw5CNKgEA2hrCjToDKu8e
AHSxLFlyN1+JaoW5jsDmgdNiEDjzPwc=
=IToO
-----END PGP SIGNATURE-----

--xH+tnDUwNUWsuXSn--


--===============4537610619455651574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4537610619455651574==--

