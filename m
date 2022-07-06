Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CACC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97tW8SwDmj3VCAFAzsQED2bzZzVvYWaRgos4mZ4sT/o=; b=3atGnAr4YDujgEAz7iU44fHgoI
	AvexDVg1zDIEKHnwFKHOYVB2lcKOlxoaVTWnUmRKVzHucenOzsVNlznzWa05aFJ+yxtAf93nxNd0H
	bGow97FcQ8pxktmddou3pH9/g5bCMOPVcmSjBIn9RjKD8aVhFi8XCxMd1VawXwJgJC3n9IcnoVo13
	KJMdsaM2UA8yXkw7MFDCOmVA74gF89Dh+2qd+I4HEsfw3IOErF+YXbIazJGxuQ+9ShJ8FvcVwASvY
	U6sI42bjGDjhwmccgwxEg2bPmQv4oJ8P+YJpJGtzKLpiXtjcbUTaFrNXelW3Y72guXfrnqsg/QBx2
	CdTQ99lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zLS-00748b-TN; Wed, 06 Jul 2022 07:21:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zLQ-00746R-DR
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:21:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0B55DB81B13;
	Wed,  6 Jul 2022 07:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A213C3411C;
	Wed,  6 Jul 2022 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657092065;
	bh=qzMpWlHvnneyzml1ICOgakHTc1rJSym0t9u8nI7Z5ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7IROoZSTm6WIg49hLLQAQkYt/TUXHvya+Z0lY9XwbPwqkCPAEcNCfqqXjn5LQPjE
	 ltXdslACUiGtUviKOH/vS7S1LfTPiy2skw/3qejnrFS1u669aZLs1OAoODYqe/1L2s
	 jp4kSbUgY4YYVEiuXOgTGQFBVv2fCGnaEbDGuNfxqtmJ9NQJe8SKcGmIa2ofVwOBPc
	 D7FU45+7jGZsBKildd4SPCKsGKl/JWxDTFaEFlOCUmvcXQx4onu37eiyokOUuGkiND
	 ZaRBbOLGYXz3AD6VLMWfkQ6fsg9Jvxv2oZChARsI1iguOD92J3BSgC5naNCKketeCJ
	 TddgY140Rdx0w==
Date: Wed, 6 Jul 2022 09:21:02 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com
Subject: Re: [PATCH v6 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Message-ID: <YsU33mo+8MwmgPr4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <20220621074238.957177-2-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220621074238.957177-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_002108_648630_D4C0576D 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: multipart/mixed; boundary="===============3795613141717489964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3795613141717489964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RlT7hi3kxpfgCUPI"
Content-Disposition: inline


--RlT7hi3kxpfgCUPI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 08:42:39AM +0100, Conor Dooley wrote:
> Add the newly added i2c controller driver to the existing entry for
> PolarFire SoC.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> New in v6.
> FYI: I have several maintainers updates in flight - usb, pwm, spi
> of which some will be in 5.20 & clk/hwrng/pci that are likely to
> go into 5.19-rcN.

Then, I'd suggest you collect all of them and send them as one patch at
the end of the next merge window?

For that case:

Acked-by: Wolfram Sang <wsa@kernel.org>


--RlT7hi3kxpfgCUPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFN94ACgkQFA3kzBSg
Kbbz2RAAoC8RtqHoaDsrcvvgA8X46nr34vTXQoDfO+mnNvMQqcK0ynxX75NrLXL1
y28340cjgp9nKa3wriOF7xRWsv42z3WrwaegvyBTVg5W9CGEvvXa1QXAyESNS7IR
azYrpm7qnYmbv/OExLGZr+nlvyHv9RfysxPeS3e5cmaUOkwVTzavug4dy9IbLltO
JtVNaZMRVgd9lc+ILvPF6q1hMxmnJ3fIViVptf/HQbXxCZfpkw0Zyn88Z3k2kI2a
UJ2z2U2Xtzs5WbYdHep0rvay/8zx/mYBYPGhnnIAXg4Pyh7iOJeyt30Va3FPuJZH
LnxI8Ir2ETnb6BLn/vK9thTa/ml+sIxPSJMJQ7ZtQzI7mjFNBA/O0vxhGW7d2R8j
/w5RDelYs1kSzjMdpnYlJx8MoJu+5ifCnsWXR46SlT5jxVC1rPe9Dgijf1Khkgie
vQP/39idrz1P7PRzeDhyjtoODpAgKPR1YL0FhxszwHwppiSfn18t4bn9aYl2VwKu
8EYcD4h/95VFOX++Cps4Nk76oXrQP0OTbdLa7LiKER8IHQ/yLCNEBSsPYsVbbWs9
C8CnMV0ri0Pp0yyyJ+i0LDDTrHUsZLERQREjvb5J6XR5pkXx5OREpwWDMO1gOj7o
A4bNOaxyFJXFmwVqEIrkGaHGjrWJ6l8Nypa24BL7vMjsxv/MaK8=
=sxFt
-----END PGP SIGNATURE-----

--RlT7hi3kxpfgCUPI--


--===============3795613141717489964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3795613141717489964==--

