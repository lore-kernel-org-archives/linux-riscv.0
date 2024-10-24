Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF74D0BB7F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCUapGSnfQkQbmQC5Iw8i3aKGIWxa775rGfkYmf4ook=; b=fgQe3zRatUWgqMHdWsHhAu7dhU
	bYMIay/NUwZ+lkZyNyze7Ygn0bHZ56Wz1BHRtAVy5444G84W3zpRPKTJjjRDA1P9VrmAUPHIRxGhb
	jDnD3in7+y35gzOjq81eLXnOjY2lrTwA7htoLKPhYMa2Ui5dwobqM7Z1iF+UvMih+9Yd/c9sSLdYU
	K5XRoO4dTpvaqi4vCCkeV7biqThrAi8YqSaXJJ47m0XZAy2Rnb5rgU3QqJ8OOWz2KZhfIiVe1Oe3j
	HS5+/dmwhjZyNKwrhU/XBvnE2GSvo8Dm5FvBPaNFIDmEgNxrD+jE+6a614kVASHb0zQBwaaOja/xw
	+78Q0DVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uO5-0000000HX7n-25zS;
	Thu, 24 Oct 2024 09:44:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uGl-0000000HUkD-1AOp
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 09:36:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAE8D5C5F35;
	Thu, 24 Oct 2024 09:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91ABC4CEE6;
	Thu, 24 Oct 2024 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729762597;
	bh=zcC4+p14p6ZR5MkdPN8Cp6S/KVzMoixwgOEc8MBNQF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEAu94QhimLFI+Xcdhg0+H3j6LGofpklHLJ+WWGpR2i5OkWMMKya53CeEfvv141VE
	 qoU0VVsumM5mwq/RHtwNKPQ2dQc5D1RR/UfJibLjhZQx1+bvIlKs3f9XPHj0Yi6UeP
	 G+CU7pBATyAbQJH60YISoAYxEV7ISnV5wiJjr6F35vlBSNICmfZ9baAGU2QjAJYcBI
	 2RLMRYWASYUjBkr+qoQAxbT1Uvhebvp8FHuIbpm+2B4+7jAmt8Z4s5AAz9Ggg7CV7V
	 gYd5CDTsx6aU3NszaMvgL1omwMwKQlW02AxEP/Jwh0jQdf5y0vhuRQbl1VJWGbeWrm
	 misttjtDALY4g==
Date: Thu, 24 Oct 2024 10:36:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241024-snagged-elated-d168d0d6bf35@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <Zvu38H2Y-pRryFFQ@shikoro>
 <20241001-haphazard-fineness-ac536ff4ae96@spud>
MIME-Version: 1.0
In-Reply-To: <20241001-haphazard-fineness-ac536ff4ae96@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_023639_496624_B4607553 
X-CRM114-Status: GOOD (  49.90  )
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
Content-Type: multipart/mixed; boundary="===============1449566024261500930=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1449566024261500930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfVLrGzLBGvcsMsZ"
Content-Disposition: inline


--hfVLrGzLBGvcsMsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Tue, Oct 01, 2024 at 11:16:24AM +0100, Conor Dooley wrote:
> On Tue, Oct 01, 2024 at 10:50:56AM +0200, Wolfram Sang wrote:
> > > At present, where repeated sends are intended to be used, the
> > > i2c-microchip-core driver sends a stop followed by a start. Lots of i=
2c
> >=20
> > Oh, this is wrong. Was this just overlooked or was maybe older hardware
> > not able to generated correct repeated-starts?
>=20
> Overlooked, because the devices that had been used until recently didn't
> care about whether they got a repeated start or stop + start. The bare
> metal driver upon which the Linux one was originally based had a trivial
> time of supporting repeated starts because it only allows specific sorts
> of transfers. I kinda doubt you care, but the bare metal implementation
> is here:
> https://github.com/polarfire-soc/polarfire-soc-bare-metal-library/blob/61=
4a67abb3023ba47ea6d1b8d7b9a9997353e007/src/platform/drivers/mss/mss_i2c/mss=
_i2c.c#L737
>=20
> It just must have been missed that the bare metal method was not replaced.
>=20
> > > devices must not malfunction in the face of this behaviour, because t=
he
> > > driver has operated like this for years! Try to keep track of whether=
 or
