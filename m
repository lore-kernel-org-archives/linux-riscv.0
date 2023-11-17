Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D3C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPBDTzc8viU/aiqCPWfNqTT2idcmjGJlDHHEgoAsBOQ=; b=idvZ22y2DIy61n9YY4K/EMeAni
	9C6tVD3Z7R3nbripsoEdwmnnMpfAnyDIxM10HaWo36+CHvfVXehLW81joziXxmduDIWg8rNZ/u/h7
	nRVJJfPv6RzMsUmHiphqqJENDUdxJc1dWo9INNz8cO4u90HUHIoSEe2puyeHyQmQHWUzmfAgNgdqP
	cstpBzh70YLZg+0t4yTtrUn/1tNZ0EFF97Bc2sSlYFeMOpD/mdZzN9+HKzkukZnX1N4M20afE+cwW
	xK/biqdeP+LCtf8B+n3iqlN7v4hYjRCmRsK8c3ck++6WWuC/NZ7NtCx/KGvDUI+7DMPNok/qMiFkW
	UCS0TRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3zrJ-006jtI-2A;
	Fri, 17 Nov 2023 14:30:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3zrD-006jsa-0k
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 14:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAF4861B04;
	Fri, 17 Nov 2023 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8170DC433C8;
	Fri, 17 Nov 2023 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700231405;
	bh=Z5V1WAiAWbPaSydno6O9LOxlTlu6ntJKngism5iAvgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkJmHaOUf4gPzCUHJlnpPPneJsVwb+9w7Oq3B4aoBdzb9hqTULp1gHsctr16NaDk3
	 +uxcGf1SvZGUJqjG3+l6aEitgeDkV4R02MbQFlIJSI4D/8ke6aqydvblKLzr3PT5Yq
	 s62E7VMJrSTMPhUsxs3NPx1GPNy6zuNIRBFV0Hwf+KrfjCe1cWLXc5pu0Fgbi3nn0p
	 wGi+n3xEQwQTEu2XHcRCZMxM6Zizowm8oFUWAzyzj6frG20WpKrRFAxmv4Yn4e41+5
	 krUd/SRRzc6JlRojIoj4bM1URy9VRhTwm5XkVupayCaH3PmDCgC6m50TdmhpZ6EWg+
	 By9k48Fh+024g==
Date: Fri, 17 Nov 2023 14:30:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Message-ID: <20231117-kindred-manor-863549870bcd@spud>
References: <184ab92d-9246-43e4-a40d-465d51208585@linaro.org>
 <IA1PR20MB49532AF0A7C6DA5A2184B250BBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49532AF0A7C6DA5A2184B250BBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_063007_378245_4008DE5F 
X-CRM114-Status: GOOD (  22.63  )
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
Content-Type: multipart/mixed; boundary="===============5656225221356052806=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5656225221356052806==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Zw1o4HV3vYXGo0w"
Content-Disposition: inline


--4Zw1o4HV3vYXGo0w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 08:30:21PM +0800, Inochi Amaoto wrote:
> >
> >On 17/11/2023 06:07, Inochi Amaoto wrote:
> >> The timer registers of aclint don't follow the clint layout and can
> >> be mapped on any different offset. As sg2042 uses separated timer
> >> and mswi for its clint, it should follow the aclint spec and have
> >> separated registers.
> >>
> >> The previous patch introduced a new type of T-HEAD aclint timer which
> >> has clint timer layout. Although it has the clint timer layout, it
> >> should follow the aclint spec and uses the separated mtime and mtimecmp
> >> regs. So a ABI change is needed to make the timer fit the aclint spec.
> >>
> >> To make T-HEAD aclint timer more closer to the aclint spec, use
> >> regs-names to represent the mtimecmp register, which can avoid hack
> >> for unsupport mtime register of T-HEAD aclint timer.
> >>
> >
> >I don't understand this reasoning. You had one entry, you still have one
> >entry. Adding reg-names (not regs-names) does not change it.
> >
>=20
> If no "reg-names", all the register of ACLINT should be defined. However,
> T-HEAD aclint timer of sg2042 only supports mtimecmp register. If no extra
> prompt is provided for the SBI, it will fail to recognize aclint timer
> registers when parsing the aclint node with one reg entry.
>=20
> There is another way to avoid this by using an empty entry to identify
> unsupported mtime, but Conor have already rejected this. See [1].
>=20
> Link: https://lore.kernel.org/all/20231114-skedaddle-precinct-66c8897227b=
b@squawk/ [1]

Perhaps you misunderstood my suggestion. I was looking for _both_
registers to be defined in the binding as well as adding reg-names as a
required property. Doing what you have here might work for your use
case, but does not make sense from a bindings point of view as there is
no way to describe the mtime register, should it exist in another SoC.

Cheers,
Conor

--4Zw1o4HV3vYXGo0w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVd46AAKCRB4tDGHoIJi
0n79AQDFrauiidg4Z18gElGE0Gk9HHl1f4oB5rhwApCisLPPqgD/SIAWWeTdv3ff
XOmoNLUC/tzBk6stx6iBfT+MgLRvjgY=
=7L3W
-----END PGP SIGNATURE-----

--4Zw1o4HV3vYXGo0w--


--===============5656225221356052806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5656225221356052806==--

