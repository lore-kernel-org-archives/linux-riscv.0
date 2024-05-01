Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD914C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Ied0hdZRY7MUfYLQiXdGp4SV+CbqJ7B0zXc9LnhHbuc=; b=Wm5
	OgkMF6OiW/5tv4zIs4Fvmpqbf/ehf9Dh3yVBZbh5hDwi7/hsmA9n5O6KMnR41mlAJHuKGi7bGO1CR
	zBfvOHZNUHYz4rUU2ETwaLmnaZhYCdGbW3C+aIIl9v9MgmgdiOq12TFY4Fo4bksPFjj0LERlK9kgz
	TO70N99UHqbvNfWZQ5pnb7dqzE9m+9cfiXXgyhvELUvYfnRxWWC0w6NijrryzFrqZTB8oWQ3kMPMI
	kdsOOrUZur3Zn76niXQ5ioU2S3NOky14o6wfP95+FpbQtzyT7dNoMkYyVEJqJcczXH1CkVS5U+ZEl
	VJEaBKD2wOjY5x4/ILqHnLRBSHIe3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26Zk-000000091Z6-0309;
	Wed, 01 May 2024 09:48:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26Za-000000091YP-2w84
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 09:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE290CE11D9
	for <linux-riscv@lists.infradead.org>; Wed,  1 May 2024 09:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C429C113CC
	for <linux-riscv@lists.infradead.org>; Wed,  1 May 2024 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714556900;
	bh=FT5WDqvt6RZ+IHJZHgtlzzdZIKMyom5Iko0Q4rBX0Jo=;
	h=Date:From:To:Subject:From;
	b=V1QeKh+injrQ98frIxyZRBKmpmgXMzm8i3mha+WoAA3TnI0bcc6AWDEtJDr4njxrm
	 dirBwCl9yS/F9tq2VHkTUdNtMV4MJdphvIe+HTPlOrzEhJD8U9kwSfrMzV4ceRl43e
	 xOM7jqqAujm2Ne41Z6AYazX+15K40y793NR/2vSbAUOqn9XiZCiM2wnGmZKSancmCI
	 qJAGjIqFpAOsOd9Kuxzu+OZLcmcxgd1cfwxirEoxpfob0oGYwaPUzdIP8Vfew0raOa
	 Zx/3WKBZTLUEDP3AlvqiK+D30c+q+v/z1xCZJRBT5YP1d2bvLMcMgfFJaeglbgdEGh
	 plS4eq4fBLwJw==
Date: Wed, 1 May 2024 10:48:17 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: weekly riscv patchwork sync call
Message-ID: <20240501-profile-chest-487e31ef3cc8@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_024822_947874_E6A97011 
X-CRM114-Status: UNSURE (   6.47  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1258964099797790948=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1258964099797790948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3IbHyQFDL9q7AqaW"
Content-Disposition: inline


--3IbHyQFDL9q7AqaW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

Just a reminder, in case there's people that would come but are unaware,
that there's a weekly "patchwork sync" call for riscv kernel stuff on
Wednesdays:

linux-riscv Patchwork Sync
Wednesday, 1 May =C2=B7 15:00 =E2=80=93 16:00
Time zone: Europe/Dublin
Video call link: https://meet.google.com/thw-qojt-pbv

Mostly it's an opportunity to ping some stalled patch or to draw more
attention to an issue that may be buried in some thread.

Cheers,
Conor.

--3IbHyQFDL9q7AqaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIP4QAKCRB4tDGHoIJi
0i4bAQC4oxFqQDltDv0PdNKlCZQl8Y48reJaZYQ70Uognzpw2gEA0s2MMtORN9j5
vyNmAgmfGjEWdOsTxhUQZTKvHYXC0gA=
=YKVO
-----END PGP SIGNATURE-----

--3IbHyQFDL9q7AqaW--


--===============1258964099797790948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1258964099797790948==--

