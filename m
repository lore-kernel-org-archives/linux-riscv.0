Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3D6C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzOeYffRaI/EOPe36aoq7U/EeT6+zgkRVm1pIB9qKOY=; b=lx4sOXQ4Rxb3sybAkSuczIaIfp
	ScvkdJsMMv9Llwewf4XTMTYAvs4UnTct81qp81h+aaRx/u80hlYUKNkGpP2McfvMNDTWX2PwgFT6c
	kBoJtLgYkd1V5aCBtJcBTajRgyGzdS4ADYfz9G/EgLkaRQl+2F1OwAKs0jZHG+tEapSQwkdZHZltZ
	LtFzaz9ZWPWmouSn0JGoOWXuH7bpSFKSrZtYcG6hesKYzsJSxV3iU5J8N//A0+kV+CIf//WjkqIH4
	R3YkakIHFuV/jmJ0yja7Cx9qAVNEgCd5wgmywSg15D54vjzfHSh17zqtC7Nwo5bZrymIJNdsFkiOu
	/mzyhu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIWY-00000005NT9-1aM7;
	Thu, 20 Jun 2024 14:12:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIWW-00000005NSP-0hEL
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 14:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6338CE2696;
	Thu, 20 Jun 2024 14:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1893BC2BD10;
	Thu, 20 Jun 2024 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718892739;
	bh=jaHtqvnl/8145WvpSmKxMsC0py9b0Z2+/5mdF/t2BVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoUAqF1TWisVXlKx1R6rbK7FF8PojsZbGDH/N21OijhxLrMzCDQGDHTdFgTzeOYF0
	 BFKwNlaHp8wC5JMnodyBFHkcHcbauG0s2HCd7E6tVAClWfnGDbIUcbiy7BrYky395T
	 W70Ov+aisUarLyr43Z9wq/7o3iTzvyhVk49HQvI26DwTmj8SRNchvO/VKe12DKXVFK
	 LVAhiD1wje3HGghF3UspexfNzkJYVn5q3Gq/l9rrql9Ga1k5WPdErK6IXkn/nogFXm
	 AIgiiJZUFe2M5HwCxywy3csXIYxwqmBSVlUSiniyGwX+1CJ0eGJpT3QBRiqaxNy+yU
	 2aqYg6ihn4M6Q==
Date: Thu, 20 Jun 2024 15:12:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	cyril.jean@microchip.com, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC v1 1/3] mmc: mmc_spi: allow for spi controllers incapable
 of getting as low as 400k
Message-ID: <20240620-sabbath-ambulance-b8764fb386e9@spud>
References: <20240612-brigade-shell-1f626e7e592f@spud>
 <20240612-dense-resample-563f07c30185@spud>
 <CAPDyKFozcUPuMooDHVSBZomHTGKzseVf9F=YBY_uQejh9o3x7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFozcUPuMooDHVSBZomHTGKzseVf9F=YBY_uQejh9o3x7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_071224_429671_5269047D 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: multipart/mixed; boundary="===============2080015126693900370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2080015126693900370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J7FzOIBzomdGrjSM"
Content-Disposition: inline


--J7FzOIBzomdGrjSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 02:50:15PM +0200, Ulf Hansson wrote:
> On Wed, 12 Jun 2024 at 17:48, Conor Dooley <conor@kernel.org> wrote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Some controllers may not be able to reach a bus clock as low as 400 KHz
> > due to a lack of sufficient divisors. In these cases, the SD card slot
> > becomes non-functional as Linux continuously attempts to set the bus
> > clock to 400 KHz. If the controller is incapable of getting that low,
> > set its minimum frequency instead. While this may eliminate some SD
> > cards, it allows those capable of operating at the controller's minimum
> > frequency to be used.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Looks reasonable to me. I assume you intend to send a non-RFC for
> this, that I can pick up?

I do intend doing that. How soon depends on whether or not you are
willing to take it on its own, or require it to come in a series with
the spi driver changes.

Thanks,
Conor.

--J7FzOIBzomdGrjSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnQ4vwAKCRB4tDGHoIJi
0h14AP9hHmPYyjRVNp3J/ZBQkJts0rC9TJWO3QCvwnoKZAnRUAEAkhi9CK031dYU
SHkj+T/cQaz5KRpEJqolTupL9bTZeg0=
=D39D
-----END PGP SIGNATURE-----

--J7FzOIBzomdGrjSM--


--===============2080015126693900370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2080015126693900370==--

