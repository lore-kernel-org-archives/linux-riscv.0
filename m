Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20191C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 04:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cFcolwftVAFo2PTqxi+nWGrL61esNJij2p+FAL+PzE=; b=nILyEpmHVxrJF+5dP9vHZFvBLW
	n+ICDxPFTLNvXzi+VopZDpJcOjMoClcel6AzJoqzxxLDCHvlqn0r4nTZLGiq1BFZxaOh+hwOLO5+M
	b+Eb9Oc4lKe31ZDNIizPehi00phFMMcQUyBWJSx74bs2umy9aZIX5dhIQjFMiaXvXj4IrwmuXabnh
	7jC0PQ9knqQNHZv2tqEgCaafNPkcA8wvJ8oQIEiOoNC05ZFukm6F7000EgaBa2XLn19DQvUUf8jmB
	gyRtO/HMHwnpxn2wAU9u9Jq2XkupM+7AYdPaVxmIhDyfP/bc2WECDo/MPEX21GNjdk7UxbIu+Tzdx
	dLOdrsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4wWK-00AnrK-Bz; Tue, 13 Dec 2022 04:03:56 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4wWB-00AnX5-9W
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 04:03:55 +0000
Received: from leknes.fjasle.eu ([46.142.49.245]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M8hph-1p0FWq1vwf-004im1; Tue, 13 Dec 2022 05:02:25 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id C79803C0C9;
	Tue, 13 Dec 2022 05:02:17 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id 90111381; Tue, 13 Dec 2022 05:02:17 +0100 (CET)
Date: Tue, 13 Dec 2022 05:02:17 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH] kbuild: add test-{ge,gt,le,lt} macros
Message-ID: <Y5f5SQxQRFpH8u2s@bergen.fjasle.eu>
References: <20221211024647.2614394-1-masahiroy@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221211024647.2614394-1-masahiroy@kernel.org>
Jabber-ID: nicolas@fjasle.eu
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:5qgXUwpYs/m4w9C/Xh/pxvEtqm4qXUOG8JKpnIXe5eiduWTcQFb
 30ONln8NYJ54kyn7N5Swb0WdMBeILEHeTxKo552VtI/0gx4CYlzWmzwPsBUlXXQjBUZRkgX
 bidVuKdQv6jurc+NQ8+I3REVLkX0gGQqS7997ynbJTuoHmlQHubHLOUh17BhS7NmZ4vIv76
 MLkjxWSN7McjetvSnVYnQ==
UI-OutboundReport: notjunk:1;M01:P0:Bg++/5kr/Xk=;QHknaR3hrJn5tOUaaqybmwSHhOE
 WN5sxwZWC2pEba184Uuie/TSR3y2jVDpePH8ZnEdn0KeTzp/IWPwKkWADw3oxh3aQ1lgT4fQ2
 2vyvr+jR8Kw6GwbnUM1oPkJy2waZA82jB82zoLsWIIjiAOwR7DZ6FmVz+Ts3fRFqxfEQu2ejM
 kJ8u6ls8ocLXQP3PNoGgDtDe6nBHmtvfbmvS4sNsSYniPQfAV+bHQwKIQMoo+2SCJLQWp0idF
 qb60uDU/B25HUDkSVvCqLDYMO9F/l4Pm2ojLzwAkxDACEHqDwBlh6zjqMKFAYI0V/CiDpIGJV
 yluJnCYJhti9SJd2uv5kLTPCJKbdjqk0XuZDwc31HTZTPoeDY4zkH/OrmD1M/7nh2tWgwx9yz
 5XNGM7391CtMzfIbA0uPpTXuxDprOpsp0CZmxGA5iIcboJ7AF+xvxXaujbPLfx+PgdfTJ3wgm
 BdwO+N3iVpYZVhVeYIPPzC4Zm1xcjQWD9bj4Y4Dp8gziFdh42lXnEq7uyYfST5t47+f8rtiQW
 EOZ1KnVIc1z31LIXRM+yZeYApmyl068siCVf+OfAxc733fj0dYXUV6h5ViCkrC/tREL1YNXWG
 puszdn0uLYGtZcWQRj45zKp3eJTxYtZ8xNLWEAc3hAcvzdgx+YF9TMQ9mqx81GBQLhgUuiBfj
 nMwvEmO26cA7JhMffLSk03SAp3kCquFNo5Tw6y2Sbw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_200347_644011_BDB55196 
X-CRM114-Status: GOOD (  15.35  )
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
Content-Type: multipart/mixed; boundary="===============3086719867749014953=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3086719867749014953==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0t9NkD14nKZzrYq+"
Content-Disposition: inline


--0t9NkD14nKZzrYq+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 11 Dec 2022 11:46:47 GMT, Masahiro Yamada wrote:
> GNU Make 4.4 introduced $(intcmp ...), which is useful to compare two
> integers without forking a new process.
>=20
> Add test-{ge,gt,le,lt} macros, which work more efficiently with GNU
> Make >=3D 4.4. For older Make versions, they fall back to the 'test'
> shell command.
>=20
> The first two parameters to $(intcmp ...) must not be empty. To avoid
> the syntax error, I appended '0' to them. Fortunately, '00' is treated
> as '0'. This is needed because CONFIG options may expand to an empty
> string when the kernel configuration is not included.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
> ---
>=20
> Changes in v3:
>   - Use $(intcmp ...) instead of playing with $(sort ...)

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

--0t9NkD14nKZzrYq+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmOX+UkACgkQB1IKcBYm
EmkfAhAApWxZ5TLlye6r6ubq1oPH6KxdMTM7wec0/MHj+Ga99bJcULpcYoWA/016
vz1Al+59s3cJoV5oCTxVobXu2XpBVhpxiKWVQdKZFpSHt7LIhN/nbSCsDkyu7Lz1
RoVUZFFM4D3cChGVHZMHFsw9M1TE/5PplZ2LqfcCm6bsDuXWcEwpAS2vfuwk3ios
UQhvm6p76lKOhPynxY4xFJXaQDMseGlr3FlpbKLW9GZoHd3dWyBGvx2geawvo3Pg
ixoYKcvAj/EgrGYk2QP7PUGz7EB+cu5b0IPuSfp5BzNSuoZq9D8bZe1tIPD3d2sI
38YlpmqDa8RDTetSBpRXtRKtwtaC8HOxILKNLpEef4kb3G9/yKymY7Ao6DSh/bj3
gSF0PgeaaUaUmYw2kF5s9VuIPEoP8acIzNnGeVFRBPj5xEqTRI8inyYDZsR6WzfJ
iKSB8+Zt85GJMhMXdqrEhWcGmpjZEFy4jkj+IwzEPHNbXTkNz0hNh1xqaVXayrav
7YGt/E7FEwoCsix2WlEIrSk/TU2Xdm9dTvjRhrkDrDMxSYlgXwFXiR4l4kWPLcDL
8h+BoSc5QNYOAFoy3oNIlMySHhNUuKB/mmCRiLGb2tly/DyttNkmzpr7Y24EAlVU
sHaM9f3vw8RwTv6w2sNW+6y0/Cc+84Um1el7bLhN1TZ8S8b9V2U=
=ESv1
-----END PGP SIGNATURE-----

--0t9NkD14nKZzrYq+--


--===============3086719867749014953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3086719867749014953==--

