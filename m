Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3519AC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZKmt9QFEEnlTHqfNBRAmdQQVLmbNJUYAz3nio2WgXs=; b=CiibGCAFChvkJIScTUwCxLpzfB
	RJ0e4pTy0dSgy4e9xkPfdgKowGhQYE0W9yzbu7NvCGxzF1QQRIc5jznpNf25TXiHOqPEL6ZpZbAnG
	Ae6PSTy06/MIlDYNlf1C7i+3rgZ9ps23OPY0mLM7ZbCY5kbVnb0Rij+ZFTiidcSeairGmWF/PGFCV
	VVb0Cov8fJJw/MuWFHOmM4KaFBSwk2krr50UjDi9ALSW97XMa2UgZ+DAZq7v4niKw8R9Zr1endH1Y
	eEIeTwYsV+qXRJ9YlpQuTzfL44etyv/IBpQJvCcCoJpv+Nmrt+zGL4GsrROkjC8puZXXGwzn0ckwr
	46ov7qMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjmk-000000062xN-0gIl;
	Wed, 24 Apr 2024 21:04:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjmh-000000062wo-0SEg
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 21:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E325D61CB7;
	Wed, 24 Apr 2024 21:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D6C113CD;
	Wed, 24 Apr 2024 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713992645;
	bh=ix7rFjnRQ5SWxjWOREETBLkfLTNt4KOdjYJOgb7Wa48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4cYjUuW8XffaDl3CZU7iBmJufxV2K/uEbL1nYrLyla8Be12TP7BOnAm6MISwLe4n
	 +owZwshXH8swXvz9hMJc0kwliUxlxtohLnnV3kLVoFR/LIWYowsTuHdqonRZY7Sz5w
	 FFM/PaSN8h3yUULKDhcpSW0z45yxrK3KvLPjpCiiTeNRaGGmfuJuQMwRmwiXwrlqsw
	 JVJTpGPmH2Nennyl2mfSdwfR1p3xGAItCa/NuWtMKogADPb79uaT6jcG28TheTNa/X
	 O7cmhIGit6DtHQOvp1RFS75/PtwpD7M6BO7tF3tsUJlDCtHtmIe7dKCJ2mmd4kmGYD
	 31yX/xnnLpW8w==
Date: Wed, 24 Apr 2024 22:04:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] firmware: microchip: don't unconditionally print
 validation success
Message-ID: <20240424-overthrow-punch-75d29c804296@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
 <20240410-throwing-sandworm-7d03e4e2f4e8@spud>
 <46925bcd-ad92-4c02-90f3-11da5c627391@ghiti.fr>
 <20240424-impish-platonic-5edf54ffda92@spud>
MIME-Version: 1.0
In-Reply-To: <20240424-impish-platonic-5edf54ffda92@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_140407_427506_6F173A02 
X-CRM114-Status: GOOD (  24.58  )
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
Content-Type: multipart/mixed; boundary="===============5634755071207706628=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5634755071207706628==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ifV/mwX84ctBZOL3"
Content-Disposition: inline


--ifV/mwX84ctBZOL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 09:59:36PM +0100, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 10:26:35PM +0200, Alexandre Ghiti wrote:
> > Hi Conor,
> >=20
> > On 10/04/2024 13:58, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > If validation fails, both prints are made. Skip the success one in the
> > > failure case.
> > >=20
> > > Fixes: ec5b0f1193ad ("firmware: microchip: add PolarFire SoC Auto Upd=
ate support")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >   drivers/firmware/microchip/mpfs-auto-update.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/=
firmware/microchip/mpfs-auto-update.c
> > > index 33343e83373c..298ad21e139b 100644
> > > --- a/drivers/firmware/microchip/mpfs-auto-update.c
> > > +++ b/drivers/firmware/microchip/mpfs-auto-update.c
> > > @@ -218,10 +218,12 @@ static int mpfs_auto_update_verify_image(struct=
 fw_upload *fw_uploader)
> > >   	if (ret | response->resp_status) {
> > >   		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
> > >   		ret =3D ret ? ret : -EBADMSG;
> > > +		goto free_message;
> > >   	}
> > >   	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
> > > +free_message:
> > >   	devm_kfree(priv->dev, message);
> > >   free_response:
> > >   	devm_kfree(priv->dev, response);
> >=20
> >=20
> > This should go into -fixes, but not sure if you take care of this or if
> > Palmer should, please let me know so that I can remove this from my lis=
t :)
>=20
>=20
> Yea, probably this and "firmware: microchip: clarify that sizes and
> addresses are in hex" should go on fixes. FYI, I usually set the
> delegate on patchwork for things that I take to me, so generally you
> should be able to tell from that.

I picked up 2 and 3. I'll send a PR with them later in the week, thanks
for the reminder. Patches like these I kinda dislike applying without a
review, but don't really get reviewed unless I harass someone at work to
do so, which I did not do here.

Cheers,
Conor.

--ifV/mwX84ctBZOL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZilzwgAKCRB4tDGHoIJi
0vppAQC+iCnthozRZn/Qlrt86aJDn/JQ/efXnyPpP3OXNvYZbwEA3I9jtWV2vFwI
q0P3V+3MafmQrL5VNaaXW1n5RvYlLgw=
=aDBO
-----END PGP SIGNATURE-----

--ifV/mwX84ctBZOL3--


--===============5634755071207706628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5634755071207706628==--

