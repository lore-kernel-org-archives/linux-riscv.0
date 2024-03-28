Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB777CD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nlxkRWWVVXLU3o/HWRoE2sI1SJQGWWtvOmxDbnKC80=; b=QGTeCGPp6pbCF2G4Ek39i+z4QI
	TTTJTbQF1+T3Pwc00nuenco03git5Pd9Df4Ov8JUcT2SkuGZ52Ac+EbS0AqtwRw5YlKpRep3INX0m
	Z+OfhYPto6h6ryFzR3bCKaisyiBxZrPkURzPLE4rCCBhVcf5KOycSJy78IEieO0O2kpGvjc1OMwxZ
	M9WC0NEbyAuXjE8/tunGGQO8RKG+HGP/p3pRfdo0reB7tJVZedmMR/NN6Gvq6gi+cu0a+YDsbqhgq
	6LSxMN/4pKnz0aGuIcXa/5QHNRV1+Hwg+VNLVtAw0JIR1vG+McVkLAKnZvajiZtrnXt3ED+adt2o2
	41jY5GUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpxuL-0000000FrAW-0kpy;
	Thu, 28 Mar 2024 22:07:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpxuI-0000000Fr8p-18UG
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 22:07:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A3688CE2D2A;
	Thu, 28 Mar 2024 22:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCAEC433C7;
	Thu, 28 Mar 2024 22:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711663649;
	bh=qy7UxkfEbTXP0fG7wTtOhGPzbFidkRhVmLz4VIILo8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PiY+MAvZ71RFRJLOV9wNKnH78WzuQ+yoDrFEDHLeDYUytCNt8LwKz0Sygxq8mN3zB
	 zQ6z9aJ/UtcJQYb+0Ix1xOcUvBTzmGnVrlnLp0Gmy7zuin8SEKFIMvaRgai8sI5mNa
	 rT0GGDmlNev4jmnp2j+eIlSQgjrssSa+StiYbos4MJYWh8B1/94h4hBeRi0O8f134x
	 7uE7DuBDy9eZNkcQZ17ObD+cwHa1FuZ5aWLMcVBNPO0eRbV2uVEVu77DeIN5SRax/v
	 JzK10wMVrXwQSwVmxMsxsApYaUSTFjSerYL/VPgvBRQMixcY7jSB7TVLmYTpiDnk/3
	 kwyow4tk4wpsA==
Date: Thu, 28 Mar 2024 22:07:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Message-ID: <20240328-ferocity-repose-c554f75a676c@spud>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_150734_684051_984DB806 
X-CRM114-Status: GOOD (  27.18  )
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
Content-Type: multipart/mixed; boundary="===============1209316993361407574=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1209316993361407574==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AbnF/Y1LlP5Fvmu+"
Content-Disposition: inline


--AbnF/Y1LlP5Fvmu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 03:34:31PM -0400, Stefan O'Rear wrote:
> On Thu, Mar 28, 2024, at 8:49 AM, Pu Lehui wrote:
> > From: Pu Lehui <pulehui@huawei.com>
> >
> > This patch relaxes the restrictions on the Zbb instructions. The hardwa=
re
> > is capable of recognizing the Zbb instructions independently, eliminati=
ng
> > the need for reliance on kernel compile configurations.
>=20
> This doesn't make sense to me.

It doesn't make sense to me either. Of course the hardware's capability
to understand an instruction is independent of whether or not a
toolchain is capable of actually emitting the instruction.

> RISCV_ISA_ZBB is defined as:
>=20
>            Adds support to dynamically detect the presence of the ZBB
>            extension (basic bit manipulation) and enable its usage.
>=20
> In other words, RISCV_ISA_ZBB=3Dn should disable everything that attempts
> to detect Zbb at runtime. It is mostly relevant for code size reduction,
> which is relevant for BPF since if RISCV_ISA_ZBB=3Dn all rvzbb_enabled()
> checks can be constant-folded.
>=20
> If BPF needs to become an exception (why?), this should be mentioned in
> Kconfig.

And in the commit message. On one hand I think this could be a reasonable
thing to do in bpf as it is acting as a jit here, and doesn't actually
need the alternatives that we are using elsewhere to enable the
optimisations nor the compiler support. On the other the intention of
that kconfig option is to control optimisations like rvzbb_enabled()
gates, so this is gonna need a proper justification as to

As I said on IRC to you earlier, I think the Kconfig options here are in
need of a bit of a spring cleaning - they should be modified to explain
their individual purposes, be that enabling optimisations in the kernel
or being required for userspace. I'll try to send a patch for that if
I remember tomorrow.

Thanks,
Conor.

> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >  arch/riscv/net/bpf_jit.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> > index 5fc374ed98ea..bcf109b88df5 100644
> > --- a/arch/riscv/net/bpf_jit.h
> > +++ b/arch/riscv/net/bpf_jit.h
> > @@ -20,7 +20,7 @@ static inline bool rvc_enabled(void)
> >=20
> >  static inline bool rvzbb_enabled(void)
> >  {
> > -	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&=20
> > riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> > +	return riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> >  }
> >=20
> >  enum {
> > --=20
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--AbnF/Y1LlP5Fvmu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgXqGwAKCRB4tDGHoIJi
0n9mAQCMUUZGliN/KpdYVcNTscPK+ff5W8UCov2gCxTu1Rgs/gD/aDZv9SYF6EQx
SpQgWucp0nYikxazDlNmYYOtPAZn8QE=
=TrHF
-----END PGP SIGNATURE-----

--AbnF/Y1LlP5Fvmu+--


--===============1209316993361407574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1209316993361407574==--

