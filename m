Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B22D30CDB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 22:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuchFHBAGNqyePWSEOCJSiR3+TFe41x7JvTNcy+QhNM=; b=Rc6hXu+8aEOAtzPCdbDAUnXQR6
	5mgRxs0Fo2VpHA2JnVJmkMPL7KtNCGr4nBSCsmwOPq+PDWQNlKnerU952qBvcWt71oLHEs7i9jMXD
	nzwUhO9y65BQvao4e1aH2TCLp3Vyr2Yo93xwDJPo9s2Aduw6pwf4OINbmXdtdXX64QZXjA0HUriwO
	7CM+7f0pzS9GyApjjpuLVh9MQZNZJ8jP8AV4nGuKueKsJyrAQkId3XgCuMd8PaxhCia7fsCcGfaww
	jG9u1CRj7YzsuYRSrUqjqccTX3rP71HwnsEcu5ILaFsrPCh/K85e2oPxLrhjkZnLdpLfFsWt8TcV8
	05fFubow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmhL-00000007oPx-3Kyc;
	Tue, 13 Jan 2026 22:17:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmhI-00000007oPa-3dup
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 22:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3468643ACA;
	Tue, 13 Jan 2026 22:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3894C116C6;
	Tue, 13 Jan 2026 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342628;
	bh=+3ONtD2eR+s+kOgpmP2sSSr8GNW6z60TPEcWwd0I1sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mK5+qEb1w6ITkZA4f1kCvraKXZ4nw6/IB986JiaILnjehCVdOQgO3D33B3BcTEwn3
	 drbxLmGvLIRDstNaX8/TmR5DkhdmsrMsy2qc1rFcSAWZL+kujYTRc7jMnJ6/nE4hhM
	 C/LbK7JiXKWskezaDTu9xGfYe4RPQi4U3ST6w8fif48X/lo1ARSCXhY4G+MCtcwakE
	 GOp8IkUPzi7CisiyFgEwzhZKwduYOkETw00qdIGlQdS7MbVJ9UxkzR3Aoi77MVqOT3
	 XxO4WiBClPfzdrfRw1oNNpU7vuA5uzrIsOfpiQGgVqHpXSxUXEn8diy6Vy+fPNTiNr
	 TZwHFeRQgHtVg==
Date: Tue, 13 Jan 2026 22:17:00 +0000
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
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Message-ID: <20260113-swarm-mama-cbd7d0546578@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
 <20260113002123-GYA19926@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20260113002123-GYA19926@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_141708_970331_1E3D8B65 
X-CRM114-Status: GOOD (  28.53  )
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
Content-Type: multipart/mixed; boundary="===============4697888015487703759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4697888015487703759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xUPru1lBOhmdPMEM"
Content-Disposition: inline


--xUPru1lBOhmdPMEM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 08:21:23AM +0800, Yixun Lan wrote:
> Hi Conor,
>=20
> On 21:45 Mon 12 Jan     , Conor Dooley wrote:
> > On Sat, Jan 10, 2026 at 01:18:12PM +0800, Guodong Xu wrote:
> >=20
> > > Hi, Conor
> > >=20
> > > For the binding riscv/extensions.ymal, here's what changed in v3 (no
> > > change in v4):
> > >=20
> > >  1. Dropped the patch of adding "supm" into extensions.yaml. At the s=
ame
> > >     time, I will start another patchset which implements the strategy
> > >     outlined by Conor in Link [2] and by Samuel in Link [3].
> >=20
> > Okay, that seems reasonable to separate out.
> >=20
> > >=20
> > >  2. Dropped the dependency checks for "sha" on "h", "shcounterenw", a=
nd
> > >     6 others. "sha" implies these extensions, and it should be allowed
> > >     to be declared independently. Like "a" implies "zaamo" and "zalrs=
c".
> > >=20
> > >  3. Enchanced the dependency check of "ziccamoa" on "a". Specifically,
> > >      - added the dependency check of "ziccamoa" on "zaamo" or on "a".
> > >      - added the dependency check of "za64rs" on "zalrsc" or on "a".
> > >      - added the dependency check of "ziccrse" on "zalrsc" or "a".
> > >     The commit message of this patch is updated too, to better explai=
n the
> > >     relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".
> > >=20
> > >  4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", maki=
ng the
> > >     dependency check in both directions, as discussed in [4]. Since "=
b"
> > >     was ratified much later than its component extensions (zba/zbb/zb=
s),
> > >     existing software and kernels expect these explicit strings. This
> > >     bidirectional check ensures cores declaring "b" remain compatible
> > >     with older software that only recognizes zba/zbb/zbs.
> >=20
> > This I asked about in the relevant patch, I would like to know what your
> > plan for adding the "b"s is.
> >=20
> ..
> > Spacemit folks, I assume you weren't planning on taking the
> > extensions.yaml stuff via your tree? If you weren't, I'll grab it once
> > the question about b is answered.
>=20
> sure, please take extension stuff which are patches 6-9, for 1-5, it's
> all about adding support for SpacemiT K3 SoC, to avoid petential conflict=
s,
> I wouldn't mind if you also taking them? then I can handle the rest 10,11=
 for DT

Stuff for spacemit is either for you or for the relevant subsystem
maintainers. You're probably safe enough taking the
timer/interrupt-controller stuff if the maintainers don't apply it in a
reasonable period, it's not abnormal for those in particular to go via
the platform maintainer in my experience. Just be clear that you have
done so. I'm only interested in taking 6-9.

--xUPru1lBOhmdPMEM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWbEXAAKCRB4tDGHoIJi
0v1dAQCafQYTWiGoSJPD2C3gwhnu05KfEBJ3q6AZTkjohRvudAD/foVWQs+/lj8U
CTtVpHi8NR/uKI23LWrPTtpjaG0dSgo=
=4H5t
-----END PGP SIGNATURE-----

--xUPru1lBOhmdPMEM--


--===============4697888015487703759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4697888015487703759==--

