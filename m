Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0524C001CC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTntEMbWYzRw+MQhZcGQpnthPcVnLB+hExmWbxWRHHY=; b=aCaJ9rZZwK2WVemKIfY5bdKgLQ
	L9ujc6L8fk2oajCTJ8Sijddqw/X8C7u7w0rcvB/Pvb1SnOE+5KSmvtXI/RCUXCimG6mBmck90bLel
	AsYNk4Ccks19oVJTJ43K2rYua6UWgyMEKVeqkObloHkzWI8ffKaXQDnuPsFi3T0LPR1Wylj0DH49h
	IN3FqKj9U+oNKdKVP56mJpB1k9g2Lyr/Awe+/ZwVGxrzOXE6iGKZo3b5bjUBrQ5/a8j5onh+14SCc
	rOc2wEh7uOU//vQqGNmXsKijQ7XOB0h/N+AGmnTkAvs7gUZ48AMkIA+Bgtyl1ms4DF1/+lFDLWFVC
	3MkIz9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx55A-0000000G3WK-0UD1;
	Wed, 17 Apr 2024 13:12:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx553-0000000G3V1-159f;
	Wed, 17 Apr 2024 13:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17242614B1;
	Wed, 17 Apr 2024 13:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2987CC072AA;
	Wed, 17 Apr 2024 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713359523;
	bh=GyaPboPEL2rOAOK0TAO7wW1CTxmk8Gw7xhEdNBWguKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYCRva+TEbeI8lHSL5KgZTLK304JVk22e0gyDw72neADh2DRRscI5GqNNsL0r9sc/
	 PQybGvggeulo+MscxzZtzNb00VcaYdYAWR7V1+FpwAHuGrWidwHe5mLMRkMUiKY5EM
	 dD1qEKrr8gPWg50sSXSQ7NHJU0p9Q8h4jqMOLQh7z5WMgHqZmcRU24Aph39VkiIuky
	 AcxN6m8Jk9TCbZxp1pG7Ftp1Fa8duJyBWB1zPGDvPMzJkT8QawezIfiNlzrlSeyD+r
	 LqyY5FmjEp2cH1muibEPw5FgNlj9FTKmlIiwBJ8sgY8spYFfkXUWfaYebL2wYN92kQ
	 tuMGVHv4toyEQ==
Date: Wed, 17 Apr 2024 14:11:58 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <20240417-smelting-rascal-d19dec72e0a5@spud>
References: <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
 <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
 <20240411-backwater-opal-00c9aed2231e@wendy>
 <5eda3278-24bc-4c17-a741-523ad5ff79f7@rivosinc.com>
 <20240416-gave-apron-3234098ce416@spud>
 <1eab3b4f-0d46-4df5-b574-6a5f796d3bcf@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <1eab3b4f-0d46-4df5-b574-6a5f796d3bcf@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_061205_413199_D40C47D6 
X-CRM114-Status: GOOD (  39.68  )
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
Content-Type: multipart/mixed; boundary="===============0108158457273594349=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0108158457273594349==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HIRb2NogcVEwLV+i"
Content-Disposition: inline


--HIRb2NogcVEwLV+i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 05:23:51PM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 16/04/2024 16:54, Conor Dooley wrote:
> > On Mon, Apr 15, 2024 at 11:10:24AM +0200, Cl=E9ment L=E9ger wrote:
> >>
> >>
> >> On 11/04/2024 13:53, Conor Dooley wrote:
> >>> On Thu, Apr 11, 2024 at 11:08:21AM +0200, Cl=E9ment L=E9ger wrote:
> >>>>>> If we consider to have potentially broken isa string (ie extensions
> >>>>>> dependencies not correctly handled), then we'll need some way to
> >>>>>> validate this within the kernel.
> >>>>>
> >>>>> No, the DT passed to the kernel should be correct and we by and lar=
ge we
> >>>>> should not have to do validation of it. What I meant above was writ=
ing
> >>>>> the binding so that something invalid will not pass dtbs_check.
> >>>>
> >>>> Acked, I was mainly answering Deepak question about dependencies wrt=
 to
