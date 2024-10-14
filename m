Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B92D18145
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLdYU5//HGpOFDfjwLv6+0FCgRg0Dmrs6lBk5DMSzrY=; b=wAg9dDrRj8sQ5BTU7Mg2CIUqlR
	fM1ht134OEn3VFD847QB7co8AUW9pNZk014lrupXD9MJL2UgtJ5iBe6bFchYgeEpBvOYYuQvhqPH9
	r2BVpSKMdSz2+YqtHrKQNZUFPmIXEEmBHSo3WutM9rJ4Tz7h7F6Eqi8PRsEKeLpc+vcfKBkl6VwPv
	qxQCsufwKJkcCT1zHUmmZfXf/t3GR1UPCLwnYETFT1z7qUjfRiVuHX61YV+eqMQdlBRNza8kpz89L
	C8tC+WXoaM1QpJyjcSLVw6YtE4uFtVgLM3T+PxHC1hUW8NJ4iElgnn9Ps4MNJ3Kfq5KprflMvrZbC
	MKOQ7jow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Rjo-00000006Ohd-41kc;
	Mon, 14 Oct 2024 20:32:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Rik-00000006OVB-3iPe
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 20:31:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4FFBA4287D;
	Mon, 14 Oct 2024 20:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16EAC4CEC3;
	Mon, 14 Oct 2024 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728937873;
	bh=/519vrXSCEBrD8167XIHl1Q+dorXR1ZPGe+dQgXTbfc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=gBcUVaQnHhFUCe5WUEVgYCtrlI6M6a4O80Q7mJz7rcdfmE5/Y9G7vBFwQw+xP7q/9
	 72ferCcQ0dXgfgYy9nKixtl+b+opIuj+lMuIAw41KW427fJr0wNFLZC8mS2RTMiYEH
	 S/OLWWvBI5oQDz/XannhpYf1VvJ+IbBlfdVnbMhvSxvlT2txZyVCe934sIWrHhhnGj
	 y/TQf8jm4UIlBxOGxXAx38KZlScBZlAuZQSFsulAeZEFaMoSTw35whA/clFMGxaaWx
	 x52SEQucqS4W1J0OmxADkMtH/R2GbjZVIMRvyBm8EUXsx4+MVoHT+aQN1O4LUOkaKQ
	 90PE0zwzzgxAg==
Date: Mon, 14 Oct 2024 21:31:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	E Shattow <lucent@gmail.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbdjM=?= =?utf-8?Q?=5D?= riscv: dts:
 starfive: jh7110: Add camera subsystem nodes
Message-ID: <20241014-roamer-cinnamon-1e100b485052@spud>
References: <ZQ0PR01MB13026F78B2580376095AF7E7F2442@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <Zw1-vcN4CoVkfLjU@aurel32.net>
MIME-Version: 1.0
In-Reply-To: <Zw1-vcN4CoVkfLjU@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_133115_081337_76FB3E3D 
X-CRM114-Status: GOOD (  27.05  )
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
Content-Type: multipart/mixed; boundary="===============8091957638166720802=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8091957638166720802==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bjrafg8s2P5yt9cp"
Content-Disposition: inline


--Bjrafg8s2P5yt9cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 10:27:41PM +0200, Aurelien Jarno wrote:
> Hi,
>=20
> On 2024-10-14 01:08, Changhuang Liang wrote:
> > Hi, Aurelien
> >=20
> > >=20
> > > Hi,
> > >=20
> > > On 2024-02-18 19:27, Changhuang Liang wrote:
> > > > Add camera subsystem nodes for the StarFive JH7110 SoC. They contain
> > > > the dphy-rx, csi2rx, camss nodes.
> > > >
> > > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > > ---
> > > >  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++++++
> > > >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 67
> > > +++++++++++++++++++
> > > >  2 files changed, 116 insertions(+)
> > >=20
> > > We have been asked to enable CONFIG_VIDEO_STARFIVE_CAMSS in the
> > > Debian kernel, which from my understanding and given the device tree =
shown
> > > below also requires enabling CONFIG_VIDEO_CADENCE_CSI2RX. That said
> > > doing so triggers the following error in dmesg:
> > >=20
> > > [   25.143282] cdns-csi2rx 19800000.csi: probe with driver cdns-csi2rx
> > > failed with error -22
> > >=20
> > > From a quick look it seems there is something in the port@0 csi2rx en=
try. Do
> > > you happen to know what is wrong?
> > >=20
> >=20
> > You need to add your sensor node. You can refer to this patch:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20240119100639.8=
4029-3-changhuang.liang@starfivetech.com/
> >=20
> > We suggest that using the imx219
>=20
> Thanks for your answer. I do not have any sensor attached, the goal is
> to build a generic kernel, and people can use overlays or patch their
> device tree to add support for additional devices.
>=20
> In that regard, I have the impression that csi2rx device (and maybe the
> camss device?) should not be marked as enabled in the default device
> tree. I think they could be enabled by users as part of the change need
> to add the sensor node.

Yeah, that's probably what should've been done when the imx219 node was
removed. Feel free to send a patch with a Fixes: tag for that removal
and a cc: stable on it - otherwise I'll send one out tomorrow or w/e.

--Bjrafg8s2P5yt9cp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw1/jQAKCRB4tDGHoIJi
0q8FAQDgeLWFLXi0q6X4bNcfHbUpz10qI/NjWDXGcvylrBjMCgEA7y/5Vki87xQ+
/7MuPhrTacNGUSIwcbhKT8B2yd/OnQg=
=AKJE
-----END PGP SIGNATURE-----

--Bjrafg8s2P5yt9cp--


--===============8091957638166720802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8091957638166720802==--

