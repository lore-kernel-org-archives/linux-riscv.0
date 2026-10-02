Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE825CA5FE0
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvtRmvYGa9xzn8TBObX2/c3Gwow3pPiq3HVqoxQ5d2k=; b=hLd+iY2JPbLXhB2mrnx6AZfFd/
	U4OFaEHqzB7hS4UOK8Xw99AvscVoZZcqWRSikaFET/Rw6aH6uhEztEfwIFJ6XqRtOlMAeDgj20H3l
	d463F9/Qs6y6R4y2OAV5SRstfBBOhIYIHk09xIHWhTwIA7RP/zpqa3WHiUWuzbkPPKqiYNso1LlzA
	YwwSY2qZye57KCVNIhcNGwi0pOEre4c3EGHc8FkQc0b9JAAeSyIVM+4H4+c8jGU8DgPeuqHsvTpXA
	jNGeWoaM6n2kUKfPoCetcnwo5cng6q/1rf5HjIVynW3hXq5Qb+ubBQYqTT9zpnrawhFafG4sKpfyP
	dRpdHRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgxs-0000000C8yQ-0jOK;
	Fri, 02 Oct 2026 17:22:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgxq-0000000C8yA-2TBM
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 17:22:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B48B6602D1;
	Fri,  2 Oct 2026 17:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233A61F000FF;
	Fri,  2 Oct 2026 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790961749;
	bh=5lsjsTCc8qCQhiVuFfa42WrZNK8Mcw0OaXI8JZ8FGXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yl9+SmW7uiPIKufU9PyJ3SGWFauI5TSTTT0hqCX26igAsxWwP4C0wdRJlusL0XT6e
	 6qUVcal33Wgq5hV8kMhH6SlNsbX7Gic7xRiIBj+1zRmEuJe9d2V0ek0TW3I3XJ8qhb
	 w8dU3ppjs4DI5xzt9Nmf+yU0UP7oGO3DmKnq0Q57T6KihY3UODADh6IheHupoTccdK
	 Rp/R23GYDV247Vso7MaOdwy6lNKIGfJiz9vw5SpT34wcOCUW+hOrvcoClO62x69x1k
	 +q2TGgu/KLBDVJMeg7evnyhjKJC+XpbnUfjeqCze1u0gx3+ymRPGrGRgx+NtBl0r0q
	 BJNbkFvaFuv8Q==
Date: Fri, 2 Oct 2026 18:22:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, conor.dooley@microchip.com,
	daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: mpfs: use kref cleanup on probe failure
Message-ID: <20261002-useable-progeny-f984e157d19f@spud>
References: <20260924110054.1553880-1-lgs201920130244@gmail.com>
 <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8604348904322562765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8604348904322562765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sVkLHppJgi9/7moi"
Content-Disposition: inline

--sVkLHppJgi9/7moi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:04:16AM +0800, Felix Gu wrote:
> Hi Guangshuo,
>=20
> On Thu, Sep 24, 2026 at 7:01=E2=80=AFPM Guangshuo Li <lgs201920130244@gma=
il.com> wrote:
> >
> > After kref_init(), the device_get_match_data() failure path jumps to
> > out_free_channel. That path frees the mailbox channel and then falls
> > through to kfree(), bypassing mpfs_sys_controller_put() for the initial
> > reference.
> >
> > Call mpfs_sys_controller_put() on that path and return immediately. The
> > existing kref release callback then performs the matching cleanup, and
> > the return prevents a second free through out_free. This is the minimal
> > change needed to keep the initialized lifetime balanced.
> >
>=20
> I don't think this is a fix.  mpfs_sys_controller_put() does the same
> mbox_free_channel() + kfree() the current path already does.

Why would it not be a fix? Maybe you mixed up the delete and put?

static void mpfs_sys_controller_delete(struct kref *kref)
{
	struct mpfs_sys_controller *sys_controller =3D
		container_of(kref, struct mpfs_sys_controller, consumers);

	mbox_free_channel(sys_controller->chan);
	kfree(sys_controller);
}

static void mpfs_sys_controller_put(void *data)
{
	struct mpfs_sys_controller *sys_controller =3D data;

	kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
}

the kref_put() that wraps mpfs_sys_controller_delete() decreases the
refcount and is the matching action for the kref_init() during probe.


> > Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource=
 leak on probe error")

Unfortunately, without a signoff, I cannot apply this.

> > ---
> >  drivers/soc/microchip/mpfs-sys-controller.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/=
microchip/mpfs-sys-controller.c
> > index 0400a01b2338..379e4f649faa 100644
> > --- a/drivers/soc/microchip/mpfs-sys-controller.c
> > +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> > @@ -174,7 +174,8 @@ static int mpfs_sys_controller_probe(struct platfor=
m_device *pdev)
> >         return 0;
> >
> >  out_free_channel:
> > -       mbox_free_channel(sys_controller->chan);
> > +       mpfs_sys_controller_put(sys_controller);
> > +       return ret;
>=20
> If you do keep this, the out_free_channel label no longer fits.

True.


--sVkLHppJgi9/7moi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/oUQAKCRB4tDGHoIJi
0imKAQDBUedm8kAA2bcq5e6HZ4PkcCF0/UMnApZud9og9CGxDAEA/xqEI1UbmZxj
WrPLoPUTBoFfjjX1LbqVRxnzOz2bMQc=
=JjLu
-----END PGP SIGNATURE-----

--sVkLHppJgi9/7moi--


--===============8604348904322562765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8604348904322562765==--

