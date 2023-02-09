Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAF5C636D7
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+6oTpvSKHbEa/XZd7kn6tqBO8zpRehxc9XxEShmf0s=; b=cdgqBnumhmD4s8QgRHiHQC+66o
	kMKYBTEto5Z3MyA1LbRqMITWylyjOHVDopZ4qIvUQM2Lu76qhAelANjsEcpKyvuJQ6v8X6hnFKcm/
	ZyGNzVNIoJFp+s9LriOndRz3gh/dgDF6zSZXfJOsO86fqw9W4aBqYZrSzYJIHmC6yYX8A0IRx34IR
	JQwy5Ps5I+AGTtBKknTQW14ZJqnt1fFDoJetO86GJV45/KnQMR2b1xaStyNYUCJCWdoCOERVvj/GS
	QG+IcAc+mehS97tpNV9oy7vzLbSbWZLjUlLz6pJ+fMGvcD26GbGqaNe91XHJqAsLqh2NkgxyE85Pf
	KrCnrodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBGL-002goa-Hz; Thu, 09 Feb 2023 18:03:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBGE-002gjh-5m; Thu, 09 Feb 2023 18:03:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0BBC1CE2605;
	Thu,  9 Feb 2023 18:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49DBC433EF;
	Thu,  9 Feb 2023 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675965782;
	bh=mb3BOfPQcnoilVf4xiklj2I0o95L3wXIQkgHxNQd3ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9cQMJj86Dw24xtTFSLjZeH+jvYUgvvPiGEI9QNOZLkrCCQeauFresJ19WVg0yV5J
	 HWm588jnaa5uVa0eMSVi9qeUGrrSJ7Ui3k8n329qNgIC0kB9CqVzWjNMeSErtVBr/R
	 Y6KiIRphIPLWx3vci2iV72yAXVv9N3T/8FzfbWift+8eaBz0XsYJk68meJHApPXkmf
	 zsGrNoFawQ4LDzb5YDV1ZVM11u7A2GtSuvGX8o7zOrUGprXQsmbVb4EZq9ZxcCUo9J
	 rmnWYcaX6OpJZ8eGatRJiSrSmtH8JvVd+3wyjdqbajfzULzFofg6yLDf48ud1MOi61
	 uRcjT8HttoncA==
Date: Thu, 9 Feb 2023 18:02:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/8] RISC-V: alternatives: Support patching multiple
 insns in assembly
Message-ID: <Y+U1UfV0oLOIHe63@spud>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-2-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230209152628.129914-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_100306_624598_A59E5F1B 
X-CRM114-Status: GOOD (  19.13  )
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
Content-Type: multipart/mixed; boundary="===============4845078424271676997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4845078424271676997==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mgCZ4A87WWmpAIwp"
Content-Disposition: inline


--mgCZ4A87WWmpAIwp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 04:26:21PM +0100, Andrew Jones wrote:
> As pointed out in commit d374a16539b1 ("RISC-V: fix compile error
> from deduplicated __ALTERNATIVE_CFG_2"), we need quotes around
> parameters passed to macros within macros to avoid spaces being
> interpreted as separators. ALT_NEW_CONTENT was trying to handle
> this by defining new_c has a vararg, but this isn't sufficient
> for calling ALTERNATIVE() from assembly with multiple instructions
> in the new/old sequences. Remove the vararg "hack" and use quotes.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inc=
lude/asm/alternative-macros.h
> index 51c6867e02f3..7bc52f33f95f 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -14,7 +14,7 @@
>  	.4byte \errata_id
>  .endm
> =20
> -.macro ALT_NEW_CONTENT vendor_id, errata_id, enable =3D 1, new_c : vararg
> +.macro ALT_NEW_CONTENT vendor_id, errata_id, enable =3D 1, new_c
>  	.if \enable
>  	.pushsection .alternative, "a"
>  	ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
> @@ -41,13 +41,13 @@
>  	\old_c
>  	.option pop
>  887 :
> -	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
> +	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, "\new_c"

The rationale above seems pretty reasonable to me.
My main thought is that vararg seems intentional, while the "s don't
really?
Given how much churn there is here at the moment, I think it's fairly
likely that the immediate blame will be lost quickly too.
Usually I'd err on the side of "try to explain the black magic parts of
the cosebase to mere mortals" (like me!), but this is going in with a
user & things will quickly blow up if it gets accidentally removed by
someone who doesn't see their value.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>  .endm
> =20
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enabl=
e_1,	\
>  				new_c_2, vendor_id_2, errata_id_2, enable_2
>  	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enab=
le_1
> -	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> +	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, "\new_c_2"
>  .endm
> =20
>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
> --=20
> 2.39.1
>=20

--mgCZ4A87WWmpAIwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+U1UQAKCRB4tDGHoIJi
0pYqAQC5V56D0NiVQdwWCyjcDk7m6RnBXWkD///DSI9ZOZVMPAEAwjJNxpik4szt
zCK81VZh/ZhH1aTnPr94O/1XEUYxwA0=
=Bd7B
-----END PGP SIGNATURE-----

--mgCZ4A87WWmpAIwp--


--===============4845078424271676997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4845078424271676997==--

