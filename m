Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD642CE8374
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuyeWnsQQd45uCD/xPAzGWHTrnXoNFO6D95s25PJHN4=; b=j7zFY2+xVHIEXO5wZBoAnf4rJl
	6IYxZgoZlZudji7Qso018rwnLItg9Iy3bg+MUcPmtrHu55jhOciw9bwmUp/IrH9ujsTomIZ74PE6A
	8/6LMb8UplcKx90XoiBT7fYmhVqRFt1k22pMgTVCgoEevEakf52YYUhcPHatnTHDYB2cw/WxaCBQl
	IeuPWzrEoj1yTNZ+CU1l5xjh9VsW8y8Kw3q6oJY4yMRqFfrYM8LoYel4ZeBN9SzFbm6rkkOCvYCIB
	JciYpIEkWrrR/EvjMkKVJmbZIfGmJ2hXfXwQOs3vu/MDGxWKpdZd5lr7iK58CvvWgwJ5uEbrnzyCh
	1HCiDgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcWo-00000002r7F-0PRD;
	Tue, 01 Oct 2024 13:02:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcWG-00000002r1X-28pj
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C683E5C5497;
	Tue,  1 Oct 2024 13:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11976C4CEC6;
	Tue,  1 Oct 2024 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787743;
	bh=FDEYOUMz0b1sSCN0xc23akav2PoKwzLJxdk7hwEzxU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iy7PxeSdnMHlKHoI9tHuh58pt95nktXjk01kOfYQ7xcNBMLeRoZHoD332cpbz/oQ+
	 Y03uWsisMVZRFmV0H+6bqNeFwBlMzZNYWYyz4Tawv+BQ7DEzTCUeCtQb+IarAnQ4to
	 yDLM1ogWva9s/OxrXeZkAJyow5CoxV6c8JMx3VFoyRp9Jz9z4argFRfAx6Ak3FGN9x
	 bnlGP61n/nMSMYRttZkxX1ImURAWZYBoTr01CATwRKX1TCbkl3UVfnRxrhouJXu+re
	 iAyMoeyGniuud0rpapvN3WqrFaNHWFWCYMkjeWXTa7ZGKEoyUS3EOGTAzhmbfLDoxU
	 7Y7XwaZsTphOQ==
Date: Tue, 1 Oct 2024 14:02:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241001-boring-livestock-0158ccc3fa88@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
MIME-Version: 1.0
In-Reply-To: <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_060224_668170_AE74E2C1 
X-CRM114-Status: GOOD (  34.11  )
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
Content-Type: multipart/mixed; boundary="===============8017480181427017211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8017480181427017211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofQ4KTZDQjzQ4Z5h"
Content-Disposition: inline


--ofQ4KTZDQjzQ4Z5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 02:45:20PM +0200, Andi Shyti wrote:
> Hi Conor,
>=20
> On Mon, Sep 30, 2024 at 02:38:27PM GMT, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > At present, where repeated sends are intended to be used, the
> > i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
> > devices must not malfunction in the face of this behaviour, because the
> > driver has operated like this for years! Try to keep track of whether or
> > not a repeated send is required, and suppress sending a stop in these
> > cases.
> >=20
> > Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controlle=
rs")
>=20
> I don't think the Fixes tag is needed here if everything worked
> until now, unless you got some other device that requires this
> change and you need to explain it.

I think the fixes tag is accurate, because it only happened to work on
the limited set of devices I and others tried. This patch came about cos
I got reports of it being broken in 6.6

> If this is more an improvement (because it has worked), then we
> shouldn't add the Fixes tag.
>=20
> In any case, when patches are going to stable, we need to Cc
> stable too.
>=20
> Cc: <stable@vger.kernel.org> # v6.0+
>=20
> (This is specified in the
> Documentation/process/stable-kernel-rules.rst and I'm starting to
> enforce it here).

Yah, some maintainers want to add the tags themselves, so got into a
(bad?) habit of leaving them out. I can add it if there's a v2.

>=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> ...
>=20
> > +	/*
> > +	 * If there's been an error, the isr needs to return control
> > +	 * to the "main" part of the driver, so as not to keep sending
> > +	 * messages once it completes and clears the SI bit.
> > +	 */
> > +	if (idev->msg_err) {
> > +		complete(&idev->msg_complete);
> > +		return;
> > +	}
> > +
> > +	this_msg =3D (idev->msg_queue)++;
>=20
> do we need parenthesis here?

I suppose not, do you want a v2 if that's the only change?

>=20
> ...
>=20
> > +	/*
> > +	 * The isr controls the flow of a transfer, this info needs to be sav=
ed
> > +	 * to a location that it can access the queue information from.
> > +	 */
> > +	idev->restart_needed =3D false;
> > +	idev->msg_queue =3D msgs;
> > +	idev->total_num =3D num;
> > +	idev->current_num =3D 0;
> > +
> > +	/*
> > +	 * But the first entry to the isr is triggered by the start in this
> > +	 * function, so the first message needs to be "dequeued".
> > +	 */
> > +	idev->addr =3D i2c_8bit_addr_from_msg(this_msg);
> > +	idev->msg_len =3D this_msg->len;
> > +	idev->buf =3D this_msg->buf;
> > +	idev->msg_err =3D 0;
> > +
> > +	if (idev->total_num > 1) {
> > +		struct i2c_msg *next_msg =3D msgs + 1;
> > +
> > +		idev->restart_needed =3D next_msg->flags & I2C_M_RD;
> > +	}
> > +
> > +	idev->current_num++;
> > +	idev->msg_queue++;
>=20
> Can we initialize only once? This part is just adding extra code.

I don't agree that it is extra code, I think it is clearer like this as
I intentionally wrote it this way.

> The rest looks good. I just need to know if Wolfram has some more
> observations here.
>=20
> Thanks,
> Andi

--ofQ4KTZDQjzQ4Z5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvvy2gAKCRB4tDGHoIJi
0owyAPwNPsSNLQz2fsZ0hPQ9cGl/6RpVQ71r0aGY6J/e82FtCgEA4mWug7Gd7DiL
vFdzZiuzu//XelR28bmApIY34+l14AQ=
=Z9Uz
-----END PGP SIGNATURE-----

--ofQ4KTZDQjzQ4Z5h--


--===============8017480181427017211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8017480181427017211==--

