Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1437EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QqHescCt3OTqfwUqtjSSw4iq1iPVSfSyLifQZ+sdq4=; b=GgANBCov67UI73kb2wAH6qrrwr
	qoTRkcdatdAFoszUL4ft8y1o3gwIs7vo1nB38Iit7EQKPzEwe71XTZmgMvUFVnLhtAFK5iis3vnzq
	nko2kgzPLy0bBFn13K7CUxPBpLS3im3JstkBmppM1OvI8qq6hP0/xr28NAdfZ1r2dW/Lw1VXBQ8tL
	HS15OVysI3DdQi9t7TgQFgIpmmgN1t0qEsrlXeeJXicut1SJnggg9ITGQ8grA85IIPlW8P3PZvLvo
	vSiBtfMkr/tfLEDna0w0AZBU1K2Y1h7uNNhwM7efb4FGuz1C1r95YHTRPE3m5SP8poYif25pHCMD1
	5wwR010A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDocp-00AZK2-1F;
	Mon, 26 Jun 2023 15:59:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDocl-00AZJ7-2f
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:59:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22CF360EBB;
	Mon, 26 Jun 2023 15:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FABC433C0;
	Mon, 26 Jun 2023 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687795170;
	bh=IQy0+rnLS6uTBv0EQVvmuZ3y+QP3gsARAmLkqk/b4kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WChK07gxHxlkUAdHaQUuFSKrcSq/wooKcOZN4Wqo3r/R5VqR9Y5jOOllsGShR0FmV
	 rvb7pRAQgTv27O7QSwY9a+xH1eSa5+h7R6IRK+R/KJC+e3jbxn4U0LvI9K+ccniiXJ
	 bw2YN8wOjOo5mTQfpaSauX2wyOzESZNHnKmkLRTFglpnRxpLCW/SjAbYnL7cGpaEsA
	 OT63iUOndvI02HzYaWOeecNHb5QagjWadjZ75y2gvemNz4JdRxPLJzk050Hx7iNjg9
	 P96esRBXLMsJFnV0BKdzBnlSlH72d+5Y5ZYoN106gzSSv2dpOpkLnuTREEpC2OCmI8
	 au1letHwjKsWA==
Date: Mon, 26 Jun 2023 16:59:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v1 3/9] RISC-V: shunt isa_ext_arr to cpufeature.c
Message-ID: <20230626-aged-premiere-5b68eb51d6e1@spud>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-endowment-crave-d72f9423c5b3@wendy>
 <20230626-79b06f642aa2996098c9353d@orel>
 <20230626-2b8f42ace039368c8e917393@orel>
MIME-Version: 1.0
In-Reply-To: <20230626-2b8f42ace039368c8e917393@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_085931_949996_F8FDAAB4 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: multipart/mixed; boundary="===============3095945400077675198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3095945400077675198==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XxbStqRRvISDqh90"
Content-Disposition: inline


--XxbStqRRvISDqh90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 05:44:18PM +0200, Andrew Jones wrote:
> On Mon, Jun 26, 2023 at 05:29:04PM +0200, Andrew Jones wrote:
> > On Mon, Jun 26, 2023 at 12:19:41PM +0100, Conor Dooley wrote:
> ...
> > > +const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
> > > +	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> > > +	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> > > +	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> > > +	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> > > +	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > > +	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> > > +	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> > > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > > +	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> > > +	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > > +	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> > > +	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > > +	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > +	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> > > +	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > +	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> >=20
> > I think we can either drop this null entry or drop the count variable
> > below. My preference would be to drop the count variable, and always
> > loop to the null.
>=20
> Eh, never mind, the entry isn't null, it's "". Why do we have that entry
> though? I guess it can be dropped?

It may just be cargo culting? The commit that added this, a9b202606c69
("RISC-V: Improve /proc/cpuinfo output for ISA extensions") [1], added
an empty array other than this element & perhaps it was just not removed
when real entries were added? Symptom of adding a feature without an
actual user (multiletter extension) perhaps?

1 - https://lore.kernel.org/all/20220314203845.832648-1-atishp@rivosinc.com/

--XxbStqRRvISDqh90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJm13QAKCRB4tDGHoIJi
0pu9AQDZP8p3Xqaor1zTCjruaNDsJup5DON/khS7K0xbZqYG6wEAgFvgKH1mc5D1
E6+fR9GyMlWaoQwnXMURKfrjzO9ahwI=
=MFMy
-----END PGP SIGNATURE-----

--XxbStqRRvISDqh90--


--===============3095945400077675198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3095945400077675198==--

