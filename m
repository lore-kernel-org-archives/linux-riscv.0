Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B534C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoPZCmfcSh8D2kZNSAL2o6obqCtI/q6ZP+6RcYPCDVg=; b=JjHyslt90h9bipQhrj1OxINNCa
	pXZ7pRci435y0pGtGBcedw1tAuuHrygVojklVAY3QRTqwwhMmqAFvNo1e/HLG0SoR/zfzqLDu3CCN
	81cHvhS9hfpMOevRPwOmnqcnMo9VmXu8Uv8uQz9O+LRLixmh+IVn40+0LF5FE6tj4ZHYqOSgUO0Gx
	vKgT4ZmQ/swa/9FnMprbwZdiwJmTiQzF2S+1+HTlsmqZf+WeRnI7pDrfQWdXhIUfiWm+RfwH9g1vp
	TxZFw4eej4E4IaGr0pVYQSgGgY3s7nz3sobxu6qXG0d/0/ojVsf049w4y6r3aL7YeVoOXRh+ZUDJ5
	ezf8Kaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5Tw-00E4EA-LV; Tue, 28 Feb 2023 19:17:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5Tt-00E4DG-Fm
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:17:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67D8661181;
	Tue, 28 Feb 2023 19:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E1C433D2;
	Tue, 28 Feb 2023 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677611863;
	bh=tbBHih+BlQpiuWkfDlkNSPDu62Kp0d5C8Z4dXWEYjUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAjSWZTuC5WAxV7Y4NIludXkc+t17IiL3M1M+bBcZl0PKSsLpDU2085Pi000XQ2WH
	 lMuXT2JerPRtamHKHWVtM9wsyhcYfEgU7YYEZckTAUtRfLuOmRbF0AcdovEx5clJM8
	 qCK8RB5gAPzkIrS/ME3ie3UYeJwazoANm7ggGxLcFr7hXLajfS/vcQ1DdoaAA3YBkq
	 dvbqQzwRjbAh88WOD3VYqbLJdlsTuU8pWeoBo7cJniavH3Q0dt5hZlCSrXfM6VJOZi
	 VRYkaYVuhFJF4tbmr4cZO8dBxB0XyKhLGYPCC3CQ1uL/5e6GnN3+m67JfsaFkWYhkL
	 Uu4Iuof3daTOA==
Date: Tue, 28 Feb 2023 19:17:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: mcgrof@kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 13/20] reset: remove MODULE_LICENSE in non-modules
Message-ID: <Y/5TU/gxAxfVOedg@spud>
References: <20230228130215.289081-1-nick.alcock@oracle.com>
 <20230228130215.289081-14-nick.alcock@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230228130215.289081-14-nick.alcock@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_111745_610378_8ACBD5B6 
X-CRM114-Status: GOOD (  14.98  )
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
Content-Type: multipart/mixed; boundary="===============2739179633309165146=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2739179633309165146==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Au4nMfSCNexqlvKW"
Content-Disposition: inline


--Au4nMfSCNexqlvKW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 01:02:08PM +0000, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>=20
> So remove it in the files in this commit, none of which can be built as
> modules.
>=20
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: Daire McNamara <daire.mcnamara@microchip.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-riscv@lists.infradead.org
> ---
>  drivers/reset/reset-mpfs.c | 1 -

I assume your script just got confused here w/ $subject, since there's
only a change for this specific file.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--Au4nMfSCNexqlvKW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/5TUwAKCRB4tDGHoIJi
0terAQDSN1HWs/d81DkwGzTWp+TvAGlzI9nhxxsO5lH/XaBLHwD8CXFo5YJnBCXe
/rXkDTfNkUmEq73ZyZrtRNTGoovC/gk=
=GpeS
-----END PGP SIGNATURE-----

--Au4nMfSCNexqlvKW--


--===============2739179633309165146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2739179633309165146==--

