Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837861090235
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/E4Yn1I7mVHTCOBNV7SxXNbx7ASohDd80VAZlWUbaHI=; b=C83Q/D096IWNesneD2VW/a0nI2
	k5fSNhRRlston5kUTL1jZRuBShHC7bMKVKMiOVfI3CNGIO0ZZ6BDk9WJqlPreDNLRU1FBdHuPG6Oe
	g2r5og+tyoLZn6j25xyCeaferjU8zdbKq30KqDeY0XzQCsOttPUypl+tCHT+HNKXLjLPKdK4EK1Eu
	gfD5beeWTYnNT2ShVnDgHIUgxqs3c3pydJOHuxFSMsJ40slyNlgzs/I0N5QqQDgTcWi+gtWQQOlz0
	NkAclC+2PcKmoIlu+dTt0ap52rxfwmsw77B2FB5ZxMb1NVkBgKwDAeU8ndy4BFdQS+zYo9PPCn6Kd
	zVg3P1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ETw-0000000AoR1-1lax;
	Thu, 19 Mar 2026 14:36:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ETv-0000000AoQr-3wUZ
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 14:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60D9560053;
	Thu, 19 Mar 2026 14:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F69AC19424;
	Thu, 19 Mar 2026 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773930975;
	bh=0sWepENTLCOfrxR5/+c2+51Ax84QGBYsq5KpzSjrIW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvUwICwbqieYDdbpxY5iLebUupFiC2wVL8ay+ylWDUNlIuiVGw8/F5wNm3tcOxksu
	 RCp3W1hwcaffTSx66C0edF7Yh17YFHjch+ErvwR/Cdwl/zrbzfKGbhorLeBrgJv6HX
	 Qi7utROptr6/Eg4YARflKNpC6eZIeFszZe6pMNQju5ASLMzui6VdzrRSgqQg1mPwwo
	 OkFMbWehAhExqwlWkgZ0UdrRaa8KkqDesVAcEXtFUT9fH5GbzbS2T6mhBEHKM0wZ/0
	 cwv/BbFBEMgkWe9/szEEGBWWpR/HzAHtwDLrvc6VSkNTUkp//hnT+VafrYCPmKofTW
	 m4Qp3r1iojKlw==
Date: Thu, 19 Mar 2026 14:36:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260319-garbage-scrunch-37dc1b72d56c@spud>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
 <20260318-crock-tinderbox-ae12024627d9@spud>
 <20260319024124-GKB489299@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260319024124-GKB489299@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0069722673913789799=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0069722673913789799==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mKkiWYjZ1K2L1Tq"
Content-Disposition: inline


--3mKkiWYjZ1K2L1Tq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:41:24AM +0800, Yixun Lan wrote:
> Hi Conor,
>=20
> On 17:21 Wed 18 Mar     , Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> > > Hi Conor,
> > >=20
> > > On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > > > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > > > Add compatible string for DWC3 USB controller found in SpacemiT K=
3 SoC.
> > > > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but onl=
y has
> > > > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > > > >=20
> > > > > Explicitly reduce number of phy property to minimal one.
> > > >=20
> > > > Is this valid for the existing compatible, will it work with only o=
ne
> > > > clock?
> > > >=20
> > > I didn't change clock binding, do you mean phy?
> > >=20
> > > Both k1 and k3 work with one clock (no change here)
> > >=20
> > > for phy, the existing k1 requires two. for k3, one controller requires
> > > one phy due to only has USB2.0 support, other controllers requires two
> > > phys - USB2, USB3 PHY
> >=20
> > Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
> > constraints for the k1, can you please add a conditional section to the
> > binding to enforce 2 phys min for k1?
> >=20
>=20
> To be explicit, the change should be applied to both K1 and K3, even in K1
> use case, it's perfectly fine for designer to choose enabling USB2.0
> only, and leave the comb phy to pcie contoller, so only one phy required

In that case, can you be more clear in the commit message about why this
is also being done for the k1 please?

--3mKkiWYjZ1K2L1Tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwJ1QAKCRB4tDGHoIJi
0oqyAP4nXoDLetxoQs642+vVHye9yDClNXYMEPidUjtskTK5NwEA3z4OdmCZisdC
OPflp/85AHIauaJjUPhuhi0GguyjGw0=
=S1Ui
-----END PGP SIGNATURE-----

--3mKkiWYjZ1K2L1Tq--


--===============0069722673913789799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0069722673913789799==--

