Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA4C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlPHOKHl04iRoG4hoGzfLCqqYn1FgvTyXT4BvaXu9f8=; b=v1iUZdqu9k7vSN4GibBGGpvwPZ
	CbUs7iiDO1d3pd40tKeDxQb4n3kjWzC4OizqY42dFX+7thapccAAqzfngVtZfBO4d7q5BYVAPEpPZ
	zsEKH76EnCUlvERPzdJ1YHWaAA0GR/clOCMc6cY3PrVaGOy4qFKOaUB7zuM34duT+B9fYA2gnkukd
	p4xvZnt937Pzn+fn5WNxC6SvhUZ5PjocdC3raNhL9DvinQJYymqo6x74NPYARydvwaxTbjMo2dBYD
	0RDdprlTnSpCY6tchH0iXCsrlUPgqxAf1NmguaJO00jCU+HuaIip0YXm1wCWrbEu1e+xfBn+9bYxr
	I+n6bmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNvFT-00000000US2-1or9;
	Sun, 30 Jun 2024 14:09:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNvFP-00000000UQy-2Wzg;
	Sun, 30 Jun 2024 14:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66AE8CE0ADF;
	Sun, 30 Jun 2024 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1F4C2BD10;
	Sun, 30 Jun 2024 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719756578;
	bh=/xCCulK2LDvM6T4DDK3IaPZekIJJ7Gq+2ykmVNaX2YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIpyXJeDjyxKeeaNxtVJX644yi5CswNk4QOjMTn10ZTy8z1URm5QSFhuiPgNw2BhM
	 3rkcWZCDMNXDAjRewXOwPJmp/XooFrSToztonDGy77Mh6n25fc2TmQ65BCxE8Miet/
	 OcWwcQgbQMo263ZlWTOwuxWs5mIwksFrbnFxNiHzV88do6qwZzHOknD66IVKY3GNQe
	 ragVgaD33bELePr9TIUPh/g7LMsGZ/8oEGcwGWCc1M5Mlep1ngwSknu6qtSFHxrJso
	 p5JP0fHbVDZtLXOf5KI2fggU9uw8qIpOu1AmEgHLyvNZ2wnse79/850GDego4u9XZz
	 tk/wLpivtFLTg==
Date: Sun, 30 Jun 2024 15:09:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240630-caboose-diameter-7e73bf86da49@spud>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
 <20240628093711.11716-3-yongxuan.wang@sifive.com>
 <20240628-clamp-vineyard-c7cdd40a6d50@spud>
 <402C3422-0248-4C0F-991E-C0C4BBB0FA72@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <402C3422-0248-4C0F-991E-C0C4BBB0FA72@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_070944_030617_54DFCC6E 
X-CRM114-Status: GOOD (  27.15  )
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
Content-Type: multipart/mixed; boundary="===============0662094152955235440=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0662094152955235440==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VstelAVsSG0eBIgw"
Content-Disposition: inline


--VstelAVsSG0eBIgw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 02:09:34PM +0100, Jessica Clarke wrote:
> On 28 Jun 2024, at 17:19, Conor Dooley <conor@kernel.org> wrote:
> >=20
> > On Fri, Jun 28, 2024 at 05:37:06PM +0800, Yong-Xuan Wang wrote:
> >> Add entries for the Svade and Svadu extensions to the riscv,isa-extens=
ions
> >> property.
> >>=20
> >> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> >> ---
> >> .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
> >> 1 file changed, 28 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b=
/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> index 468c646247aa..c3d053ce7783 100644
> >> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >> @@ -153,6 +153,34 @@ properties:
> >>             ratified at commit 3f9ed34 ("Add ability to manually trigg=
er
> >>             workflow. (#2)") of riscv-time-compare.
> >>=20
> >> +        - const: svade
> >> +          description: |
> >> +            The standard Svade supervisor-level extension for SW-mana=
ged PTE A/D
> >> +            bit updates as ratified in the 20240213 version of the pr=
ivileged
> >> +            ISA specification.
> >> +
> >> +            Both Svade and Svadu extensions control the hardware beha=
vior when
> >> +            the PTE A/D bits need to be set. The default behavior for=
 the four
> >> +            possible combinations of these extensions in the device t=
ree are:
> >> +            1) Neither Svade nor Svadu present in DT =3D>
> >=20
> >>                It is technically
> >> +               unknown whether the platform uses Svade or Svadu. Supe=
rvisor may
> >> +               assume Svade to be present and enabled or it can disco=
ver based
> >> +               on mvendorid, marchid, and mimpid.
> >=20
> > I would just write "for backwards compatibility, if neither Svade nor
> > Svadu appear in the devicetree the supervisor may assume Svade to be
> > present and enabled". If there are systems that this behaviour causes
> > problems for, we can deal with them iff they appear. I don't think
> > looking at m*id would be sufficient here anyway, since the firmware can
> > have an impact. I'd just drop that part entirely.
>=20
> Older QEMU falls into that category, as do Bluespec=E2=80=99s soft-cores =
(which
> ours are derived from at Cambridge). I feel that, in reality, one
> should be prepared to handle both trapping and atomic updates if
> writing an OS that aims to support case 1.

I guess that is actually what we should put in then, to use an
approximation of your wording, something like
	Neither Svade nor Svadu present in DT =3D> Supervisor software should be
	prepared to handle either hardware updating of the PTE A/D bits or page
	faults when they need updated
?

--VstelAVsSG0eBIgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoFnHQAKCRB4tDGHoIJi
0ndoAP93+tDDtA9REzbCkIEltVoxfZckvSQWizwwYg211bfpVwEAr32+ixQYgkK/
rHueZ5hB231ndT82y+Y9rNscAzTMUwA=
=tz48
-----END PGP SIGNATURE-----

--VstelAVsSG0eBIgw--


--===============0662094152955235440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0662094152955235440==--