> >>>> using __RISCV_ISA_EXT_SUPERSET() which does not seems to be relevant
> >>>> since we expect a correct isa string to be passed.
> >>>
> >>> Ahh, okay.
> >>>
> >>>> But as you stated, DT
> >>>> validation clearly make sense. I think a lot of extensions strings w=
ould
> >>>> benefit such support (All the Zv* depends on V, etc).
> >>>
> >>> I think it is actually as simple something like this, which makes it
> >>> invalid to have "d" without "f":
> >>>
> >>> | diff --git a/Documentation/devicetree/bindings/riscv/extensions.yam=
l b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> | index 468c646247aa..594828700cbe 100644
> >>> | --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> | +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>> | @@ -484,5 +484,20 @@ properties:
> >>> |              Registers in the AX45MP datasheet.
> >>> |              https://www.andestech.com/wp-content/uploads/AX45MP-1C=
-Rev.-5.0.0-Datasheet.pdf
> >>> | =20
> >>> | +allOf:
> >>> | +  - if:
> >>> | +      properties:
> >>> | +        riscv,isa-extensions:
> >>> | +          contains:
> >>> | +            const: "d"
> >>> | +          not:
> >>> | +            contains:
> >>> | +              const: "f"
> >>> | +    then:
> >>> | +      properties:
> >>> | +        riscv,isa-extensions:
> >>> | +          false
> >>> | +
> >>> | +
> >>> |  additionalProperties: true
> >>> |  ...
> >>>
> >>> If you do have d without f, the checker will say:
> >>> cpu@2: riscv,isa-extensions: False schema does not allow ['i', 'm', '=
a', 'd', 'c']
> >>>
> >>> At least that's readable, even though not clear about what to do. I w=
ish
> >>
> >> That looks really readable indeed but the messages that result from
> >> errors are not so informative.
> >>
> >> It tried playing with various constructs and found this one to yield a
> >> comprehensive message:
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        riscv,isa-extensions:
> >> +          contains:
> >> +            const: zcf
> >> +          not:
> >> +            contains:
> >> +              const: zca
> >> +    then:
> >> +      properties:
> >> +        riscv,isa-extensions:
> >> +          items:
> >> +            anyOf:
> >> +              - const: zca
> >>
> >> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: cpu@0:
> >> riscv,isa-extensions:10: 'anyOf' conditional failed, one must be fixed:
> >>         'zca' was expected
> >>         from schema $id: http://devicetree.org/schemas/riscv/extension=
s.yaml
> >>
> >> Even though dt-bindings-check passed, not sure if this is totally a
> >> valid construct though...
> >=20
> > I asked Rob about this yesterday, he suggested adding:
> > riscv,isa-extensions:
> >   if:
> >     contains:
> >       const: zcf
> >   then:
> >     contains:
> >       const: zca
>=20
> That is way more readable and concise !
>=20
> > to the existing property, not in an allOf. I think that is by far the
> > most readable version in terms of what goes into the binding. The output
> > would look like:
> > cpu@0: riscv,isa-extensions: ['i', 'm', 'a', 'd', 'c'] does not contain=
 items matching the given schema
> > (for d requiring f cos I am lazy)
>=20
> Than fine by me. The error is at least a bit more understandable than
> the one with the false schema ;)
>=20
> >=20
> > Also, his comment about your one that gives the nice message was that it
> > would wrong as the anyOf was pointless and it says all items must be
> > "zca".
>=20
> That's what I understood also.
>=20
> > I didn't try it, but I have a feeling your nice output will be
> > rather less nice if several different deps are unmet - but hey, probably
> > will still be better than having an undocumented extension!
> >=20
>=20
> If you are ok with that, let's go with Rob suggestion. I'll resubmit a
> V2 with validation for these extensions and probably a followup for the
> other ones lacking dependency checking.

