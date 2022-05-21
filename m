Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EBDC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il+rzZU8rP0V/zn/jVnc3SuWiuO0CTEzZ5/WalLDyjs=; b=zRDj30CvBbY7v0dWy997Xrcd3W
	TfGb2/XESqt0gkyNuGogZ2spFB0f1AzZzOZj2zgN2Bue+i73l+fmUNuo2WtxXHd0ooojV0xJ8a0i/
	dF2JS/Ry1jlTaLVdRREryoXWqb8n/dZn2EOMmE2MPDSnUqZ751xUbqx3Jr+61dAWsGUixK2bheE7q
	bogoIUZrEUQwKc9LByuGVNrMPeCXs6t9fq85AZc8v11mUkYtNgK70q6RZG7cGlxF3kLJugtnlCh3R
	pX1kARCiGqBKgtDO30LvJ45AVFmf2HGs+rlKyA0PaBekDwqj+0bVSrlB6XB0EOYCzHowbedpMVe89
	6wDVJcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsNI2-00GNny-T7; Sat, 21 May 2022 11:28:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsNI0-00GNn3-8q
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 11:28:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EB34B8284A;
 Sat, 21 May 2022 11:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D549BC385A5;
 Sat, 21 May 2022 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653132532;
 bh=irdHG4XDhujs78rGcOOT8dP4dOtrCFTYOdf9CAfk39w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sgOZAHYxmYyEB7Uo+QAfXe2IdQ7Mk4lnm8Aj6IoqXaqRqOUlM7rqnO81DQr4r+zyW
 NzK6j5Z4bcp+i/0krDKekWYmFp8DM4gsOP/GByRecd1RYU/NPu6ELtunFV4pynLXzs
 cpPXzct4JGtPkgJ9tpTrLUz7TBhkY9U0dLEYS7HdX1zhlRRgzOEsE8RT22uUCu1O2A
 xgeZdPYApXG9n/s5IcBA+cP6V5Lpt2BLVC4Z6e9AuQyJib47iEOhqGPFl4P1sQNNSS
 IINt1sR1M0KkKJrXP1g9dlagRr5DrOny7C6riyIxhFnNAPvhhJYrmwFDq3A6ai5Snp
 cU0kCXW6PeOHQ==
Date: Sat, 21 May 2022 13:28:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor.Dooley@microchip.com
Cc: linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
 Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Message-ID: <YojM8KiGJneGh16D@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
 linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
 Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220516073331.3508505-1-conor.dooley@microchip.com>
 <Yoi1bV95l7+thgS5@shikoro>
 <dbf6073c-0814-ec25-cec5-cb3cf9c931d8@microchip.com>
MIME-Version: 1.0
In-Reply-To: <dbf6073c-0814-ec25-cec5-cb3cf9c931d8@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_042856_501244_AD7677E5 
X-CRM114-Status: GOOD (  11.27  )
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
Content-Type: multipart/mixed; boundary="===============7793359038806326019=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7793359038806326019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="afvwLyDuav/fPEU/"
Content-Disposition: inline


--afvwLyDuav/fPEU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +	ret =3D devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SH=
ARED,
> > > +			       pdev->name, idev);
> >=20
> > Really SHARED?
>=20
> Yeah, this driver supports both the hard peripherals & soft FPGA cores.
> The hard peripherals do not have shared IRQs, but we don't really have
> any control over what way the interrupts are wired for the soft cores.
> Worth adding a comment to explain the reason for it being shared?

Yes. Such information never hurst, I'd say.

Thanks, have a nice weekend,

   Wolfram


--afvwLyDuav/fPEU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIzO0ACgkQFA3kzBSg
KbaIyg//ZJ9OqPwDGI8q+886yLcIadgterwgro/F5vVGHPWu3Bh4v2KRijTQGoq1
7dHVT3oy8UM+4BIRtn43zNq43g6ZmZykrOrnkcCrDrZinU+XLgd8d0O/DwnaVnlX
eppOrkrgO7x/eTSUZxngbi0t3MyGbFxHeM7seOVZ3wxIEA3UZ2Dr39U9ZQh8enRB
w9aZ7rJ8VrYx0wMDoHcoO3Gn6aHguRxN4y5xnRIeYjiPek9OuQNBA3DES7x+CXq1
ZHiU3pQW1CW3+kPyJf/sY57YhMXTEOPQrloYISzWiBuETQJdAGFP2PBmduEKlO6h
Nw5V/mJK9DUU9aUsqLW3+7Sw/QPVKL6Xkf11WUX5NzFv8BBYpIK2m68hjY1ZVYKx
Gcelmi/Z8skWHCGhIiDwjXN2YSaxnCoTTer983CHBjqAL0M8oPURTv9NkjzOqCxx
Pn3h/wfWjdmOa3z7DaquKFSH54lmzuZwJEx3F1Q+GFKdgbPYLVI26za2ahGFkSMj
ptW7ZWtKsTXBaLnMRRteaEZTqHfbpuy4vxGhhK1fAqMsIwhsLBxmgTBmDrxDoGRr
zJmHAEzWtEssWAEnqvBLPGndkA/g5HkXW6fo9HuFxVnBlBa0GrbfGEBXki/cqpVX
XwBY9PL+xaDMlmRNrvn4iI6JPPyAkTQd+Vc6gBfyjXMFLbqX/jU=
=4rJa
-----END PGP SIGNATURE-----

--afvwLyDuav/fPEU/--


--===============7793359038806326019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7793359038806326019==--

