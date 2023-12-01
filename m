Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C701C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+V9HAbsCC3/ng9IcY3dM2Ui+1Kv86xovHaES72pXhU=; b=qtV3P6MKQdpJpUvH/S55XwgpZU
	vnBMQktcyg5TdZUImv7q73d7PHry/2yEMSHra0BlHZBLnzS4da9k4BOCIAplsmtNPCD6LoEG/0CH2
	XO8lhW0EItJeB5KL9cy5KqnKAwKiLYcIUvOYfhMxZY/Y5l+IS4CuOI/EhjpUu1kXE7P0qBbIn8eqK
	9TA7Re5kpGllgVlQekdCkLwNCc/ISoOXN6wCZXxtQbj6g0qrgtbjl3IzpiQBNoIZVqQljR4mAA/D9
	IlvzReU4fpLEa/YMFPHSLGF5gmsANR8zmF4d6Gx8Oy2Ww0+/IfZFkjYBCoW0kBNs1wpdP7M9xNTp2
	LpSE9aNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r96Gb-00EApd-04;
	Fri, 01 Dec 2023 16:21:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r96GX-00EAo8-1p
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 16:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE89AB84773;
	Fri,  1 Dec 2023 16:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2155C433C9;
	Fri,  1 Dec 2023 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701447679;
	bh=cDugfAWAT5G/xGu+06cvSWYQg2BA2F/CfT8nBweNIWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3kvIYkTxGaQHJYWqQl2anjmpLtxGpDBZdjmFBPmQmk0BDa0Gqn4lisY5Qhyv+oYm
	 bv+0lVe2gDTusYqqFTJiZ3dQij9DbQRiRjF0BS/ON3ePJRxmedZX3Ha7ldzjWX0j/d
	 WBF/VvF266fomO+k8mjfQeNH3cKFjUnNbUTaeskYLNw9tXxxChyaAUpdltz33gnje5
	 ueJrUMoVNKsXfx8iassNDvaLpYVXhce8mEQylWobMbFBtmX2WO2WmwaRgcFparfv5V
	 jxOFowKbxB+rfQ8ThS0pE+U/ji05tDLqQieJRNEKcPJ0cUcfwz09vrN6qR8L8roVC/
	 qSgXfjmhL2jgw==
Date: Fri, 1 Dec 2023 16:21:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Message-ID: <20231201-nutshell-uptake-48161193c6e7@spud>
References: <20231201-strung-mandarin-110a322468c9@wendy>
 <IA1PR20MB49539E82E5C0B5CBFD889F39BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49539E82E5C0B5CBFD889F39BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_082121_920743_67DDCB94 
X-CRM114-Status: GOOD (  24.11  )
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
Content-Type: multipart/mixed; boundary="===============1558228623775441727=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1558228623775441727==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uXPxtQUqc4AkN2jk"
Content-Disposition: inline


--uXPxtQUqc4AkN2jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 04:31:38PM +0800, Inochi Amaoto wrote:
> >
> >On Fri, Dec 01, 2023 at 09:02:59AM +0800, Inochi Amaoto wrote:
> >>>
> >>> On Fri, Dec 01, 2023 at 07:21:29AM +0800, Inochi Amaoto wrote:
> >>>>>
> >>>>> On Thu, 19 Oct 2023 07:18:00 +0800, Inochi Amaoto wrote:
> >>>>>> Huashan Pi board is an embedded development platform based on the
> >>>>>> CV1812H chip. Add minimal device tree files for this board.
> >>>>>> Currently, it can boot to a basic shell.
> >>>>>>
> >>>>>> NOTE: this series is based on the Jisheng's Milk-V Duo patch.
> >>>>>>
> >>>>>> Link: https://en.sophgo.com/product/introduce/huashan.html
> >>>>>> Link: https://en.sophgo.com/product/introduce/cv181xH.html
> >>>>>> Link: https://lore.kernel.org/linux-riscv/20231006121449.721-1-jsz=
hang@kernel.org/
> >>>>>>
> >>>>>> [...]
> >>>>>
> >>>>> Applied to riscv-dt-for-next, thanks! LMK if something looks not as
> >>>>> expected.
> >>>>>
> >>>>> [1/7] dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
> >>>>>      https://git.kernel.org/conor/c/21a34e63afcc
> >>>>> [2/7] dt-bindings: timer: Add SOPHGO CV1812H clint
> >>>>>      https://git.kernel.org/conor/c/06ea2a1968a9
> >>>>> [3/7] dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
> >>>>>      https://git.kernel.org/conor/c/d7b92027834e
> >>>>> [4/7] riscv: dts: sophgo: Separate compatible specific for CV1800B =
soc
> >>>>>      https://git.kernel.org/conor/c/5b5dce3951b2
> >>>>> [5/7] riscv: dts: sophgo: cv18xx: Add gpio devices
> >>>>>      https://git.kernel.org/conor/c/dd791b45c866
> >>>>> [6/7] riscv: dts: sophgo: add initial CV1812H SoC device tree
> >>>>>      https://git.kernel.org/conor/c/681ec684a741
> >>>>> [7/7] riscv: dts: sophgo: add Huashan Pi board device tree
> >>>>>      https://git.kernel.org/conor/c/2c36b0cfb408
> >
> >>>> Thanks for the confirmation. But I suggest to revert these patches.
> >>>> Several days ago, Sophgo informed me that CV1810 series will be
> >>>> renamed. And the Huashan Pi will switch to the chip with new name.
> >>>> To avoid unnecessary conflict, please drop these patch and I will
> >>>> prepare a new patch once the renamed chip is launched.
> >>>
> >>> This is a board that exists, that you (and possibly others) have, rig=
ht?
> >>>
> >>
> >> Yes, of course.
> >
> >I dunno then. It sounds from your message that this is purely a rebrand
> >of the SoCs,
>=20
> IIRC, it is.
> FYI, Chen and Chao. Maybe you know something more.
>=20
> >so since people already have these boards, I'd rather not.
> >We should be able to support both since it's just a naming change,
> >right?
>=20
> I agree with this. If the above is true, we can just reuse the exists code
> with a different compatible name, right?

I think so? I'm not sure what the precedent really is for pure
rebrandings of an SoC.
I say for now, assume we can do that, and we can discuss it with Rob and
Krzysztof when the time comes if there is no difference between the SoCs
and boards.

Cheers,
Conor.

--uXPxtQUqc4AkN2jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoH+QAKCRB4tDGHoIJi
0grUAP0S9amy4TrGcFFu/F4s2tNM5WedtZOnPZBjxgrdKnrdJgD/ZJZEqehUxEN4
eaHuCHDQlp6ulBfBbzfKighJU6ZLUwQ=
=BD5D
-----END PGP SIGNATURE-----

--uXPxtQUqc4AkN2jk--


--===============1558228623775441727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1558228623775441727==--

