Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5B2C54EBC
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwU1X/Hf0MXjwXCYT399WGmSozx9gdWSrbLlCSA7MyM=; b=QcQItzgP7qLfWcf8lijtPU75mN
	RX5IPFThutHCVSxxI43Ib5sGAYuDGJHBCxvhV2wPVGzb8HAjRRRmL+hMLh8uVA5di1QfsS+C1nEvZ
	yS8UL3p7lV3DSVdbF5CYF3NrrhNtXnZVaV1qwMQjd4cr/YRLTLzLyxs41OTwu2KtGsAdcDivu2h93
	XTPPQMvX1DBC3dhxG2LVrOy7p8w1DUgixqHRvLdBnIEEgKsF71ZXO+DF7XmqOJq4pjW5jzaGv1uRi
	V3bPB1n8l9YofbP1KlwwqF/si+57u4/FWIxmAiMtFZxi+JUjWJDqk07riHNreQDTW2Lhm08mLho68
	Jkqe8Gzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdJo-00FtsA-3g; Sun, 08 Jan 2023 21:35:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdJh-00Ftr0-6y; Sun, 08 Jan 2023 21:34:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D1805B800E2;
	Sun,  8 Jan 2023 21:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71A9C433EF;
	Sun,  8 Jan 2023 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673213693;
	bh=0wHJQPN/hpr3Vl9aQTSQEIJxwRCq7DQjAoDMixc2BhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkDJ3Y7GJAmzlskWWhUBfZLdMQnBuJNnw6zC52Zwp5N5lUWJWY/Z892uu6JgFYxFP
	 iWCfoQcUsmf8gXDGEZh+/ddmTDHNMmgUlr63Ba9LiQ/8Ve6W93i3+r4TeXWFAacDiF
	 4jT7xCHOl6W+mfcN/Lt9fSJ8pMULo/WIFNnRR3hp4cUYGEb1Iau9z/oHPwCh41prBE
	 ORaJeDwKl/5QWw7DsZlh0YGKivaW+LtLjPbadmLBGgOxp4J2oifCt2THRmbF0ItlRg
	 Nw2moygITtrPd8jHR8hm3/jl8s/gD4ihclW21bpqZ0WYZYy0GDIwIMuT/RQ2R/XBQf
	 27zVh5jwSpGMg==
Date: Sun, 8 Jan 2023 21:34:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com, atishp@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apatel@ventanamicro.com,
	will@kernel.org, mark.rutland@arm.com, opensbi@lists.infradead.org,
	samuel@sholland.org
Subject: Re: [PATCH v3] dt-bindings: riscv: add SBI PMU event mappings
Message-ID: <Y7s2+McYXLeEMNck@spud>
References: <20230102165551.1564960-1-conor@kernel.org>
 <20230103092816.w6hknvd4caeahdo4@orel>
MIME-Version: 1.0
In-Reply-To: <20230103092816.w6hknvd4caeahdo4@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_133457_649606_5EAC81EE 
X-CRM114-Status: GOOD (  25.32  )
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
Content-Type: multipart/mixed; boundary="===============5649605262520077439=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5649605262520077439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XO6L+Ie2KiC/ogDG"
Content-Disposition: inline


--XO6L+Ie2KiC/ogDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drew, Atish,

Mainly just a question about the OpenSBI doc at the end. Gonna fix up
the rest of the wording and resend in a few.

On Tue, Jan 03, 2023 at 10:28:16AM +0100, Andrew Jones wrote:
> On Mon, Jan 02, 2023 at 04:55:51PM +0000, Conor Dooley wrote:
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

> > +  riscv,event-to-mhpmevent:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      Represents an ONE-to-ONE mapping between a PMU event and the eve=
nt
> > +      selector value that platform expects to be written to the MHPMEV=
ENTx CSR
>                             ^ the

I think this one is arguable, it makes sense both ways IMO. I don't care
since it's not my prose though ;)

> > +      for that event.
> > +      The mapping is encoded in an matrix format where each element re=
presents
> > +      an event.
> > +      This property shouldn't encode any raw hardware event.
> > +    items:
> > +      items:
> > +        - description: event_idx, a 20-bit wide encoding of the event =
type and
> > +            code. Refer to the SBI specification for a complete descri=
ption of
> > +            the event types and codes.
> > +        - description: upper 32 bits of the event selector value for M=
HPMEVENTx
> > +        - description: lower 32 bits of the event selector value for M=
HPMEVENTx
>=20
> > +     * codes, U74 uses a bitfield for events encoding, so several U74 =
events
> > +     * can be bound to single perf id.
>                                 ^ a   ID
>=20
> > +     * See SBI PMU hardware id's in OpenSBI's include/sbi/sbi_ecall_in=
terface.h
>=20
> IDs

Most of this stuff comes directly from the doc in OpenSBI that I
copy-pasted. Atish, what do you wanna do once the binding is upstream
about the original doc?

Thanks,
Conor.


--XO6L+Ie2KiC/ogDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7s2+AAKCRB4tDGHoIJi
0pu6AP9wCOtE0JPf/jDtqIJnKHi2n73OeKq0MkwLM5SU5/sZ5gD/W9s+CxpmmBc+
5BcwhD+MSLvsGf9pbk7f7Mrs6k3iYwQ=
=eD0/
-----END PGP SIGNATURE-----

--XO6L+Ie2KiC/ogDG--


--===============5649605262520077439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5649605262520077439==--

