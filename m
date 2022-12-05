Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB48C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crn4j1zUYaWknOqLeoNPJrkDD8TfBtTksQcaJxiXUxo=; b=x2kpxzyRgcDNsscel8s37p87gJ
	gIsY6vIUR2o6U2+TqPBNbJFdt76s4bhm+GAPnRV7LUA6rgJcQPTS66togNfJWHG+akS6OyOKr/oRF
	O7zG0bA926gxWHZPysv4Em8ej06WDvbmPI+ENm3cgDP9qO6pvy5vpR+p1fRJcJnwzSNSGrQ9fqCal
	Oz32lJmD27rFbcLnWhsEb4InLCZvWCuh/fdjMz2C0o+umYNX7YtrerZVUlVe6QCezOpWgdVBJxPre
	YP60q+YQwcr8QXl+H9JraZkIKpzS0GSWUODE/zcw1cZ+qShKg8rsoLhTaonmIX4pAji4vnDykgfKs
	nR6xv6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GqQ-0098cU-Sf; Mon, 05 Dec 2022 19:09:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GqN-0098ZO-UP; Mon, 05 Dec 2022 19:09:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E664612ED;
	Mon,  5 Dec 2022 19:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9F5C433C1;
	Mon,  5 Dec 2022 19:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670267374;
	bh=6ugKg8XgFTkNG84QNFHtzuPWco24KqBv6OpdEDRioF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQ6ZDMbocsys8DvrxnXnZS67TgJYhZkYERnmdFOeolKoOj8ggiPZUAs/0ZD+Ql78i
	 +77/x2EExotYgU3SpDgxtbTIeL1jKBPu8BmdHv0HbBfc4Aa5c4EQ1jCciEdlSx2Nfy
	 kzvuJkVM6iVjtUrBO7KwGFXQc/CInJWMWtViYk7STVfM+VtHPxlQyxP1QpkGLTPZT0
	 MhCbWkxud8JmjP0lk1ny1l2XQFZT/+Kf5WfExvxFMyjH0Gc2gE0IjTwQDwI0lytl8g
	 IvLhQWnpJRfuDGyqB9Y5veYtY1lHqtXKYlKi+LKEW6Zroj69Gxl6C5xd4P37gHxhPP
	 aPnxC2j5REpDw==
Date: Mon, 5 Dec 2022 19:09:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 03/13] riscv: cpufeature: detect
 RISCV_ALTERNATIVES_EARLY_BOOT earlier
Message-ID: <Y45B6eB0BQTSZMEa@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_110936_042637_9A3BAE3B 
X-CRM114-Status: GOOD (  19.78  )
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
Content-Type: multipart/mixed; boundary="===============2684160307752995112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2684160307752995112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ROJIk5MPQ3MQ0MkM"
Content-Disposition: inline


--ROJIk5MPQ3MQ0MkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 01:46:22AM +0800, Jisheng Zhang wrote:
> Now, the riscv_cpufeature_patch_func() do nothing in the stage of
> RISCV_ALTERNATIVES_EARLY_BOOT. We can move the detection of "early
> boot" stage earlier.
>=20
> In following patch, we will make riscv_cpufeature_patch_func() scans
> all ISA extensions.

I'm not 100% on the motivation here. Let me try and regurgitate the
changelog in a way that makes more sense to me and maybe you can confirm
it.

Currently riscv_cpufeature_patch_func() does nothing at the
RISCV_ALTERNATIVES_EARLY_BOOT stage.
Add a check to detect whether we are in this stage and exit early.
This will allow us to use riscv_cpufeature_patch_func() for scanning of
all ISA extensions.

Would that be a correct summary?

Thanks,
Conor.

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 364d1fe86bea..a4d2af67e05c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -305,6 +305,9 @@ void __init_or_module riscv_cpufeature_patch_func(str=
uct alt_entry *begin,
>  	struct alt_entry *alt;
>  	u32 tmp;
> =20
> +	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
>  	for (alt =3D begin; alt < end; alt++) {
>  		if (alt->vendor_id !=3D 0)
>  			continue;
> --=20
> 2.37.2
>=20

--ROJIk5MPQ3MQ0MkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY45B6QAKCRB4tDGHoIJi
0gcWAQCiQMg5Wozpr0WVgdCehOiu3NTihv2RvGoWtlhZoCEB0QEAs910IJMPlZ99
OxKW1kxlggOReEGh+AHf4JDbq+k4VA0=
=f2RF
-----END PGP SIGNATURE-----

--ROJIk5MPQ3MQ0MkM--


--===============2684160307752995112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2684160307752995112==--

