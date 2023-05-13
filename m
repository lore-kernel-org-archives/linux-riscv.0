Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0B1C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 21:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SmIR22DZ8BOz/pNQpAweGfl0R9bgSoXdod34LzwH5E=; b=yz44hH7YmXIt+lJ1IR4ehgrEs5
	YVcr6ZjPOOWc7d1/mJBB7YlHWHyUSeX5W+cWkVF+41bDxpYEG4a7lcJtoNrz7ytS8tcX7MerpufTD
	CHazijQohAdUOdzx+8LcVROI62Y11Jpq0toFpSxkR64R4LmIn9hE84gPbhEPx+XmM1nMF0OEQPNYP
	zb7LEWAr47yI2iL/RYnBdYzA66cEQ4Z5drJfECwDvMgrB16fwNN8LtEY3tWJrz0npGhB5WiLAgl/Z
	zhrQ4CxEiP93YfEsphq5cpwUeWcpDdCxViJQgA0o43zHD0NN+C0u1w4zRbQgrI7OIL89eGgKfAuzL
	SR/qzZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxxCb-00FvdP-13;
	Sat, 13 May 2023 21:54:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxxCY-00Fvcp-2P
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 21:54:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1038609FA;
	Sat, 13 May 2023 21:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A69C433D2;
	Sat, 13 May 2023 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684014890;
	bh=NgMrOpISNBxNvGYXPclgMXoSV7daZbwXWL5lYCVLSlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TuTuBt7qizZijHKv+d3UKhaB+QqDJZelwwWBDdSGdO/nsR/E0paEZVGX/SOjQRsOo
	 uhgwTO0vCrIz/TdoVt5BRgGQRwV8Zd12kaodlrfKL15XGifzXnAyxH+GZuOEzOmrnE
	 oE11b6ehMCWZb2xazcQsoS9Q39mO9pHICK4jsiA1i1D8kGUFdR/Z1vf9T1nPjCkVe8
	 Rb2BMfYJZxAk2DwmI0BINRtkx2JjuhC4ObPQl8HVO2PJjWmcKKnjGorXh/FagfSML1
	 J/BhZWGg6DPWlbldhV5wN9FpQLf8IEe/T99kVwqaynE+xrN/ZEPBWiux+jfqcEj6k9
	 gGtdkW6VNfCCw==
Date: Sat, 13 May 2023 22:54:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	conor+dt@kernel.org,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Favor <gfavor@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Waterman <andrew@sifive.com>, cyy@cyyself.name,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Krste Asanovic <krste@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Mark Himelstein <markhimelstein@riscv.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230513-starlit-editor-058e609c10e4@spud>
References: <20230511-occupancy-cleat-06e532e3ea11@spud>
 <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud>
 <20230512-exhume-unfold-f104dd4c4cbf@spud>
 <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
 <12BD8A89-CC3C-4C67-A501-7BB6BAD2EF59@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <12BD8A89-CC3C-4C67-A501-7BB6BAD2EF59@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_145454_886421_56CC3A3E 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: multipart/mixed; boundary="===============1484017301864970480=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1484017301864970480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GD9tCDTvShhz02+o"
Content-Disposition: inline


--GD9tCDTvShhz02+o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 10:34:15PM +0100, Jessica Clarke wrote:
> On 13 May 2023, at 08:47, Anup Patel <apatel@ventanamicro.com> wrote:

> > For DT, users can either use "riscv,isa" DT property or use boolean
> > DT properties.
>=20
> Can we please not gratuitously have two ways of doing the same thing.

My intention, iff this goes ahead, is to deprecate that property, not
have some 'you can use "riscv,isa" or boolean, whichever you choose'
situation.
Obviously for backwards compatibility reasons parsing it as a fallback
would have be kept in Linux, so in theory a DT based Linux system "can
use either". It would be up to other platforms to decide whether they
would also like to do such a thing.

> I say this as a non-Linux OS that has to deal with whatever Linux
> decides to do with device trees. It is a total nuisance when you flip
> flop on things and we have to follow suit. Please consider the breakage
> very carefully.

I think I said it in my cover & in a later message, that I sent it here
only for first thoughts and my intention is to "send a non-RFC version
of this that also CCs the likes of QEMU, U-Boot & the BSD folk".
It's clearly not something that could be done unilaterally.


--GD9tCDTvShhz02+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGAHJAAKCRB4tDGHoIJi
0tztAQDO35y2/lCm7w1u4RRxVzrcFsTqnIKgOhfRuGsT+pRylQEAhHIyOmwWeqSA
7qmj59rJ/EcJyqXuCxO83VxYIzLfMQg=
=qYEv
-----END PGP SIGNATURE-----

--GD9tCDTvShhz02+o--


--===============1484017301864970480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1484017301864970480==--

