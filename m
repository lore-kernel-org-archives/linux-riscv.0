Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FC5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBi0itrMMqFBOFgudIei8u0A0Xp3I4v3cdLqRTqN9sM=; b=MOSRxd4zJEE3fULLrXhHYVY8fc
	3Sn7RIda4J8iqrRwZwsqlBJMtv8WfdbqSLea+cLlvQODY7wAioHyE1OZGtBM/I8WmJpUmrTimEYlX
	EXVL8xNnOHMpCb3vVb7Pdslxr8f7IZxKxtROly7bzu/Bq/DpGwaTPxw4jco+nqgmCaRStABCrmsV3
	xWHEg4AnMPe0t9+nhM3bUt7PdREGkuqnXB46w37kR5XN+qdnqVJ5Z9Mh2ydwGYnxfzYktBl0RQKUI
	zrIGQiCRj+QPpX0iCFTQ1mCx7I7ca6QmGzwTEt2epTeaJ9WC8AN1xUxvV0wCa/bjOBZdJosLswcBy
	IjReUs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjiT-000000062Hl-3jlR;
	Wed, 24 Apr 2024 20:59:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjiQ-000000062H4-3RTJ
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F38D5CE173A;
	Wed, 24 Apr 2024 20:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67CFC113CD;
	Wed, 24 Apr 2024 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713992380;
	bh=AtbHrS/SRHBMPOyZWKxUQceaSfXzElYHYKOrTpS9txM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3ncoNB6xJbHsBwLMGl9yGOIyBnLv69hx3sUqeXYBUgZIP8WuXJ+7udJKg5sFbvGM
	 UeZj3tVu15TUd/6GsoH0zjDko2v3Q5MjMKi+/eybAQuFU1yJWtxpxyDA8M9fDou5hx
	 HaK7BQ0ODJU99BoU5QwTQ+tcsFBu+jqbXdHgZE0lx0OYt3fJrKhZj6sjPAgERXr28z
	 hNno4vUlPVVi8FCWTfFo7t2ucUfLNELfU41oZPK3HVTZf7XLdyjF+DrzuvTEeOt6lb
	 Evy30KTiG/24zmWpu3giejMvv8A+XTpKN3vdOMo/HGw4PXLsxadJbk3BuEidaKLL3y
	 lTcXDaxYwTnNA==
Date: Wed, 24 Apr 2024 21:59:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] firmware: microchip: don't unconditionally print
 validation success
Message-ID: <20240424-impish-platonic-5edf54ffda92@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
 <20240410-throwing-sandworm-7d03e4e2f4e8@spud>
 <46925bcd-ad92-4c02-90f3-11da5c627391@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <46925bcd-ad92-4c02-90f3-11da5c627391@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_135943_179568_13EDE66B 
X-CRM114-Status: GOOD (  19.26  )
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
Content-Type: multipart/mixed; boundary="===============0046174236247538117=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0046174236247538117==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wfvFrLcwJu/CsjjT"
Content-Disposition: inline


--wfvFrLcwJu/CsjjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 10:26:35PM +0200, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On 10/04/2024 13:58, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > If validation fails, both prints are made. Skip the success one in the
> > failure case.
> >=20
> > Fixes: ec5b0f1193ad ("firmware: microchip: add PolarFire SoC Auto Updat=
e support")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   drivers/firmware/microchip/mpfs-auto-update.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/fi=
rmware/microchip/mpfs-auto-update.c
> > index 33343e83373c..298ad21e139b 100644
> > --- a/drivers/firmware/microchip/mpfs-auto-update.c
> > +++ b/drivers/firmware/microchip/mpfs-auto-update.c
> > @@ -218,10 +218,12 @@ static int mpfs_auto_update_verify_image(struct f=
w_upload *fw_uploader)
> >   	if (ret | response->resp_status) {
> >   		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
> >   		ret =3D ret ? ret : -EBADMSG;
> > +		goto free_message;
> >   	}
> >   	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
> > +free_message:
> >   	devm_kfree(priv->dev, message);
> >   free_response:
> >   	devm_kfree(priv->dev, response);
>=20
>=20
> This should go into -fixes, but not sure if you take care of this or if
> Palmer should, please let me know so that I can remove this from my list =
:)


Yea, probably this and "firmware: microchip: clarify that sizes and
addresses are in hex" should go on fixes. FYI, I usually set the
delegate on patchwork for things that I take to me, so generally you
should be able to tell from that.

Cheers,
Conor.


--wfvFrLcwJu/CsjjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZilyuAAKCRB4tDGHoIJi
0u8sAQDXfCnN72t0usUB/TxsxGQh0meKlPPQxL/1JGYczIUeNAD+OrnpAgicXCAn
OWkhvywo60dsKPA2IK3qlkCprCFbkwQ=
=oLCZ
-----END PGP SIGNATURE-----

--wfvFrLcwJu/CsjjT--


--===============0046174236247538117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0046174236247538117==--

