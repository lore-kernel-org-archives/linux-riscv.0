Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D024BCA0FED
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgdRMoU7fjAn0VI9sJ3ogeDp+ellj+uqfIMUkP0eCXA=; b=oMZhH+lgJdWjxPKj5mAyasuedd
	lZOKtEIJq2GAL5VGt/XqWi0hSebmy/ff3sSORh1U5aao/3qDgz1WfziBPKtJDSZBxr5vDoJlkLTTy
	Q+AlaLsN2QHrIeCR/eGoBdYSdd9AeQe9c1JC6Y5VRARPD6j5BsqA+wRv0op7foyyO4e0VlKASkbiM
	tnhkR7vsVrxn0z9M/aNxXI7h5C+6gW2rWvjq1X5Qvwuur6WLVQ3M0b9/TBcaVzewQYQR5s2y1AQAr
	bLdvof77IIWgIWA8zTqqFzcKRTE03wkweBigvVKyc09ELT2Va//x+NsEbik0B/c6JsIcoe6B99czd
	4/LLZMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc8Aw-000FIt-0w;
	Fri, 01 Sep 2023 17:43:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc8As-000FHu-2l
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 17:43:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E2E14CE21FD;
	Fri,  1 Sep 2023 17:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AEAC433C7;
	Fri,  1 Sep 2023 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693590191;
	bh=dbHY4NbH/giNzi2oBHDT/tg4te/ZtoQps2IQIiB/Gww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRzNP25N4+w+sHpLXmmMpcBoqwFdfPW0ayH8hbGnliHWT3PJ8I46jCRqDEBnt8YXZ
	 NoPUYzW3QIp64SA/fuA/truy57OOddgUFM27GGii88cOYHIa3nA3+vXCPPfcfvOtct
	 u16dClrcXSNGNonWe6WtyF36HgSFLoMP+fGj0mpuMkLoCZRTPEvLDa/EYdaV8QS5iP
	 WAqKRf/ftPS9f8aRXyaP9aSGemk8kqxL7SiaglUFvSwFKwaqKvU+Vcsdh5naqTRq7E
	 dA2G4D3Uxc2aOB7Bwi4TGb2g6+sFWZNEYqb5W+sE+imqgsvBEVesu5wLST7uAdjiOq
	 ZxlOpYDgb27jA==
Date: Fri, 1 Sep 2023 18:43:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: William Qiu <william.qiu@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-mmc@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Message-ID: <20230901-affected-wanting-ab517791a870@spud>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
 <20230901-remold-sublease-a1ddb1fc6348@spud>
 <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_104315_281247_88FA5F05 
X-CRM114-Status: GOOD (  30.44  )
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
Content-Type: multipart/mixed; boundary="===============9147755481954282138=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9147755481954282138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VVkFRg4/+IISb4qT"
Content-Disposition: inline


--VVkFRg4/+IISb4qT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 06:20:38PM +0100, Jessica Clarke wrote:
> On 1 Sep 2023, at 16:42, Conor Dooley <conor@kernel.org> wrote:
> >=20
> > On Fri, Sep 01, 2023 at 10:33:13AM +0800, William Qiu wrote:
> >>=20
> >>=20
> >> On 2023/8/30 16:34, Conor Dooley wrote:
> >>> On Wed, Aug 30, 2023 at 09:29:20AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 30/08/2023 08:50, Conor Dooley wrote:
> >>>>> On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
> >>>>>> Due to the change of tuning implementation, it's no longer necessa=
ry to
> >>>>>> use the "starfive,sysreg" property in dts, so drop the relevant
> >>>>>> description in dt-bindings here.
> >>>>>=20
> >>>>> How does changing your software implantation invalidate a descripti=
on of
> >>>>> the hardware?
> >>>>>=20
> >>>>=20
> >>>> Which is kind of proof that this syscon was just to substitute
> >>>> incomplete hardware description (e.g. missing clocks and phys). We
> >>>> should have rejected it. Just like we should reject them in the futu=
re.
> >>>=20
> >>> :s I dunno what to do with this... I'm inclined to say not to remove =
it
> >>> from the binding or dts at all & only change the software.
> >>>=20
> >>>> There are just few cases where syscon is reasonable. All others is j=
ust
> >>>> laziness. It's not only starfivetech, of course. Several other
> >>>> contributors do the same.
> >>>=20
> >>> I'm not sure if laziness is fair, lack of understanding is usually mo=
re
> >>> likely.
> >>=20
> >> For this, I tend to keep it in binding, but remove it from required. B=
ecause
> >> we only modify the tuning implementation, it doesn't mean that this pr=
operty
> >> need to be removed, it's just no longer be the required one.
> >=20
> > Please only remove it from required if the current driver doesn't break
> > if the regmap is removed.
>=20
> Either way please make sure the documentation clearly states =E2=80=9Cnev=
er use
> this, if you=E2=80=99re using it you=E2=80=99re doing it wrong, this only=
 exists
> because it was wrongly used in the past=E2=80=9D. Otherwise people writing
> drivers for other OSes will probably use it too thinking they need to.

Maybe we should just delete it if the impact is going to be negligible,
sounds like you're not using it in FreeBSD, which was part of what I was
worried about. Guess it depends on what Emil & the distro heads think.

--VVkFRg4/+IISb4qT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPIiqQAKCRB4tDGHoIJi
0gykAPwMyjaH4QlvlKNp66b+AkhwtZYuHNp93F2DQ5zKpQdaNgEAuBss3Yag0o95
9UvKadGCMRv9Wi5nr/an6EGVMLhKkAQ=
=nFPr
-----END PGP SIGNATURE-----

--VVkFRg4/+IISb4qT--


--===============9147755481954282138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9147755481954282138==--

