Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB39EB3637
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re0/HAwNrOGP3tRy04MNalCrayb4Tt3BWZ5hEO/qv+k=; b=nlMDyF3q6lfZAvEXWwrk96wGpy
	5GybSWN8BWPChSk2VRiUSwAu3+Ts5EvskOiQpRLdMVyqwi8qpybqEsjXcD6CKDaER+nSCstCHOnyk
	P9ibKOPUnBhipQmGzrdtOJA5MDHcdWAnAxXvH3NL5k1CWbkES5GG4SImOGbYLXMl+C2XewmHo6Sek
	O6ez3gTCXVfnzyOmk+2i5hEYXxLVGtROv0RIjcUfxs+Lx/pPNH/lMiqyIm1Vhr59MWMkcmPB2NcjN
	MgMQlK9KDvuMLCrEe2cw4zQozX5vz41Xim5RUV4uWXdJYMVDe/dnyn1ompLyyLA6ZEJzA2w1/OLON
	9WXQx00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBRb-0000000E5TN-41Ba;
	Mon, 02 Mar 2026 22:08:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBRY-0000000E5SC-3oGA
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 22:08:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3404140A08;
	Mon,  2 Mar 2026 22:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94699C19423;
	Mon,  2 Mar 2026 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772489328;
	bh=MWeiRHOZVMp8f8oX8Z0AIictRy9pyjV/mPA9ZtkT2AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTfh1LSL3ln5ZRLjHnCQOQE2MGQjVfSGFu6Y+lcOa36J6O6p0e52/K4tId/GbXuGP
	 0eR8ggeMIFIuDSwHINvXBV+wUPHYOgb89fRnVXxuqRW1JoSvaWudstKXG91Lk8s3uZ
	 62S6r0Z2TsBMPaMaRTI4Gv1iuZIKe2mocQ1pNcpQ3ZdrsGvbGYyeV9E1kF/0+WjhLM
	 fyQ8cyRlkW4hybha8goZCuWpTZrJpThuP5W0YUESgQ5SGFcoN518y28h24wmvxUI0e
	 umK6cv52O5R7AKdTUVJdQUrY+k+tQJwRPOfnaibb3dyMOM8FK9N0/E+4Lo79DMLyzm
	 N2Ec5s2Zdl4jg==
Date: Mon, 2 Mar 2026 22:08:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
Message-ID: <20260302-mayflower-filing-e111fbcc7d30@spud>
References: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_140849_326678_0F93BEDD 
X-CRM114-Status: UNSURE (   7.47  )
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
Content-Type: multipart/mixed; boundary="===============7932496139730891752=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7932496139730891752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b9dU3SrgV6WWXKXq"
Content-Disposition: inline


--b9dU3SrgV6WWXKXq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 02:13:17AM +0800, Felix Gu wrote:
> In mpfs_pinctrl_probe(), when pctrl->regmap fails, it just print out an
> error message without return, which could lead serious errors.
>=20
> Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--b9dU3SrgV6WWXKXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaYKbAAKCRB4tDGHoIJi
0uf8AQCDlTaYPVh8zUpVkl/UC7RIvNq8xGN1yjVKohZC8GIqZAD/cKb+4dvv6/0O
8KAgzRWqTAcSvrgFQNI9NTsj6p+h7gM=
=75b+
-----END PGP SIGNATURE-----

--b9dU3SrgV6WWXKXq--


--===============7932496139730891752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7932496139730891752==--

