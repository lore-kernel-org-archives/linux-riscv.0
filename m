Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34D7CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2Gyaim6RSp0fTKqvGGNhEJzFOHMLwLQ8ddyiCzBLnc=; b=sXQJ0ieinAdUPVVRDMuXbs+Xbe
	+2jc7DFSL5vDklPwNyyfQr9DsgWMz3+Pmeec3Y8Xa0XsFAr40z8Vt3neLccQWU9ZxdpMmR0lp4JSM
	BF1wQ85tNvcXjvltYyvCaY4DaOkiRd223gapwlUdEEY69ifFDfrW5UNZef0YWBU73or71+k1/EWok
	1DYeXHLHuukE5d97+BbU+gvFm0W2p6qitHKgAnyZxzrDaf4KK4jXKdfNkJx/8ozoVEykMi7b9WruI
	7S1W8Ww3iqjxLyA1MUReUKYq8zHDIcFYaDg3pUTEVqLA6R6vxGm7xzTwIEzIkFVLOgG3NOm5ponNc
	FzIT9iBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCnS-002jV6-2k;
	Fri, 13 Oct 2023 07:41:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCnO-002jUK-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 07:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0E301CE2CEE;
	Fri, 13 Oct 2023 07:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA431C433C7;
	Fri, 13 Oct 2023 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697182876;
	bh=HCwC6BY1bb24e17Bl+yq4xWJAW4Po3ldTzp38IgTEq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCfzTnfSPNpr8oHgUrMAWWnGod72/w0SFUhRryo5wbDOeG76rzR9TMuDoQ2Sad0hP
	 /j71x4Nhiuaz6uiC8BwRiTh5/TE6HuK+cT6suCUjlZ3JHWFA0Ma7vnSANFyuFDANaw
	 feIEzFicz9B/+sM24DE+X12K8tAMgUpenuZINmyQkg46K2qmdUAft2WB84uHs/3hfE
	 mLAITV3d5wU9XT33C2qGpePlAaR81pj4iInfmIBp+VHm4UYM1wdGKmpVaYeAqbtwk5
	 LUPUm9uYj2HD/MlLl9A4Dr8alOYiy8u/HbxvCWmFnn+saMX4Vz4APGkZt1ZnMA+t6f
	 kWz7+6MPDP24A==
Date: Fri, 13 Oct 2023 08:41:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v10 07/15] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
Message-ID: <20231013-pluck-skies-1b4ee57e770c@spud>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
 <20231003044403.1974628-8-apatel@ventanamicro.com>
 <20231012-countable-darkish-7e449edc763d@spud>
 <CAK9=C2ViQj5iNBvQcMpYii2p+CrOiQ3hY8t5_U8mrJTcMVZCYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2ViQj5iNBvQcMpYii2p+CrOiQ3hY8t5_U8mrJTcMVZCYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_004119_132262_4057F8DE 
X-CRM114-Status: GOOD (  25.11  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============3454108239289985918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3454108239289985918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SpvMUTlv7MvkLw0D"
Content-Disposition: inline


--SpvMUTlv7MvkLw0D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Fri, Oct 13, 2023 at 12:16:45PM +0530, Anup Patel wrote:
> On Thu, Oct 12, 2023 at 10:05=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > On Tue, Oct 03, 2023 at 10:13:55AM +0530, Anup Patel wrote:
> > > We add DT bindings document for the RISC-V incoming MSI controller
> > > (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> > > specification.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Just FYI, since they'll reply to this themselves, but some of the
> > Microchip folks have run into problems with sparse hart indexes while
> > trying to use the imsic binding to describe some configurations they
> > have. I think there were also so problems with how to describe to a
> > linux guest which file to use, when the first hart available to the
> > guest does not use the first file. They'll do a better job of describing
> > their problems than I will, so I shall leave it to them!
>=20
> Quoting AIA spec:
> "For the purpose of locating the memory pages of interrupt files in the
> address space, assume each hart (or each hart within a group) has a
> unique hart number that may or may not be related to the unique hart
> identifiers (=E2=80=9Chart IDs=E2=80=9D) that the RISC-V Privileged Archi=
tecture assigns
> to harts."
>=20
> It is very easy to get confused between the AIA "hart index" and
> "hart IDs" defined by the RISC-V Privileged specification but these
> are two very different things. The AIA "hart index" over here is the
> bits in the address of an IMSIC file.
>=20
> This DT binding follows the IMSIC file arrangement in the address
> space as defined by the section "3.6 Arrangement of the memory
> regions of multiple interrupt files" of the AIA specification. This
> arrangement is MANDATORY for platforms having both APLIC
> and IMSIC because in MSI-mode the APLIC generates target
> MSI address based the IMSIC file arrangement described in the
> section "3.6 Arrangement of the memory regions of multiple
> interrupt files". In fact, this also applies to virtual platforms
> created by hypervisors (KVM, Xen, ...)

Thanks for pointing this out - I'll pass it on and hopefully it is
helpful to them. If not, I expect that you'll hear :)

Cheers,
Conor.

--SpvMUTlv7MvkLw0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSj0lgAKCRB4tDGHoIJi
0npGAQC6rGsNEsyvptpG1+5wrE9ET1h1yjmigGMA1ot+EgTHewD/eQHPUyx/z1tG
Jx0CDrTp0SXbanOo3/If7opBTzOB5Qc=
=owzU
-----END PGP SIGNATURE-----

--SpvMUTlv7MvkLw0D--


--===============3454108239289985918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3454108239289985918==--

