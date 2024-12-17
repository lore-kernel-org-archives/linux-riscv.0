Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B779E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbbrAJ75+KoDlhrVn7EBgdjDaH965sk+s8kdw3Zz06I=; b=ualbWc3Q4rYR+s/Vc+O+BOixtC
	8a1MjdOGdZH51+HLEvaDMUiVyW6uhB3wfMdxl385KBhu+TGtANwCdrPjE1spOqfhxEItLlYxWFZMT
	yuvfovzj7zWV1evnL7hJOr2cIv9Trs9yLgMyl56T1s6fHJj7f0LIbVmfqFmVzXpgo1HiI4XCLXLgr
	Hl0UZ5DfZXiRcORXD4KdkNySqZ9AgJCJXxIdZzobVpm8y+RxWYiJunbM4MOMCA8pmt7Gmjs32wj6S
	4RNgHclFqSBCACcfTlr3qTwuNemSSrL8GljkxiIDUQioe2SfHFGJYEg1MUB8UJw3zcCKBLS/5axXb
	m3Gc3P+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcQH-0000000EZ3Q-3M54;
	Tue, 17 Dec 2024 18:35:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcQF-0000000EZ2n-2EV3
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 18:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 075A5A41F53;
	Tue, 17 Dec 2024 18:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1C9C4CED3;
	Tue, 17 Dec 2024 18:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734460554;
	bh=wij3ElUa0/t3wfliWgMTifTt8iMGWm7a+SOOKMXIXNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlulLJMh7uD/z5Bv/s64cWLcn4AdlXLVoDizkhGmkydmJedP+Ie8Q6zNYJyCvwqjX
	 7LCnMk9VXAoEp4cHtL06Bf7x0n4MpbyQOT+VTU6ZagXQL06IgNXpZ+f2bI8uiqB/8v
	 J0d6U3Ppxj4j2DoOuL2F61tYCrJ1XoqyH7D7H2vR62k+Mx2vn+WJ6FkTgPJxFk+HBp
	 kCtMzlpJfj3HJxkQ8j9NHpQ1b6YnQ7iKAScVCaOqv2WLny05xxj3ySFXk76ji87vgf
	 gnj5n7ZZ4NbQ7cAqEXAkXzTjQ4mQturl97evBfdnO5WDsBPmp8C+uflhClLNy4usxq
	 SYNhbiMsui3aQ==
Date: Tue, 17 Dec 2024 18:35:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241217-probe-snowdrift-9c4b9521a2e9@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <Zvu38H2Y-pRryFFQ@shikoro>
 <20241001-haphazard-fineness-ac536ff4ae96@spud>
 <20241024-snagged-elated-d168d0d6bf35@spud>
 <20241206-random-spectacle-9de88d412653@spud>
MIME-Version: 1.0
In-Reply-To: <20241206-random-spectacle-9de88d412653@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_103555_705354_447D3BB0 
X-CRM114-Status: GOOD (  60.48  )
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
Content-Type: multipart/mixed; boundary="===============8010172725200325053=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8010172725200325053==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3ncXWw6MCTEpEL92"
Content-Disposition: inline


--3ncXWw6MCTEpEL92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Andi, Wolfram,

I'm just going to resend this tomorrow, it's 2.5 months since this
conversation started and I'd really like to get this fix included.

Cheers,
conor.

On Fri, Dec 06, 2024 at 11:48:07AM +0000, Conor Dooley wrote:
> On Thu, Oct 24, 2024 at 10:36:33AM +0100, Conor Dooley wrote:
> > On Tue, Oct 01, 2024 at 11:16:24AM +0100, Conor Dooley wrote:
> > > On Tue, Oct 01, 2024 at 10:50:56AM +0200, Wolfram Sang wrote:
> > > > > At present, where repeated sends are intended to be used, the
> > > > > i2c-microchip-core driver sends a stop followed by a start. Lots =
of i2c
> > > >=20
> > > > Oh, this is wrong. Was this just overlooked or was maybe older hard=
ware
> > > > not able to generated correct repeated-starts?
> > >=20
> > > Overlooked, because the devices that had been used until recently did=
n't
> > > care about whether they got a repeated start or stop + start. The bare
> > > metal driver upon which the Linux one was originally based had a triv=
ial
> > > time of supporting repeated starts because it only allows specific so=
rts
> > > of transfers. I kinda doubt you care, but the bare metal implementati=
on
> > > is here:
> > > https://github.com/polarfire-soc/polarfire-soc-bare-metal-library/blo=
b/614a67abb3023ba47ea6d1b8d7b9a9997353e007/src/platform/drivers/mss/mss_i2c=
/mss_i2c.c#L737
> > >=20
> > > It just must have been missed that the bare metal method was not repl=
aced.
> > >=20
> > > > > devices must not malfunction in the face of this behaviour, becau=
se the
> > > > > driver has operated like this for years! Try to keep track of whe=
ther or
> > > > > not a repeated send is required, and suppress sending a stop in t=
hese
> > > > > cases.
> > > >=20
> > > > ? I don't get that argument. If the driver is expected to do a repe=
ated
> > > > start, it should do a repeated start. If it didn't, it was a bug an=
d you
> > > > were lucky that the targets could handle this. Because most control=
lers
> > > > can do repeated starts correctly, we can also argue that this works=
 for
