Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0694BD2A52F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTWHX9+akLUPuoW53EVbfeYFffsEEM0hJMi+QZ48cTE=; b=rUqyzobKYIG2FgXy/9V0P2p1cq
	A9mRcAUUmV5vKPdI1wKPj5re3gMDuyaUT8N9ANbHkqj7irWwGqvY8tple+VDUrdRYXSaWrnCnb8so
	zde9sygnuia2Q1eKf+uQfP2SNYa+TL5ETVJr9LU/SG1O1gocit77qxk4fpkP7NeGagJLmDl+GIYfb
	CUHDLraGMAEfP+TASUCz3LjBj3e3wJVpkz1Z34LB6WWoEhuZz18Zp2EEZepgqraa4UctzFoytII5E
	Fk8iYVHxAEZ2I7wlYibL+OxRBfw5Q2xWmU7M8Ib/33yG/x1XfQ1mzzg/uz4PsvZSFKxMyqgXa45mF
	k7tYBBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t179F-0000000CSw0-35Ey;
	Wed, 16 Oct 2024 16:45:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t170b-0000000CRee-35X7
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 16:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA3385C5F16;
	Wed, 16 Oct 2024 16:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A9DC4CEC5;
	Wed, 16 Oct 2024 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729096584;
	bh=tEgVuItg9cKERlMvE79FjV7ymN+CZ6ZP2s9MIK145nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kb4jm9TV6i5pyRvbIxxFyJ36GfgAdlGlmUeIfkQchmXlTcTyC2z9w3lCBBynL2U5t
	 oR4Ss5dvNlX54np68CO6aHHro1SP1G1asBe9wNZY3OoYosxS7kQ4sqYDD0p2b7Tetx
	 uOmUV6wepZd0piOPbXFxmLE2a4wf2taN9BLkUMBcoZ6zp8Kl80OYGrBqzCsf3nrfSs
	 AmHdXvDKqgyqyyJXKJVce8y23bfxLER9G8bSmY7mG33JA6nHkiv+a8CoXNvylEuTLy
	 p1u9kaEBwPc2fvD2Z8jViCKBUYMAJxBUEPhn/WqaSZihaHCMccQellatM1kTCXBEhq
	 +w3smA0r9gRdw==
Date: Wed, 16 Oct 2024 17:36:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] firmware: microchip: auto-update: fix poll_complete()
 to not report spurious timeout errors
Message-ID: <20241016-abdomen-agent-4f24e0f68fbf@spud>
References: <20241016-slouching-excess-d7a62fc926a1@spud>
MIME-Version: 1.0
In-Reply-To: <20241016-slouching-excess-d7a62fc926a1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_093625_836637_8DC9B6A0 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Type: multipart/mixed; boundary="===============2728069721170009480=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2728069721170009480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PllR1fdHlubf9A7B"
Content-Disposition: inline


--PllR1fdHlubf9A7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 05:35:06PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> fw_upload's poll_complete() is really intended for use with
> asynchronous write() implementations - or at least those where the
> write() loop may terminate without the kernel yet being aware of whether
> or not the firmware upload has succeeded. For auto-update, write() is
> only ever called once and will only return when uploading has completed,
> be that by passing or failing. The core fw_upload code only calls
> poll_complete() after the final call to write() has returned.
>=20
> However, the poll_complete() implementation in the auto-update driver
> was written to expect poll_complete() to be called from another context,
> and it waits for a completion signalled from write(). Since
> poll_complete() is actually called from the same context, after the
> write() loop has terminated, wait_for_completion() never sees the
> completion get signalled and always times out, causing programming to
> always report a failing.
>=20
> Since write() is full synchronous, and its return value will indicate
> whether or not programming passed or failed, poll_complete() serves no
> purpose and can be cut down to simply return FW_UPLOAD_ERR_NONE.
>=20
> Fixes: ec5b0f1193ad4 ("firmware: microchip: add PolarFire SoC Auto Update=
 support")
> Reported-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

note to self
CC: stable@vger.kernel.org

--PllR1fdHlubf9A7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw/rhQAKCRB4tDGHoIJi
0miUAP9DZg+s4X9HStNvKpoT3C/o+qTS33CtyQ6GFiSOaEq8dgEAy7LnQJb1n9Kn
0KOH/EpfS+kx4vlKWk0/60nK48nH8wU=
=ZYWB
-----END PGP SIGNATURE-----

--PllR1fdHlubf9A7B--


--===============2728069721170009480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2728069721170009480==--

