Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZmuwmLr7EfzPOjOdSSM3hKdC6rmjiPR7H3nB6rbrAA=; b=rMppP4j53sdCeIEdxuoLYIuIcb
	V0KM7diuaa66hbeW1RrXtzTQ77TOAv6HdgmcupC4MPTkxeNvgc9JYJ0MeRRk3D9LPe6VgMxKHU0fK
	qpOhekLOtuM2sl7IO+dewliFQXCQ27xZRRYJ+4oGAu6nBqY+W1w5biCIQECTxH9C8IwXxGf8vK9C6
	Z2PYadH5XvgIwPTPuhTerEPpIsyhfvdrieP8KO9ufIzoIgg+35DZ/30BoGS6szbvR/S/g3JBRgwud
	rFz/vYs+pvX43al2w8Eb/lopDrnYMUO/1IEYdY/0tZl6oyHFmCtMJu61tMFWq2OpFTENAxPTiypMc
	6h/tQ//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Xx4-00CHUA-NM; Wed, 29 Jun 2022 13:41:54 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Xx1-00CHSN-PK
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 13:41:53 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 43DAA1C0B8F; Wed, 29 Jun 2022 15:41:48 +0200 (CEST)
Date: Wed, 29 Jun 2022 15:41:47 +0200
From: Pavel Machek <pavel@ucw.cz>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
Message-ID: <20220629134147.GA16868@duo.ucw.cz>
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org>
 <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org>
 <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
 <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
 <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com>
 <0fdbfdd0ee1c7ca39f8d3e2f86af1194@kernel.org>
 <CA+V-a8u8X+bne_a3LY13zGTKr-hOWhm=R9gGX1JyE8PzWRNXpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8u8X+bne_a3LY13zGTKr-hOWhm=R9gGX1JyE8PzWRNXpQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_064152_010399_DAD5FB3D 
X-CRM114-Status: GOOD (  18.18  )
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
Content-Type: multipart/mixed; boundary="===============4330621859360278298=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4330621859360278298==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >> +#define PLIC_QUIRK_EDGE_INTERRUPT      BIT(0)
> > >>
> > >>  struct plic_priv {
> > >>         struct cpumask lmask;
> > >>         struct irq_domain *irqdomain;
> > >>         void __iomem *regs;
> > >> +       u32 plic_quirks;
> > >>  };
> > >>
> > >> What about something like above?
> > >
> > > LGTM.
> > >
> > > Marc suggested to make this unsigned long, but TBH, that won't make
> > > much of a difference.  PLICs are present on RV32 SoCs, too, so you
> > > cannot rely on having more than 32 bits anyway.
> >
> > But it will make a difference on a 64bit platform, as we want to
> > use test_bit() and co to check for features.
> >
> Ok will change that to unsigned long and use the test_bit/set_bit instead.

Is there good enough reason for that? test_bit/... are when you need
atomicity, and that's not the case here. Plain old & ... should be
enough.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYrxWmwAKCRAw5/Bqldv6
8l9XAJ9PDnKunqrF+aGJXyJ5p6LANeuPPQCbB6eNJLatSurZL6FSw4K9O5lrN+I=
=Ha9n
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--


--===============4330621859360278298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4330621859360278298==--

