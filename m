Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D8CC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWtTRY9dhTAmU6ITJ4yDVaPWw8j8fLGq7/6HaWVgJdQ=; b=LyU/LctJjlxj2b6l0wE3fQx6fX
	SvtGJ+QG/RhhoIkik5/Wba8Ft/gXzW8UN3n2psY2a+RptlwI412ix592ooX8FBU1N8Qd2q9BThzOB
	eTBJ+TmdruHgjlRft4v8t0bYKsT0DGvlkmI/wcUZyr//ZJBW8E6RCbTfowhzzhoJi+F/qAB+unne6
	9CYq69skzeUBsAJT25k8tMIOFCnvGtdQT8/Jn84hmoTH/mE3YCtRImeDFwbDCRKRwzxQ5k/pYPqSj
	s+i5jSaWDJfu5Yiwd+FiwnCS15od2Q5ISuCHBaMwCdNr1HwimUARgI9q4QhGvzgN1mtcc/KHi126w
	M+kYYHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVta-0000000EIfE-0E7K;
	Tue, 18 Jun 2024 10:16:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVtX-0000000EIeD-0Sd7
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 10:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718705814; x=1750241814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gx5XNpX9FgJu98i8CWmHAYRyuGCEFHvQShWetZfMZMk=;
  b=zTIu54EX+CkSg18utNxJYWpn2qpGOgFRFKP5yt8+MYodf6vzhdwfc+yk
   rPsWHBl9OJIiT3wgQbdm+SpV5p7aJfwoEYrL1yDlrWNj3qwS8VUoP7Wy2
   0BP4x75Sr5z7mOU2WhMAPxf+UET9a39F3Ft26HQmCY5935pDDpFhN9Kz2
   Y3Jggecd/NcI/JjyN6VFTRF/xdwH7rSF0wbaSmK6hYVEHANhuigSQ2fYl
   IZpToxI3QIZMOBn3O4chv4cLVe1JibJ8vY7dp8AIgFm2AbBMuNyVmja8A
   8LRaNDQCP/kHeflVn2uUPeFjK0bxLP2GYzUkh1JF1agPPEdl0OFynGw67
   Q==;
X-CSE-ConnectionGUID: o2SKGVjbQSiEKU8bW2iCXQ==
X-CSE-MsgGUID: 7ZBDQuLCQhWCJdZiKrs8Rg==
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="asc'?scan'208";a="195429902"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2024 03:16:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 18 Jun 2024 03:16:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 18 Jun 2024 03:16:46 -0700
Date: Tue, 18 Jun 2024 11:16:28 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>, Yangyu Chen
	<cyy@cyyself.name>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, Anup
 Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <20240618-hardwood-footrest-ab5ec5bce3cf@wendy>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
 <ZnBEBQjTQtFs-fXt@xhacker>
 <20240617-synapse-carmaker-0a59c7c6edb7@spud>
 <ZnEOU7D00J8Jzy-1@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZnEOU7D00J8Jzy-1@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_031655_291942_AD4C5E47 
X-CRM114-Status: GOOD (  50.12  )
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
Content-Type: multipart/mixed; boundary="===============2182279050487367006=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2182279050487367006==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ls0dFZComN3YRvgQ"
Content-Disposition: inline

