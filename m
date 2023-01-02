Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874F4C4708D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLk7JqnKvFfqDtIRoqJnnJQNdjxhBD4PYYnwSbFMt7U=; b=4e59s6gyMwaTkETfJGMVomCvNf
	/RWuy2nMCCNK0Sy7OTGrOt2XLYRwcInX8E2F6w8Plf0DwgdPPgKYGP3dC45F7Mza/6Ji9QfT4SQAW
	0/kEv7GJ69YGqk6Fh51byjniiCZfgNIBr4LBWkah8EL5ZLEUueEU53U1XQfufUpDHdqV7Dntk1amI
	gVPfTMbxSty5XfeB0QTGbIdbmV3qqNyw/O22Ss3YNzewmmn5/4Sq6OqdRVe57EpmzK7ALP3v/Ud8D
	wXNew5JBPJPlZX4QOMCbn8T8C7xmwYGphQIhqYTiFax+RbriQXRrKN4Ekv6vSI05Y5tFhYng1Lny8
	a/lkvpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPOi-00DOpg-IP; Mon, 02 Jan 2023 18:18:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPOK-00DOhc-35
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:18:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F5906108F;
	Mon,  2 Jan 2023 18:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591AEC433EF;
	Mon,  2 Jan 2023 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672683510;
	bh=89S45z/8Tm/wRkpmUZ1bW+UDgb3zPm1RefIO82Il6MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN/9HLIBOoPzp3rwuXEcMvcqkyeoiHhfTryjSCgsvA2U7HG/MXUsjnzGIoWv96o8R
	 C0nyz8ubHwMVLSUe9nSv14vlM5UPjz+S6Mosv9hYUmrtuEVxNo2qmxoU2LlWD+MQLE
	 0XKEctxnBRFp4BE8j7xvY4lCTNBFuxKIVe8y65RcQ0QPSpWm6XSGSqZHd4FcJQSbqL
	 /hgcKJ0Wd7nKQY6eA1zsgw6ZCzKfuuVj58vduDL0I56WTLH5l3yL/xx1IfNKJOnA7h
	 Tt/w8bHVhD6sKoZpeVuWOC2m+5rHivfzkhAwdVZDXTa63Wy1psN/BAC71zo3n+47Fy
	 eFBWobXg5eeQA==
Date: Mon, 2 Jan 2023 18:17:45 +0000
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
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
Message-ID: <Y7MfyZBAErYGMZBK@spud>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-7-apatel@ventanamicro.com>
 <Y3EQ4JU7uGbIMGiW@spud>
 <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_101832_261335_A9768608 
X-CRM114-Status: GOOD (  32.21  )
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
Content-Type: multipart/mixed; boundary="===============1591923317380668136=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1591923317380668136==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TQVrb+7+nS5b2faU"
Content-Disposition: inline


--TQVrb+7+nS5b2faU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2023 at 10:20:48PM +0530, Anup Patel wrote:
> On Sun, Nov 13, 2022 at 9:14 PM Conor Dooley <conor@kernel.org> wrote:

> > > +  domain.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - vendor,chip-aplic
> >
> > Same comment here about the validity of this placeholder.
>=20
> Okay, I will add "riscv,qemu-aplic" as QEMU specific compatible string.

Ah neat. I think that's a fair compromise.

> > > +      - const: riscv,aplic

> > > +  msi-parent:
> > > +    description:
> > > +      The presence of this property implies that given APLIC domain =
forwards
> > > +      wired interrupts as MSIs to a AIA incoming message signaled in=
terrupt
> > > +      controller (IMSIC). This property should be considered only wh=
en the
> > > +      interrupts-extended property is absent.
> >
> > This mutual exclusion can be represented, can't it?
> > IIRC it is some sort of oneOf thing, somewhat like below:
> > oneOf:
> >   - required:
> >       - msi-parent
> >   - required:
> >       - interrupts-extended
> >
> > AFAIR from doing the i2c ocores binding, this will force the addition of
> > one, but not both, to a node.
> >
> > Or is this not actually mutually exclusive & the msi-parent property is
> > permitted but just left unused if interrupts-extended is present?
>=20
> If both are present then interrupts-extended is preferred.

Perhaps I am making a fool of myself here, but why would someone include
both of them at once, if only one is going to be used?
It would appear that making them explicitly mutually exclusive would
make the binding easier to understand.
What am I missing?

> > > +  riscv,children:
> > > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > > +    minItems: 1
> > > +    maxItems: 1024
> > > +    description:
> > > +      This property represents a list of child APLIC domains for the=
 given
> > > +      APLIC domain. Each child APLIC domain is assigned child index =
in
> > > +      increasing order with the first child APLIC domain assigned ch=
ild
> > > +      index 0. The APLIC domain child index is used by firmware to d=
elegate
> > > +      interrupts from the given APLIC domain to a particular child A=
PLIC
> > > +      domain.
> > > +
> > > +  riscv,delegate:
> > > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > > +    minItems: 1
> > > +    maxItems: 1024
> > > +    description:
> > > +      This property represents a interrupt delegation list where eac=
h entry
> > > +      is a triple consisting of child APLIC domain phandle, first in=
terrupt
> > > +      number, and last interrupt number. The firmware will configure=
 interrupt
> > > +      delegation registers based on interrupt delegation list.
> >
> > What is the inter dependence of the children and delegate?
> > Is it valid to have a delegate property without children?
> > Can the firmware delegate interrupts without the delegation list, based
> > on the children property alone? Or is it effectively useless without a
> > children property?
>=20
> Both properties convey different information. The "riscv,childen" describ=
es
> the association of child indexes with child APLIC domains whereas the
> "riscv,delegate" describes the interrupt delegation to few of the child
> APLIC domains.
>=20
>=20
> >
> > In your examples, the second has msi-parent but neither of these custom
> > properties. Do the children/delegate properties have a meaning in the
> > msi-parent case?
>=20
> The "riscv,childern" and "riscv,delegate" are only useful when we have
> hierarchy of multiple APLIC domains. The second example only has
> one APLIC domain hence these custom properties are absent.

It'd be great if you could include an example that explains the
difference as, IIRC, both Rob and I both were kinda confused as to how
the properties differ.

Thanks,
Conor.


--TQVrb+7+nS5b2faU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7MfyQAKCRB4tDGHoIJi
0thjAP99pOOK7i02KGfJvyYLevP0789k8SS2zN0cOk0Ie++/vwEA1hE5jLKlaIxR
MNgh209EnpK++6FWUk87WgaAxdmY0gg=
=gLSk
-----END PGP SIGNATURE-----

--TQVrb+7+nS5b2faU--


--===============1591923317380668136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1591923317380668136==--

