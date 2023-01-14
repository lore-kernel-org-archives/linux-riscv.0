Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E942FC46467
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jan 2023 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3za8NI4wwWxHypS9Nm4JQMiF+zCcf44Zx+g3Z6Jefs=; b=L/Z0twMGDFvxamPeXIbsgcujHt
	TDMrk/jjAogeDreOd3WVjycXuVmQ/EozbDo07Y+zxCzpXZeNDdIrKSHZFy11Tug/qqpwdsjKSVjWs
	vvepeN+XYKs+9L4z/FOWRIfDEOK9eZFkcNGVQlZJldnHCb88So889Ph1sKpuxLaFd7OX/zqB6uxjz
	UQpf8Je/rq9Y4TGtNGXHlwD1zKqZ9qzSgqyTMvd/OCxBk/1NHEPqXwYeTTcxiHkz7sPqqitkeWU6d
	VG1lGUKOFFG8YbKR+EJNlZ9uT1RZzMmTahgJerQoE8NV+OP8Fe14TssTHl7NjpTexUKnTXfRzERgI
	D/QdzHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGkjj-006J5i-TG; Sat, 14 Jan 2023 17:54:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGkjh-006J5G-9V
	for linux-riscv@lists.infradead.org; Sat, 14 Jan 2023 17:54:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 977DB60B90;
	Sat, 14 Jan 2023 17:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DF6C433EF;
	Sat, 14 Jan 2023 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673718872;
	bh=cBeCxDNt7FUR/blvv0t/bXalulF8Saf8c3fJIq9XoYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aivuiw8UdlHw9A441tNbYDGuKkEk9lM37ueYvKgCxyh8SqU249cAMuCRuBGKKLwIn
	 NCfuP3h64IlPBpjplGn4C+LUZMtth1wv78xpiPom5RUbvxWe0npSz69chNorLf2ldL
	 1QHRZgxhLaQtijIASwWTwV72bgl9yu+SkiUNZ2JAsRvSZpe/HyiZWyL9v/9VbkugfQ
	 eOpIhApcYO+FuPg01LwG96IONcp7nrhZ51PDbwfAYXKEduLweArUtpRWJF71D1r4nN
	 +GsTDEnAapVqtK3c7mQuozqJ88csWoRU70bSzDam4xArSZ8P4HAhaE+zV7MQezsvNa
	 aAxTpMdsupZpQ==
Date: Sat, 14 Jan 2023 17:54:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/4] RISC-V: use bit-values instead of numbers to
 identify patched cpu-features
Message-ID: <Y8LsUyEHMRriwhZ5@spud>
References: <20230113212351.3534769-1-heiko@sntech.de>
 <20230113212351.3534769-2-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230113212351.3534769-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_095433_392092_A207B218 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: multipart/mixed; boundary="===============7398457183406624837=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7398457183406624837==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5jhH67jKmqcLQVg9"
Content-Disposition: inline


--5jhH67jKmqcLQVg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 10:23:48PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> RISC-V cpufeatures are often based on available extensions and maybe even
> some combination of them. Using a bitfield for the errata-id gives us a
> simple way to also require a combination of extensions for a specific
> alternative patch.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 7bfc6eb9a5cf..8c83bd9d0e22 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -350,13 +350,13 @@ static u32 __init_or_module cpufeature_probe(unsign=
ed int stage)
>  	u32 cpu_req_feature =3D 0;
> =20
>  	if (cpufeature_probe_svpbmt(stage))
> -		cpu_req_feature |=3D BIT(CPUFEATURE_SVPBMT);
> +		cpu_req_feature |=3D CPUFEATURE_SVPBMT;
> =20
>  	if (cpufeature_probe_zicbom(stage))
> -		cpu_req_feature |=3D BIT(CPUFEATURE_ZICBOM);
> +		cpu_req_feature |=3D CPUFEATURE_ZICBOM;

I know the behaviour isn't changing here, but using a bit per feature
seems like scarily few, especially if people come along with variants
they want for all the various dinky extensions that exit.
Probably gonna need an iteration on this stuff in the not-too-distant
future...


--5jhH67jKmqcLQVg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8LsUwAKCRB4tDGHoIJi
0iY5AQCkgjzZG4+gb4yyqASifmM7cl3Vjgoo4Sc1lBtxfEYn7gD8CvW02mWiUJUO
ydA/jEBdGt5NOx8GnQM3Y/rR3pH5BA4=
=d3X0
-----END PGP SIGNATURE-----

--5jhH67jKmqcLQVg9--


--===============7398457183406624837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7398457183406624837==--

