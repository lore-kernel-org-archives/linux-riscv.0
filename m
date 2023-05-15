Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EBFC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3SneKOmfa9oFNLp3kvSMcn3A2Yet6n6ndOqeVrRN6E=; b=DDFl/EUFXNOOru38ft66qHwgz3
	EgYRtnX1tBSGysAsMRWHl5kmIjrCig2TM6EbOcHI3mXMNr9PP5WH9Qt6bEmpNqAQcUvzC7Jb7puLM
	DfiaMTeMKIS6G2gFtSa8p2X4jk6RUMSSWQqT2ajAthdoTV2DM4dTL04LhEWFE9apx1b41hjE4vFCT
	W9kH4mx1lB62M97g6++8DjH5mNEksV03ZykXp+dwgMqMeBSmwxBq1JqDjUO0YVBEJCD7GXRFXaPUw
	2GM1nEr/K6g7DbzSdi8kADdJEIgfCCF27zmzRqU3LMaohJ5829Y/hdwqdZhooq/rr214dK0Aeb7na
	9kq2xeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pybnL-002tqW-1y;
	Mon, 15 May 2023 17:15:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pybnI-002top-13
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 17:15:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D575B62BDE;
	Mon, 15 May 2023 17:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BB7C4339C;
	Mon, 15 May 2023 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684170931;
	bh=Ev9noomAYJfnt2AIcctg5rEid6cEDTtCWoPYWoVf+aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkwiFK+JuMl25oOozpqhCwBZrNmt5R+yTHWLNsmkSSGle0QgrkFnRG5Eivgw+nn9o
	 5tYNxUYoFLwBMndntqThOY/VxXn7OLjnexsp0Op4L+ETxEcUNimiCeledGaHalADcY
	 aClbbxd9kXSuKR7k6qVaQCcbQnUhzirHnGDpHoLsTa2zUdOYupO6ZrXZ06vxvRhk6c
	 pRIURWR1dpLFOBDbkgVRhenkpVbrX8YqjF9RZqksfmCdrI2dJWuskGgZb7pvIqkXRI
	 tuzfD5husbKiz1LsPLly/mIT5A+byE8uzJKg7I6uVBuoLrxko1BToNdl1HZv1UADxA
	 0pLqH3AO4XIrw==
Date: Mon, 15 May 2023 18:15:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: update entry for T-HEAD RISC-V SoC
Message-ID: <20230515-skimpily-pluck-0a1f71e36020@spud>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-4-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230515054402.27633-4-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_101532_399348_52793F16 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Jisheng Zhang <jszhang@kernel.org>, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============5136074324161174965=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5136074324161174965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="++jOKj3XXxEhTRyC"
Content-Disposition: inline


--++jOKj3XXxEhTRyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 01:44:01PM +0800, Yangtao Li wrote:
> Wei and me would like to help support and maintain too.
>=20
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1e51accec4f..dc35c654f78e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18155,11 +18155,15 @@ T:	git https://git.kernel.org/pub/scm/linux/ker=
nel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/riscv/
>  F:	arch/riscv/boot/dts/
> =20
> -RISC-V THEAD SoC SUPPORT
> +RISC-V T-HEAD SOC SUPPORT
>  M:	Jisheng Zhang <jszhang@kernel.org>
> +M:	Wei Fu <wefu@redhat.com>
> +M:	Yangtao Li <frank.li@vivo.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/thead/
> +F:	drivers/clk/clk-th1520.c

Please tell me you actually communicated with Jisheng this time about
maintainership of stuff, since you're signing them up to maintain the
dt-bindings and the clock driver!

Thanks,
Conor.

> +F:	include/dt-bindings/clock/th1520-clock.h
> =20
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> --=20
> 2.39.0
>=20

--++jOKj3XXxEhTRyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGJorgAKCRB4tDGHoIJi
0hKKAQDjAVao6ahBxcrNBFDV6+WHrLkkFLBnLKnwkip62Qw5WwD/UQA7kNd/ynHV
xPGDx/VtvKrvvAVJX7emHY4xguA2JAQ=
=oQCM
-----END PGP SIGNATURE-----

--++jOKj3XXxEhTRyC--


--===============5136074324161174965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5136074324161174965==--

