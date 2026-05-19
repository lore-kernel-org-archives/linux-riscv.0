Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD9FCD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJWkZHtjb0cmzQlio7Tj+rrk5DUlQh2mx/MML4G+Xe0=; b=mqjpV8C3pZoVEbsxxWwaLNHq8J
	7tBkdqoL6c3JzBBp2jH4YhW/T8WTwJQm/qkX25V8BAn1PJ+fVg1gH1RQ0ZBBxPQOjOZ0elfk3d2Bs
	ANTr8adGj/BslpIhR2mixoZIbSz2P1+ZuLQvl9/f31Iq6DaMpVz6Fw4hPHQpEKaePPHxOO2e4LngW
	JPHqQps2nah+tZ00mGuJkwkoC5NEnbaup+stgteHICjRHoh3O1ZObs5N7fXhbaT1Bx3KuNJWfMGC6
	oMLhtgAhhd5xnqEk/uwUQyDhfX2h2tdIzGd9s0bD+H8Jr7buXeVze3Zx8ljxJn3rm7O5P0HT81FRw
	noCgEHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQIr-00000002dvQ-3eow;
	Tue, 19 May 2026 19:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQIp-00000002dug-1jeC
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 19:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB47243469;
	Tue, 19 May 2026 19:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7181F000E9;
	Tue, 19 May 2026 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779219630;
	bh=xL6f42+NZTDsw+OmkZm6LZWfUUP2ibmkWGqkJCR5vys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DRaRiHvb7F0z7nWHXYLLUu/MlLVGCyqbcUgZpL6Xn52X7QNyXBw0NndeRzdkVxVXI
	 fuDJj0mwdjpNHO++ycJ6oaLmG2CnJwtQdPvVzq1KeD8WUeFWcunA9Jwcly2159eSYF
	 cV64ggWt6RVhfBpCZPN5+PmpDWflNUx+0ZdDnh2XERWlwRaEH2a3kr2lf1hh+GzYtr
	 mSSr1ja+vrDgEPE854O9SmMkK/Ic30R1EHrzUdnuuUaRX+sIXyVzlmjPOWt2qy86gO
	 LWPzyh5X8IQ58hyNdzuoAw+uBSalwmWpqWfDMfR4TD5bGepIJe5/Zzi6YEqYslzD0V
	 PFb0Uw1UiRYwQ==
Date: Tue, 19 May 2026 20:40:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Michael Ellerman <mpe@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, pasha.tatashin@soleen.com,
	andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com,
	debug@rivosinc.com, baolin.wang@linux.alibaba.com,
	zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
	wangruikang@iscas.ac.cn, apatel@ventanamicro.com,
	liu.xuemei1@zte.com.cn, ajones@ventanamicro.com,
	cleger@rivosinc.com, charlie@rivosinc.com, hui.wang@canonical.com,
	guodong@riscstar.com, pincheng.plct@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
Message-ID: <20260519-uniformly-italicize-7559af43864a@spud>
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
 <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
 <20260519-justly-fragile-f0e298526b08@spud>
 <66c1503a-5fc5-432d-8312-403b2999d9d4@sifive.com>
MIME-Version: 1.0
In-Reply-To: <66c1503a-5fc5-432d-8312-403b2999d9d4@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_124031_496437_4E40BB23 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Type: multipart/mixed; boundary="===============2063582730089872950=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2063582730089872950==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MJwb+OluF7oAJ/ZE"
Content-Disposition: inline


--MJwb+OluF7oAJ/ZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:34:44PM -0500, Samuel Holland wrote:

> >>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> >>> index f46aa5602d74d..e46b2d2b49eed 100644
> >>> --- a/arch/riscv/kernel/cpufeature.c
> >>> +++ b/arch/riscv/kernel/cpufeature.c
> >>> @@ -35,6 +35,8 @@
> >>>   static bool any_cpu_has_zicboz;
> >>>   static bool any_cpu_has_zicbop;
> >>>   static bool any_cpu_has_zicbom;
> >>> +bool riscv_hw_pte_ad_updating_enabled __read_mostly;
> >>> +EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating_enabled);
> >>>   unsigned long elf_hwcap __read_mostly;
> >>> @@ -287,15 +289,74 @@ static int riscv_ext_zvfbfwma_validate(const st=
ruct riscv_isa_ext_data *data,
> >> ...
> >>> +static int __init riscv_hw_pte_ad_updating_init(void)
> >>> +{
> >>> +	bool has_svade, has_svadu;
> >>> +	int state;
> >>> +
> >>> +	has_svade =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> >>> +	has_svadu =3D riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> >>> +
> >>> +	if (!has_svadu)
> >>> +		return 0;
> >>> +
> >>> +	if (!has_svade) {
> >>> +		riscv_set_hw_pte_ad_updating(true);
> >>> +		pr_info("riscv: hardware PTE A/D updating enabled\n");
> >>> +		return 0;
> >>
> >> This block is identical to the tail of the function. I'd probably use =
"goto
> >> enable", with an "enable" label below.
> >=20
> > Is this code correct though? On DT systems, !svade && !svadu means we
> > don't actually know if it is hardware or software managed, so printing
> > that it's hardware managed may not be correct.
> >=20
> > I don't understand the mm code enough to know if arch_has_hw_pte_young()
> > returning true is problematic too, but it probably is?
>=20
> This block is for !svade && svadu (Svadu is present; we didn't return abo=
ve), so
> I think this block and Michael's comment are correct.

D'oh... My bad!


--MJwb+OluF7oAJ/ZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagy8pwAKCRB4tDGHoIJi
0tYdAQDSwXIk96jnbTkYs82xE6/iNsMCRId5KKPAJ+TtlglaOgEA7uFm9OpY0iJm
oaGe2k2f6AY4AGPXB3cC1oauUwc+0w0=
=PyLU
-----END PGP SIGNATURE-----

--MJwb+OluF7oAJ/ZE--


--===============2063582730089872950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2063582730089872950==--

