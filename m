Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ABCCE79CF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K++0TjRgJtjeq6OtmSC6VL/mpW11W+ZPjksojPZOXjE=; b=gu75svai+QYu5r9ppUH6GfGo2w
	UGiisVZLZ5JYNmrpHrB3N15R4Q61JnYsy+Q587mWKmXVo1rKLtVYiriyD4lm1AyJpdx+vNjO4jZsU
	/2VVaV7ugUz00C5jZV9eDCCB2BOPCBxphHi1Q3hk22HiyqqVQWCt0IPHQEkl4e+TAXrcqfoGiJR8V
	nmwuGDG2Bhr4fKq/rpKfiQmmiJGUIIoVeemZK36gWc9DRPsoMqgH8wVRU9BD4RF3eJaX6r7PTOxl2
	7KfI7vQ9YjpvTD9WhOvsS8avcFkuvcJnic38j7CmYopJqRzusHGUjaLcLOmOBwI+oZglMr3dJ/Ucj
	BV2A4LnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwrJ-0037Z9-2g;
	Wed, 20 Sep 2023 13:03:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwrG-0037Y3-1r
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:03:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 296FDB81D6B;
	Wed, 20 Sep 2023 13:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6BCC433C8;
	Wed, 20 Sep 2023 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695214987;
	bh=mOsDBDIOwfXwaQhf3USDdb3F9JCa//1vBpkpJd55YHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuVcOtjf5E0QnKm5GwYp4/s+Fv8bh/OeBioyoSy25ZJcD2Ci1Uit4uS3skQKjNxk6
	 WUNAeGuJVZc4XdcP0jIyMgQk7Z67VkS2Qn86YqPEOSossNMj7qF39W7SX0zE1itOAB
	 2j099vpEKgsXcqJU8IrUGEIETl2yuPdYJ6yWFePy95Y0Wa1Yf9LZciCjhUha5Y+p2q
	 3AfCPjtwbK5EjsClfF0zhPYKMCsbefBphdptSwAVDEEvyG6u1UqZvTOq+tdo6AlKiW
	 EsZa3GnYXFKxjzTGZsPr/DaPQp8W3JKhvWCbwJZzPLfAv7PTPC0Jrvg4+EoGYAm951
	 tzAdBmQsLF6iw==
Date: Wed, 20 Sep 2023 14:03:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230920-53a04651c08acb0796dc63b4@fedora>
References: <20230920-untimely-untagged-12b75e247afb@wendy>
 <IA1PR20MB495313B7E9B2FC529BE0BB2ABBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495313B7E9B2FC529BE0BB2ABBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_060310_906218_3C27B8DE 
X-CRM114-Status: GOOD (  45.87  )
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
Content-Type: multipart/mixed; boundary="===============0031678747716771530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0031678747716771530==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fHzTHLymqgiKnOlw"
Content-Disposition: inline


--fHzTHLymqgiKnOlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 07:24:21PM +0800, Inochi Amaoto wrote:
> >
> >Yo,
> >
> >On Wed, Sep 20, 2023 at 05:08:41PM +0800, Inochi Amaoto wrote:
> >>> On Wed, Sep 20, 2023 at 02:39:39PM +0800, Chen Wang wrote:
> >>>> From: Inochi Amaoto <inochiama@outlook.com>
> >>>>
> >>>> Add two new compatible string formatted like `C9xx-clint-xxx` to ide=
ntify
> >>>> the timer and ipi device separately, and do not allow c900-clint as =
the
> >>>> fallback to avoid conflict.
> >>>>
> >>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >>>> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> >>>
> >>> Have you ignored Krzysztof's comments on this? I don't see a response=
 or
> >>> a reaction to his comments about the compatibles on the last version.
> >>> Additionally, where is the user for these? I don't see any drivers th=
at
> >>> actually make use of these.
> >>>
> >>
> >> Sorry for late reply and wrong message-id.
> >>
> >> The clint is parsed by sbi.
> >
> >That needs to go in the commit message.
>=20
> Yes, it will.

Thanks.

> >> As use the same compatible, the opensbi will
> >> parse the device twice. This will cause a fault.
> >
> >Then only have one compatible with 2 register ranges? Then your SBI
> >implementation can use those two register ranges to find out the base
> >address for the mtimer bits and for the mswi bits.
> >I don't understand why this cannot be done, could you please explain.
>=20
> That is a good idea, but now SBI use the second register ranges as
> mtimecmp address for aclint. And there is a aclint-mswi in the SBI.
> Maybe a change is needed?

Yeah, I don't think the model for this in OpenSBI at the moment (and
since I checked, in QEMU too) is correct. I think we should re-do things
correctly and it'd be great if things didn't get merged to those
projects that end up being objected to by dt-binding people.
I've started keeping a closer eye on QEMU recently in that regard, but I
am not super attentive. I'll try to be better at that going forward!

>=20
> >I also don't see anything in the opensbi repo right now that is using
> >these (nor could I easily see any patches for opensbi adding this).
> >Is there another SBI implementation that you are using that I can take
> >a look at to try and understand this better?
> >
>=20
> This will be sumbit in a short time.
> Now we only use it is sophgo vendor SBI, which url is [1].
>=20
> [1] https://github.com/sophgo/opensbi

Thanks.

> >>> Why do you need to have 2 compatibles (and therefore 2 devices) for t=
he
> >>> clint? I thought the clint was a single device, of which the mtimer a=
nd
> >>> mswi bits were just "features"? Having split register ranges isn't a
> >>> reason to have two compatibles, so I must be missing something here...
> >
> >> Sorry for late reply, The clint consists of mtimer and ipi devices, wh=
ich
> >> is defined in [1].
> >
> >Yes, I have looked at the spec. I went to check it again before replying
> >here in case there was something immediately obvious that I was missing.
> >
>=20
> I think nothing missed.
>=20
> >> This standard shows clint(or the aclint) has two device,
> >
> >The wording used here doesn't really matter. It's one interrupt
> >controller that does mtimer and mswi.
> >
> >> but not one. In another word, there is no need to defined mtimer and i=
pi
> >> device on the same base address.
> >
> >There's also no need to have two compatibles for the same interrupt
> >controller, so I do not get this reasoning. What actually _requires_
> >them to be split?
> >
>=20
> Yes, it is one, but can be mapped into different address. So I think we
> need two.

Not two compatibles though, just two memory addresses that you need to
locate (or maybe even 3, for SSWI?)

>=20
> >> So we need two compatibles to allow sbi to identify them correctly.
> >
> >Why is it not sufficient to identify the individual memory regions?
> >
>=20
> FYI, Anup. As I have no idea for aclint implementation.
>=20
> >Thanks,
> >Conor.
> >

--fHzTHLymqgiKnOlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQrtgQAKCRB4tDGHoIJi
0sH4AP9aPXJ2MxGFLtqJMN8gdZXDTRRPiXRkMYqGcMxe9DXbQwD/YgQh6XCaTtVs
o6MGOLBVFZ6PY7rSGjPa2yPRN3KiPAc=
=c3Dp
-----END PGP SIGNATURE-----

--fHzTHLymqgiKnOlw--


--===============0031678747716771530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0031678747716771530==--

