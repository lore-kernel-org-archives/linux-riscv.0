Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4043CE79CF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5l0F7JfiuOGf2rV2TtGB2jDkviFPXfZjLqoNucbUbk=; b=P1wpXYk/D4oeUJjO8uvKRUzf7z
	AANLpmiJQnE3nDL0xlA4Dxk4ZfOmy76Zbuiwr5oYDeWkyevWsbIP9QkKVpMMfyt6MXNq0WCMqR/1g
	OW9lMLQK38a2qUVbAHkwN8S2K7INVhbpt2LyplUgq5G8dvIJ5Sjec1zYyHqJCghCrY33EYPyc98Xq
	xlYNXPFdvO7iJcZBGS7ZPuV8hjvRtK+jI/1xtju5+W9xB+diGvh3Yf4SxeMGHF4Ppxm7CWWMiDB2n
	2vfC0jTCNe26BUoHqQ/OqZfD/2gv7mNpjHL/iyEPK75i3vNzy+wEucQgPo0Gn7LZw64cQYjvc4vAG
	RsEGr77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwmm-0036Zl-0J;
	Wed, 20 Sep 2023 12:58:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwmi-0036YD-2s
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 12:58:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFAF661B5A;
	Wed, 20 Sep 2023 12:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833C0C43395;
	Wed, 20 Sep 2023 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695214707;
	bh=JEcE762TPALh3A2MTMmeFILTtcz7SC6kjuHzb4W9xBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWIIorXFUwbp4n1PIUTjm8jETvlYxVQNNtidWIl9OCuFKTnimuDLKXetpPjVxyyL/
	 1os2BKYSTsRnAgAxiFH4rfWxZ3gDKKRVjvVw2lhzMV4s4bdfoU05XBIEMaip91LbNr
	 J7iNPzDxU6FXqQAYeun6sjlWZGXCz/WjE+vRqsj1tgBCR4xq/ZrMgsoIgXGkH+zBam
	 2D/hPRhENvAtkAiyy1VCfh+8Z4BFqG1GB41T13I7UUtcsX6+r6XTYQ6jFqKSiSPTqH
	 SrEJun/lBf+9ylKUR9jcfBfRfeXs1GfNMo6pG4yICwc8NtGX9jqjj1J9rcddaam51h
	 ZXQLqdwP+24Tw==
Date: Wed, 20 Sep 2023 13:58:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230920-8503c6365655d3ef3dadfd53@fedora>
References: <66b988f0-39fc-2ed3-8f38-151d6a3c9e52@linaro.org>
 <IA1PR20MB49536BFE1254ADEE0E795A26BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49536BFE1254ADEE0E795A26BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_055829_016523_73891281 
X-CRM114-Status: GOOD (  21.10  )
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
Content-Type: multipart/mixed; boundary="===============3706928802948523691=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3706928802948523691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uwbkuouaUi9cdxhL"
Content-Disposition: inline


--uwbkuouaUi9cdxhL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 08:40:07PM +0800, Inochi Amaoto wrote:
> >On 20/09/2023 14:15, Inochi Amaoto wrote:
> >>> On 20/09/2023 08:39, Chen Wang wrote:
> >>>> From: Inochi Amaoto <inochiama@outlook.com>
> >>>>
> >>>> Add two new compatible string formatted like `C9xx-clint-xxx` to ide=
ntify
> >>>> the timer and ipi device separately, and do not allow c900-clint as =
the
> >>>
> >>> Why?
> >>>
> >>
> >> If use the same compatible, SBI will process this twice in both ipi and
> >> timer, use different compatible will allow SBI to treat these as diffe=
rent.
> >> AFAIK, the aclint in SBI use the same concepts, which make hard to use=
 the
> >> second register range. I have explained in another response.
> >
> >What is a SBI? Linux driver? If so, why some intermediate Linux driver
> >choice should affect bindings?
> >Best regards,
> >Krzysztof
> >
>=20
> SBI (Supervisor Binary Interface) is defined by riscv, which is an interf=
ace
> between the Supervisor Execution Environment (SEE) and the supervisor. The
> detailed documentation can be found in [1].
>=20
> The implement of SBI needs fdt info of the platform, which is provided by
> kernel. So we need a dt-bindings for these devices, and these will be
> processed by SBI.
>=20
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc

Yeah, this is the unfortunate problem of half-baked bindings (IMO)
ending up in OpenSBI (which likely means they also ended up in QEMU).
This T-Head stuff is coming across our (metaphorical) desks, so we are
obviously going to try to do things correctly. I may end up speaking to
Anup later today, if I do I will point him at this thread (if he hasn't
seen it already).

--uwbkuouaUi9cdxhL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQrsaQAKCRB4tDGHoIJi
0gYFAP4j2wdTtFTv0vOJOXuZqtSvyvpNj8FZ4JrRTM69BgGsVQD+J4NLAm5BLqkT
GTQ6s+Dy7mcY2pMniUqr/VphB228SwA=
=fsWb
-----END PGP SIGNATURE-----

--uwbkuouaUi9cdxhL--


--===============3706928802948523691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3706928802948523691==--

