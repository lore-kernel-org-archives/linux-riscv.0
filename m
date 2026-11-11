Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE5C606A336
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mc+1Wtt6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=xLL2XTZP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b/ctwiOKtiXdswnkRQPkLQERNn2JOD412EqH9gx5VWQ=; b=mc+1Wtt6onJ6u7nse5IvbfIxUo
	2EcXwRHN1IOMkDnOm+EA949N3KnzjzAuXbvHQSJA1BesqvDDjO/Ghu87TyliWV2J2Yjallx241K9Z
	rAM7uPmvjxci+hpTDcY+9jYuSeaUx4suQ6gmJMUqoH+Ctj7x+JnwSIt8yVtJL2B5uZQv7ki+2CXdV
	pPUil11GCTUBcmJEktzwfCk43JlehATXP+gBr9DAlszjsQwUndsenVfngAK2Nt0+YQRYmHzENnm0j
	1u7gygod4zh418Glhh8h1UnCeQL+KvAswA0oYRJf5eqXkD9Q03mcCc66oPaW1C+WO208/bMTdL2Bm
	qasC9DDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eb-00000006BXF-0OIZ;
	Wed, 11 Nov 2026 09:30:05 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eY-00000006BUi-1pC4
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=aCEmHAMMqjdgQujqmJ5VIUQOP6Jloh9KuH8qoIGfibw=; b=xLL2XTZPRMU0ZS9YR2uE9FHjdA
	GKPBXK8r8BVFfPnkLzjhMtkuLLTVTQjIL2eXUOMMJX1WYADn1eRRGzXVJj6z+oH+uXl4vLhrXqiP0
	fjGsUZWDVoyY/dpnWiYyTy8LXVMzsSfkCt33gLhpAi0Y/bCLgigZfUcyZvaNuYNSHLd7yjc9uHdxs
	QJV9wbOSeXbuedTVHuEMiKz05i3QOjvnr0oyca0zh30YSYi3WwmVZ6NzBMvbd+09wBxC3MmxMZ2Jc
	yFHPRNc6dZfr/YRIFaYTm720x01U86xJv9q1N2FW7r0biqs0bHP/uTu/zj7yu9W87HrpXMpPf1/30
	MAywDWDQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xR4eT-000000072xD-3EjV;
	Wed, 11 Nov 2026 10:29:57 +0100
Date: Wed, 11 Nov 2026 10:29:57 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
Message-ID: <avQ1kVTvdCmS1MxN@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Anand Moon <linux.amoon@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
 <20261110061429.2036-2-linux.amoon@gmail.com>
 <avOL1mCkI4YSaDeO@aurel32.net>
 <DMRZGMGRLD4S.KT6VEU28902E@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <DMRZGMGRLD4S.KT6VEU28902E@linux.spacemit.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_013002_556645_8519FC1E 