> > > > most targets for years. In the unlikely event that a target fails a=
fter
> > > > converting this driver to proper repeated starts, the target is bug=
gy
> > > > and needs fixing. It would not work with the majority of other
> > > > controllers this way.
> > > >=20
> > > > I didn't look at the code but reading "keeping track whether rep st=
art
> > > > is required" looks wrong from a high level perspective.
> > >=20
> > > I think if you had looked at the code, you'd (hopefully) understand w=
hat
> > > I meant w.r.t. tracking that.
> > > The design of this IP is pretty old, and intended for use with other
> > > logic implemented in FPGA fabric where each interrupt generated by
> > > the core would be the stimulus for the state machine controlling it to
> > > transition state. Cos of that, when controlling it from software, the
> > > interrupt handler assumes the role of that state machine. When I talk
> > > about tracking whether or not a repeated send is required, that's
> > > whether or not a particular message in a transfer requires it, not
> > > whether or not the target device requires them or not.
> > >=20
> > > Currently the driver operates by iterating over a list of messages in=
 a
> > > transfer, and calling send() for each one, and then effectively "loop=
ing"
> > > in the interrupt handler until the message has been sent. By looking =
at
> > > the current code, you can see that the completion's "lifecycle" match=
es
> > > that. Currently, at the end of each message being sent
> > > 	static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *=
idev)
> > > 	{
> > > =09
> > > 		<snip>
> > > =09
> > > 		/* On the last byte to be transmitted, send STOP */
> > > 		if (last_byte)
> > > 			mchp_corei2c_stop(idev);
> > > =09
> > > 		if (last_byte || finished)
> > > 			complete(&idev->msg_complete);
> > > =09
> > > 		return IRQ_HANDLED;
> > > 	}
> > > a stop is put on the bus, unless !last_byte, which is only true in er=
ror
> > > cases. Clearly I don't need to explain why that is a problem to you...
> > > You'd think that we could do something like moving the stop out of the
> > > interrupt handler, and to the loop in mchp_corei2c_xfer(), where we h=
ave
> > > access to the transfer's message list and can check if a stop should =
be
> > > sent or not - that's not really possible with the hardware we have.
> > >=20
> > > When the interrupt handler completes, it clears the interrupt bit in =
the
> > > IP, as you might expect. The controller IP uses that as the trigger to
> > > transition state in its state machine, which is detailed in
> > > https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/Produ=
ctDocuments/UserGuides/ip_cores/directcores/CoreI2C_HB.pdf
> > > On page 23, row 0x28, you can see the case that (IIRC) is the
> > > problematic one. It is impossible to leave this state without trigger=
ing
> > > some sort of action.
> > > The only way that I could see to make this work correctly was to get =
the
> > > driver track whether or not the next message required a repeated star=
t or
> > > not, so as to transition out of state 0x28 correctly.
> > >=20
> > > Unfortunately, then the clearing of the interrupt bit causing state
> > > transitions kicked in again - after sending a repeated start, it will
> > > immediately attempt to act (see state 0x10 on page 23). Without
> > > reworking the driver to send entire transfers "in one go" (where the
> > > completion is that of the transfer rather than the message as it
> > > currently is) the controller will re-send the last target address +
> > > read/write command it sent, instead of the next one. That's why there=
's
> > > so many changes outside of the interrupt handler and so many addition=
al
> > > members in the controller's private data structure.
> > >=20
> > > I hope that that at least makes some sense..
> > >=20
> > > > The driver
> > > > should do repeated start when it should do repeated start.
> > >=20
> > > Yup, that's what I'm trying to do here :)
> >=20
> > I'd like to get this fix in, and Andi only had some minor comments that
> > didn't require a respin. I don't want to respin or resend while this
> > conversation remains unresolved.
>=20
> Could you please respond to this thread? I don't want to respin without
> resolving this conversation since I feel like we'd just end up having it
> all over again.
>=20
> Thanks,
> Conor.



--3ncXWw6MCTEpEL92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HEhgAKCRB4tDGHoIJi
0hl1APwIXHwW10oO02kRxqmh1W9UKke1PozdqDAxCsWRAp3rBAEAhxSip2syQmVz
jpckourpupLAWwSnWwmUvxrNNWuLtA4=
=jCFQ
-----END PGP SIGNATURE-----

--3ncXWw6MCTEpEL92--


--===============8010172725200325053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8010172725200325053==--

