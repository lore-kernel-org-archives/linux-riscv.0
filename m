Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3F9C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1bEy7Or1cl5bjkmljOYy/nTaUr2dPqrhOnshm54/lU=; b=puXKfVF5bosyATbPSC1bW5xZJG
	Hr3UAqXOL4rXDMPeVEEHhklsBp2F45XGvgRd7xdpGz2sW3Iw6tCRF9+hPd/nVIdeAmR/8pXXvuaOT
	2qKyAyxS+ZgV2aj0yGPwXU0Jfm4xAY/8zTBQoO8tzSVPS+nFp5zaguLW8+XaDmuH1em1TIz64dNSO
	Ihq9tmCWhuW4TXqcSmVAe8V2wqgnvMForixOvTg1dCVawc2g9uew+dvbmyWELzi+MZa1Q2erTR1a7
	45/Ik7yxdIuNLQDk28KmeMyPE0Jb54ew5XNFIXZnl0sG3w/Ac2LQmLXN+vrZyxZxhvB85T3M3bp0l
	aEZMi86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAGOr-00G14R-FV; Tue, 27 Dec 2022 20:18:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAGOl-00G11W-Ua; Tue, 27 Dec 2022 20:18:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E829B81168;
	Tue, 27 Dec 2022 20:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C94C433F0;
	Tue, 27 Dec 2022 20:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672172284;
	bh=pGyop+au4H0+njiVOEW2/kj4Vbw3nAC02Ud1MQ63UV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZRPi8qOmGpu4gfjpUCgnn62d/mEt/wHTIFJLfNh4JDwfDKZ0XuR4pHdLdHqVyO+K
	 /oIs08WIGr8LR6twoSi+k+Da6NWKQqYH9lEaIhbyaQeyVFc6zwLpr8aYnEYvIMHfC5
	 VHLhrsVA5R5TbL+eTD1xvhL1n0HdZOBDM5wFb+KJ6LluBRjskvCPpVKtaE8Vnj4buD
	 oNEw8d9qCDIu0ontvs8w1Q6FKvrhOQCK18cBOSlnawTWwjT9ipkJlUD0aSfhLVuuWX
	 +w//QvQSriaYt7t9/24FI9UFjjRUERS7BO12XLnM9f9ZS0kOXFGuxYkZgRWMUOyQpQ
	 I72m0N7c8Jj1w==
Date: Tue, 27 Dec 2022 20:17:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com, atishp@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apatel@ventanamicro.com,
	will@kernel.org, mark.rutland@arm.com, opensbi@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: riscv: add SBI PMU event mappings
Message-ID: <Y6tS959TaY2EBAdn@spud>
References: <20221227194056.3891216-1-conor@kernel.org>
 <8bbe4e7b-ae35-ab68-bb0b-72c201ea1256@sholland.org>
MIME-Version: 1.0
In-Reply-To: <8bbe4e7b-ae35-ab68-bb0b-72c201ea1256@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_121808_567783_C4446EAA 
X-CRM114-Status: GOOD (  28.86  )
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
Content-Type: multipart/mixed; boundary="===============5001643615377963350=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5001643615377963350==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eIOXp9yigPnMrT0e"
Content-Disposition: inline


--eIOXp9yigPnMrT0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2022 at 02:05:01PM -0600, Samuel Holland wrote:
> Hi Conor,
>=20
> On 12/27/22 13:40, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The SBI PMU extension requires a firmware to be aware of the event to
> > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > DeviceTree to describe the PMU mappings. This binding is currently
> > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > since v7.2.0.
> >=20
> > Import the binding for use while validating dtb dumps from QEMU and
> > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > mapping.
> >=20
> > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pm=
u_support.md
> > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-=
sbi.adoc # Performance Monitoring Unit Extension
> > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes in v2:
> > - use the schema mechanism for dependancies between properties
> > - +CC perf maintainers...
> > - move the matrix element descriptions into regular item descriptions
> >   rather than doing so freeform in the property description
> > - drop some description text that no longer applies since changes were
> >   made to the SBI spec
> > - drop mention of the "generic platform" which is OpenSBI specific
> > - drop the min/max items from the matrices, they don't appear to be
> >   needed?

> > +  riscv,event-to-mhpmevent:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      Represents an ONE-to-ONE mapping between a PMU event and the eve=
nt
> > +      selector value that platform expects to be written to the MHPMEV=
ENTx CSR
> > +      for that event.
> > +      The mapping is encoded in an matrix format where each element re=
presents
> > +      an event.
> > +      This property shouldn't encode any raw hardware event.
> > +    items:
> > +      - description: event idx
>=20
> It might be good to clarify that this refers specifically to "event_idx"
> from the SBI specification.
>=20
> > +      - description: upper 32 bits of the event selector value for MHP=
MEVENTx
> > +      - description: lower 32 bits of the event selector value for MHP=
MEVENTx
>=20
> Since you are describing the the columns of the matrix here, I believe
> these entries need to go under two levels of "items:". The same applies
> for the other properties.
>=20
> > +
> > +  riscv,event-to-mhpmcounters:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      Represents a MANY-to-MANY mapping between a range of events and =
all the
> > +      MHPMCOUNTERx in a bitmap format that can be used to monitor thes=
e range
> > +      of events. The information is encoded in an matrix format where =
each
> > +      element represents a certain range of events and corresponding c=
ounters.
> > +      This property shouldn't encode any raw event.
> > +    items:
> > +      - description: upper 32 bits of the pmu event id
> > +      - description: lower 32 bits of the pmu event id
>=20
> These two cells represent the start and end of a range of 32-bit values
> (again the "event_idx" from the SBI specification), not 32-bit
> components of a 64-bit value.

I think this one is me struggling to understand the markdown description
of the binding. Thanks for explaining!

I'll sort the lot out for v3 in a few days.

Thanks,
Conor.


--eIOXp9yigPnMrT0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6tS9wAKCRB4tDGHoIJi
0sobAQDjWQob/opNqA920t7VrsXFJGE09T9GqC35jEjYCfZYsgD/aTGKWWYqH3b7
EBoFrwJVFhonxS+5Rg28In6ObBYTSww=
=/2gu
-----END PGP SIGNATURE-----

--eIOXp9yigPnMrT0e--


--===============5001643615377963350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5001643615377963350==--