Also, Rob made some modifications to dt-schema yesterday, so now the
report about an undocumented extension looks like:
cpu@1: riscv,isa-extensions:3: '0' is not one of ['i', 'm', 'a', 'f', 'd', =
'q', 'c', 'v', 'h', 'smaia', 'smstateen', 'ssaia', 'sscofpmf', 'sstc', 'svi=
nval', 'svnapot', 'svpbmt', 'zacas', 'zba', 'zbb', 'zbc', 'zbkb', 'zbkc', '=
zbkx', 'zbs', 'zfa', 'zfh', 'zfhmin', 'zk', 'zkn', 'zknd', 'zkne', 'zknh', =
'zkr', 'zks', 'zksed', 'zksh', 'zkt', 'zicbom', 'zicbop', 'zicboz', 'zicntr=
', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihintntl', 'zihpm', 'zts=
o', 'zvbb', 'zvbc', 'zvfh', 'zvfhmin', 'zvkb', 'zvkg', 'zvkn', 'zvknc', 'zv=
kned', 'zvkng', 'zvknha', 'zvknhb', 'zvks', 'zvksc', 'zvksed', 'zvksh', 'zv=
ksg', 'zvkt', 'xandespmu']
instead of
cpu@0: riscv,isa-extensions:4: 'anyOf' conditional failed, one must be fixe=
d:
	'i' was expected
	'm' was expected
	'a' was expected
	'f' was expected
	'd' was expected
	'q' was expected
	'c' was expected
	'v' was expected
	'h' was expected
	'smaia' was expected
	'smstateen' was expected
	'ssaia' was expected
	'sscofpmf' was expected
	'sstc' was expected
	'svinval' was expected
	'svnapot' was expected
	'svpbmt' was expected
	'zacas' was expected
	'zba' was expected
	'zbb' was expected
	'zbc' was expected
	'zbkb' was expected
	'zbkc' was expected
	'zbkx' was expected
	'zbs' was expected
	'zfa' was expected
	'zfh' was expected
	'zfhmin' was expected
	'zk' was expected
	'zkn' was expected
	'zknd' was expected
	'zkne' was expected
	'zknh' was expected
	'zkr' was expected
	'zks' was expected
	'zksed' was expected
	'zksh' was expected
	'zkt' was expected
	'zicbom' was expected
	'zicbop' was expected
	'zicboz' was expected
	'zicntr' was expected
	'zicond' was expected
	'zicsr' was expected
	'zifencei' was expected
	'zihintpause' was expected
	'zihintntl' was expected
	'zihpm' was expected
	'ztso' was expected
	'zvbb' was expected
	'zvbc' was expected
	'zvfh' was expected
	'zvfhmin' was expected
	'zvkb' was expected
	'zvkg' was expected
	'zvkn' was expected
	'zvknc' was expected
	'zvkned' was expected
	'zvkng' was expected
	'zvknha' was expected
	'zvknhb' was expected
	'zvks' was expected
	'zvksc' was expected
	'zvksed' was expected
	'zvksh' was expected
	'zvksg' was expected
	'zvkt' was expected
	'xandespmu' was expected
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#

Which is really great from a readability pov. Not only is it compressed
to a single line, it actually points out which extension is the
offender.

Thanks,
Conor.

--HIRb2NogcVEwLV+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/KnQAKCRB4tDGHoIJi
0rS2AP4tYLrh/eXDFYhHN6RFYGaDkHa5QoOTDGCuiOux9TzJugEA6lkqPZDvjYPG
J84YQJbfPA3XcZTUTJSFs3XuDrr2Vgg=
=knP8
-----END PGP SIGNATURE-----

--HIRb2NogcVEwLV+i--


--===============0108158457273594349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0108158457273594349==--

