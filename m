Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9A2E7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qq3dKR2VfTp5zp5gEKZ/8GUNz/B8wYZALg/6yOorZOc=; b=W/yr51BKC/JIJstFx+RPkT7hA8
	ewsEnkc0FPl9ELI1KC7N4p7WemdbvJYBex9/WuHvQ9x2DbxnNQxmali3kyCS82lIH36M9HNBGiSeM
	Pe67XAx7r0X2Q2ri6VxdnGwYtmTtW3aIi2j8cD0wDhnz/4WTdK0rWV+lvJmR7E46n6o7wV4ega5yi
	h0/Rb82fxtjX4w6JYGCq4xNjmWfrIyaiDdEPQLr34Km9/nCO6iijw95YHfeWIqsN4UEJtt8AxCAPG
	HsngPh4ozbx/RLWrHICtE/Y4Tl8D2A+14NzMJNEkipG6ReQHfeNeN1CXzD5tDZBminuEEl1YZ6JFr
	UtAx86Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXK1y-00000005ALn-1yJd;
	Mon, 13 Jan 2025 12:58:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXK1w-00000005AKt-0ye4
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 12:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF808A40EBB;
	Mon, 13 Jan 2025 12:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5899C4CED6;
	Mon, 13 Jan 2025 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773134;
	bh=84MajbQ1yKgXRv5dbC8JnSPlPt0USHyAEEiHuUxZoOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8C+cUzD9IIzAXYcPgYNLkFEnJcmQLtQwcw99QAxqzQ1SkhqBJH+y5WCre3jrt81g
	 Xz7n9XEWXExrmeg4vbi6vFguMVL0GrsFy+R4eQ9jgupZTrwOk2eHnJOoQtk8UrS5XD
	 2QYj1qc36zxbtg1YZVmetLFMqVKYQJH+pDANLv/+9+9+G1l+cYrbbhvxT4S5eA11Fq
	 24iaBdKhcxCqW0W2dWWJrVf9svTg06iedPErpq6W+VDUjNf4S4ypGZgx9k6C9vQQ1R
	 RGbDPniG7unYWqQBKoAt6wBnmvi7KKBeRWKh2wIZebRaDchvT0VsPvl7yN0KpY1xVy
	 cCTs5juUxVLLw==
Date: Mon, 13 Jan 2025 12:58:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as a riscv reviewer
Message-ID: <20250113-carried-revolving-b0f464fd48f1@spud>
References: <20241212131134.288819-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241212131134.288819-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_045856_333530_B7093996 
X-CRM114-Status: GOOD (  13.21  )
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
Content-Type: multipart/mixed; boundary="===============3574652919321560655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3574652919321560655==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CpP4gpV8FCWdOU/n"
Content-Disposition: inline


--CpP4gpV8FCWdOU/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 02:11:34PM +0100, Alexandre Ghiti wrote:
> The goal is for me to get a kernel.org account and then send pull requests
> in order to relieve some pressure from Palmer and make our workflow
> smoother.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Pretty late to the party, but FWIW
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17daa9ee9384..1c7838642398 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20108,6 +20108,7 @@ RISC-V ARCHITECTURE
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
>  M:	Palmer Dabbelt <palmer@dabbelt.com>
>  M:	Albert Ou <aou@eecs.berkeley.edu>
> +R:	Alexandre Ghiti <alex@ghiti.fr>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
>  Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> --=20
> 2.39.2
>=20

--CpP4gpV8FCWdOU/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4UOCwAKCRB4tDGHoIJi
0j+LAP0cnha+0uYHr7aOb9zQgM6fE7kGiiDGaS0uaQ2UnoSvdwD9Gko9WHHlwtPR
Eyb3vZifg/mgDsrb1uiEA198627byQU=
=9wfc
-----END PGP SIGNATURE-----

--CpP4gpV8FCWdOU/n--


--===============3574652919321560655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3574652919321560655==--

