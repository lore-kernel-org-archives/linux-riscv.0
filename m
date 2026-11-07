Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCB606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IlAmvu35;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CYldCipq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W2QnEJfXIVRcQUax8V3erUxGjiTpv7HHej5rcuzj1u0=; b=IlAmvu35zkIatKJayY91iTFaHJ
	1WVoFeav53nILpURt/DAD40qD6ctYF8RGM1s600bENv4xJbHDdh3dOZ3odouhk15kxLXY6wGsRk0A
	tqTUw+4g5Eh884RnDGhKNqAFEBFdm3g8YhJm+178NpPFjFQe6sK+zZ2eK6fZbJrcty7KmzE0B/QkC
	z9PGa8P4j+jSPRd1/iXLlz+1cwq1Lmld+11QgiilxRKp6ZflkBhe9uDGvSpqt4yyLrAVZYYGqXEQE
	ot9zfISwlOY/Lvng0+nJ4HlDtzPg+XCY8Qp3wa9ySgGpKRETfPimhMhE4E9VIz0QuMuTcaoj6VBAE
	sqDiZpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgLa-0000000EieB-02d8;
	Sat, 07 Nov 2026 13:20:42 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgLW-0000000EidL-00X6
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 13:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794057586;
	bh=Vv1qxZPlk0vkh8L3xJUWyUVlD4vXJ4Gcl2ZuiOio4dw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=CYldCipq5BagZLXme6wuPePkCbHZaFQx6CDcKEdW3CR4GoNL/AHcndA1sl2gxuRe5
	 NJ1VEzr7H45Me1JjNlboBfvsFVZoD2cZB+MHP7MXQlBIfzmyTaqVhQ1sPOA91VOdbO
	 wj59PrxeUrFQcEH9SIbPo759rX5u7NxVELeGaA9E=
X-QQ-mid: zesmtpsz2t1794057585t8b0d7424
X-QQ-Originating-IP: MnVFJSGk3Q8VFD+XQqbWfmBpJkYvSe1EFIeqkTdJt6o=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Nov 2026 21:19:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9492300081805224949
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sat, 07 Nov 2026 13:19:39 +0000
Message-Id: <DMP0C29S8OJL.3SBBFOOCLLE1K@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sarah Emery" <sarah.emery@canonical.com>
In-Reply-To: <DMOZO92UHE9L.2PC9QE72225NX@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
 <79211469-cf77-414c-9a10-2b684833ad64@canonical.com>
 <DMOZO92UHE9L.2PC9QE72225NX@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MoXwJvxx3/NeGsNMvSMwpVo7aLjx1Sv3M8mz7j646crF2nfS6zJwTenu
	+vkimWHyBZ9kyjRnBsT6C8Af20T3IGqlreX3KVz6c/ghNLG/4xFdDY0cshLe7HNlyXP0rwB
	sbFqIMCDU3rTAtVp4cwIwa4Sz9+Mp5YXzVqnwAPeuhgG6NK87PD70OhLmkrGVChEP+Hidha
	xyTlKXC5pAtJNnfYAX9ajCQdD+GiYIJZ4mJqA01rYWyyEX/Q9fbZ0etAQd5HMBWdKywDMID
	Zvg3j31MwvcBmFRLNp6wTM0TGNEmXBrbu4c907/Y9/LbUTbuIJd+9CHQv27AVdxiE0odkmT
	7WAv3PaWFCF22xdQoz2eN+dipjK3tGLedDRd8TdPLXfZU7LuU8Z0Gc7HzqBkOsluYqb5t2i
	tntFTmm+sMuQLqf7ENpflxX3stdWJMVpPdS6dTUyEm+cKKNGHI7MWhKeNQx8Rh1E06rWmMI
	YLobE78gzcw6bf9s4/HJlNDr7r8ZvrQX9bnGc1jBvs2P5PzXq4OrYwwscJgsVJz3CoLOA6j
	zaHZvXfaCOhCPVy+J0xWK7I0Tp73qvljGhVS5ZXPbd2F3V4TcigTXMZNDBouhjdE9hfLHqK
	RDvwEq6V+JRJBszLGNRokPLizX0BRcy5LLzpRsGMFMTMlifocvnZ8+yXka5kJ0maYgwaZvA
	51BkCVkaEylc6bjEoyggH64YBAlSLgN28vB5Pig5G2LpK1BThoGC0F3PogztaX01kHb1Lqj
	9cMBvGBAx8KISoL6+WRoXXhVq9f9M7DIU0GrS2kCcXiKgPkn5Rs1WUSWU40uNK4bvwy4FaR
	7tTisQ2spV3tvcyhU/vDhnrinpSIYWtx53OXbtRIPgAbNZdZZEVcN7JW67YAmzhLJiV5gVk
	Nbn3pS7wA+OynD5ybaIUXwYQ7w34WSZhrxgC4uyQa11wh+g95UhUVYxMtEHfFWgY1Zo1cbD
	hidkx5yTLUmWO6hKimOVLROm5LKzSV9537zmRX1bLweNk8/KJLsRxd8zxEE1D7Qautl5LIj
	JsyFQfv6M/NzGYsfeoUzwi0MXuM5KrV2Zi6ncQ5ZhI8OlVYILZR/xe4rtQMXgvGlkOal5Eh
	G9rRfTRLG8dsqHBQbEtA3U=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_052038_810819_9AB7FCA9 
X-CRM114-Status: GOOD (  19.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7822561554024878426=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7822561554024878426==
Content-Type: multipart/signed;
 boundary=cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat, 07 Nov 2026 12:48:33 +0000, Troy Mitchell wrote:
> On Fri, 6 Nov 2026 17:25:48 +0100, Sarah Emery wrote:
> > > +			uboot@210000 {
> > > +				reg =3D <0x210000 0x5f0000>;
> > > +			};
> >
> > This partition ends at 0x800000. On the CoM260 with EDK2,
> > 0x700000 to 0x7c0000 holds the variable store (NVRAM and FTW), so
> > reflashing this partition from Linux would erase it.
> >
> > I think we could split it like this:
> >
> >     uboot@210000 {
> >        reg =3D <0x210000 0x4f0000>;
> >     };
> >
> >     var@700000 {
> >        reg =3D <0x700000 0xc0000>;
> >        read-only;
> >     };
> >
> > What do you think?
>
> The layout here is the one used by the SpacemiT boot firmware for K3,
> where U-Boot owns everything from 0x210000 to the end of the flash.
> The EDK2 that SpacemiT ships for K3 (including the CoM260
> configurations) keeps its variables in memory and does not use the
> flash for them, so it has nothing at 0x700000.
>
> Which EDK2 build places the variable store at 0x700000?
Sorry, I checked an outdated EDK2 tree. The current SpacemiT EDK2 for
K3 does store the variables in flash, in a separate region pinned at
0x700000 with size 0xc0000, and the firmware image itself goes at
0x210000. So you are right, and I'll split the partition the way you
suggested in v2.

> > The Pico-ITX node also uses 0x5f0000, but I think it should be
> > modified to split out the var part too if it makes sense here.
>
> Same answer as above.
For Pico-ITX, the same layout applies, so its DTS should get the same
split in a separate patch.

--=20
Troy Mitchell

--cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau8layEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8mjAEAgs2JcthFsP1D
X0CRVNci79azmcIjmw43lI/q3Mp1We4BAJiF7dDYWSszpFNzPWE068epMe+unJfn
VBoMajSNo8cN
=FnAV
-----END PGP SIGNATURE-----

--cd90495969691536a859394151b1932e9ba645d5efb1309eed502dd53e7b--


--===============7822561554024878426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7822561554024878426==--

