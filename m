Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C408C54E76
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU21rt6ztsldHwN9Qw02X6VoZdeYEfDMQ3LKD0O3OWk=; b=OdYJm+etr6QxxTkX7TXQEpB6/G
	1CIoD7bnYeSuX6x8Gw+N7FPsn5mkICiBWA4GhksaLMEHGNW9u9z7cwwT3N6kP9+cXKHITePcb0Qgi
	RsuTNdiFoq4vYxJQo9XLYDVBef/zNY1oCgAIQuhjDsPIHRpmxUYXKVdJg+urT4+e3ILgIXAJwGrsH
	/dYDLWZf1052hjZzHIjJTq5KsRpRL2HgV624RjtDnetHvJMBLmF4APjkuP4cYPxuk95Hi5P+SC3AK
	4JCGTlGuftMS3AS23mcMynv2bzAWtQfVU0ZywkZEk6W/5ZpmXnpV36zv13r8RjegGzoCl5pTil1ls
	EzUDKB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHsmd-00Fnru-AC; Tue, 17 Jan 2023 20:42:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHsmZ-00Fnr6-Rj
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 20:42:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B04CB81A0C;
	Tue, 17 Jan 2023 20:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4F7C433D2;
	Tue, 17 Jan 2023 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673988128;
	bh=bN1rNc513vQmrecLRhCXnFkD9PGMHmyMJzDfwS8nfT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsTWxiHa3biQSfAqhmIIf1A5AYQV4HeVTuhO6QauJFJMyT2CsaswdOxuFQK8+HxXd
	 sl+lum2g1RuJlFIWm7vdNvlmrhEx90XxhsY862oaTX7BsaBKMaFcphJurL0oup7SsV
	 hQzzxKRChvB1nm9uY91DTr7SAmcfaedaOr4Eq/iYkNWt48xgfOrtzpbetrEoBISVQZ
	 WzjKIvzlPpd0GSS/egu/HNENkD2DmCw0VOBvNJmCBDP/oT8W4JtUYK1sNt5MLiGUGN
	 9OUIITCOJMYj378/XhBKy4OT3hDSz8HdmczZSQDi7a9p53LCuzD5hl2zDi1e5ZOYFH
	 UHs6BxcdPtm8g==
Date: Tue, 17 Jan 2023 20:42:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/9] RISC-V: Add AIA related CSR defines
Message-ID: <Y8cIG6gKSlkTh5AF@spud>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-2-apatel@ventanamicro.com>
 <Y7YGp/7ufyRPhkwg@spud>
 <CAAhSdy2YKJfuxhBmsx9v-OMyxKQjys+J-z_ZqoPJF7q=YrE4Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2YKJfuxhBmsx9v-OMyxKQjys+J-z_ZqoPJF7q=YrE4Zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_124212_242368_0010807D 
X-CRM114-Status: GOOD (  21.04  )
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
Content-Type: multipart/mixed; boundary="===============8773284881336475446=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8773284881336475446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k2uHQ/1oXnALNsqN"
Content-Disposition: inline


--k2uHQ/1oXnALNsqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

I thought I had already replied here but clearly not, sorry!

On Mon, Jan 09, 2023 at 10:39:08AM +0530, Anup Patel wrote:
> On Thu, Jan 5, 2023 at 4:37 AM Conor Dooley <conor@kernel.org> wrote:
> > On Tue, Jan 03, 2023 at 07:44:01PM +0530, Anup Patel wrote:

> > > +/* AIA CSR bits */
> > > +#define TOPI_IID_SHIFT               16
> > > +#define TOPI_IID_MASK                0xfff

While I think of it, it'd be worth noting that these are generic across
all of topi, mtopi etc. Initially I thought that this mask was wrong as
the topi section says:
	bits 25:16 Interrupt identity (source number)
	bits 7:0 Interrupt priority

> > > +#define TOPI_IPRIO_MASK              0xff
> > > +#define TOPI_IPRIO_BITS              8
> > > +
> > > +#define TOPEI_ID_SHIFT               16
> > > +#define TOPEI_ID_MASK                0x7ff
> > > +#define TOPEI_PRIO_MASK              0x7ff
> > > +
> > > +#define ISELECT_IPRIO0               0x30
> > > +#define ISELECT_IPRIO15              0x3f
> > > +#define ISELECT_MASK         0x1ff
> > > +
> > > +#define HVICTL_VTI           0x40000000
> > > +#define HVICTL_IID           0x0fff0000
> > > +#define HVICTL_IID_SHIFT     16
> > > +#define HVICTL_IPRIOM                0x00000100
> > > +#define HVICTL_IPRIO         0x000000ff
> >
> > Why not name these as masks, like you did for the other masks?
> > Also, the mask/shift defines appear inconsistent. TOPI_IID_MASK is
> > intended to be used post-shift AFAICT, but HVICTL_IID_SHIFT is intended
> > to be used *pre*-shift.
> > Some consistency in naming and function would be great.
>=20
> The following convention is being followed in asm/csr.h for defining
> MASK of any XYZ field in ABC CSR:
> 1. ABC_XYZ : This name is used for MASK which is intended
>    to be used before SHIFT
> 2. ABC_XYZ_MASK: This name is used for MASK which is
>    intended to be used after SHIFT

Which makes sense in theory.

> The existing defines for [M|S]STATUS, HSTATUS, SATP, and xENVCFG
> follows the above convention. The only outlier is HGATPx_VMID_MASK
> define which I will fix in my next KVM RISC-V series.

Yup, it is liable to end up like that.

> I don't see how any of the AIA CSR defines are violating the above
> convention.

What I was advocating for was picking one style and sticking to it.
These copy-paste from docs things are tedious and error prone to review,
and I don't think having multiple styles is helpful.

Tedious as it was, I did check all the numbers though, so in that
respect:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--k2uHQ/1oXnALNsqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8cIAQAKCRB4tDGHoIJi
0qosAQDNLMBZwn0pOgFxNRZ2gQ4mAB4/IDrKT4lV7uJ6FsZKTgD/d5T4U/puI+fm
TEmdCdjhH8752eP4Q65/dDTea9aeXgk=
=HSHv
-----END PGP SIGNATURE-----

--k2uHQ/1oXnALNsqN--


--===============8773284881336475446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8773284881336475446==--

