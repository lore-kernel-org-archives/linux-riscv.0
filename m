Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E28C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 17:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OjMtAmpGTiN12u469eXgc1P7eC3FP83kL2X+MxSZKQ=; b=wtrMwAtSQ5cuFZZrKtskamgRcM
	S4Q8rBu94hZTBxd8e7okSQZMRMlNYGrbozwbmLBcgTgVLus/taug1Rg2uweqMgvowJV8jAf6pyq1S
	GyOQ8e1A7+iBCpUs+ZX+nH6oXXBJvnQoHbgCpDDPe6FiIZmklQmOQGVmbw5hommx3i/aDle1Oa7Tq
	qH3sNiqKnCTbejpItUcW48uB782XPTKy/t4evOeBTCHNDC/QfXrKD0dn0h6acU9vLb4KPtnClilav
	Xt9yefMCBWmUKCsRnyG4wiPZMfCa5b48Bcz12wFXI++IaQVsjggS5uAVcmESaZxKzaQMN+eSXbKnf
	nisb/umA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lK0-004lGO-2f;
	Mon, 12 Jun 2023 17:27:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8lJx-004lDz-2E;
	Mon, 12 Jun 2023 17:27:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0D362089;
	Mon, 12 Jun 2023 17:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA9FC4339B;
	Mon, 12 Jun 2023 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686590832;
	bh=F/xfsUaVL/B3Qc4E2prwYl5t9MVB1CSnSrmP09x8b5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzTPTpPTd1To2ISnxdmYL8ef9TJZSAU9PdNRTmq/k9VtENcockLRuxRDPcn5NPxky
	 +zFFOaM8mFfDezhQPlKMNQ794b98mqyxxbYjjDmM211ai4i6uAsjYj3u9/r9XXQbSG
	 5boDRT4BO0vgX/nLPtzD4+L7AC9NI/Sclrq86Cn3oeaqm83Q7eKMkhSX8raJTWpp77
	 ofJLljmbbsdvCMYM7s8hkr0AmvajAn1P2Nsfl1PjyjwDpYUn8qXTFSbL83/iEA2R8d
	 ORGGVnJOC2Vkv72Hu8YqLkRMwhntgG6JRFJUJCQb3u6+WC/2WcHbGbv6goIdrv0UsT
	 3XFgo4p7+BTlg==
Date: Mon, 12 Jun 2023 18:27:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
Message-ID: <20230612-manhole-awoke-599b8ff72edb@spud>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com>
 <20230612-wriggle-remindful-89d5105c94ee@wendy>
 <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_102713_766832_3F5F13AE 
X-CRM114-Status: GOOD (  17.35  )
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
Content-Type: multipart/mixed; boundary="===============4919672329709628750=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4919672329709628750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YndCLQNRUhwsHafT"
Content-Disposition: inline


--YndCLQNRUhwsHafT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:17:20AM +0300, Maxim Kiselev wrote:
> Hi, Conor
>=20
> =D0=BF=D0=BD, 12 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 10:55, C=
onor Dooley <conor.dooley@microchip.com>:
>=20
> ...
>=20
> > The RISC-V patchwork automation is complaining about this patch while
> > running dtbs_check:
> > arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: thermal-zones:=
 cpu-thermal: 'trips' is a required property
> >         From schema: Documentation/devicetree/bindings/thermal/thermal-=
zones.yaml
>=20
> I didn't add 'trips' because I'm not sure if they should be the same
> for the D1 and the T113s.

I'm sorry, but I am of no help there. Perhaps some of the Allwinner devs
can help you on that front.

> Maybe it's better to drop 'thermal-zones' from this patch and add them
> later in separate patches
> for T113s and D1?

Does it pass dtbs_check with the thermal-zones removed?

Cheers,
Conor.

--YndCLQNRUhwsHafT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIdVaQAKCRB4tDGHoIJi
0icUAQDwugDXiKIix1q9MpKsiXdSHj6OKofB7WNjaX+WRaIpQwEAkCWK9ab2/bj7
4IMW9hBtFvXjJov/I8+GOF9h4yNFVgM=
=fE32
-----END PGP SIGNATURE-----

--YndCLQNRUhwsHafT--


--===============4919672329709628750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4919672329709628750==--

