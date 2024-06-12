Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32C9C27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZAc7Fyucwx+ZQGG4xc0c3Pe6uqDCqOlh0h+yXY8SM0=; b=l6XPwA9lG3cxC/BvQWUP9g5Jkb
	zm8ib/jtmjUUIbekw57SmXAJ9mrRjKPkhu765s5HrnfI5b6BrVLI3aLXDr/gAx+tSqQLZslLG8B63
	tvL1Ozxki7K1TkCdrcukjP6exrUNhr1BrueXHOrdMFcWVOi2Rckl2u4QWRCdbi3PvoRYDYF6DuBAz
	tyaRGHG6m/c2ytXJIShPSn25kMJPEcnEYsvskKhJaVLCROxJsZA3+pLlsXq66CkhVfj57fLGfy2N0
	i0Cqud14C10C1hW3fWAxG0bPIUcmYK4dJoDQBgC5yCsx1Gfi0XqMMnZOf5v8Doa9ehocTe76AjQKr
	5RnfoWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR7A-0000000DR9G-23yl;
	Wed, 12 Jun 2024 16:46:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHR75-0000000DR8d-15pq
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 16:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87BD6614E5;
	Wed, 12 Jun 2024 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BC5C116B1;
	Wed, 12 Jun 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718210778;
	bh=WQco/TtFmwtPptSfLGLzBaCcF7qBrspOVsH29Yreg+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M90jOke58UGSrPUEK2wo6P9/a6tGuxg2hhnL/SsVkI1PqjtFRL4vinUkC3YuTjiuy
	 ZxlxoUVqS2D2iyiEDlcdWFSbygIbV9v1RNR/yYnu/Lk2Le0RTqh6UJBwoYJHYokwl1
	 wa2ygWPoancIWjgK+dPjIEVztey5Ef5AA5IykbVsa5//xyWDOJQ7iMWPmQVBQR2U8V
	 d5Rt68RnFzQBeJk5pUL+idT2Up3/sB9D2RA/tzdwJrUC4tQLX1FxZvm0SB0BfDyK1i
	 U2p/uLGG8dw7dviNeScmSXebfGhs1BkBHhg58cz/5+10xWBvtNZ+9QcVVWaR0IhMVX
	 ZyIqdrLJYi6yw==
Date: Wed, 12 Jun 2024 17:46:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] dt-bindings: riscv: Add Sipeed LicheeRV Nano
 board compatibles
Message-ID: <20240612-marlin-nineteen-f7c348b12a2b@spud>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-4-19a585af6846@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240612-sg2002-v2-4-19a585af6846@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_094619_490312_DE4226E4 
X-CRM114-Status: UNSURE (   8.82  )
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
Content-Type: multipart/mixed; boundary="===============5693266797105673493=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5693266797105673493==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tq2aSu6KUZzbmE/o"
Content-Disposition: inline


--Tq2aSu6KUZzbmE/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 10:02:34AM +0200, Thomas Bonnefille wrote:
> Document the compatible strings for the Sipeed LicheeRV Nano B board which
> uses the SOPHGO SG2002 SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Tq2aSu6KUZzbmE/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnQ1AAKCRB4tDGHoIJi
0mRUAQDZ7AXfOi+XqbOn03XGi2ywetfbxT+USN+QzfRX/RgX0wD+OF3Y1v1+Ge7s
BNIghg0wrRtnoFIBsHAEaYdtbhh4wgY=
=85Ho
-----END PGP SIGNATURE-----

--Tq2aSu6KUZzbmE/o--


--===============5693266797105673493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5693266797105673493==--