X-CRM114-Status: GOOD (  25.21  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andi Shyti <andi.shyti@kernel.org>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, Yixun Lan <dlan@kernel.org>, "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: multipart/mixed; boundary="===============7240547016235007224=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7240547016235007224==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXM73+j60MUUUff0"
Content-Disposition: inline

--cXM73+j60MUUUff0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Troy,

On 2026-11-11 01:16, Troy Mitchell wrote:
> Hi Aurelien,
>=20
> On Tue Nov 10, 2026 at 9:25 PM GMT, Aurelien Jarno wrote:
> > Hi Anand,
> >
> > On 2026-11-10 11:44, Anand Moon wrote:
> >> The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> >> to access the PMIC. However, these handlers run in an atomic notifier
> >> context (specifically within an rcu_read_lock() critical section), whi=
le
> >> the I2C-backed regmap uses a sleepable mutex.
> >>=20
> >> This triggers a "WARNING: suspicious RCU usage" warning due to an ille=
gal
> >> context switch in the RCU read-side critical section during shutdown o=
n the
> >> Banana Pi BPI-F3:
> >>=20
> >> [  563.803475] WARNING: suspicious RCU usage
> >> [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> >> [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch i=
n RCU read-side critical section!
> >> ...
> >> [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> >> [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{=
4:4}, at: __do_sys_reboot+0x230/0x29e
> >> [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: =
atomic_notifier_call_chain+0x4a/0x1c2
> >>=20
> >> Replace the regmap operations with atomic I2C transfers to avoid sleep=
ing
> >> in an atomic context. Preserve unrelated register bits through
> >> read-modify-write operations and check for atomic I2C support before
> >> registering the handlers.
> >>=20
> >> Obtain the I2C client from the parent device and verify that the adapt=
er
> >> supports atomic transfers before registering the handlers.
> >>=20
> >> Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> >
> > While the patch looks correct, I am not sure this is the correct=20
> > approach, as opposed to the one proposed by Troy [1].
> >
> > Indeed bypassing regmap and using i2c atomic transfers needs to be done=
=20
> > by all affected drivers. For instance the VisionFive 2 board, which use=
=20
> > an axp15060 PMIC is also affected by this issue. And the corresponding=
=20
> > driver is shared between architectures, which make this kind of change=
=20
> > more difficult.
> >
> > For the BPI-F3, note that with OpenSBI 1.9, the reboot is handled=20
> > through the SBI SRST extension, preventing this issue to happen. On the=
=20
> > long term, I am not sure we should keep this driver.
> >
> That only covers restart. The SBI restart handler is registered at
> priority 192 and runs before the P1 one at SYS_OFF_PRIO_DEFAULT. Power
> off is the other way around: sbi_srst_power_off() goes through
> register_platform_power_off(), i.e. SYS_OFF_PRIO_PLATFORM, so the P1
> power-off handler still runs first and still hits this on shutdown,
> even with OpenSBI 1.9.
>=20
> So until this driver goes away, BPI-F3 still needs the arch fix [1]
> for power-off.
>=20
> Link: https://lore.kernel.org/linux-riscv/20261104-v7-0-rc1-rv-dis-int-be=
fore-restart-v5-1-956ec09c900d@linux.dev/ [1]

We also need a more global fix for the other boards like the VisionFive=20
2, so definitely we need the above fix instead of patching the drivers.

Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

--cXM73+j60MUUUff0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUryGlb40+QrX1Ay4E4jA+JnoM2sFAmr0NZEACgkQE4jA+Jno
M2u3Qg//R7XKE2ZEnRyE8bC3iOSZzrxWB3pYbNEVMbzBcouE30nPamYF4V78RXNk
kYKdevhLqbQYTgzlT7P9oIiJIGh9eKpX1k0byeO8Z0GuyO5p+tCiY5fNKjlwU3Dg
leZKbyzfyAIs8yrm7YmjqrpDQHQauqcN1Io33GliLXUTHqQmGgV31/hm0pWchQij
XrCXLzN9Ll+6uQ3nIAQsSto47pPyN6NkQA97YokbAFBSqcSOdzcK+l10xH0lwbav
2X8rYHGVa8zFmGOzi4ewoShxatuvyZ2L/JvkXVOxHdgZdDUDSGmMJIVmiiTMukdG
6aLJoW4iPlmRQrjhlKkC6QkhN0ZmBRkl6gx09mhyHlDtaWwgSZLhm/lAMogp4ene
claRtwFpVUgjHvAgNDsixpgTSN+BPbfNGXhKfbB1X5D0bnQJMJWmZjZaQ/CUbkbF
104ZjNjOdsTVLg/Mct42AdMebeRh9s5NeyW56G51Mbj0sihanMG5WEv1XnqHh1a2
+3SSv2woHXIz/dtfNUQD6cvYbAoth3d4hrmOnxL3TPmM/Nha4nYaElrnS2RCfspY
EVXYksPEw7WZxz1oPy8VykYqrX9jgyoNdfa5LS1ZOTvrowGtqfuNqbRTWNLmaz2R
4hVeX0Rh03m9W8nwxIpBP4JwZtSoTPO4WOtELP5QAfLYjfZny4Y=
=i3nn
-----END PGP SIGNATURE-----

--cXM73+j60MUUUff0--


--===============7240547016235007224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7240547016235007224==--

