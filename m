Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71C4C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 21:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wn5S1HgMG0g03Z8P34niKZ/xvXOHYc88mzBSHq9c3M4=; b=EfA4VLDQ+H2TM/tFwjzinY0sDW
	xgH12WjU4hRF1XhQbq4JRx30ifuGJC3Ud6crxC80zZosSc5GBhpq7+EWXQohBP3uIJjbfD93IGALc
	M0ru+xFF8vqAv3YPdWEvrGMDAvSr72DcCtPh30QLOHkV9wh9fgsYJY1xSJJ8wmVznC0ni2JJqCT0d
	aiFR5IKCj5EvtqTGayGAlaeEB5bN/0aSuLRqM53MO/PUARnosu8Jezm3z5pQgrnqp+Gunen0EfaYO
	i8eM54ROd0vB1lNpev8yZFy2Z1cW3M5n7/C2XRrPPZ/pAEJbSw3qu/ZAMII0mHLNW0PTGZJDPDEQO
	yzMQaP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYuo5-0000000222L-1KId;
	Sat, 10 Feb 2024 21:22:41 +0000
Received: from e2i605.smtp2go.com ([103.2.142.93])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYuo1-0000000221c-1KE1
	for linux-riscv@lists.infradead.org;
	Sat, 10 Feb 2024 21:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1707601049; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=2Fq96AF5MB0+kJ+KJdOs/5ZldIf6fpvtRLYffLd24+I=; b=Pltqcn2s
	7oEmw3+2hnlMDLzb9eP1MZocM0FtRdeAuhhHRQHF7QWrbWXSwE9o3IAW9f2oI7Mlaoxxz5Spzvsut
	fqrqCpyOyEbSuUDmnZ2BlyS4gHQfrPW/cDh/hZ2u2j/tqTh7wPh/LFZuoRVr4Zz9nb6cSWGGaXbJb
	k/7+moaDYEncXBpC4z92wxYXX7Vg3MvxzP5UGvsnS0/6UkAXyNgQSUPL3AQH4OzA12NGnA9aTlrUI
	dMYvsH8cdBw3J7pMiKeeMQ76IIzRg42Mn9w0SLhztnxW4wHJNmEhhGI1WjgH+Kt+ZH79b55m3AI4g
	6g1I9Ry89e8BfcKNjw6CLo0vEA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1707600149; h=from : subject :
 to : message-id : date;
 bh=2Fq96AF5MB0+kJ+KJdOs/5ZldIf6fpvtRLYffLd24+I=;
 b=BNDjlyxmW21o0Q7vqfBShJN8SBn5QYGGCs+cBIMF336Befe9XSjqbQwkkmXLYIKqplzBW
 QB6uKSt+Lx3nMwPWa5w5AWInsqIz/maEw7tGbZBaLvjZREnhEMUA3/7Jv9JCdVuUTSsyBcy
 bYMlFCVZzUj0BY7v0O7meac8aJrPZ4wra41mknOPvb7ePd4hRrMepT40ol6orP7ZwZ/w7t7
 jZAAM8ZYOxztg/OzXF4BIcMcLHBqq3UiladLEL5xlHIFePNnHyHEGjxSZHB0M6ImZeP4PsB
 9gpVOqiOrsVC67qtn7aTxHw3oD/UxOagxMVWQGLYabWjN4U3wCWXtsoc1K8A==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rYulD-qt4Fr1-Lp; Sat, 10 Feb 2024 21:19:46 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rYulD-4XnyKn-0Z; Sat, 10 Feb 2024 21:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1707599972; bh=I1g56Qbu1U7xe3c1QV1JroAnkemuPw2aHxort9pD/Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JbkbT0pdaP8BnvXh9tpxj+YS6okGmBmnNGsrfdhfV9EoSpDF5F4uOHaMJ+xMqzgij
 GHorn8ZRP9m/80ivs1VHZsgnANVVzW1lsFOxlplnJSNro9J6nuH834VWmTQkPGt9Is
 yHwwg6G/9TmIg3PL7q7Lo4tsSP4IC66lViSJVPGw=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 9DE743E9DC; Sat, 10 Feb 2024 22:19:32 +0100 (CET)
