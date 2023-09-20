Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A9DCE79DE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukiUGryDsO7ith3f3ulMuhv1bY7b8h50V5MY1WO0dXQ=; b=PgQPwytAKUGsNFB3A262H5Va0Z
	R18fxHurL0xr0jc6W1m2o4mQoFZas6e3tt9R0uQlaOm61EbC7QnMs1L0i2XN8nuQMWI6h5+U40NFG
	dqYil1/Tw6s8XC607JwPL2Nx11bWeAiPQb+ZLzw3oYqtqEK21msVVDs/y09aNqb//7bi64zIWCZtO
	rBOEMphP+Qyb7tRW1Dwp0qUOY4vdyU1aHoIrmf3fFnJdaf+2o1bZjXY8kkSdgwDB6xkOTCMdfg6rE
	vrAzxsUBr9w/GY/fuu4ilVmUsUs6pReMdje6QNLNRDnTLOYK7CoIZ16sw4iv6HeqfZSZPx9HzhDvq
	v6AeYgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyYj-003QLf-1O;
	Wed, 20 Sep 2023 14:52:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyYf-003QKq-2C
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 14:52:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C5D32CE1B7F;
	Wed, 20 Sep 2023 14:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0126C433C8;
	Wed, 20 Sep 2023 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695221522;
	bh=+2j3nces5C2Y6G0w4dr7sRGrgDbYjuDpUw6pC0lKXLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NygEtZrk84lRg6zKqBNWyp3ecx3eq9+OEYuaKVfg2N7CTM0PFuCY+ay2Nts8XzVf9
	 q4P86pfVq6bOsFt9RzKQMFNwbNhIRkmKK/+yQxcmlNfb/bwcOf0le3K5HVsWDaus7x
	 8rG61cADEugt8Xq3G2sh+KU2IF3kD/RDzsV3kbHi3tlwbwEUhyOAI3/FNNgC8WphQG
	 IQTQtfOjcvDjO5g1asyVSoMh/huLKRvq68pCPMiIyIssh7pZgVN2npFfCq6+p2q2i6
	 29gO3GTdmMadV259kKNdlXHvnW/wCxAYFhp+wR/X5lodXFNBFyRhiuY1kExAraLatu
	 HWAE1QULyRqTA==
Date: Wed, 20 Sep 2023 15:51:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230920-992a56b66366f3c0591a6a94@fedora>
References: <66b988f0-39fc-2ed3-8f38-151d6a3c9e52@linaro.org>
 <IA1PR20MB49536BFE1254ADEE0E795A26BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20230920-8503c6365655d3ef3dadfd53@fedora>
 <CAK9=C2WWzc_M49-S+Gi509a6-gk3-89sAZn-ZCRhsQc4JwUpoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2WWzc_M49-S+Gi509a6-gk3-89sAZn-ZCRhsQc4JwUpoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_075206_105530_01D0602E 
X-CRM114-Status: GOOD (  33.49  )
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
Content-Type: multipart/mixed; boundary="===============3724199621793680515=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3724199621793680515==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lO3IQKh1/e514qwn"
Content-Disposition: inline


--lO3IQKh1/e514qwn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 08:08:49PM +0530, Anup Patel wrote:
> On Wed, Sep 20, 2023 at 6:28=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Sep 20, 2023 at 08:40:07PM +0800, Inochi Amaoto wrote:
> > > >On 20/09/2023 14:15, Inochi Amaoto wrote:
> > > >>> On 20/09/2023 08:39, Chen Wang wrote:
> > > >>>> From: Inochi Amaoto <inochiama@outlook.com>
> > > >>>>
> > > >>>> Add two new compatible string formatted like `C9xx-clint-xxx` to=
 identify
> > > >>>> the timer and ipi device separately, and do not allow c900-clint=
 as the
> > > >>>
> > > >>> Why?
> > > >>>
> > > >>
> > > >> If use the same compatible, SBI will process this twice in both ip=
i and
> > > >> timer, use different compatible will allow SBI to treat these as d=
ifferent.
> > > >> AFAIK, the aclint in SBI use the same concepts, which make hard to=
 use the
> > > >> second register range. I have explained in another response.
> > > >
> > > >What is a SBI? Linux driver? If so, why some intermediate Linux driv=
er
> > > >choice should affect bindings?
> > > >Best regards,
> > > >Krzysztof
> > > >
> > >
> > > SBI (Supervisor Binary Interface) is defined by riscv, which is an in=
terface
> > > between the Supervisor Execution Environment (SEE) and the supervisor=
=2E The
> > > detailed documentation can be found in [1].
> > >
> > > The implement of SBI needs fdt info of the platform, which is provide=
d by
> > > kernel. So we need a dt-bindings for these devices, and these will be
> > > processed by SBI.
> > >
> > > [1] https://github.com/riscv-non-isa/riscv-sbi-doc
> >
> > Yeah, this is the unfortunate problem of half-baked bindings (IMO)
> > ending up in OpenSBI (which likely means they also ended up in QEMU).
> > This T-Head stuff is coming across our (metaphorical) desks, so we are
> > obviously going to try to do things correctly. I may end up speaking to
> > Anup later today, if I do I will point him at this thread (if he hasn't
> > seen it already).
>=20
> RISC-V ACLINT is one of those unfortunate non-ISA specs (like
> SiFive PLIC) which is implemented by various organizations but
> not officially ratified by RVI.

Yeah, I brought this stuff up at the weekly pw sync call, and Paul
pointed that out.

> The SiFive CLINT has flexibility related limitations which makes it
> not useful for multi-socket and mult-die systems. The SiFive CLINT
> is also not useful for systems with AIA because with AIA M-mode has
> a new way of doing M-mode IPIs. Due to this reasons, the RISC-V
> ACLINT spec breaks down traditional SiFive CLINT into two separate
> devices namely mtimer and mswi. This allows platforms to implement
> only the required set of devices. The mtimer as defined by the ACLINT
> specifications also allows platforms to place mtime and mtimecmp
> registers at different locations.
>=20
> Refer, https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
>=20
> We need a separate DT bindings document for ACLINT MTIMER
> and ACLINT MSWI because these are separate devices. The
> Sophgo sg2042 SoC should add their implementation specific
> compatible strings in this document.

If the spec isn't frozen, I'm not accepting a binding for the "generic"
version of it. Bindings for this specific implemtnation are okay.
For sure though, squeezing this into the sifive,plic binding isn't
appropriate.

What was pointed out, I think by Samuel, that the reason that this may
need to be split is the fact that there are many possible MTIMER
register ranges & possibly sswi stuff too that would need to be
differentiated.

>=20
> Regards,
> Anup

--lO3IQKh1/e514qwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQsHCAAKCRB4tDGHoIJi
0oIxAP4l9Y+OWxR43uIh16s9q+QkJcVDOsWIXdpnb0KYX5AOogD/eVTeoiQKQkzL
Sdw+Zw7PIgPrS0SkTX280B840uhfswE=
=7xPz
-----END PGP SIGNATURE-----

--lO3IQKh1/e514qwn--


--===============3724199621793680515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3724199621793680515==--

