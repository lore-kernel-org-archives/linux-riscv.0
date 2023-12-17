Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7667C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=053tIsI8fgRbkLj5ea+GbxnyT/40CW6nM0xc00XmLkQ=; b=1lkms+ukAei0rizfUJN6KV7E5L
	YfVJ0tWiCCFHDy8IEczFL/XBNlK2EiD9f6bpkmFF3V54nOqhs5X2vtCy+B0SKCDrLeBNvwHpJkRq5
	NEK5RFnfHPRPfzYtJab2hQmfD06YNeU2V1fsH9wNv+6/XMZBAN0yOvJpTIMcqY8ZLh505sHK3dqvs
	aok4mBUQu3kebV90CW7kxqrPs2bj/HEVfe8iUdlTyy/bv5wn8cR8nlMl7CBNhTmor8wS3JjlQn5CO
	1CgW9SnRXlIZTh8A8kZAJEY7TqBrlCIekU3v8p9AA/jtMJoYZqrGU/ZCFEVxvhnj2PrG0qG2KNnlq
	1P1UX4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyOZ-008Tic-2Y;
	Sun, 17 Dec 2023 21:09:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyOV-008Tea-0R;
	Sun, 17 Dec 2023 21:09:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 940ECB80B8A;
	Sun, 17 Dec 2023 21:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317F9C433C8;
	Sun, 17 Dec 2023 21:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702847388;
	bh=pDlIZybXRI8LmSUJwxQ9swF4niWXVQabD7yDs33HQw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsxGX/S/ViVVCvVazbG/67dop8rBwKNAK0dNrdbW9ku1xUK7Uy3PWJ/3prB6KR7A3
	 jaGh7tY7oq7+/vcSnaDXXTMuXA2Qm1tnkWSGSHx5C6c4RYOUrIiREi7tXvCgTG3Lej
	 eSmpo0Y6z/UH6KL13F/6r8JOuERk45EhQAXHJjBn96lWKFrBXLgK4GafN+SukoCDkj
	 ZllSmcsT95dO8YHkqIUK3VFP0Al0dgbjW4iZoSw4DLVvwOMLHv4r69rdXPz7OHuISH
	 Bi2J87TZYPASi2rtj4daAGOhyXv7leeDj8PRokk4Ts0ne4ym7UJYLGGF45GYkYwY11
	 EMg0VORZNSAeg==
Date: Sun, 17 Dec 2023 21:09:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Message-ID: <20231217-spray-livestock-a59d630b751e@spud>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
 <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
 <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
MIME-Version: 1.0
In-Reply-To: <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_130951_444133_30EFE59A 
X-CRM114-Status: GOOD (  20.61  )
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
Content-Type: multipart/mixed; boundary="===============3722708942914921528=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3722708942914921528==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npmbwANzcjocFUKY"
Content-Disposition: inline


--npmbwANzcjocFUKY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 11:03:24PM +0200, Cristian Ciocaltea wrote:
> On 12/15/23 22:59, Samuel Holland wrote:
> > On 2023-12-15 2:47 PM, Jessica Clarke wrote:
> >> On 15 Dec 2023, at 20:40, Cristian Ciocaltea <cristian.ciocaltea@colla=
bora.com> wrote:
> >>>
> >>> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
> >>> similar to the newer JH7110, but it requires only two interrupts and a
> >>> single reset line, which is 'ahb' instead of the commonly used
> >>> 'stmmaceth'.
> >>>
> >>> Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
> >>> conjunction with 'stmmaceth', extend the logic to also permit exclusi=
ve
> >>> usage of the 'ahb' reset name.  This ensures the following use cases =
are
> >>> supported:
> >>>
> >>>  JH7110: reset-names =3D "stmmaceth", "ahb";
> >>>  JH7100: reset-names =3D "ahb";
> >>>  other:  reset-names =3D "stmmaceth";
> >>>
> >>> Also note the need to use a different dwmac fallback, as v5.20 applies
> >>> to JH7110 only, while JH7100 relies on v3.7x.
> >>>
> >>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>> ---
> >>> .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +-
> >>> .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
> >>> 2 files changed, 55 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/=
Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >>> index 5c2769dc689a..c1380ff1c054 100644
> >>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> >>> @@ -95,6 +95,7 @@ properties:
> >>>         - snps,dwmac-5.20
> >>>         - snps,dwxgmac
> >>>         - snps,dwxgmac-2.10
> >>> +        - starfive,jh7100-dwmac
> >>>         - starfive,jh7110-dwmac
> >>>
> >>>   reg:
> >>> @@ -146,7 +147,7 @@ properties:
> >>>   reset-names:
> >>>     minItems: 1
> >>>     items:
> >>> -      - const: stmmaceth
> >>> +      - enum: [stmmaceth, ahb]
> >>>       - const: ahb
> >>
> >> I=E2=80=99m not so well-versed in the YAML bindings, but would this no=
t allow
> >> reset-names =3D "ahb", "ahb"?
> >=20
> > Yes, it would. You need something like:
> >=20
> > reset-names:
> >   oneOf:
> >     - enum: [stmmaceth, ahb]
> >     - items:
> >         - const: stmmaceth
> >         - const: ahb
>=20
> Oh yes, I always forget about the "oneOf" thing. Thanks!

Won't this also relax the naming for all devices that allow a single
reset, but expect the stmmaceth one? I'm not sure that that actually
matters, I think the consumer bindings have constraints themselves.

--npmbwANzcjocFUKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX9jlAAKCRB4tDGHoIJi
0u2kAQDwhBC97TRp152I+1W+AAVbbj170OQONz+W/j8kuDieIwD/cY+M0Ecr1wRq
sRFbcJiO+jHPZHDgTTISrvusYc5QxwU=
=mt/n
-----END PGP SIGNATURE-----

--npmbwANzcjocFUKY--


--===============3722708942914921528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3722708942914921528==--

