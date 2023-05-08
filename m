Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC19AC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QUKAfxeNpwAeJWFo7z3i8JxVk67l8gleRdgiXfy3mY=; b=f24CQ8eX74jhnU9UPbjvHpqA0Q
	RpMIppawrEKer9AzOrw2ModVIC4d7yaDzPln5Z2uwSLV4huV/M5UxlfE5A+l63K2Zi/6anWuoTSVW
	HeqHwBmso1ABluVo5W+uCjkm/q3GiitqhJ0P/hAwyB8mLosmI5FAwtKbfW7R7e0/9nvRYPRVt3bS2
	DKRicnCj3sUoWE0KZxzzvOJhj4FLULIDgb8JPDyXxgWnAmwJSNlwpB7Mrm96VGwBAWivDtg+jyHcD
	ZHVR3/PvzBjAjFspw/4TQNmfkhNtxonwmsUMv2179UehVm7rbc11fKy5EApWunsJ0yyN7A9r3h9d0
	YVGRbW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7yD-001Q6o-0H;
	Mon, 08 May 2023 21:00:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7yA-001Q4b-1t
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 21:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A0C5628E3;
	Mon,  8 May 2023 21:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC8EC433D2;
	Mon,  8 May 2023 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683579621;
	bh=HuZXZyIsyyrsaaFo7CxO+2hnXlQ/3Nhe97ni5qf0luo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AA/lkaDC4XXGg9p0Imm/N+MBsdmMH/iaoaQcNKv0l3zKmK6MZwG+8l4wNVTIcWLAe
	 uJZ49qJmP+m1ruVQ5mM7BJJJMnPq4wcDBcuqjwCBaXri6Q405FseOcrTLmi+2DGSU0
	 8BFNlPhdGO10NFLL5XmwEFuFktkgkRKjTEpOeGiQpS4+Tow8NANUBkrl4gNyE4827k
	 XpoOS864vI4nLM1fF4easuILyqne1tSJei6h/OZNx/S3uPj/kHQCmXLZyZsH7RuRwD
	 btlUcMfPgQ+7WTcl8cTlDvWm3lwIMA0B5cZ4EervFlFQ5vKVcjqlF8QMXYzx4Nq+pr
	 dUTys+LEvfJXw==
Date: Mon, 8 May 2023 22:00:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 37/89] i2c: microchip-corei2c: Convert to platform remove
 callback returning void
Message-ID: <20230508-cottage-senator-e4882fbe9010@spud>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-38-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230508205306.1474415-38-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_140030_689532_19E02A34 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Type: multipart/mixed; boundary="===============3852676006150448190=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3852676006150448190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lOjmbblZE3LZ+1uX"
Content-Disposition: inline


--lOjmbblZE3LZ+1uX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 10:52:14PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--lOjmbblZE3LZ+1uX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFli4QAKCRB4tDGHoIJi
0mQyAP42uKbl045YUAeaLFX1GnoxoLfsqEPIBLLm24QuRYsibgEA0f9L0vL03xi4
RnHjvn+HLIB4qXCKk4B76QCeA29TbAo=
=VzIV
-----END PGP SIGNATURE-----

--lOjmbblZE3LZ+1uX--


--===============3852676006150448190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3852676006150448190==--

