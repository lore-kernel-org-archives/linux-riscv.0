Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44031C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1xOHEBokU3utnOGM4QD/qLG7HfzgE0XUlY4FLkqkCo=; b=PNroTa7dpeXhggKQEAKurNk5RP
	k2kQpUwLW+YZudrjCsYtB49x86tPQqjWQGZHjL9jrDI2Xlm6W3tNeatsBggISOWc0eJEiuKvlw2u/
	ogORO9n+5PuxbnKrbsWrE3P6XeLE3mZ/AbCc26gGyseghz0jGVdDZKIEGjWo8QDB/3SYsBkKMOP3K
	RnkexTBYZlvdCCUzKrNZMvqln6q3hI4i3NABq6GxmP+sq+SNlTxbHnzLkcl2/YdA9tlCpOEh8lU3O
	4+2EpHZaagSWJT2/iDc4cib6rgyvjd05KwctMmn2SFGQPr977ps5wAhYzFaCJZEIltb1rCvCBbZ0H
	gwCOIjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGwp-00000008nWH-2Ih0;
	Wed, 28 Feb 2024 10:13:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGwn-00000008nVf-1KIu
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 10:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD7D5614E3;
	Wed, 28 Feb 2024 10:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C372FC433C7;
	Wed, 28 Feb 2024 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709115236;
	bh=Aw6MTellXqHFmH4oHAwG/lZE8WzOhLwzBazP1CZOc3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYQM1lxmkxNt120hTaJP/7wOwZev0uQR715A6QnDoDDYlidkOBaA3qtqAdy6LcI8D
	 x4NmbNvlmUcC4fLeIvUTA7xbR9MZGPuKXvhwOjqZvj/tGkGpTeGJIs66+2PJkPxun8
	 FgdyrIVH/qijkwwNPFaEOWgSrz2Mx+1XyfVdMpoL0N/V0wSbTolbOJKgcNTD3AlQ9u
	 8dRu6JEYamSBWfpYetisMVpvSkNYOqcyvH4BQ3od9+kHnfCc8WO5rHQFIKfhecykWI
	 AUvpJ4wlS0GEaEYKTpYniOE2BhQWuujT5cx6TF/4JX56+4fSDsOdhw3M8GRxYfqqc7
	 HktFy5Lic9W8A==
Date: Wed, 28 Feb 2024 10:13:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v4 1/3] riscv: Fix enabling cbo.zero when running
 in M-mode
Message-ID: <20240228-rarity-underuse-4ea0ceaa9688@spud>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
 <20240228065559.3434837-2-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240228065559.3434837-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_021357_418665_E8552967 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5128536053283568469=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5128536053283568469==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RYUaLBvwPMLmjhGg"
Content-Disposition: inline


--RYUaLBvwPMLmjhGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 10:55:33PM -0800, Samuel Holland wrote:
> When the kernel is running in M-mode, the CBZE bit must be set in the
> menvcfg CSR, not in senvcfg.
>=20
> Cc: <stable@vger.kernel.org>
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RYUaLBvwPMLmjhGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd8HYAAKCRB4tDGHoIJi
0qirAQDYy7d+sylmhikfmo2GXMnmIUPyHkY+kHBctTx2ItI1sgEA9XOfdZ8oy6/R
EurTtub65SmrnNrgrVNCv60+b4ljXAw=
=9KZG
-----END PGP SIGNATURE-----

--RYUaLBvwPMLmjhGg--


--===============5128536053283568469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5128536053283568469==--