Date: Sat, 10 Feb 2024 22:19:32 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Zhang Bingwu <xtex@envs.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Zhang Bingwu <xtexchooser@duck.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
Message-ID: <ZcfoZKJHkdEh5JmV@fjasle.eu>
References: <20240210074601.5363-1-xtex@envs.net>
 <20240210074601.5363-2-xtex@envs.net>
 <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
X-Smtpcorp-Track: 1rYI_D4bnyKn0Z.xzh11gNhzRRb8
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sd7ZiAHDp8
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_132237_950729_B95080C2 
X-CRM114-Status: GOOD (  19.79  )
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
Content-Type: multipart/mixed; boundary="===============0499223222694500772=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0499223222694500772==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="enK6rDCtE6qVMuuk"
Content-Disposition: inline


--enK6rDCtE6qVMuuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 10:29:00AM +0000 Russell King (Oracle) wrote:
> On Sat, Feb 10, 2024 at 03:46:00PM +0800, Zhang Bingwu wrote:
> > From: Zhang Bingwu <xtexchooser@duck.com>
> >=20
> > Setting '-e' flag tells shells to exit with error exit code immediately
> > after any of commands fails, and causes make(1) to regard recipes as
> > failed.
> >=20
> > Before this, make will still continue to succeed even after the
> > installation failed, for example, for insufficient permission or
> > directory does not exist.
> >
> > Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
> > ---

Thanks for fixing!

[...]
> > diff --git a/arch/arm/boot/install.sh b/arch/arm/boot/install.sh
> > index 9ec11fac7d8d..34e2c6e31fd1 100755
> > --- a/arch/arm/boot/install.sh
> > +++ b/arch/arm/boot/install.sh
> > @@ -17,6 +17,8 @@
> >  #   $3 - kernel map file
> >  #   $4 - default install path (blank if root directory)
> > =20
> > +set -e
> > +
>=20
> What about #!/bin/sh -e on the first line, which is the more normal way
> to do this for an entire script?

are you sure?  I can find many more occurrences of 'set -e' than the
shebang version in the Linux tree, especially in the kbuild scripts, thus
it's bike-shedding, isn't it?

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas

--enK6rDCtE6qVMuuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmXH6FkACgkQB1IKcBYm
Emmflg//QV42IFPNYuHOXGOMGBjwhOcPS5a63Ery8+rM164QOh4y8GFFm70Ti5Wd
s5wSWvSTxw+riHznvjEkrzi/KrHEMIWsy6HRRBdrzwpiytGb7QCnUT1LtSteBeNe
JPtcZ5MGz0W4HIUA4cj46FxFGpR+DjnrGk2FoXd/BSwhYq0asA1muUHQ0YwN3ksS
b86PM8Y/JgAbCGeA9qF+uZGaSFjU9cl4LQj14E7IPYrp9ZeDgYY3eC6vNPJ+64zD
Jipvq0pg5G9MrN92hNXw/VVn4pGrquNcIqFQwGypcZIb2YrKOLEtPBctEqZkYNfd
TGngv5bUFvUwllm9o/VpflR1XOx1auN2AJQux6l1ca41dhH/tKkFCrDU7V5Xxc6J
3VBC9QeZuVuh5AETrC9whYVFSIvoQvH5NHRV6ffqA6AGjXQJNsNNsUuwVnhliaDh
vqNO7OJm2ZoZmlBjNCGI1LsjNateOOY7mzk1Fsz9pl0OyhkDjjDoT56rTcC+Ykz9
HSceveMepuVG/vTNMEwXIGAaG3p+7+/mj4QrwE9TAWCRs/ASCnaMYJUkPmJLfuXD
tOP59blzBvkY5HAmDHMdl4AIFtM9rjm/JQORwYT2tB+MfdyZxCWWJPz7mjs6ykAy
JF9090FJh3puL9bw721bvpb75ptKyBxpuvQsas2SspCCtT1DidQ=
=NJcH
-----END PGP SIGNATURE-----

--enK6rDCtE6qVMuuk--


--===============0499223222694500772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0499223222694500772==--