> > > not a repeated send is required, and suppress sending a stop in these
> > > cases.
> >=20
> > ? I don't get that argument. If the driver is expected to do a repeated
> > start, it should do a repeated start. If it didn't, it was a bug and you
> > were lucky that the targets could handle this. Because most controllers
> > can do repeated starts correctly, we can also argue that this works for
> > most targets for years. In the unlikely event that a target fails after
> > converting this driver to proper repeated starts, the target is buggy
> > and needs fixing. It would not work with the majority of other
> > controllers this way.
> >=20
> > I didn't look at the code but reading "keeping track whether rep start
> > is required" looks wrong from a high level perspective.
>=20
> I think if you had looked at the code, you'd (hopefully) understand what
> I meant w.r.t. tracking that.
> The design of this IP is pretty old, and intended for use with other
> logic implemented in FPGA fabric where each interrupt generated by
> the core would be the stimulus for the state machine controlling it to
> transition state. Cos of that, when controlling it from software, the
> interrupt handler assumes the role of that state machine. When I talk
> about tracking whether or not a repeated send is required, that's
> whether or not a particular message in a transfer requires it, not
> whether or not the target device requires them or not.
>=20
> Currently the driver operates by iterating over a list of messages in a
> transfer, and calling send() for each one, and then effectively "looping"
> in the interrupt handler until the message has been sent. By looking at
> the current code, you can see that the completion's "lifecycle" matches
> that. Currently, at the end of each message being sent
> 	static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> 	{
> =09
> 		<snip>
> =09
> 		/* On the last byte to be transmitted, send STOP */
> 		if (last_byte)
> 			mchp_corei2c_stop(idev);
> =09
> 		if (last_byte || finished)
> 			complete(&idev->msg_complete);
> =09
> 		return IRQ_HANDLED;
> 	}
> a stop is put on the bus, unless !last_byte, which is only true in error
> cases. Clearly I don't need to explain why that is a problem to you...
> You'd think that we could do something like moving the stop out of the
> interrupt handler, and to the loop in mchp_corei2c_xfer(), where we have
> access to the transfer's message list and can check if a stop should be
> sent or not - that's not really possible with the hardware we have.
>=20
> When the interrupt handler completes, it clears the interrupt bit in the
> IP, as you might expect. The controller IP uses that as the trigger to
> transition state in its state machine, which is detailed in
> https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDo=
cuments/UserGuides/ip_cores/directcores/CoreI2C_HB.pdf
> On page 23, row 0x28, you can see the case that (IIRC) is the
> problematic one. It is impossible to leave this state without triggering
> some sort of action.
> The only way that I could see to make this work correctly was to get the
> driver track whether or not the next message required a repeated start or
> not, so as to transition out of state 0x28 correctly.
>=20
> Unfortunately, then the clearing of the interrupt bit causing state
> transitions kicked in again - after sending a repeated start, it will
> immediately attempt to act (see state 0x10 on page 23). Without
> reworking the driver to send entire transfers "in one go" (where the
> completion is that of the transfer rather than the message as it
> currently is) the controller will re-send the last target address +
> read/write command it sent, instead of the next one. That's why there's
> so many changes outside of the interrupt handler and so many additional
> members in the controller's private data structure.
>=20
> I hope that that at least makes some sense..
>=20
> > The driver
> > should do repeated start when it should do repeated start.
>=20
> Yup, that's what I'm trying to do here :)

I'd like to get this fix in, and Andi only had some minor comments that
didn't require a respin. I don't want to respin or resend while this
conversation remains unresolved.

Thanks,
Conor.

--hfVLrGzLBGvcsMsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxoVIQAKCRB4tDGHoIJi
0sT4AP4gyW2JC+ZvXZHXcGYN2FJ6YO7+hYJzdRLR+I/1VXj58QEAh9nOFblwYbJB
+cl/h8Md3RPx7N08+bDVx8LOeRrZJwY=
=F2Ka
-----END PGP SIGNATURE-----

--hfVLrGzLBGvcsMsZ--


--===============1449566024261500930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1449566024261500930==--

