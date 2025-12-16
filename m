Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54848D609BB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZFIYp1KOBNt+GiP74t1eUJ9FxkDt9XQwOsd6CxZvWI=; b=pBhgXy4CVndJb/KSxeS7oNnK8l
	pwwQQLrYvXDB1akF/Pcj3yt2dFGP9NBy7liu/QxlfMggFdvRM0va3Yy7rhaAqWEZnyCgc5RXwisJ4
	ddrf8p+1DPfgG5gGGtgYqayDd97QGwWhmhlie7zQ3DNcJw4q454PCw4+04QYKQ1lP3iBMEO9UnYhE
	7f7zJVvL2AxIfWvJPzwW6N0146ErHoSK81hpyG5YBxfn5h2kZE8AsNaYg3dvBskTMqBCMZjDXRrzv
	JUUOib9/Rs/W6D0KQ5w2SEBhTvv856a9k4OH2LbdHXnt3AYjD4+4R1VWT10SB1Gk4D0D6WQvz5Lz0
	hXctVAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXzn-00000005X9C-0IjI;
	Tue, 16 Dec 2025 16:33:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXzk-00000005X8i-2QFa
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 16:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0060140408;
	Tue, 16 Dec 2025 16:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB5CC4CEF1;
	Tue, 16 Dec 2025 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765902828;
	bh=YKJMtPFWa6ht+n9Bxx5M3M/3OHahvRpYpniNwtoIfcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rD2pRTmX6g38MqEQaqw1UPO3Qn55ibZ/bbyJaoRGufwZLufeGkG88EHBSDXFUabaO
	 640367wbsRRwXZs1Myg2eN36rgpbN1bA1N44fXG8hZgG8H0qEww3e+uxo0g0c7KIfi
	 q2Qs5HMImmZiZjsM6uyoA/5+fN0ZHxYpeZ3pyLA4+tGqEv/HNvNRIj7szFMWYd0Z1j
	 DaeiKBc/0y/WW4bz+TdnR77riKVcs30CTmrBn9WyEbKP+U6PU5YXESVvas52pHfBoV
	 ouJiRXUxFT0t30dxtShiqzxEVijxlxrFRIOus6ondRUejmAstBAnkj26AfvNrfU4Kd
	 E6LbXeRVnlnYA==
Date: Tue, 16 Dec 2025 16:33:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Message-ID: <20251216-wing-squander-2fed378d3035@spud>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com>
 <20251216150530-GYD1903981@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20251216150530-GYD1903981@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_083352_657566_5D322CF6 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: multipart/mixed; boundary="===============5773582123983625241=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5773582123983625241==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WOHLg4B2RTM9rCY3"
Content-Disposition: inline


--WOHLg4B2RTM9rCY3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 11:05:30PM +0800, Yixun Lan wrote:
> Hi Guodong,
>=20
> On 21:32 Tue 16 Dec     , Guodong Xu wrote:
> > Add DT binding documentation for the SpacemiT K3 SoC and the board Pico=
-ITX
> > which is a 2.5-inch single-board computer.
> >=20
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/spacemit.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Do=
cumentation/devicetree/bindings/riscv/spacemit.yaml
> > index 9c49482002f768cd0cc59be6db02659a43fa31ce..003b0bc1539b621e39172a0=
565dfea1274cbc8b8 100644
> > --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > @@ -8,7 +8,8 @@ title: SpacemiT SoC-based boards
> > =20
> >  maintainers:
> >    - Yangyu Chen <cyy@cyyself.name>
> > -  - Yixun Lan <dlan@gentoo.org>
> > +  - Yixun Lan   <dlan@gentoo.org>
> > +  - Guodong Xu  <guodong@riscstar.com>
> please simply use "one blank space" here, it's more consistent,
> trying to align them like this would result in even worse situation..
> =20
> - only email addresses got aligned while not user names (first, second
>   name?)
> - adding another maintainer in future may break the alignment (if long
>   name)

Yeah, these are never aligned. Just do one space gap.

--WOHLg4B2RTM9rCY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGJ4gAKCRB4tDGHoIJi
0kA9AQCvdHdh3ZN6TPbUIs6IjVSdbLXEtx33bODh8014ZkTIPAD+O1FYIibih/H5
/frJtNNEwi9BQrqT/KU1vwpLyBCJQwU=
=4/Ek
-----END PGP SIGNATURE-----

--WOHLg4B2RTM9rCY3--


--===============5773582123983625241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5773582123983625241==--

