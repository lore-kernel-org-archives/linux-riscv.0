Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A05EC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjF9m4LG7Phin7m2Dsu98Jefo9mo9hvoog4QIHf3HAE=; b=sPqiazWVw+5q2MzJjesFx3U3pL
	cxoO7/rplKgMQxtFUGCvZcjG6+P1768dJBQ4Tc3sT8lbNEvHzQuzaFXXL8tiOk8L+HhMT9VJA3gbT
	gmzzEV2jpIPOqYufTLYBNCTnYJXHIBM7I00xM57Jn8RCBY7T0pqBLDlK7e3IuauHkT11Wmsds2FSQ
	Q28yCUWU/DDoEkfbaxsuZIyrYHlAOXAVsDkzJx4HXKd7TrRvSwWFcTiHasUMN7Vf+IUUXvl3xpKJy
	vy1OVUSudWq0lr6r9/Bqvt3V6LLCF05y29E4QcGUw3FWp9Z3r+r6XBd8eKNmrpYHv3fKr9QbAiSVV
	mxYK1fjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gnv-0000000BcmH-2yqj;
	Wed, 09 Sep 2026 11:49:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gnu-0000000Bclw-3oOz
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 11:49:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F56D406A9;
	Wed,  9 Sep 2026 11:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DE71F00A3E;
	Wed,  9 Sep 2026 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788954566;
	bh=nhGbwomjQ4cV6eZMtHYxkXFToUqnimfxR1ZcZ83JK9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JSEMhmz8nqDCAneBXqOH4+OwbdOIeKdrU3fXMEIw52zPCiBL1g1He1lgqT7kNH0q6
	 s2LoBtGINKTvpIfvZLRo0EnsVaumy4+mG5faUBD2WHUHHGj9oeC4Ybirqw0vI1u2yV
	 1sLnilXIBy253x+UtDscbgLxmbYTfrJ9UnSqwQzeI583XAH1pAYAdIYxthMQ9/Vyri
	 lpmK++Nu1JuvZgJVtjXitseCTcuBKC9aDPKtq+Cewp9esjIGMAytLOYVGBsVM7Y2x1
	 +KghMpqjoEGRCwq4D4g/kNoQ8q9Ki2SgDT7x9zTr1PtBfLx/CAbuysSTTHXdVTcn1K
	 U9cWohCesrGeA==
Date: Wed, 9 Sep 2026 12:49:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 3/5] riscv: support early isa ext and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <aqFHr3BWR0XhxMsv@squawk>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-4-jszhang@kernel.org>
 <20260907-smashup-darn-93d1ee105a57@spud>
 <ap-EZ-rb7RJ5ykmG@xhacker>
 <20260908-baggie-tripping-c2cee6bb4947@spud>
 <aqCeaXYJEdW78PMV@xhacker>
MIME-Version: 1.0
In-Reply-To: <aqCeaXYJEdW78PMV@xhacker>
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
Content-Type: multipart/mixed; boundary="===============4356346545221057053=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4356346545221057053==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="loqWGgo4+1JPEZ8Z"
Content-Disposition: inline

--loqWGgo4+1JPEZ8Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 07:46:49AM +0800, Jisheng Zhang wrote:
> > > This assumes SV48 and SV57 are the only "early" users, but
> > > other ISA ext may also need "early", who knows. So if future some ext=
ensions
> > > need the "early", the code is ready, the author doesn't need to care =
about
> > > the isa filling at all.
> > >=20
> > > So I prefer my patch as is. What's your opinion?
> >=20
> > We're about decade into the port being merged and this is the only thing
>=20
> but the isa extension alternative is not, it was introduced by me three
> years ago. But no matter how many years,=20
>=20
> > behaving in this way. I don't think the code in this patch is worth it =
on
> > the off chance that something else comes along. If it does, we can
>=20
> this makes sense. Let me cook a new version
>=20
> > always fish this implementation back up and use it.
>=20
> >=20
> > I'd also like to differentiate this code from "needing early", because
> > this is about populating the information early in the extension bitmap,
> > rather than about actually needing the information. There's no advantage
>=20
> the code after arch/riscv/mm/init.c but before mmu on needs the
> bitmap informaion when pgtable_l5|l4_enabled() is called (w/o
> USE_EARLY_PGTABLE_LEVELS)

Oh, I must have missed something then, I didn't realise you were
patching the alternatives early - I thought you were skipping them until
the information became available at the normal time. Sorry bout that.

How bad is the damage btw, if you implement pgtable_l5_enabled() as

static __always_inline bool pgtable_l5_enabled(void)
{
	if (riscv_has_extension_likely(RISCV_ISA_EXT_SV57))
		return true;

	return _pgtable_l5_enabled;
}

? It shouldn't be too bad since it should get expanded to stuff like

	if (riscv_has_extension_likely(RISCV_ISA_EXT_SV57) || _pgtable_l5_enabled)

by the compiler. I wonder if you can do this and get rid of
USE_EARLY_PGTABLE_LEVELS entirely, since the unpatched alternative
should return false?

Cheers,
Conor.

(btw, I am kinda unavailable til the 22nd, so sorry if I take some time
to reply here or to a new revision)

>=20
> > gained, as far as I can tell, by setting this early and it only makes
> > the code more complicated.
> >=20
>=20

--loqWGgo4+1JPEZ8Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqFHrwAKCRB4tDGHoIJi
0kNPAPwKsnb0Nigb9+J8Zf+WnE3OeDqGa6cRZBx1CwuUwS95SAD+JgfTl9+MD1xz
AC0FTNoNkfZCoO5UpNQ2PytnNp5KDQY=
=XopZ
-----END PGP SIGNATURE-----

--loqWGgo4+1JPEZ8Z--


--===============4356346545221057053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4356346545221057053==--

