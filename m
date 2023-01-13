Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22070C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 18:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEPsDv8DPIZeM8qu8avPzygic71WCuzyeLy01QE9occ=; b=gVHMo408kFq4s1AsDHD9cfGE5n
	sRHQXb8U2WBXDpkFsLeKaGx6kwTiatpDidxRHrwnfVEBIj1ervdVQbFsT9INOZXQHtDk/YbyTaSOh
	sWg+RvFqapaJ479trKPwxFFcg29WT/VoNVr18X/KvTXWhLF1//4moqyZbMteH03SqAZTYYgNV3cz2
	1XAlxbO+K7lyrpZnRNz8W8xb+9506zNJ2Aglt6W1RqhZUgUrkEPvR4B5UDn+m0PBoUX7XRCx7fb6K
	YFy2lkBagn79ftJeQeKzUhk/v8Z8j0IN5CJXDO8wkl1orzEK86tkdsqhwGX7rv3wdUuvwzNGgL5db
	2VGDdJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGOrC-0043el-D5; Fri, 13 Jan 2023 18:32:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGOr9-0043e8-Lj
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 18:32:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 341A3622D9;
	Fri, 13 Jan 2023 18:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7C0C433D2;
	Fri, 13 Jan 2023 18:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673634766;
	bh=LMQX4Yk9JoDU1EK8Wku4zAgoynNv0qGCi+JVZ96WGAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xt31pQVRh5BHWgj1bYntbih7Zsf1SbsQB/pBqL19TA5lLR45CbM2Zhaf1apqmt2L5
	 Dn/YVTdiBrW1pxrI839F2pTvgfmukmQSKVTYHP14korUvBeUk95wUCVsZQoAPK4Vwj
	 3eHdUg7uBvUzo+WFUnXL3F71WT6xtSUl1ykPY8VhBztyb65sNl9tBDw9A2MxxMIZJC
	 r2USHW70NUOzjZtYtORHCJdVw1qkvfq1h5XSXi/JWx1dUTsPWMab9/5MDtihdpTIWl
	 iEN0ccZtCX7tdYKT1iQ20EveNbVN+tvEKlouhPjbp+U/tHoY/VGmwMyekOq3EfjiBo
	 1XG0rgSh3N6kA==
Date: Fri, 13 Jan 2023 18:32:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <Y8GjySjm9OjoZvCF@spud>
References: <20230113083115.2590-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230113083115.2590-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_103247_808866_645AA95C 
X-CRM114-Status: GOOD (  22.77  )
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
Content-Type: multipart/mixed; boundary="===============7853889350462469905=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7853889350462469905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8H29E2czozb1Ysd/"
Content-Disposition: inline


--8H29E2czozb1Ysd/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Uwe, Thierry, linux-pwm

Hey Nylon,

Please run scripts/get_maintainer.pl before sending patches, you missed
both me & the PWM maintainers unfortunately!
AFAIK, the PWM maintainers use patchwork, so you will probably have to
resend this patchset so that it is on their radar.
I've marked the series as "Changes Requested" on the RISC-V one.

On Fri, Jan 13, 2023 at 04:31:13PM +0800, Nylon Chen wrote:

> According to the circuit diagram of User LEDs - RGB described in the
> manual hifive-unmatched-schematics-v3.pdf[0].
> The behavior of PWM is acitve-high.
>=20
> According to the descriptionof PWM for pwmcmp in SiFive FU740-C000
> Manual[1].
> The pwm algorithm is (PW) pulse active time  =3D (D) duty * (T) period[2].
> The `frac` variable is pulse "inactive" time so we need to invert it.
>=20
> So this patchset removes active-low in DTS and adds reverse logic to
> the driver.
>=20
> [0]:https://sifive-china.oss-cn-zhangjiakou.aliyuncs.com/HiFIve%20Unmatch=
ed/hifive-unmatched-schematics-v3.pdf
> [1]:https://sifive-china.oss-cn-zhangjiakou.aliyuncs.com/HiFIve%20Unmatch=
ed/fu740-c000-manual-v1p2.pdf
> [2]:https://en.wikipedia.org/wiki/Duty_cycle

Please delete link 2, convert the other two to standard Link: tags and
put this information in the dts patch. Possibly into the PWM patch too,
depending on what the PWM maintainers think.
This info should be in the commit history IMO and the commit message for
the dts patch says what's obvious from the diff without any explanation
as to why.

I did a bit of looking around on lore, to see if I could figure out
why it was done like this in the first place, and I found:
https://lore.kernel.org/linux-pwm/CAJ2_jOG2M03aLBgUOgGjWH9CUxq2aTG97eSX70=
=3DUaSbGCMMF_g@mail.gmail.com/

That doesn't explain the driver, but it does explain the dts being that
way. Perhaps a Fixes tag is also in order? But only if both patches get
one, otherwise backporting would lead to breakage.

The min() construct appears to have been there since the RFC driver was
first posted.

Thanks,
Conor.

>=20
> Nylon Chen (2):
>   riscv: dts: sifive unmatched: Remove PWM controlled LED's active-low

nit: s/sifive unmatched:/sifive: unmatched:/

>     properties
>   pwm: sifive: change the PWM controlled LED algorithm
>=20
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
>  drivers/pwm/pwm-sifive.c                            | 1 +
>  2 files changed, 1 insertion(+), 4 deletions(-)
>=20
> --=20
> 2.36.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--8H29E2czozb1Ysd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8GjyQAKCRB4tDGHoIJi
0te3AQCOUP2q+X8xQoPB6gQEJSA6kxsp3o3UBJtLo2y3rj1ghgEAv5fpkfmkc7fM
XrAwr8T1JhNctwLAS7OsG6CQibVFcQ0=
=wA6w
-----END PGP SIGNATURE-----

--8H29E2czozb1Ysd/--


--===============7853889350462469905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7853889350462469905==--

