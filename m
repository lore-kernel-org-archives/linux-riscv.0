Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E72CC3ABA3
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxd4KsWvo2tVeYwrWYGThVyS70dneicRNRsbMToOtVU=; b=TrlbBiIKqB8UYf1lmpNW2w9GTO
	gwokDKuSkeFDs/F0NGnZfTp4mDOt6WR/sb8StCgfGos6bmFBj254skdQtqrwcz5b2CvQkI3m4G/k3
	n8QW5hRHQFsTDF87/+BVwZ/eBN4l2eerSuRko3eLtApCraqErY0VFrPJH9d6r6uh3IF2tVnTrgH0P
	l912gFcSovN/hckkfJ0rU+2czX6a2kOeUGISKXKq+GNy7zYeJmlBkK91d7aL7uI3xJ1Ra3I51F0Ui
	FHK0Qg1YPYDQRBf9y5XDCqlY9wrMNZ9l0AGnY4FqHAJ3LK0vSPXBq8DrQe+Jz+7fouy7DQ369aTIs
	EC36Qm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spv2J-00000002aFO-2LUv;
	Sun, 15 Sep 2024 19:35:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spv1Z-00000002a70-1lFJ
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 19:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 702BDA40F57;
	Sun, 15 Sep 2024 19:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47350C4CEC3;
	Sun, 15 Sep 2024 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726428907;
	bh=TegTfxzMRKVsjSI958Q3E0pV4BcivWmeXOWpP71ZNh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uce/rLQFmd2E1rkjh8POBHvnJYzVZsdoRWrsqAH4jxBLkC++ToznVXMGsZXneSsnT
	 1mAf0PP5pJtlGnh1qpQjERBVkEKD8vUJbssm3D7PkVZKwGqis4ox1j64o2YoYZk9Q5
	 i7IpnNQpMVA5HvXHUoHfjaKpsO1O4unouAvAxEMUvfsiv/R5uwR7zpYJi+g5mpgrEP
	 v02UhFpu3c//sss+5+52xKJgH5CVGnls7NduFfYni/PHn9c0klt3MBhbAyv6SXEHTz
	 6CMstSEUCq0thVzF3cMJotaaH6hkkjwJA3/xhrtAHlc8MI6usuDZMldZbKceuYCe5t
	 jt446Li/EB0oA==
Date: Sun, 15 Sep 2024 20:35:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Ze Huang <18771902331@163.com>
Subject: Re: [PATCH 0/3] Add initial support for Canaan Kendryte K230 pinctrl
Message-ID: <20240915-flinch-harness-e9e1b92f5c79@spud>
References: <ZubtZKlxqejnCFx_@jean.localdomain>
 <320c1fd8-2f8d-414d-a6a5-23280955b9b8@163.com>
MIME-Version: 1.0
In-Reply-To: <320c1fd8-2f8d-414d-a6a5-23280955b9b8@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_123509_613609_44025204 
X-CRM114-Status: GOOD (  20.57  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, dlan@gentoo.org, kevin.z.m@hotmail.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, jesse@rivosinc.com, cyy@cyyself.name, devicetree@vger.kernel.org, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, inochiama@outlook.com, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, zhangmeng.kevin@spacemit.com
Content-Type: multipart/mixed; boundary="===============4599354954403763553=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4599354954403763553==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CyzwYAu3/6FE9Ujm"
Content-Disposition: inline


--CyzwYAu3/6FE9Ujm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 11:22:16PM +0800, Ze Huang wrote:
>=20
> On 9/15/24 10:21 PM, Ze Huang wrote:
> > This patch series introduces support for the pinctrl driver of the Cana=
an
> > K230 SoC. The K230 SoC features 64 IO pins, each of which can be config=
ured
> > for up to five different functions.
> > 						=09
> > The controller manages the entire pin configuration and multiplexing
> > through a single register, which control features such as schmitt trigg=
er,
> > drive strength, bias pull-up/down, input/output enable, power source, a=
nd
> > mux mode.
> >=20
> > The changes have been tested on the K230 development board.
> > 						=09
> > The pin function definition can be found here [1], and most of the DTS =
data
> > was converted from the vendor's code [2].
> >=20
> > Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a=
81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
> > Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/a=
rch/riscv/dts/k230_canmv.dts [2]
> >=20
> > Ze Huang (3):
> >    dt-bindings: pinctrl: Add support for canaan,k230 SoC
> >    pinctrl: canaan: Add support for k230 SoC
> >    riscv: dts: canaan: Add k230's pinctrl node
> >=20
> >   .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++
> >   arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi  | 318 +++++++++
> >   arch/riscv/boot/dts/canaan/k230-pinctrl.h     |  18 +
> >   arch/riscv/boot/dts/canaan/k230.dtsi          |   2 +
> >   drivers/pinctrl/Kconfig                       |  10 +
> >   drivers/pinctrl/Makefile                      |   1 +
> >   drivers/pinctrl/pinctrl-k230.c                | 674 ++++++++++++++++++
> >   7 files changed, 1151 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k=
230-pinctrl.yaml
> >   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> >   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
> >   create mode 100644 drivers/pinctrl/pinctrl-k230.c
> >=20
>=20
> lost base commit and prerequisite patch id here:
>=20
> base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
> prerequisite-patch-id: 740cbeb9fc3f3e3fd30df4914cd31e9eb148a581
> prerequisite-patch-id: b5cc919a7e8e2f852569d5918944dbe4f21e6912
> prerequisite-patch-id: 554cb838b7264109437359e88443cc3497ed344c

I don't have the ability to convert those to something I can understand,
is
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic
effectively the basis for your series?

--CyzwYAu3/6FE9Ujm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuc25gAKCRB4tDGHoIJi
0ulQAQCknK6VYQasoWh8AAI3+LsDn+3tbfKKbzDGoTZdf0W2tQD/ayh4pmeE6f4b
G7dvGUnbYVw+aPXbxopXJPwekkLhtQU=
=a291
-----END PGP SIGNATURE-----

--CyzwYAu3/6FE9Ujm--


--===============4599354954403763553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4599354954403763553==--

