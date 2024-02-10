Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22BDC48260
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzwgcmeqHqpONAyFXIaeep5EXZgP9f40SO8rB57fmw0=; b=rsuQeViGQslnv0Tx8iwY2Dca82
	ltpAN1wJJqkAiVLxO0GDPw+AoAbLxkHikgQ+F5ol6XAaXQtFdx+BLxHAucEWzXdT+wZ1mVqZ03G5W
	pToS6zlORCh/UBLxiLVDiBPWcYYkcQTDX9cLIvcYk2OXGbhNCz9ATD5Wh1FDBmjpVOQIFtobLGEMw
	57SUYCwcwUrzWmRHtFNlA4A3TOH5bjTiECSr/MBpZwdf5rBBtbwLqL6R0C9aZ/egbxZANUBs9Yr99
	Ey5GLr+v0XCiIuqBN3/q3bVmZf4SLyMW6HwBlaBibdgCf7Ndiu/UJz0a775K37/wtwYqPy9LbqBlu
	p03Cem7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYuu1-000000022f3-0QYa;
	Sat, 10 Feb 2024 21:28:49 +0000
Received: from e2i605.smtp2go.com ([103.2.142.93])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYutx-000000022e7-3apC
	for linux-riscv@lists.infradead.org;
	Sat, 10 Feb 2024 21:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1707601424; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe; bh=/a1NKqeWXcomDM15U7re5KNGNhB+KStNX+Jjw32PO8k=; b=AfSWZcq9
	uwCnwEID1h4itCoJV6fKSXRXr4sWCk9WRNGCVwpEaGIYZJCWHVJbNwmnN3XjcB/6KH61M4xMD8ftl
	VZzneu1a30Yog+OF7DODS/f/IILQcSFe2obSzfP4ybcXaGl5V/CI3LFrz94UhMwr2ynEmT4JxOFk+
	hlFOuxmtH+/8Ng7s08qdI7TOppG2pD2VJ4u5l9qSYqTP/4O/7/HOIOBsbzOrVtPx9oNdkzMUzL3HT
	iFZEvCbq/6upKRwV4WnH6WsD42sjL0yU7Ls9OC+AvImtS8GxH7uR4DSBXXNZW5k/PVTOu8VAYqV0L
	3Ng4cBeD7mLC/LlPNKJrQg2Shw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1707600524; h=from : subject :
 to : message-id : date;
 bh=/a1NKqeWXcomDM15U7re5KNGNhB+KStNX+Jjw32PO8k=;
 b=EjdjswSQBZWl7GR3qQkBualloRRGkomE5n3fEBXD0AchfMSc8uQ+AugUnNSb9KSzw3X3J
 hhsxQ21ixgOaVrJRIcbzdGtUmGG4tBAPIkypc67lXMey3uoUTsVKGp+ybykEJVAtxuuFZkF
 zrcaQzXel5hlD5bRE2LFwCqCB8frOSjRjlGRPH4rHLdJfuMlJ2QUjJEWlXXaSeTHmQ3E8w+
 2FEB5lSipkAhgT2RedxZKEqMZ5gxZFO7TTLxDuUr3FTIFjk5s6eK+aEFVDIADGHO6DYKbx7
 BFhYxS17k/X6F/CHNoyTCOsrG8x1ee808nvdGM0BjXvBCh+r3Bn9q6rSZ60Q==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rYurb-qt4BXu-QO; Sat, 10 Feb 2024 21:26:21 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1rYurb-9EMoK9-0P; Sat, 10 Feb 2024 21:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1707600370; bh=2Du69mSeHaxU4Lx7+MOepHIT2fMVUkQRRtGqtvh8tn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NY+lAiZuOqkS5pMrJUpcG65n5ETEJV2Y+6gc5E/FA4KrEooCHnXiFhSd0KsKLU3N/
 3V9msP+z+BGKPowTYSTTNEmBr+1NIrpx57jUGQwQqM9RCQXeavAWqRwKTkQ9w8VmVT
 HYORQqzNDMTLtRrB3rbNgRNY2yBj7YRn9ojD9DtY=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 07A053E9DC; Sat, 10 Feb 2024 22:26:09 +0100 (CET)
