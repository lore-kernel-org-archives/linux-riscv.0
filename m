Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4EAC46CCD
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNIAHBaIakp9h3U42uVusYSquAl4DWFEN+YSbcEylxQ=; b=NFP/WS3wUGBEHaLkKyRgshRqJY
	8V6pu0ndluEMMHkqLqEVTntuTXuxNb/Zldm5x0r5KYjuMCH73mB2xIUiX92Jgo8C2ZY5oSBfO1q2j
	8yBdKuJuGJRjgTpnyy3j6HdLYozAxXYD0UPehQzh3Ici/jyE9oua0d95DKne5xEzVxrV2Zi42EmXK
	At1zL9HwFVgFZE/iBomRvUxulh4l5aqgw4yXkD1pXDnMAvxluiTIWPPySvUMz/EQndjtWpVHfI6ho
	VjpeEi6O9njVYCokukLGZLtwPHrVC9Zn56y5nWJ5JKkwt66LfXne8KcCDndUbACbZamDq8eUYqDxD
	DTHLM0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rET71-005zys-0k;
	Sat, 16 Dec 2023 11:45:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rET6z-005zyH-0U
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 11:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10843CE0ADF;
	Sat, 16 Dec 2023 11:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BBBC433C7;
	Sat, 16 Dec 2023 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702727136;
	bh=x9SxEWOFFuFY8XwiG9HmjQSCtKXVQ4EWYRuvMvY3oR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ss1Z31zAkRJPdgKX8HbcdZBjBDr9jXmzFuTG3FLaPQd4QYI8pPOjB1jPPsnQioqHK
	 827sRi3OE6uROSPM9fhvwo2+9oRUus78lLNoRDmcWPMldTEuLF7QPjb27u5gcv3ClM
	 66AJ2qIHZOM34EPg4aKC9mrI9eV/DaOTVOmpueE/4RgkOTO1phUw8GY7TQqG3jL3Ed
	 ddwxw9LW613s/4/Luw3MIfPqBulct0aDGf8J9XfJvZuO7+fFDL1o2NxPAsNzwE5Zag
	 oCRr1icTrg1FC7/8LUpWa7QE1+QUZMF7Vm0CuGS75t3nqF29k6hG4NcLOKl7uPV1PL
	 rxIZ5kCIAeXBw==
Date: Sat, 16 Dec 2023 11:45:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Victor Isaev <victor@torrio.net>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Update AT_VECTOR_SIZE_ARCH for new AT_MINSIGSTKSZ
Message-ID: <20231216-proofread-headed-08642dda8684@spud>
References: <73883406.20231215232720@torrio.net>
MIME-Version: 1.0
In-Reply-To: <73883406.20231215232720@torrio.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_034541_447827_1844E78F 
X-CRM114-Status: GOOD (  20.45  )
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
Content-Type: multipart/mixed; boundary="===============2621464953582737271=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2621464953582737271==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lM9ALq2aws/s08Xp"
Content-Disposition: inline


--lM9ALq2aws/s08Xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

A few process issues here unfortunately.

On Fri, Dec 15, 2023 at 11:27:20PM -0500, Victor Isaev wrote:
> "riscv: signal: Report signal frame size to userspace via auxv" (e92f469)
> has added new constant AT_MINSIGSTKSZ but failed to increment the size of
> auxv, keeping AT_VECTOR_SIZE_ARCH at 9.
> This fix correctly increments AT_VECTOR_SIZE_ARCH to 10, following the=20
> approach in the commit 94b07c1 ("arm64: signal: Report signal frame size
> to userspace via auxv").

Both of your references to commits do not use the correct style, that
checkpatch would have told you about:
ERROR: Please use git commit description style 'commit <12+ chars of sha1> =
("<title line>")' - ie: 'commit 94b07c1f8c39 ("arm64: signal: Report signal=
 frame size to userspace via auxv")'
#97:=20
approach in the commit 94b07c1 ("arm64: signal: Report signal frame size
to userspace via auxv").

Also, you should add a Fixes: tag for the first commit you mention here
since it is the source of the bug.

> ---
>  a/arch/riscv/include/uapi/asm/auxvec.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/ua=
pi/asm/auxvec.h
> index 10aaa83db89e..95050ebe9ad0 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -34,7 +34,7 @@
>  #define AT_L3_CACHEGEOMETRY    47
>=20
>  /* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH    9
> +#define AT_VECTOR_SIZE_ARCH    10
>  #define AT_MINSIGSTKSZ         51

This patch is corrupted with tabs changed to spaces and cannot be
applied.

>=20
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> ---
>=20

> Signed-off-by: Victor Isaev <isv@google.com>

This needs to be in the commit message, before the --- line.
Also, you are missing a from header in your message that needs to be
added when the sending email does not match the one that has been
attributed authorship.

> Signed-off-by: Ivan Komarov <ivan.komarov@dfyz.info>

What was Ivan's contribution to the patch?

Cheers,
Conor

--lM9ALq2aws/s08Xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX2N3QAKCRB4tDGHoIJi
0ibsAQC+ijyf7OHw3YNafd/0gzrAZq4QAX33Pr+hhvLoCBD/TgD7BUFRs321BYk1
BLbTMxh23pJqwnQVn/F2miySLS1P5wQ=
=yRaz
-----END PGP SIGNATURE-----

--lM9ALq2aws/s08Xp--


--===============2621464953582737271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2621464953582737271==--

