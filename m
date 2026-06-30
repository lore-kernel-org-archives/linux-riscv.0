Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB87DC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXHSO1lg/SE1YVXfKoiOd7ylfnQmtddPSxywgORf9yI=; b=Vek4gsJjOWip8LkjZnFtYCXQW5
	T4UZFYM/FdQnhqVv7q7GhcnjGb/2FaVotBSgnMa3uVikuoBAhM8JgWj5VGHpliZUlsjSmKpE2lhGe
	AwqV2XNZWm5O9iLsT5AhVR+D5MpRIEkCO5vL6zBs+1jJIEknN/NYszS6P9u7qLK+l7+Ead1oRaPym
	ni0T+eHhbIPweQ4AZfhQaGFIbGLkbRtYIgXOP6EcpwwL4HZPNnUWbXurPlffetGmPCIisHX2h5Ma+
	rm6OdU905E8LbObhZICM8L+4YzVrsDswFWWZIUCt7g9nFFP8+oup1xyyg9wHNC8QDqqsnkOqhJeEB
	WoAQIcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVFj-0000000GYlk-45je;
	Tue, 30 Jun 2026 09:59:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVFh-0000000GYlI-39Am
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:59:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 181EC4382C;
	Tue, 30 Jun 2026 09:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8609D1F000E9;
	Tue, 30 Jun 2026 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782813577;
	bh=9HR80y+uE7bIR4bZjVORkXp36/uTWSKCANgLeVCUwcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ez+Zzv/rHixTDU9gexxUTS698bwowOyMBM+JBX6OjvBL6C//6Bj4+Yume51fzGFvp
	 iUx8EuPt6BwTdRdi8eudfMaGoGI7tbwvSg8sbKRvmeT2HQs0Oqv4mBj4Vcl6JUSqam
	 H+kzp0Y3k92jQ3JBJGuhUTBfPRlwghgyJJDb2XeE+iP1VbAkuwnADIKSjJjs8iIAii
	 0J7B7TcnOXdXdsUGao/RRCSj4dzq4xTeHHvmfNDoNWeKXCx25qff0NARydJqw6pMUz
	 oLCtRgT6WogFsTclYFRcCv4FKqSAidNvLX6CFMFzmngxx/GIdJy0CoSBagNR8zmKWD
	 y1XzwW+uI/K5w==
Date: Tue, 30 Jun 2026 10:59:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v20 1/3] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <20260630-footpad-barbed-2415fb3acd5c@spud>
References: <20260629063601.63917-1-hal.feng@starfivetech.com>
 <20260629063601.63917-2-hal.feng@starfivetech.com>
 <20260629-unedited-tarmac-b6eaaaced8fc@spud>
 <ZQ2PR01MB130775F6E674F6074A6E2CA9E6F72@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB130775F6E674F6074A6E2CA9E6F72@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============4612801223678287440=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4612801223678287440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zxIQn28rhvHzrlL0"
Content-Disposition: inline

--zxIQn28rhvHzrlL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 01:15:09AM +0000, Hal Feng wrote:
> > On 26.06.29 23:00, Conor Dooley wrote:
> > On Mon, Jun 29, 2026 at 02:35:59PM +0800, Hal Feng wrote:
> > > Remove the jh8100 compatible since the JH8100 SoC has been canceled
> > > and will not be released. Add the jhb100 compatible to replace it.
> > >
> > > Change the register size in examples to 0x10, since an OpenCores PTC
> > > IP has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.
> >=20
> > Actually, please also add a fixes tag to the original commit adding the=
 binding.
>=20
> OK. Will add it in the next version. Thanks.

If this version is up to scratch on the driver front, providing one in a
reply here will probably suffice.

--zxIQn28rhvHzrlL0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakOThAAKCRB4tDGHoIJi
0pGDAP0V84v0E0JF11z4iKvk1U9IU4AGvM9YLUuWPTFAiaNNBwD7BJTuPKX9SsUT
AMmioCQOnL6t08Nvm8frfHvjzxL7VwQ=
=konP
-----END PGP SIGNATURE-----

--zxIQn28rhvHzrlL0--


--===============4612801223678287440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4612801223678287440==--

