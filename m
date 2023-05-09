Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53759C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K89TOM3eFnvrVmoDpikQNqvjzYqrKjKrQTt0rhFfl08=; b=fzHZY65jFLr9J4fTlzEDxSFEie
	xX1rGiuFha9IHT5YvMWysNP1c68lwPcyGxfXQLan2Rd9Owz9LTxiYi90W8pC/SBJcH7E13oAA1BJn
	N38S/mKC1QVkhk7Cn7VI6E6AwlMAvp2tdrUHkko2YHqrB1ExJws/jNOt4W6xJZzLyhN6BWmbRDYLg
	QRo+jXccOkv8nxwncIel98ZGqyENWOSSJEXvL4dIWe0aNUiQ72RggqZLrHcW7c7IdE4RysoU/EyeM
	5UxDbGrdcvVmUMVgnzmM4xNzIqWH4pFnPbs0CE4IsOOD0aJ1TnAi4rheIBOkRjX2OuwXugzxP6Yuf
	WaLU2wpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQad-003qSU-0I;
	Tue, 09 May 2023 16:53:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQaZ-003qRz-14;
	Tue, 09 May 2023 16:53:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4172628BE;
	Tue,  9 May 2023 16:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D1EC433D2;
	Tue,  9 May 2023 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683651202;
	bh=vRIAzOifVTJF+NL+zPnob6GzLta4VkDeRxHaLY4fN94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2WGJ/pCR/n86hfghAdWTdIjbCDFYlHyQ/7+SQ92/BVX/AZljbZub3QbsLJgoBV5O
	 JLcPZnBBQzuQL8Rx7whJ15wNUe0XDNKfBsoUoCrJadKcM2OXUUiw+9CFqqsEKtuFhS
	 Y27/tcsBeK5NY8D2Pswef2kKV9DxEP4ccMUyjHM8y+x7k+26OZkKMu1v+/M/4AOSNY
	 sqemOSiebo+LmEoGNr8NLnUAAH1xmm5aVJveWktkb1XTm2VcA3HrhM6JR63ltk3sEr
	 3M5oKwOOm/Sjo8qkXmofEdNfjPTVwO/NMNWgZfryqGNP3PNDSZlpvs5AXoX7lbECAk
	 N3MNDM/KxvaDg==
Date: Tue, 9 May 2023 17:53:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Message-ID: <20230509-chitchat-elitism-bc4882a8ef8d@spud>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-24-andy.chiu@sifive.com>
 <20230509-resilient-lagoon-265e851e5bf8@wendy>
 <CABgGipXvVw8GWeVLTuTJT9Hus-pEPUcgRhO3oovKYOAZK3fAEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipXvVw8GWeVLTuTJT9Hus-pEPUcgRhO3oovKYOAZK3fAEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_095323_458050_70FF54E6 
X-CRM114-Status: GOOD (  25.34  )
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
Content-Type: multipart/mixed; boundary="===============5163804002025130812=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5163804002025130812==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="poLtL7+Byn1gs2Xr"
Content-Disposition: inline


--poLtL7+Byn1gs2Xr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 12:04:12AM +0800, Andy Chiu wrote:
> > > +config RISCV_V_DISABLE
> > > +     bool "Disable userspace Vector by default"
> > > +     depends on RISCV_ISA_V
> > > +     default n
> > > +     help
> > > +       Say Y here if you want to disable default enablement state of=
 Vector
> > > +       in u-mode. This way userspace has to make explicit prctl() ca=
ll to
> > > +       enable Vector, or enable it via sysctl interface.
> >
> > If we are worried about breaking userspace, why is the default for this
> > option not y? Or further,
> >
> > config RISCV_ISA_V_DEFAULT_ENABLE
> >         bool "Enable userspace Vector by default"
> >         depends on RISCV_ISA_V
> >         help
> >           Say Y here to allow use of Vector in userspace by default.
> >           Otherwise, userspace has to make an explicit prctl() call to
> >           enable Vector, or enable it via the sysctl interface.
> >
> >           If you don't know what to do here, say N.
> >
>=20
> Yes, expressing the option, where Y means "on", is more direct. But I
> have a little concern if we make the default as "off". Yes, we create
> this option in the worries of breaking userspace. But given that the
> break case might be rare, is it worth making userspace Vector harder
> to use by doing this? I assume in an ideal world that nothing would
> break and programs could just use V without bothering with prctl(), or
> sysctl. But on the other hand, to make a program robust enough, we
> must check the status with the prctl() anyway. So I have no answer
> here.

FWIW my logic was that those who know what they are doing can turn it on
& keep the pieces. I would expect distros and all that lark to be able to
make an educated decision here. But those that do not know what they are
doing should be given the "safe" option by default.
CONFIG_RISCV_ISA_V is default y, so will be enabled for those upgrading
their kernel. With your patch they would also get vector enabled by
default. The chance of a breakage might be small, but it seems easy to
avoid. I dunno...


--poLtL7+Byn1gs2Xr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFp6WAAKCRB4tDGHoIJi
0tbRAP92OqQTPhLZLqtifLjtmpk/XP/qCNCv1/2OEe0mjpWnsAD+JswXLM/3OV2q
7UgK5h39kaC/tJc2kq/HBsfBTh6YvwA=
=0eCT
-----END PGP SIGNATURE-----

--poLtL7+Byn1gs2Xr--


--===============5163804002025130812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5163804002025130812==--

