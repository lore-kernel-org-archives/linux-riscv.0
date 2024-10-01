Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527ECE7D08
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N16nCVZXNGr2pWjDO4NNGdEqCS+1D6uzrtNv4KRoZCs=; b=n4aWCTxSbSzaPqs25BHY2Y++DJ
	OhApV/ot6OWDExdwre754Fl63nvT9RbGQQqBkX7dh51ADeIXooeTiS+ZSGOvm7vbDXmkz0fncYLGw
	jooZ/GyMda+5PM0phUOjYd1kyRNcOGTD/acpL8PWQjlpzXJkFrITnewmyhvvb27YO+HbuEwkuco/0
	TXRIfkYd6VjMO+uIiPCGlw/ZUM67Xh6ODwvSGme86JHOvZ1gB8A2rDcrxz8SyyvX2nFmQjark5Rf8
	upLc0/4n+pa4O8iaiQ9IiUPtWabcRLgu4/MsMObujl3qT5b5f9BJXuvgp8UX9E+F+gE6leaeZnE2u
	DwsbMLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZvk-00000002K3K-1ge1;
	Tue, 01 Oct 2024 10:16:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZvh-00000002K2v-1pM4
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 10:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 974A65C0F7B;
	Tue,  1 Oct 2024 10:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E26DC4CEC6;
	Tue,  1 Oct 2024 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727777788;
	bh=YQx7FeRcu9P6Be4U/Hjhs4f/myEgGAkd2TSGzXQlQEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhDVwrJCyJ4XMpJIrkjH7E4Vy3XUelLRLUXyqh+IgOP3aApVoJZYM7kSOas1YrHl6
	 cO9tNN7YiO7l9Srm+TWTl0Y+AcgakW/ZSYWKgwU4TO4cgb00FsjTafZMiKwX7j/m8Q
	 Sk0XXB52xzC4iCAwdNKOtrGbZX15kRHGh5p+DMZtfINestzKIOgWqrKf2qm4//ZBIl
	 dUjUhlDkqdo0snXUGr/89oR6Gqc30Lm+ZnR3Ee/QPOOBLEvC1BUssE3WrsXgMR+lhk
	 4ljiE8/f+csi4oKfp6FtgwIVw/eNP3QtpXIY/kEJFe5T3P8LIxRl6EPWELGtXYRyyL
	 rpN2+RQonUMYg==
Date: Tue, 1 Oct 2024 11:16:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241001-haphazard-fineness-ac536ff4ae96@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <Zvu38H2Y-pRryFFQ@shikoro>
MIME-Version: 1.0
In-Reply-To: <Zvu38H2Y-pRryFFQ@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031629_585976_055A9FDA 
X-CRM114-Status: GOOD (  36.30  )
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
Content-Type: multipart/mixed; boundary="===============0539456101229835875=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0539456101229835875==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pyVrSTv7wMWn+iPE"
Content-Disposition: inline


--pyVrSTv7wMWn+iPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 10:50:56AM +0200, Wolfram Sang wrote:
> > At present, where repeated sends are intended to be used, the
> > i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
>=20
> Oh, this is wrong. Was this just overlooked or was maybe older hardware
> not able to generated correct repeated-starts?

Overlooked, because the devices that had been used until recently didn't
care about whether they got a repeated start or stop + start. The bare
metal driver upon which the Linux one was originally based had a trivial
time of supporting repeated starts because it only allows specific sorts
of transfers. I kinda doubt you care, but the bare metal implementation
is here:
https://github.com/polarfire-soc/polarfire-soc-bare-metal-library/blob/614a=
67abb3023ba47ea6d1b8d7b9a9997353e007/src/platform/drivers/mss/mss_i2c/mss_i=
2c.c#L737

It just must have been missed that the bare metal method was not replaced.

> > devices must not malfunction in the face of this behaviour, because the
> > driver has operated like this for years! Try to keep track of whether or
> > not a repeated send is required, and suppress sending a stop in these
> > cases.
>=20
> ? I don't get that argument. If the driver is expected to do a repeated
> start, it should do a repeated start. If it didn't, it was a bug and you
> were lucky that the targets could handle this. Because most controllers
> can do repeated starts correctly, we can also argue that this works for
> most targets for years. In the unlikely event that a target fails after
> converting this driver to proper repeated starts, the target is buggy
> and needs fixing. It would not work with the majority of other
> controllers this way.
>=20
> I didn't look at the code but reading "keeping track whether rep start
> is required" looks wrong from a high level perspective.

I think if you had looked at the code, you'd (hopefully) understand what
I meant w.r.t. tracking that.
The design of this IP is pretty old, and intended for use with other
logic implemented in FPGA fabric where each interrupt generated by
the core would be the stimulus for the state machine controlling it to
transition state. Cos of that, when controlling it from software, the
interrupt handler assumes the role of that state machine. When I talk
about tracking whether or not a repeated send is required, that's
whether or not a particular message in a transfer requires it, not
whether or not the target device requires them or not.

Currently the driver operates by iterating over a list of messages in a
transfer, and calling send() for each one, and then effectively "looping"
in the interrupt handler until the message has been sent. By looking at
the current code, you can see that the completion's "lifecycle" matches
that. Currently, at the end of each message being sent
	static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
	{
=09
		<snip>
=09
		/* On the last byte to be transmitted, send STOP */
		if (last_byte)
			mchp_corei2c_stop(idev);
=09
		if (last_byte || finished)
			complete(&idev->msg_complete);
=09
		return IRQ_HANDLED;
	}
a stop is put on the bus, unless !last_byte, which is only true in error
cases. Clearly I don't need to explain why that is a problem to you...
You'd think that we could do something like moving the stop out of the
interrupt handler, and to the loop in mchp_corei2c_xfer(), where we have
access to the transfer's message list and can check if a stop should be
sent or not - that's not really possible with the hardware we have.

When the interrupt handler completes, it clears the interrupt bit in the
IP, as you might expect. The controller IP uses that as the trigger to
transition state in its state machine, which is detailed in
https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocu=
ments/UserGuides/ip_cores/directcores/CoreI2C_HB.pdf
On page 23, row 0x28, you can see the case that (IIRC) is the
problematic one. It is impossible to leave this state without triggering
some sort of action.
The only way that I could see to make this work correctly was to get the
driver track whether or not the next message required a repeated start or
not, so as to transition out of state 0x28 correctly.

Unfortunately, then the clearing of the interrupt bit causing state
transitions kicked in again - after sending a repeated start, it will
immediately attempt to act (see state 0x10 on page 23). Without
reworking the driver to send entire transfers "in one go" (where the
completion is that of the transfer rather than the message as it
currently is) the controller will re-send the last target address +
read/write command it sent, instead of the next one. That's why there's
so many changes outside of the interrupt handler and so many additional
members in the controller's private data structure.

I hope that that at least makes some sense..

> The driver
> should do repeated start when it should do repeated start.

Yup, that's what I'm trying to do here :)

--pyVrSTv7wMWn+iPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvvL+AAKCRB4tDGHoIJi
0mOnAP4+xs5yL6wkcBkpOyCc5Vy7umDFIYydMTIrHO0f3pSOrAD/b1UltiYEXah9
hTtHzrc/2bswOIFDFP4AIzr6rgqLMAs=
=dDbX
-----END PGP SIGNATURE-----

--pyVrSTv7wMWn+iPE--


--===============0539456101229835875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0539456101229835875==--

