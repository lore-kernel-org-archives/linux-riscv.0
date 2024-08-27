Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0476C54731
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh0FWtB7R759VN6yw7Wr3TXCFzQsdGo8FtQm7/gXm2o=; b=0A5O6VX4LWrAYQAYskBb64qsgr
	CwQ9mqTJGsGVLulCf8wlAzxVZolmDaBb+gYf0M5GhmiY5Ix8iyFeR2OCGXzTLKmZoaC3/Zzof0gcI
	UB3QGrkNvt/HawjEIySw/7wSRhDquapw6OkNQKr0Iz7ekLjaBAyo4wnqll4SLmmeWKJJybnxkbpzy
	6Vprw5AnU7AIjEc/DpRXyjmSOZAsN21HwNwgyBbS1M5rqjgzxYSW7cMH6ICom8WNrvRecBg8tPcxA
	GbphZaaa9CZ7u7s8wIpv+rRYwrpruWl9dXxP9ZzX4icXTjRA6gPH/n/T+k9xys1jY56xTFKGGuQQ0
	UeZ+OLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sixtJ-0000000Bp3x-15D9;
	Tue, 27 Aug 2024 15:13:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sixtF-0000000Bp3N-3HLU
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 15:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A522A41B1E;
	Tue, 27 Aug 2024 15:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660C9C6105F;
	Tue, 27 Aug 2024 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724771628;
	bh=RVcNBdVAYTptBbubyMnyKBRWzpO4+aKNbz2XLBFAbxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1Zaj8U6vpme0Vp49C+hK56kdlnuQcIKo90mnsaiTJaH5Hh9emT+WfzmElx7fftmv
	 S/yjR5QHR38xFqTpk9jWiKn9P/kjcS5nJ9Mbm4Fvw82TDFaHO7AIBrHqE5GzB7e54I
	 w1rK47uEGKi3Ey0zp4mATqw/suzS0wuyRgNHgZ4c5mh3La2TsyQSMU91IdiL22GflP
	 TjGF2ZYH7aHmjAKiz3716N/KLpzTHtee/ItrSB12K4A7qz0e/4nCJeKO6QHxILZFqD
	 xzvH81mLH2M4nUkmHalE9Z68yk+Ylt0+f43vokanyRwahU+8mIj9x4h7uOf6PoXxhe
	 uyqFgibOpufdQ==
Date: Tue, 27 Aug 2024 16:13:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240827-same-channel-dad1dc97a893@spud>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
 <20240826-turbofan-unwound-280af18d60cc@spud>
 <66cd3abe.050a0220.bf184.b4feSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <66cd3abe.050a0220.bf184.b4feSMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_081349_976050_1AD84311 
X-CRM114-Status: GOOD (  24.96  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: multipart/mixed; boundary="===============3144064205885159649=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3144064205885159649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jz0ET5wWh0WKJCpc"
Content-Disposition: inline


--jz0ET5wWh0WKJCpc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 02:23:05AM +0000, Yixun Lan wrote:
> Hi Conor:
>=20
> On 17:22 Mon 26 Aug     , Conor Dooley wrote:
> > On Mon, Aug 26, 2024 at 03:09:39AM +0000, Yixun Lan wrote:
> > >=20
> > > On 13:10 Sun 25 Aug     , Yixun Lan wrote:
> > > > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> > > >=20
> > > > Two vendor specific properties are introduced here, As the pinctrl
> > > > has dedicated slew rate enable control - bit[7], so we have
> > > > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > > > creating spacemit,strong-pull-up for the strong pull up control.
> > > >=20
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >=20
> > I got this mail, and one of your other ones, 5 times. What's going wrong
> > with your mail setup?=20
> >=20
> Oops, sorry for this, it's the second time you complain this..
> TBO, I have no idea what's happened, asked Yangyu, he didn't have this pr=
oblem
>=20
> I'm using mutt+msmtp to reply, while using b4 to send the patch series,

The patches only appear once, it's the replies that have the problem.

> for all the mails you received, do they all have same message-id?
> I have a local filter for duplicated mails myself, could this help?
>=20
> (I leave only one address of your mail in this reply, see if still have p=
roblem?)

It's nothing to do with me having multiple addresses, the mails have
different message ids, and as you can see below, even different sizes too.
For example, two copies of the current reply came in as:
Message-ID: <66cd38b0.050a0220.113bce.d5acSMTPIN_ADDED_BROKEN@mx.google.com>
Message-ID: <66cd3abe.050a0220.bf184.b4feSMTPIN_ADDED_BROKEN@mx.google.com>

Your mails also don't properly appear on lore, you can see some [not
found] mails there:
https://lore.kernel.org/linux-devicetree/20240827033057.GYB208832.dlan.gent=
oo/

The SMPTIN_ADDED_BROKEN might be a hint as to what is wrong with your
setup?

>=20
> > | 250   T Aug 25 Yixun Lan       (6.0K) =E2=94=8C=E2=94=80>[PATCH v2 4/=
4] riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
> > | 251 N T Aug 26 Inochi Amaoto   ( 12K) =E2=94=82 =E2=94=8C=E2=94=80>
> > | 252   T Aug 25 Yixun Lan       (6.8K) =E2=94=9C=E2=94=80>[PATCH v2 3/=
4] riscv: dts: spacemit: add pinctrl support for K1 SoC
> > | 253 N T Aug 26 Inochi Amaoto   ( 46K) =E2=94=82 =E2=94=8C=E2=94=80>
> > | 254   T Aug 25 Yixun Lan       ( 38K) =E2=94=9C=E2=94=80>[PATCH v2 2/=
4] pinctrl: spacemit: add support for SpacemiT K1 SoC
> > | 255 N T Aug 26 Inochi Amaoto   ( 22K) =E2=94=82 =E2=94=8C=E2=94=80>
> > | 256   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 257   T Aug 26 Yixun Lan       ( 338) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 258   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 259   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 260   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 261   C Aug 25 Rob Herring (Ar (9.0K) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 262 N C Aug 26 Krzysztof Kozlo ( 14K) =E2=94=82 =E2=94=82 =E2=94=8C=
=E2=94=80>
> > | 263 N C Aug 26 Inochi Amaoto   ( 19K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 264   C Aug 26 Yixun Lan       ( 285) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 265   C Aug 26 Yixun Lan       ( 281) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 266 N C Aug 26 Yixun Lan       ( 14K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 267 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 268 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 269   T Aug 25 Krzysztof Kozlo ( 13K) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 270   T Aug 25 Yixun Lan       ( 14K) =E2=94=9C=E2=94=80>[PATCH v2 1/=
4] dt-binding: pinctrl: spacemit: add documents for K1 SoC
> > | 271   T Aug 25 Yixun Lan       (8.5K) [PATCH v2 0/4] riscv: spacemit:=
 add pinctrl support to K1 SoC
> >=20
>=20
>=20
> --=20
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

--jz0ET5wWh0WKJCpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs3tJwAKCRB4tDGHoIJi
0vHEAP4yzxgAUlp0JW0TlnqXOhzqwyfH3HuKhnoHxjTT+wPzsgEA+cgEMruf5sqY
cIEKgwxApjwyY5e7KMQx1HkEaYETjwA=
=+Ntg
-----END PGP SIGNATURE-----

--jz0ET5wWh0WKJCpc--


--===============3144064205885159649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3144064205885159649==--

