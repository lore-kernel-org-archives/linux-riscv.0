Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB44C87FD2
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtsSVyrac3utEwSTSozU8O1c6DKIA9KvUtneRHXK4lI=; b=khOFUTLQvNFWgITS8lp2uYiAFX
	4Mj/mAxXsqya/yb4b1pwhpxiwY6jvVsm7NEsI1zr3LEGgW2an65y93ADhXXB/iCvSfEmXmzSao+gf
	aieQUQ3Ci7bnukynMkJEqzlCdv0zd63g26YXwPygwFyqICH0a1ckmCDOxpiJmZy7HBaSv7cywOAaZ
	P0FLKdCGg7zhIZz1jc9Y10iAqTWGJKaEZpiI2UflRn9p8kZfVumsE8lPWO/6PCHTjFX8YbD47IqYb
	IPwy7wSNhTEhkWCA7WRVC3QhYFP5n5kq4EKnEKYWmAE5EgOwtZm5EYffBHrQwze6j0cNat564WL/0
	ShksAMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJhs-0000000D9sZ-21mr;
	Tue, 05 Aug 2025 15:36:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIXX-0000000CzZS-1OA6
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 14:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C165BA564BE;
	Tue,  5 Aug 2025 14:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449B1C4CEF0;
	Tue,  5 Aug 2025 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754403677;
	bh=whNVERXr8/AN2Vvfa653Gd5vcbSu7aoK+Gs6t3i+W5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkNCQekXfQ5zz7SFOm1X7LU/T8JpA9F6gAsS3c6+9y+qglrwIbLwFIyBWP0D7ry9L
	 GNhbEPDSTXig2ETCkjlyEQjsdVC+Esbhv/Mb6sC4EIXYY6JR+pDMVBPqqMyLZbPmV7
	 zCXEyHeM3myKgWKd3MxjVBE8NTyWb7P0zROsiSR2Ao8hISoyvyhrvyXOgF3UaB+Klv
	 nppZ4E0Y9K/XyXaSW7LqmDdDoxSCWK+Fgvj0t1nTVbxwcdQp5c/QjtjWZvjgaTOo29
	 +Qi5Lyikzld4at0TH6QtlFDyU5soOqU4XCrww1smX/qa1O+f2NrdrUwYW5PN9JBJ3u
	 OORGr+Kr6H51w==
Date: Tue, 5 Aug 2025 15:21:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	"rafal@milecki.pl" <rafal@milecki.pl>,
	Anup Patel <anup@brainfault.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH v4 0/7] Basic device tree support for
 ESWIN EIC7700 RISC-V SoC
Message-ID: <20250805-equinox-setup-cd37520d2586@spud>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
 <SA3PR04MB8931098CC4A73E8FDD481DA78326A@SA3PR04MB8931.namprd04.prod.outlook.com>
 <2ed69301-f787-4257-8d44-a8544c1a43c9@kernel.org>
 <SA3PR04MB89312063FB96E85ABB6F3D3E8323A@SA3PR04MB8931.namprd04.prod.outlook.com>
 <72354ec9-7dc8-4192-9c25-d37abf33b5f0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <72354ec9-7dc8-4192-9c25-d37abf33b5f0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_072119_509059_771AF987 
X-CRM114-Status: GOOD (  19.72  )
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
Content-Type: multipart/mixed; boundary="===============7367352542692163191=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7367352542692163191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="90osRGvCEAKF0z/s"
Content-Disposition: inline


--90osRGvCEAKF0z/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 04:45:10PM +0200, Krzysztof Kozlowski wrote:
> On 04/08/2025 15:10, Pinkesh Vaghela wrote:
> > Hello Krzysztof,
> >=20
> > Sorry to bother you. I pinged because we addressed all the review comme=
nts of V3 in V4. But on V4 we have not received any comments since last 6 w=
eeks.
> > Could you please let us know what should be the further steps?
>=20
> Please don't top post.
>=20
> That is a bit different question than you asked before: "Gentle reminder
> to review DT patches.".
>=20
> Please read SoC subsystem maintainer profile document. For ARM platforms
> you would send now pull request or patches to soc.
>=20
> I would suggest following standard SoC way, same as for every other new
> SoC (but carefully observe the kernel process cycle). You can easily
> check archives to see how people also did it...

Yes, standard SoC way please. Arnd expressed recently a preference for
the initial series for a new SoC vendor to go as a patchset to
soc@lists.linux.dev rather than as a pull-request.

> For RISC-V - not sure
> some trees are handled by Conor, but rest go directly to soc tree.

I'm only doing the canaan/sifive/microchip/starfive ones that were there
when I started, all the "new" platforms have dedicated maintainers that
send direct to Arnd.

Cheers,
Conor.

--90osRGvCEAKF0z/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJITVQAKCRB4tDGHoIJi
0rfRAPsE27O+0eBI7GpGuWCrShsC8OmvPSMg1HZpeLJfBi4P4QD/dHgMhoqf1QeQ
1euvTqb8q7cSCtui9wi8PvuYBEqxoAQ=
=0EsT
-----END PGP SIGNATURE-----

--90osRGvCEAKF0z/s--


--===============7367352542692163191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7367352542692163191==--

