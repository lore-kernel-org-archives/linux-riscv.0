Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2A6606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dw1333lY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NdgnQtfW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7+U4TRUXIXtGTMxYWDwkvlzVGNxakzS52hUUb/wgeZk=; b=dw1333lYKtRCk7b0hM13IU7V/Q
	9mZcDp8P1JWXAYwHsHCBS/xix8t/riW/bhgf6hfK962xL6SNDw62p/P7HjQMS6NqGepSGRtf5j2F/
	dakfNiNbnyjFuqGrz6d4+KJl3rhnWYYie914lacJUL85w6wWZFX8m546CNPRzFI/Bg4eYeir7P15/
	bKXbm/uDyZ0rwcZmFVj1Ohmuj9nds8VP10gQjXNkpyqiw4+SQx7h5jYHnn8UUvSfLtZ2AnPz9MfT7
	eh/OTUVD/RkCD78qlGGLSZq52oFAhwk1B4xSHpQSwQT9Mb+KT35dxei33/aNTse5yL7hGs/Lap+eO
	GERsY+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAnh-0000000BB0u-2TNl;
	Fri, 06 Nov 2026 03:39:37 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAnb-0000000BB0O-38Bz
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 03:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793936358;
	bh=YWjCVMH6QOR8U1HdP5g2Ap2iHKmTUMycrvWqvC+OZSg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NdgnQtfWQTdDDLxkFVmyZenAyc2QFWutEtKY0BPTYdVsReEfuLs6n6HfLluLvXXlF
	 2pJUBmMf1oyVBznkOa4Xwuld6C7+vfbTQBhDrNNOH2Gi5VxUUxExHJfcaEAfXXJree
	 G95gYU4uFb6TEW6BRxQSSOpLKKGcnX5Vu0N4N6Ec=
X-QQ-mid: esmtpgz13t1793936357t36e91489
X-QQ-Originating-IP: C3yEeWDAIm4PyjGi5UJr3LByUX02//lzDscXXGL1zXk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 11:39:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9883087005053734820
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 06 Nov 2026 03:39:13 +0000
Message-Id: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Emil Renner Berthing" <emil.renner.berthing@canonical.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <docular.xu@gmail.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NHLGb615Ee/ro7mEPxFyPT/euJjKyX5DrkSw9FAZqTBtDcM7sc8I3DMu
	AE1/DV7bgQpR3g++m0bMtvu6v5lFl4fUFHssGtqnaRtVWEPfOJmIQIbc7y25gSDrSYE+VUf
	Og9huuxlj/WC9a51hQaiowE6fqHYA6S/tVQxiZvDclUWoIDM9hO12Y/Q0P4G1Yz7/6tX6jf
	a96E7bRck+x3YLEL+Cpz0s/RcI6uyqKR4sIS1T+2+9OHY5FSJG5nYZMfmYrmmIrkF1YROAS
	JOsRH3kOt9/OUoYaGVtg+69G0xWCvfJ19ZN+gDELXlr/MIyawGe887xvX7u+Bu4y3BJN5Be
	z07ST+UrPOm4mqMxc0PyQjJ9t+zcN4idxYDmm/BGRHInolOk4SECT5I9mfflhu7fKq5xzzp
	IlIvkbBTFKCv42ZLKy26e0OHEAOaSpER5nV9JfrDIvaeCXbXecTmUHX73lFy70p7j2ve01h
	lDahcqtREuEmqhPLR0CXfOOy3dETqG5c8M7IYl6tLo4ywobQJvdQoP+LylwFR6ib/P5urL6
	LSJ2TNFTnXFeZ9dLKZBEJAENtoKCJZWQVFxdy6kycF4OZ4X7A6aECBH5xhUqnFSLq36lqMA
	RQUKp0k+1MEyEFQcfoUKNrbtJXZQ36w645+5hjwVDFIMhmFfWaKRA3/BgNMKhbrOxm2fXuP
	CDsF7BlSOOFGdBxwz/yWa8IViHeGa1OsfWtPeyOBQ5EZ7wJBeChJWDIjLjYgdQpg6KFX7lX
	fwx2f1DfnRyY/eb3km4ujzEv7P5d83YdFW4NhTbfIdy3FfOcNfc76sPZdcZ+5uN9k3OtUM8
	PcJ9Znd0RSgjp73sRw83Qz62e7IovqUzKxfa7iXlTSPFrhi8EesdakRXEqwLiYV5XYQN63I
	JEIi1w24BKZaOnnRpC6u9N9V20VmJUDVA7WuTrbEGWHhIGADoyp5RhNXYsdVA+zA5Hs1iIb
	fIVfbZTspW6BS+G85P8v/RQBxDABOK8hHlRWrJEjZ7V1Ok+2N01vxEZAqTEScO2E2jB0ZZ8
	IO74eqMeF/EaGPt0Fh34frBhaVbAaZIVm7NRZRQzKWVVR24mwJTILTUXkYW8xexVbxcJ/Qf
	rnO/VQhm4CGC0P5z/OL0yQEx/cGw/DyF+Jauoj9nWpd/b1bDFrjtd0=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_193932_767881_E082205F 
X-CRM114-Status: GOOD (  16.86  )
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
Content-Type: multipart/mixed; boundary="===============8312973095824652861=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8312973095824652861==
Content-Type: multipart/signed;
 boundary=fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > I just had a talk with Dong from Spacemit. He tells me the
> > BS01DCMA is the name of a module similar to the com260, only it has
> > a different form factor and each module consists of 2 separate K3
> > nodes. Similar to how the com260 module can be used in a small
> > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > (spacemit,k3-com260-tq), I'd expect to see a
> > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > module itself, and then an
> > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > describes the extra peripherals that can be accessed when the module
> > is plugged into the server.
> >
> > [...]
>
> Ah, it's called the Cluster Server RV2768
> https://spacemit.com/community/development-kit/cluster-server-rv2768

Hi Emil,

I've checked with our hardware team. BS01DCMA is indeed a module, so
the "board" wording in this series is wrong and I'll fix it in the next
version.

I'd still like to keep a single k3-bs01dcma.dts though. The module is
only used in the RV2768, and that carrier is essentially just cabling
to PCIe network cards. Those are found by enumeration and there's
nothing else on it for the K3 to control, so a
k3-bs01dcma-rv2768.dts would have nothing to describe.

Does that work for you?

--=20
Troy Mitchell

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau1L4SEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8bHwEA/wJFXrKpYftH
FB5kzcPBx6DamUD5F+4zMd1bZudAqVUBAKPNyObrwunkgozWj9HWqQMnkYJyk6XD
Wmy765878T8H
=dLV/
-----END PGP SIGNATURE-----

--fa641b20d767eb6dfceae802e81e79246e3b4039a9ed52a8760cf69df47f--


--===============8312973095824652861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8312973095824652861==--

