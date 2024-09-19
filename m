Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E8CE8D58
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 07:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzkT6dx0ERzKcSdXo+E5aK3wjx3eb/3sAyEdy2Wu7z4=; b=4HUClIm6jpYy6eq7mEGA2QGJCw
	L1BaPwT/QTVPpmjI7GIxbQqXQMpGdBNm8IFRMea6iX8zNsUpnujh69qak4z6vH6/dUKAMPON6uDkL
	FdE+duOirWI4MActOXzaVBD7NrL/gbaaOanI1GUasJ1WYV+RAoJxlidcWIxX/dM2j962qRxeiIYvd
	SWuhvwO54tDJXw6+c65vyoJhsyOzALDE44aCIzJUTu0rKt5Y+9qN3F0WnCOIZrtLMylItik6EzUSJ
	s2OkeiYFY6XRd6+EbTiGpgmNWZ0/W4a4tRPb5nwegbfWR6AT1julmxPyKN2gcEwcQWPrp8QcrpvrD
	xlR3mK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBm8-00000009frL-0TSO;
	Thu, 19 Sep 2024 07:40:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBlo-00000009fmz-0zsk
	for linux-riscv@lists.infradead.org;
	Thu, 19 Sep 2024 07:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92B925C5C31;
	Thu, 19 Sep 2024 07:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3113DC4CEC4;
	Thu, 19 Sep 2024 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726731607;
	bh=SKHiWuT9os4iwt/8Rac5rB767h2DJnB/vbFf5fmwPGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8fKW7ZTcay47pT/vW9S0y+4lE0fuNphqZeE6IY6af3wozhlOnLetyr4/nf7jP7Zy
	 TETUSuGjCDJI9V2aSBGrSLKgUtEdgTmovhu6BQGjhkIZSBOe7PubY2Pt+4my0tnPz3
	 n6G1KDycUbajtzn0Nk9jzpB/JN42orDcCQqv5ZLw2axJjYpaL2s1TURRZvP7WAWPjW
	 t7XS/y5z2RljkHluIhYezKh/Ns5ZMNXJHWDYWJatsGATCdcdLUUwDuCp4iTrPMJFEe
	 SL+Hqb6B9fwmgw/fgMyRq8sw36XZz4WHHZzTUUGCAeYqZXOTglrKA3/s+hvhKcTdWO
	 EkJDusAOtJy7A==
Date: Thu, 19 Sep 2024 08:40:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com, ycliang@andestech.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, conor+dt@kernel.org,
	conor.dooley@microchip.com
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240919-useable-margarine-d6eefae9485c@squawk>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
 <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>
 <20240916-palpable-flock-7217424ed8db@spud>
 <20240918153558.GA1567736-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240918153558.GA1567736-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004008_409711_A159788D 
X-CRM114-Status: GOOD (  34.62  )
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
Content-Type: multipart/mixed; boundary="===============5570921579526234870=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5570921579526234870==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XW5QfXNOZ95nX152"
Content-Disposition: inline


--XW5QfXNOZ95nX152
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 10:35:58AM -0500, Rob Herring wrote:
> On Mon, Sep 16, 2024 at 05:31:36PM +0100, Conor Dooley wrote:
> > On Thu, Sep 12, 2024 at 04:23:44PM -0500, Samuel Holland wrote:
> > > Hi Valentina,
> > >=20
> > > On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
> > > > Add a dt-binding for the Microchip Inter-Processor Communication (I=
PC)
> > > > mailbox controller.
> > > >=20
> > > > Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@micro=
chip.com>
> > > > ---
> > > >  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++=
++++
> > > >  1 file changed, 115 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mailbox/micro=
chip,sbi-ipc.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sb=
i-ipc.yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.ya=
ml
> > > > new file mode 100644
> > > > index 000000000000..dc2cbd5eb28f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.y=
aml
> > > > @@ -0,0 +1,115 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Microchip Inter-processor communication (IPC) mailbox contr=
oller
> > > > +
> > > > +maintainers:
> > > > +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> > > > +
> > > > +description:
> > > > +  The Microchip Inter-processor Communication (IPC) facilitates
> > > > +  message passing between processors using an interrupt signaling
> > > > +  mechanism.
> > > > +  This SBI interface is compatible with the Mi-V Inter-hart
> > > > +  Communication (IHC) IP.
> > > > +  The microchip,sbi-ipc compatible string is inteded for use by so=
ftware
> > > > +  running in supervisor privileged mode (s-mode). The SoC-specific
> > > > +  compatibles are inteded for use by the SBI implementation in mac=
hine
> > > > +  mode (m-mode).
> > >=20
> > > There is a lot of conditional logic in this binding for how small it =
is. Would
> > > it make sense to split this into two separate bindings? For example, =
with the
> > > current binding microchip,ihc-chan-disabled-mask is allowed for the S=
BI
> > > interface, but doesn't look like it belongs there.
> >=20
> > I dunno. Part of me says that because this is two compatibles for the
> > same piece of hardware (the choice depending on which programming model
> > you use) they should be documented together. The other part of me is of
> > the opinion that they effectively describe different things, given one
> > describes the hardware and the other describes a firmware interface that
> > may have any sort of hardware backing it.
> >=20
> > I suppose it's more of a problem for "us" (that being me/Rob/Krzysztof)
> > than for Valentina, and how to handle firmware interfaces to hardware
> > like this is one of the topics that's planned for Krzysztof's devicetree
> > BoF session at LPC.
>=20
> If how the client interacts with the device is fundamentally different,=
=20
> then I think different compatibles is fine.

It wasn't about different compatibles (which I think are non-debatable
here) it's whether or not the different compatibles should be in their
own binding files.

--XW5QfXNOZ95nX152
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuvVVgAKCRB4tDGHoIJi
0ogwAP9aQ00DhFSZtkfdD4M6IsRJi3SNUC6DmPJlEz0PltPCegD9FJcnmg8ZE6Dm
4HbBn/9l40PyHree8TdGYaQazOxWIwU=
=QgG+
-----END PGP SIGNATURE-----

--XW5QfXNOZ95nX152--


--===============5570921579526234870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5570921579526234870==--

