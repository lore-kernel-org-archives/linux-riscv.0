Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872D8E7716A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2024 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6IlaRkqVPhYdHZsZqaojHJi4WsEGT/IJUkqRcSdCsE=; b=izjT06zq/0Ln98a8ReOXh8/7wR
	UdAHe+Lfuvt3AmDug+p8PIgRfgYbUn53BZ9AP51DhyESLSyVSQyFX7uj+c1bRLtwLkCuHn7J6xrMO
	zxUxo4maCSfYROdennHJs+4hIRWhzfYIorlxIZQahXyCLrwlgMIcXkHS5QgLCyJEs69AHe4U2ELoE
	amUvu/hl+KIupX0KncaRKZY9lQmF+YKZd75873DsY1wu2GJ8O962dpbjxzY2Kvuveglqk6CQpNLq6
	EPGCnFbpR7XXMSIkjwj9YZKZjXV6Q2GOipU/nSz+0IuCfwQkCByxbRykFDjQwJkHWa8QSaslCpXfW
	F6iocBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMqAV-000000084Qt-2n07;
	Sun, 15 Dec 2024 15:04:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMqAT-000000084Q0-1CGz
	for linux-riscv@lists.infradead.org;
	Sun, 15 Dec 2024 15:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 994BF5C5866;
	Sun, 15 Dec 2024 15:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAEBC4CECE;
	Sun, 15 Dec 2024 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734275063;
	bh=B21t/+Jd24OqV24lEe0unWNkkQaLiMeKbtQvE7t0xgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1IHChdsmyUj2rHC1Sxe+lq/YC7/Qi1Clc8g+kIeAWhfWK70K3cbx6He8drDOw3Zo
	 FXYA+wLl38BI05tCza8iFiwJNCE9ag4IHxrpcfQQTvwFiMq8m5Xuo2CV3HNyHeytS1
	 zuzHzM05a+zK39w6VaesXQ9NbQo85ig8e75blj1lpMa34unnuo8JGd2kp1nv686B23
	 u0mGOVd9+f18d6BGYau4wZwpj9GpdBzHB7VmDZ1rGdDsL93omoIKhdH7PoMB9isdgF
	 G7N4AkSurDNP3/1kUgFFYjLDFnAXu4lU+cfu09LxKYWZwlZJwqt76hxCw3vqdjN6cF
	 8t9cZMAxXlWZQ==
Date: Sun, 15 Dec 2024 15:04:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cyy@cyyself.name,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	samuel.holland@sifive.com, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, lkundrak@v3.sk,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>,
	inochiama@outlook.com, zhangmeng.kevin@spacemit.com,
	jszhang@kernel.org, matthias.bgg@kernel.org, kevin.z.m@hotmail.com
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
Message-ID: <20241215-reward-nutlike-23f481fb1b75@spud>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
 <173395638199.1729195.1529576042123666894.git-patchwork-notify@kernel.org>
 <20241212101901-GYA2292414@gentoo>
MIME-Version: 1.0
In-Reply-To: <20241212101901-GYA2292414@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_070425_411266_ABC2435E 
X-CRM114-Status: GOOD (  21.71  )
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
Content-Type: multipart/mixed; boundary="===============4534064821554090306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4534064821554090306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/kpettwmxOSIqaPM"
Content-Disposition: inline


--/kpettwmxOSIqaPM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 06:19:01PM +0800, Yixun Lan wrote:
> Hi Conor:
>=20
> On 22:33 Wed 11 Dec     , patchwork-bot+linux-riscv@kernel.org wrote:
> > Hello:
> >=20
> > This series was applied to riscv/linux.git (fixes)
> > by Conor Dooley <conor.dooley@microchip.com>:
> >=20
> > On Tue, 30 Jul 2024 00:28:03 +0000 you wrote:
> > > SpacemiT K1 is an ideal chip for some new extension such as RISC-V Ve=
ctor
> > > 1.0 and Zicond evaluation now. Add initial support for it to allow mo=
re
> > > people to participate in building drivers to mainline for it.
> > >=20
> > > This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-B=
oot
> > > bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> > > Zicboz, which does not in the vendor dts on its U-Boot. Then successf=
ully
> > > booted to busybox on initrd with this log[3].
> > >=20
> > > [...]
> >=20
> > Here is the summary with links:
> >   - [v5,01/10] dt-bindings: vendor-prefixes: add spacemit
> >     https://git.kernel.org/riscv/c/7cf3e9bfc63d
> If I understand correctly, only patch [01/10] of this series was accepted
> to 6.13-rc1
>=20
> for the rest of patches, they would be expected to go through SpacemiT's
> SoC tree? which should I take care of them.. so if no objection, I'd like=
 to
> queue them at branch k1/dt-for-next [1] first, we might rebase or revert =
if
> something happens before merging (since the clock driver is still under r=
eview)
>=20
> Let me know what you think..

Sure. I had grabbed the first patch because a couple trees needed the
vendor prefix for peripheral drivers. How is the clock driver getting
on? Do you think it is close to being merged?

--/kpettwmxOSIqaPM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ17v8AAKCRB4tDGHoIJi
0iAdAP9HD4/Y0RNI7dVATy3fSwrhtkjS3S73FSLgbFoXrRzX3AEA13XuZem7fa3p
+XtYsKHNn/iYUJB1jXAY5GCnofTroAc=
=0rg/
-----END PGP SIGNATURE-----

--/kpettwmxOSIqaPM--


--===============4534064821554090306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4534064821554090306==--

