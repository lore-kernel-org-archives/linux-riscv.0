Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF3AC36001
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m25AZCEyrW9phYWnupXOEWcBRTpalnpONM6sH9vYOIo=; b=LU6OM7aJ7oBu9D/S2K++NqkIoU
	+ODRNdJ99NxH2Ej8zfBVt2A9XCnAsjO14m2wOCu4hpsGMIvz9DO8DhYHVGPpwut0ulFUpSZTQFjd/
	b+yLpD3+I4vsIUNtZmnLot7bX6ZHkOgRoBePECCiMniF4gI1CExR/FrP1QY7AkvLBVL1A8LRFZt9U
	7jem+XgugQeU8ajwGTwCCIn9G88MQxUwgttGDtapGu1M07FmBuBuEZWiqhMhVL4U5J7wmDwMz4ZOq
	Plh2TnVjsYZT+JtyoGz4QDFV+HHQSfhCKvnpPAlBgQN39gZChua2wnSt2akYM3XfIIc8HInNRONsK
	Dld1ur2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcdA-0000000ExPC-0JOF;
	Fri, 21 Mar 2025 13:41:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcd7-0000000ExOL-2YVe
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 13:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D28F0A4510B;
	Fri, 21 Mar 2025 13:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348FAC4CEE3;
	Fri, 21 Mar 2025 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742564503;
	bh=eq+z2NNjf7FTukWVpkQ2qGB887ccsImFLhwuR8Nvkig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzHYr6/U/ZegOdlAf62w1ezW1sGmXONWKXfuFieNOPMJqwKJHtgyig3pZhX94c0ES
	 7XtlQUDhKntSUlcrVgGUPR6aLFzafbJ372aIKmdgT6aUv5T9HMVCVfqt9tV14HcYoA
	 rQs/E5mRdoOaczY4PFC6LspPLGY0caJtGl3hTwavq6fJnS71PlDL1ZS7Yx5NhY4ooN
	 5OcLK1oHBol6POy9lF5riGyC5/xFFcWQij2uaTSEO/+4YkN+C29YrNLrFyPkVLakTx
	 qK52FLMCkcTU9Jm1TdvG76AywsFvf8nVdxxIRIYYuzq9uDFE3YKTozaOHwNkP40s8s
	 cY+0AYcTmBrJA==
Date: Fri, 21 Mar 2025 13:41:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Message-ID: <20250321-pacifier-varied-bbb1cae00182@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311-backdrop-porthole-440ae005e8fa@spud>
 <SA3PR04MB893164FCD6C4CB8924FC8DE583D82@SA3PR04MB8931.namprd04.prod.outlook.com>
 <20250320-uprising-couch-0af012a1fee6@spud>
 <f0dd950a-02a7-402b-a08e-015db458b273@kernel.org>
 <SA3PR04MB893147FE3E09B43DA41A7DF283DB2@SA3PR04MB8931.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SA3PR04MB893147FE3E09B43DA41A7DF283DB2@SA3PR04MB8931.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_064145_773153_3D5696EA 
X-CRM114-Status: GOOD (  28.97  )
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
Content-Type: multipart/mixed; boundary="===============1260579547819296293=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1260579547819296293==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jB7oSH4WdargtE72"
Content-Disposition: inline


--jB7oSH4WdargtE72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 11:29:27AM +0000, Pinkesh Vaghela wrote:
> On Fri, Mar 21, 2025 at 3:07 PM, Krzysztof Kozlowski wrote:
> > > On Thu, Mar 20, 2025 at 10:39:52AM +0000, Pinkesh Vaghela wrote:
> > >> On Tue, Mar 11, 2025 at 11:38 PM, Conor Dooley wrote:
> > >>> On Tue, Mar 11, 2025 at 01:04:22PM +0530, Pinkesh Vaghela wrote:
> > >>>> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> > >>>> P550 CPU cluster and the first development board that uses it, the
> > >>>> SiFive HiFive Premier P550.
> > >>>>
> > >>>> This patch series adds initial device tree and also adds ESWIN
> > >>>> architecture support.
> > >>>>
> > >>>> Boot-tested using intiramfs with Linux 6.14.0-rc2 on HiFive Premier
> > >>>> P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> > >>>
> > >>> There's no git tree in your MAINTAINERS entry, nor mention here of
> > >>> what the story is going to be in terms of sending patches to Arnd.
> > >>> Who is going to be doing that?
> > >>
> > >> We are not currently set up for sending signed pull requests, so for
> > >> now we plan to send changes to Arnd as separate patches.
> > >
> > > Undesirable, but sure. You didn't answer the first part of my question
> >=20
> > Just to clarify - separate patches as separate postings to soc@ after t=
he review
> > was done on the lists and then you applied them to the tree Conor asked
> > below, right?
>=20
> Correct. Once the patches are reviewed, will send separate patches to @soc
> and then apply to the git tree.

No, that's the wrong order. You apply reviewed patches to the git tree,
they then appear in linux-next, after some time soaking there, you send
a PR (or in your case patches) to soc@kernel.org, usually around rc6 or
rc7. Fixes get applied to a different branch and can be sent at any
time. I expect both branches to appear in linux-next.

Bear in mind that patches for this SoC might be sent by other people,
for example me if I find some issues, and you'll need to forward those
on to soc@kernel.org on top of whatever work you're doing to bring up
the SoC.

> > > though, and there's no git tree listed in your v2 series. That part is
> > > not negotiable, you have to have one and get it included in linux-nex=
t.

--jB7oSH4WdargtE72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ91skAAKCRB4tDGHoIJi
0uEXAQCPJJkOErMXPJI1hMZw+JZzaLhhY2ew43wR9BFZRSWvTQD6A03L62ZGb0HW
nyCNJA8Q+NY5eQpX+dyXYdiMkC6QAg4=
=sX2X
-----END PGP SIGNATURE-----

--jB7oSH4WdargtE72--


--===============1260579547819296293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1260579547819296293==--