Date: Sat, 10 Feb 2024 22:26:09 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Zhang Bingwu <xtex@envs.net>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
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
Subject: Re: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not
 exist
Message-ID: <Zcfp8fn7o74K08g0@fjasle.eu>
References: <20240210074601.5363-1-xtex@envs.net>
 <20240210074601.5363-3-xtex@envs.net>
MIME-Version: 1.0
In-Reply-To: <20240210074601.5363-3-xtex@envs.net>
X-Smtpcorp-Track: 1rYIrP9EuoK90e.xznh1gL1dyRPk
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sDwEn1GXPS
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_132846_520050_9321A88B 
X-CRM114-Status: GOOD (  18.34  )
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
Content-Type: multipart/mixed; boundary="===============3611092108568158481=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3611092108568158481==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W0xuwF1M0d/5Cjtp"
Content-Disposition: inline


--W0xuwF1M0d/5Cjtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 03:46:01PM +0800 Zhang Bingwu wrote:
> From: Zhang Bingwu <xtexchooser@duck.com>
>=20
> If INSTALL_PATH is not a valid directory, create it, like what
> modules_install and dtbs_install will do in the same situation.
>=20
> Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
> ---
>  scripts/install.sh | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/scripts/install.sh b/scripts/install.sh
> index 9bb0fb44f04a..02b845e7ab33 100755
> --- a/scripts/install.sh
> +++ b/scripts/install.sh
> @@ -20,6 +20,10 @@ do
>  	fi
>  done
> =20
> +if [ "${INSTALL_PATH}" !=3D "" ] && ! [ -e "${INSTALL_PATH}" ]; then
> +	mkdir -p "${INSTALL_PATH}"
> +fi
> +
>  # User/arch may have a custom install script
>  for file in "${HOME}/bin/${INSTALLKERNEL}"		\
>  	    "/sbin/${INSTALLKERNEL}"			\
> --=20
> 2.43.0
>=20

Thanks.

Reviewed-by: Nicolas Schier <nicolas@jasle.eu>

--W0xuwF1M0d/5Cjtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmXH6fEACgkQB1IKcBYm
EmkWwhAApeau8lv5luMtDVI0MRTjPUBISiudGax4Vj5+2kq+lpcurNBfDgb8g6vz
d9eKFrAY4RpiyQA/tfByDJMkOdxjeozILABmF9E/mHAU1ddjG0tdN7dCcoiadZ1C
nRQsrQ0hMPgl/ohv5Gq6uSBNs9iJ76I8VPAUSGVhSEUXPIlZoPMYgvaKWDrUEKoA
6T6PTWoCQZ9rTRIRDzuiiXDVnEtF7Yc8qcdU/GhJTaxXuvO0NAZ2we1D7evgQriK
pvlgl/Z3UEJuoqa7gLW0tP66I1aIoBW89cAmxOMPEbx7ILj2uz94ZmL6qxCh6Ift
JIjvMM6y/6q6XnQf5a9amudS45/dT8F6+2wuPsWB5mUyUu4Jtj+nP6HgLTQsw3MO
TblqqeWBw+OZFmoU/F6R2RLTkoS00OxKrNcVSQ4ztsHmbYJZC4uqx3qTdq296LDt
gfm7Me4IHyqXCpR2TkCNL2L+Y4iABSspsgayVoJMMRdGphz55Aa7tRfpu+M3Su7P
x21blad5Owsw9AgQwY3Eh7SUmh0ooNgFtC2w3hpwj41Whe1IcAQx8iyAaO5UG802
fweAOlp41rdel9LwyfuPqG0nFwTf3+pYdqOCTOF68S3EFav85/UDo6Mg9Zgk11Je
X9KRaCfNIMNh4RXVh5toNthTBAISAYeD8tHQypeyU4J9PunrzFc=
=PO1M
-----END PGP SIGNATURE-----

--W0xuwF1M0d/5Cjtp--


--===============3611092108568158481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3611092108568158481==--

