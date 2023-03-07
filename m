Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B91C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C093aDslCu00y7vUOXGkveA494kloqpYiOHi5t85DUo=; b=cDMbOjPVXKQsoeWdBG2KHGmXVb
	7hbWSiYKE5jnglLF/A+l4Ixhaf5jd43TbLx5HStouhu6qTuceUT6o348Fzpbcq2y/n6N8m0vuSDK1
	1zTTf9A6qzidWLwgdS85eMSt2cUUWIj1juXwluL6dVvtpGBTCx0qpXnPPc75cT1ZcQA3xtof2BKSZ
	6dYYfdqOVz5BXMHAhn06Aq67NbdznD158uDEhdkmGRSq3RX/9eHYnLWCWLrgkta4sj6Ir7B555VJD
	WLug8coD2KK+oX+XqDBfnlzLfiay4KU/mYMpiyJTJ5SU0N/SjTkSpl9JyxVE/nj5pljNGuE0CnWHS
	RWuiCc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdxH-002NsO-ML; Tue, 07 Mar 2023 20:30:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdxE-002Nrm-4Q
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:30:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 796A661574;
	Tue,  7 Mar 2023 20:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E7AC43443;
	Tue,  7 Mar 2023 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678221035;
	bh=ZAdGPhIZbPYpk5nafNPWCk6LqG232yQGxd7U/0Ah/CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMEkGGFnMFrwvFPsetw3iDXplT+zODW7WcvIT5dNbJNfJvw/qvDh+duJkdzZtXxpl
	 XClPq8oInJE6IDn6bLP72+0mpVupJhUNWiKvcBi9HzNNI7bFeDKzPLPzZLGELG9LV+
	 hp7OnXL7uhCq3F0wh1ZjGilg1hHzxwmSFVCIpM9rZEKbjPPzSP/ZiRiym0nkYTRgEf
	 677qq3PkHm7R6S4zcXoEbiPGsqzCca6EKf7EPyUtLUuhNW4zQDRtZF1IZN/kX6zfQt
	 rIyjM6U5x7kBkfFuE58ApF6hQkJgLe7cgyRGiLf+t+tyI2+uNHImutCdWNBvt7f3Ny
	 1+rKfPpgcValw==
Date: Tue, 7 Mar 2023 20:30:31 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
Subject: mailbox,soc: mpfs: add support for fallible services (was [PATCH v3
 0/8] Hey Jassi, all,)
Message-ID: <d7c3ec51-8493-444a-bdec-2a30b0a15bdc@spud>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_123036_277496_457A4E4A 
X-CRM114-Status: GOOD (  38.59  )
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
Content-Type: multipart/mixed; boundary="===============4391779420489692087=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4391779420489692087==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qeOVstxuNHgmCn60"
Content-Disposition: inline


--qeOVstxuNHgmCn60
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 08:22:50PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>

I botched $subject, I blame copy pasting the branch-description from
lore and not double checking the output of --cover-from-description=3Dauto

This should be a more suitable one... /sigh

>=20
> Here are some fixes for the system controller on PolarFire SoC that I
> ran into while implementing support for using the system controller to
> re-program the FPGA. A few are just minor bits that I fixed in passing,
> but the bulk of the patchset is changes to how the mailbox figures out
> if a "service" has completed.
>=20
> Prior to implementing this particular functionality, the services
> requested from the system controller, via its mailbox interface, always
> triggered an interrupt when the system controller was finished with
> the service.
>=20
> Unfortunately some of the services used to validate the FPGA images
> before programming them do not trigger an interrupt if they fail.
> For example, the service that checks whether an FPGA image is actually
> a newer version than what is already programmed, does not trigger an
> interrupt, unless the image is actually newer than the one currently
> programmed. If it has an earlier version, no interrupt is triggered
> and a status is set in the system controller's status register to
> signify the reason for the failure.
>=20
> In order to differentiate between the service succeeding & the system
> controller being inoperative or otherwise unable to function, I had to
> switch the controller to poll a busy bit in the system controller's
> registers to see if it has completed a service.
> This makes sense anyway, as the interrupt corresponds to "data ready"
> rather than "tx done", so I have changed the mailbox controller driver
> to do that & left the interrupt solely for signalling data ready.
> It just so happened that all of the services that I had worked with and
> tested up to this point were "infallible" & did not set a status, so the
> particular code paths were never tested.
>=20
> Jassi, the mailbox and soc patches depend on each other, as the change
> in what the interrupt is used for requires changing the client driver's
> behaviour too, as mbox_send_message() will now return when the system
> controller is no longer busy rather than when the data is ready.
> I'm happy to send the lot via the soc tree with your Ack and/or reivew,
> if that also works you?
> I've got some other bits that I'd like to change in the client driver,
> so via the soc tree would suit me better.
>=20
> Thanks,
> Conor.
>=20
> Changes in v3:
> - check the service status in the .tx_done() callback rather than
>   mpfs_mbox_rx_data()
> - re-order the if/else bits in mpfs_blocking_transaction() to please my
>   eyes a bit more
> - expand on the comment in same
>=20
> Changes in v2:
> - up the timeout to 30 seconds, as required for services like image
>   validation, which may vary significantly in execution time
> - fixed a typo!
>=20
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Jassi Brar <jassisinghbrar@gmail.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
>=20
> Conor Dooley (8):
>   mailbox: mpfs: fix an incorrect mask width
>   mailbox: mpfs: switch to txdone_poll
>   mailbox: mpfs: ditch a useless busy check
>   mailbox: mpfs: check the service status in .tx_done()
>   soc: microchip: mpfs: fix some horrible alignment
>   soc: microchip: mpfs: use a consistent completion timeout
>   soc: microchip: mpfs: simplify error handling in
>     mpfs_blocking_transaction()
>   soc: microchip: mpfs: handle timeouts and failed services differently
>=20
>  drivers/mailbox/mailbox-mpfs.c              | 55 ++++++++++++---------
>  drivers/soc/microchip/mpfs-sys-controller.c | 52 +++++++++++++------
>  2 files changed, 67 insertions(+), 40 deletions(-)
>=20
> --=20
> 2.39.2
>=20

--qeOVstxuNHgmCn60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAee5wAKCRB4tDGHoIJi
0qsiAQD3OhSRQ6pKImL+lWjsXKSZfn7qf7pAK1hH5D7PtKD5YQD/fgPmA568Cp3p
kfE7dcgTCRvZpl2/woDJc+iIDy/8uQo=
=KGcZ
-----END PGP SIGNATURE-----

--qeOVstxuNHgmCn60--


--===============4391779420489692087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4391779420489692087==--

