Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6DAC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtzgJzyVKCmGzz26G3SXBtIZyMu4MCmV92RNDjnZ1Pw=; b=Lj8d/tFE8CuIqMXWH4M/MsvVwB
	OUVDk6IWNBKSUJ55v97sWXgWR4EZCDGxJW0ixj+MYAeWYLiMr9eH45H/2JB58dZ8V2/ufEM+2JGYy
	UQUJLsxJFhnlKTfXM8y+kEwIHYq+CN56Tn1u36WxIrKUUB0rdJFN4eDXoajJFOvzOxZ8ypLfyKPkw
	yBDs+H1lSPs8jedjxSDgkkohOH8ILkqIuLxoFvcZzLhk+14i8Jwh2Eiuz1qKuebiIQJ8iZUGYcRXk
	5xfMGqGjRFzZxlU3GB3cXMz46PfcfT4OLQTFT1VU2CyPAO57Bpzv9y5LLBWeizbGlFP81ZXgdu9ip
	ERy+IEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk2n8-000000062ND-3xp5;
	Tue, 12 Mar 2024 14:07:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk2n4-000000062Lh-2B4A;
	Tue, 12 Mar 2024 14:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99B3360E83;
	Tue, 12 Mar 2024 14:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAEEC433C7;
	Tue, 12 Mar 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710252457;
	bh=VxlpGxDihZXj7jY5GEg/ShwUNDeC49+jqJqaSIfPhsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5Rje2GOhhmmf2q6wh8tnNGuD3tTEdAt2GDgKJqBRsX83vpcz+vGfagvrnOnCBkML
	 jSth+OmJ0TmjvkKv/FHbMjGA9SKfvslDXJiOSsUgD/Qzf+nHqxX5fOv24mr0lK42ed
	 MVPfgfPkavIORcva44kvaPz20jSzsV6BY3BETPNO2nkia7j0w9Qth401Nx1dWJOpDj
	 0sHQKRzLSyrUiHHiGbnhg45kuRXaRhBokjUDzKs7sXjTrWg6f4oDGiOIH7oUY9w0Z+
	 6pzkeManYXfsh0kdOBXcQOWR6G0ULbZVy5Bh9UH5NVPMLppD3yUZZfadwNclBfbHhl
	 r3oA8T0eYwlwg==
Date: Tue, 12 Mar 2024 14:07:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240312-evil-resource-66370b68b9b4@spud>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_070738_770905_9CC64C7A 
X-CRM114-Status: GOOD (  23.88  )
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
Content-Type: multipart/mixed; boundary="===============5452528973663773032=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5452528973663773032==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pq4l/U+EGNQPJ6t+"
Content-Disposition: inline


--Pq4l/U+EGNQPJ6t+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 03:56:29PM +0800, Qingfang Deng wrote:
> Hi Inochi,
>=20
> On Mon, Mar 11, 2024 at 3:13=E2=80=AFPM Inochi Amaoto <inochiama@outlook.=
com> wrote:
> >
> > On Mon, Mar 11, 2024 at 02:30:18PM +0800, Qingfang Deng wrote:
> > > T-Head C908 has the same IRQ num and CSR as previous C9xx cores, but
> > > reports non-zero marchid and mimpid. Remove the ID checks.
> > >
> >
> > Hi, Qingfang,
> >
> > IIRC, the existed C908 SoC (such as K230) have an early version
> > of C908 core. But C908 core itself may support Sscofpmf.
> > So I do not think removing the ID checks is a good idea. Instead,
> > I suggest adding CPUID of your SoC to this check.
>=20
> As of Feb 2024, the latest C908 revision does not support Sscofpmf.
> You may Google "C908R1S0" to see its user manual.
> But I think you're right. Even though C908 does not have Sscofpmf,
> T-Head may release new SoCs which do have Sscofpmf, and the check will
> break. I will submit a new patch with your suggested changes.

If on an SoC where they have updated vector to 1.0 and implemented both
Zicbom and Svpbmt instead of their custom stuff they did not implement
Sscofpmf I think we can expect they won't move away from their custom
implementation soon.
I do agree that we should not remove the ID checks entirely, but I also
do not want to be adding an ID for every SoC that needs this. I think we
should be getting this information from DT going forward.
The DT parsing is done prior to the application of boot time
alternatives, so I think we could apply the "erratum" based on the DT.

I'm also pretty sure that we can also modify the existing code for the
archid =3D=3D impid =3D=3D 0x0 case to set a pseudo isa extension so that t=
he
perf driver could do call riscv_isa_eextension_available() and not worry
about the specfic conditions in which that is true. It'd be something
like this patch:
https://lore.kernel.org/linux-riscv/20240110073917.2398826-8-peterlin@andes=
tech.com/
Just without removing the archid =3D=3D impid =3D=3D 0x0 case from the erra=
ta
code. If you're lost after reading that, I can probably throw together
some untested code for it.

Thanks,
Conor.

--Pq4l/U+EGNQPJ6t+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBhowAKCRB4tDGHoIJi
0qpNAQDkCoYYNr9WEQUhd2aEI/zbE3vwTfDh+2GK9L7+lQaBUAD/Ub+ksm3LncKt
mAWaii+Of3v6TKIm+8K1yjxEtDdKlQE=
=5JMP
-----END PGP SIGNATURE-----

--Pq4l/U+EGNQPJ6t+--


--===============5452528973663773032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5452528973663773032==--

