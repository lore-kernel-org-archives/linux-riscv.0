Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83647C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpgV5puWV+Ythvk10981cMbnz0J39y/Wh6idowTF2rY=; b=wbvIk4AXaRVgbVPSP9P/15DnR0
	9Xzh8itdNI0+75JpTJ4a/PK6NSqJeNc4diPsWzCm7cXIm1TD/3k9tkdv16YgQzYKIF+yZIn/JBAf+
	UivyBQp416fPqI8LhLTsRCyK5wjyuaOs1NuwGnO4Iv8AWI5Qq7sqFTV2S7TfUTO0A/XyZ5mAm2Blc
	aUgYhLtWYNL7qLhly3sKY/SatR1qycYSTl3ayiOhOzM7uWKXzNLTBCDR2yIvsE6o9NV5MahCpAWJV
	OFGNtvXyP7tkISZFHOeJ/fiwWyNAIW1oS2rbOdruRZkumSBDG4yoxVa/Tn1ug5ILLDjFKvH+X341V
	qmQtidhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1Vg-0010uA-PT; Mon, 23 Jan 2023 18:25:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1Vd-0010rJ-BI; Mon, 23 Jan 2023 18:25:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8C1BFCE16D6;
	Mon, 23 Jan 2023 18:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304A9C433EF;
	Mon, 23 Jan 2023 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674498328;
	bh=WeP4mhPA4ay641kKbHx/kCfP8Rsttkr011e7+Aq3lLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g31LACcIaaZZsG2l+LGdqamMGppe4VLcgSeCYyNIFSKB0VOyWZjLdr9fEAIAiEw0t
	 9c86M5OYAKmOBskjyaxuDDAnIawZ4k+1ccWZ4SpB6NXPJhliLvUfl8aCtV1uiwy1My
	 r97bnXIpN4uBQLpWNU0DFFZrKFoVm0CGZwLhWnyHlXqdDK2j9zlsF4lBUFcuf0t1LS
	 SzSAOwYlbCj4DMRzWzOSw5w/wRUuPygaCOBgtUZuLVEgXSUF73lljRtNxzZkG8g85a
	 FOGsegEhVdMUC9q5G3VUZlDBHvgU9Ww4SZig7lDZWchUyK+qVFEbXCe8jK+2+IofeW
	 5gPB1A0PJJCpQ==
Date: Mon, 23 Jan 2023 18:25:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <Y87REk8M/lDbQUhb@spud>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
 <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
 <20230123155404.oqcfufnot4f2vjw7@orel>
MIME-Version: 1.0
In-Reply-To: <20230123155404.oqcfufnot4f2vjw7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_102533_824493_E755C166 
X-CRM114-Status: GOOD (  41.42  )
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
Content-Type: multipart/mixed; boundary="===============5992896104026115296=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5992896104026115296==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MWqyUABs1AiNk1pc"
Content-Disposition: inline


--MWqyUABs1AiNk1pc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew, Rob,

On Mon, Jan 23, 2023 at 04:54:04PM +0100, Andrew Jones wrote:
> On Mon, Jan 23, 2023 at 08:33:56AM -0600, Rob Herring wrote:
> > On Sun, Jan 22, 2023 at 1:13 PM Andrew Jones <ajones@ventanamicro.com> =
wrote:
> > >
> > > The Zicboz operates on a block-size defined for the cpu-core,
> > > which does not necessarily match other cache-sizes used.
> >=20
> > Please use get_maintainers.pl and send patches to the correct lists.
>=20
> Yup, Conor also pointed out that I forgot to update the CC list when
> adding this patch to the series.
>=20
> >=20
> > I have no idea what Zicboz is. How does it relate to Zicbom for which
> > we already have a block size property? I really hate one by one
> > property additions because they lead to poorly designed bindings. So
> > what's next? What other information might be needed?
>=20
> Zicbom and Zicboz are both RISC-V ISA extensions for cache-block operation
> (CBO) instructions. Zicbom defines the instructions cbo.inval, cbo.clean,
> and cbo.flush while Zicboz only defines cbo.zero. While it's probably
> likely that the cache block sizes which Zicbom and Zicboz use will be
> the same when both are implemented, the specification does not require it.
> With that in mind, it makes sense to me that Zicbom has its own property
> and that Zicboz could follow Zicbom's pattern with its own property as
> well.
>=20
> That said, having a generic block size property which is used in the
> absence of the per-extension block size properties would allow DTs to only
> specify the size once when they're the same. In my reply to Conor, I
> suggested introducing a cbo-block-size property for this purpose, but Anup
> suggests we just expand the purpose of cbom-block-size. Expanding cbom-
> block-size's purpose would allow its size to be used with cbo.zero in the
> absence of a cboz-block-size property. Additionally, we could defer the
> introduction of the cboz-block-size property until some system needs it,
> which may be never.
>=20
> As far as to what's coming next, I'm not aware of a plan for more of these
> types of properties at this time, but the CMO spec also describes prefetch
> instructions, which are defined under the Zicbop extension. If Zicbop
> support is added, then it should follow the same pattern as we agree for
> Zicboz, which is either
>=20
>  a. Add cboz-block-size and require it (as this series currently does)

heh, be careful with the word "require", in dt-binding terms it's not
required - we just get a pr_err() and the feature is disabled, right?

This is most clear of the options though, even if it will likely be
superfluous most of the time...

>  c. Don't add cboz-block-size, only expand the function of cbom-block-size
>     and use it. If a need arises for cboz-block-size some day, then it
>     can be added at that time.

I don't really think that this one makes much sense. It'd be perfectly
okay to have Zicboz without Zicbom, even if that scenario may be
unlikely.
Having a system with Zicboz in the isa string, a cbom-block-size just
sounds like a source of confusion.
IMO, there's enough potential crud that "random" extensions may bring
going forward that I'd rather not make decisions here that complicate
matters more.

>  b. Add cboz-block-size, expand the function of cbom-block-size to be
>     a fallback, and fallback to cbom-block-size when cboz-block-size is
>     absent

I personally think that this one is pretty fair. I won't even try to
claim knowledge of what decisions hardware folk will make, but I think
it is likely that cbo.zero will share its block size with the other
three cbo instructions that we already support.

idk if you can refer to other properties in a binding, but effectively I
am suggesting:
  riscv,cboz-block-size:
    $ref: /schemas/types.yaml#/definitions/uint32
    default: riscv,cbom-block-size
    description:
      The blocksize in bytes for the Zicboz cache operations.

>  d. ??

Have both properties and default them to the regular old cache block
sizes, thereby allowing Zicbom/Zicboz in the ISA string without either
property at all?
Or is that one an ABI break? And if it is, do we care since there
doesn't appear to be a linux-capable, Zicbo* compatible SoC yet?

Thanks,
Conor.


--MWqyUABs1AiNk1pc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY87REgAKCRB4tDGHoIJi
0pVQAP9p4tWx9ARDDmj5vpg/2YO0fGMgaLVS3qZhsSIqTY4BCgD+PX+8OXOwov4h
zmyeceAGkGAf9V9N0NSGicgS/2iWdw8=
=EyGm
-----END PGP SIGNATURE-----

--MWqyUABs1AiNk1pc--


--===============5992896104026115296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5992896104026115296==--

