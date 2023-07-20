Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145D8EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1EDBN8d9zzt0lf+UU3Na3DMMIt8H4CsKEWzDQacEIc=; b=PHOCWrMIDD79ijmwDgJCkSFi9v
	LJSORniq3uJrJaBOg/NOGPI85yEpkKu0V/qSkjrr2zcw+dL/K0nHQYYcsY0HtCmBI4uHTj3tFVx3F
	KQ4wJ+ypZl7H3RlS/9FInL4Kxi9eHMDDG33ztsKTjinJQv0J0Z+Y6wfIvR8kW4OJREUTr7vp6fV7L
	ONK/RdqnTyh6QdxsaOhugUcXTnviWVFAaPqDp/diXCvTq5gXRt4GXxo+ztZcRURGxNhC14lJXpS8n
	9HRJw82NRD8mRLexXBVPQA+LEuAHA/NtZnJfGRg1gs7f32sdbFTOvpkGP0MnwfTH8D+KmsjMCAVn7
	4yE7NqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZIw-00C3Yv-1l;
	Thu, 20 Jul 2023 19:27:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMZIt-00C3YJ-2F
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 19:27:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D952A61BAF;
	Thu, 20 Jul 2023 19:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E19AC433C7;
	Thu, 20 Jul 2023 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689881230;
	bh=CJRKA7PTC+3zbSnVoUQ2xy4P4+PLWvmEQShLI/rDtV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8yO9TLNDF7CNnC7ooBnQhdcZv7jECBIpBkg8dGXL2dbZrB7KLTVSRNP8WKEqPWA/
	 btuCB0gldrpM6+6synKmKyI5vLbRyF2EMIr0/YGZvqm0DfAQxroX35xShVf0Op1AXA
	 mP/oe9dgXoobZy4Xsb9glE0/4a8EOOa35Sxqk2mVXXo+v2Q0ZVxSiEBuqCGjk9UaVR
	 f4Wao2vkABbBWrVlNUQSlcuTDKku1qZPP6VdbJFlzKJyzcU2lvQaSpvPQvnS+xdVm+
	 i0VydMJCcjjyBrlQ6LV5GU/1l5O4W50NQ/KhD/WpPCAKdoRRQwDmuD6faZ03dXgN1p
	 TDEF3HyOesZkg==
Date: Thu, 20 Jul 2023 20:27:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu
 support.
Message-ID: <20230720-charter-lustrous-061e7550ce7c@spud>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <20230719-confront-grass-6d0eb304b94f@spud>
 <CAH2o1u5pZQ6iKThFLgnn+_BBZ=j8fu91URYYxwWbfVt3OyerAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u5pZQ6iKThFLgnn+_BBZ=j8fu91URYYxwWbfVt3OyerAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_122711_777152_EB9FC09F 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: multipart/mixed; boundary="===============0958435259242441523=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0958435259242441523==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uFR2qPiOGZh5u8nm"
Content-Disposition: inline


--uFR2qPiOGZh5u8nm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 02:43:51PM -0700, Tomasz Jeznach wrote:
> On Wed, Jul 19, 2023 at 1:50=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > Anyway, what I wanted to ask was whether it was valid to use the IOMMU
> > in a system if Ziommu is not present in whatever the ISA extension
> > communication mechanism is? Eg, riscv,isa or the ISA string property in
> > the ACPI tables.
> >
>=20
> Yes, this has been pointed out to me already. As far as I can recall,
> there was a discussion
> at some point to introduce those as Ziommu extensions, later agreeing
> not to call IOMMU
> using ISA string conventions.  Will remove remaining occurrences of
> Ziommu from the series.

Right, thanks for clearing that up. I got a bit confused :)

--uFR2qPiOGZh5u8nm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLmKiQAKCRB4tDGHoIJi
0nKvAQCY4Qfl5o53tpBHorzaEf49d9BTMt+qWrTdweBVlIvXWwEAxSbe0KPPgv4y
zC/FdQ3GvKUVGBGv2E80c4D/boCv1gc=
=X54m
-----END PGP SIGNATURE-----

--uFR2qPiOGZh5u8nm--


--===============0958435259242441523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0958435259242441523==--