--ls0dFZComN3YRvgQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 12:34:27PM +0800, Jisheng Zhang wrote:
> On Mon, Jun 17, 2024 at 04:32:59PM +0100, Conor Dooley wrote:
> > On Mon, Jun 17, 2024 at 10:11:17PM +0800, Jisheng Zhang wrote:
> > > On Sun, Jun 16, 2024 at 10:48:11PM +0000, Yixun Lan wrote:
> > > > Hi Conor
> > > >  Thanks for bringing this up
> > > >=20
> > > > On 19:35 Sun 16 Jun     , Conor Dooley wrote:
> > > > > On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:
> > > > >=20
> > > > > No MAINTAINERS update, so I figure that means you don't want to m=
aintain
> > > > > it going forwards? If there's someone out that that does care abo=
ut the
> > > > > spacemit k1 (Jesse maybe?), then I'd be more than happy to have t=
hem
> > > > > look after it.
> > > > Yangyu kind of has limited time, too many stuff for him..
> > > >=20
> > > > I'd volunteered to help on this if it can fill the gap
> > > > Also I'd be more than happy if anyone willing step forward to co-ma=
intain..
> > >=20
> > > Does maintainership work like this? Is willing to do enough?
> > > FWICT, maintainership involves active patch contributing, reviewing a=
nd
> > > maintaining the whole SoC. It is better to take over the maintainersh=
ip
> > > after showing enough patch contributions and understanding of the SoC.
> >=20
> > I was going to reply to your other patch about providing more complete
> > "basic" support for the SoC, but I guess I'll reply here and address
> > both points. After the k230 and th1520, which were both merged with very
>=20
> When I saw k230 a few minutes ago, I assumed you mean k210 since I
> didn't found k230 support in linus tree now. After searching the
> maillist, I found oh there is a k230 series which is similar to this
> series, no pinctrl, no clk, no reset. Since the incomplete K230 initial
> series hasn't been merged into Linus tree now, is it possible to drop
> it so that we can avoid the same mistake for k230.

Yeah, I think you're right there and I should drop the k230 stuff from
for-next. I forgot that it was not already in, because I had sent it for
6.10 and Arnd didn't like some of the inter-branch dependencies that my
PR had and told me to drop it. If nobody really cares for getting the
platform to a reasonably usable state, then I guess we will just not
support it. And it seems like there's little interest in it, despite
being the first system you could buy with ratified vector. It's not a
great platform to work with documentation wise, at least as a non-Chinese
speaker like myself nor is the U-Boot M-Mode -> OpenSBI -> Linux vendor
boot flow good for iterating on kernels.

> > basic support and have made very little progress towards being a useful
> > platform, I'm pretty reluctant to merge another platform in a super
> > basic state. I was going to make this point before you brought it up,
> > but it's good to know I am not the only one with that view. To be clear,
> > I'm not pointing blame for those platforms, I'd just like to avoid a
>=20
> Yep previously I thought it was fine to use a fixed clock or dummy clock
> during the initial patches, but I changed my mind now, especially after
> Samuel complained the cv1800b reset dt changes.
>=20
> > repeat. If Yangyu doesn't have time to do any development work on the
> > platform, I'd like to see someone else (and as I mentioned Jesse is
> > interested) take on getting some of the basic driver patches written and
> > merge only when those are accepted. Having no in-tree clock and pinctrl
> > drivers is definitely a hindrance to other people doing parallel
> > development of drivers and I'd like to avoid that.
> >=20
> > Getting back to your point in this mail, whoever gets the platform to
> > that state is well suited to looking after it going forwards. Some other
>=20
> The person who can bring the platfrom support to a well-moduled state,
> IE, proper clk, pinctrl, reset drivers shows the passion, the code
> contribution and solid understanding of the SoC, sure he/she is
> definitely suited to maintain the SoC. I just don't think it's=20
> a good practice a person can became maintainer even w/o one LoC
> contrubition to the SoC, because IMHO code contribution matters
> for maintainership.

Right, and the th1520 is suffering a bit from that at the moment, the
maintainers other than yourself haven't sent a single LoC for it, and
have not gotten involved after you have become unable to spend time on
it. I do know that things are likely to change there soon, which is
good.

Thanks,
Conor.

--ls0dFZComN3YRvgQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnFefAAKCRB4tDGHoIJi
0njCAQDRmhJBRDXSxo9jmNwWNsNOWf+p+Of21MpteeW5PvqBYQD+PRRpSWRtgdSR
MTHkDx0FRVW1eds3JwR/x3zZL4n7/Ak=
=BGK6
-----END PGP SIGNATURE-----

--ls0dFZComN3YRvgQ--


--===============2182279050487367006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2182279050487367006==--

