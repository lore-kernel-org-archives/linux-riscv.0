Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E59BC98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37w3v3+E1FXypJbffCRcQpXJlQwa4/dPEK7Xm0Lz54c=; b=OJqk5V0v0nh+BPyXk6is9ui/8k
	2ZqpY7Qzs/XG8H5kt3NVXxkU1m7Y0To3I2yIouk2SPAhYwwKC1tjDVQ0fp3tmZpgqmDFjX1eL2WNN
	hQxPSdRSFOWsIhWK4q1XFxx43WudOP9qRxrvXt6LP49KP3/tVHD8ay2Jdh0g3BhYUPqMsh0IYvIkq
	6S9HQB8UZStTkq2a/tIwtGzPpYQA1zVa7iaSG7Shgo6LoNjU6cSlA7HFmgTEhb5TkakHA8N4Pcg9/
	MI/fOwHd6Nl2bu5JdmVFDs88I+iHuHC9KNXXsYnMP1+jMs2hcGCTkltshEbEa3fu3okgfisl3nrLc
	7eC4Bujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7QY-0000000DgGi-3MzO;
	Fri, 25 Sep 2026 15:01:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7QX-0000000DgGZ-1zeH
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:01:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1D25423E1;
	Fri, 25 Sep 2026 15:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D3B1F000FF;
	Fri, 25 Sep 2026 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348488;
	bh=DI+mmXxD7qUxnKcKdDCwsrln8WdylVQzYC7Pf1iU2YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=APBM9T0H4epfRZuAsOSkI4OmSNz2xWx7pvMxg9LdZ/BkzFp68hZrkvzqR71QPnbQp
	 7tiOQxHfG8mhlhK76VzWNabLKjEp0k6FqJH9sTdW9G/kG/WneOCiOHO7b+6Ha2O/KW
	 cmOPzvDWQz3CaaBSUwimDP8xZSra3Q/Sl3qXKQw2Bb+AWrPe7++HqDtJlWYYltRnTH
	 OBzeuMLvQKmb3WKbOm7FPjg09I/E3gVfgrrNjJGelH2tSmWlhQ2K0hQm9aXOGZ4OIT
	 ZSQ+1/CWV3thNbcVu/ENALD6ddWwIqGdEDwBgQc0a1QD6YOdIR/ZEveZ30/6kXpnmd
	 YVDnOcbVnM4ew==
Date: Fri, 25 Sep 2026 16:01:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 3/5] riscv: support early isa ext and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <20260925-hermit-unguided-6092dbf18a69@spud>
References: <20260909150158.9313-1-jszhang@kernel.org>
 <20260909150158.9313-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260909150158.9313-4-jszhang@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4591930951246171894=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4591930951246171894==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="riYNickt+IUsKtV0"
Content-Disposition: inline

--riYNickt+IUsKtV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 11:01:56PM +0800, Jisheng Zhang wrote:
> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> boot, we can use alternative mechanism to optimize them.
>=20
> So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
> riscv_has_extension_*() or not. Per [1] and [2], SV48 and SV57 are ISA
> exensions too. From another side, riscv_has_extension_[un]likely() and
> other related functions report whether the extension is supported and
> enabled on the platform. So SV48 and SV57 can be supported with current
> isa extension alternative mechanism.
>=20
> However, to use it to optimize pgtable_l4|l5_enabled, we have support
> the "early" characteristic, I.E besides risc_isa bitmap setting, we
> need to support appling alternative early before MMU on.
>=20
> After that, use it to optimize pgtable_l4|l5_enabled.
>=20
> For the typical access_ok(addr, 1);
> before the patch:
>=20
> ...
> auipc	a5,0xb43
> lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
> bnez	a5,ffffffff8000ef46 <foo+0x56>
> auipc	a5,0xb43
> lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
> beqz	a5,ffffffff8000ef5a <foo+0x6a>
> ...
>=20
> after the patch:
> These memory load and test branch instructions are replaced with only
> two j or nop instructions.
>=20
> Initial test lmbench's lat_syscall write on TH1520 platforms shows that
> the write syscall latency is reduced by about 2.38%.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/pr=
ofiles.adoc [1]
> Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratifie=
d+ISA+Extensions [2]

I don't love the early business at all, but I do prefer this diff to the
previous one.

> @@ -1147,6 +1159,8 @@ void __init riscv_fill_hwcap(void)
>  	isa2hwcap[RISCV_ISA_EXT_C] =3D COMPAT_HWCAP_ISA_C;
>  	isa2hwcap[RISCV_ISA_EXT_V] =3D COMPAT_HWCAP_ISA_V;
> =20
> +	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> +

The only real gripe I have is that this should probably have a comment
explaining why it is being zeroed. I can see reasons to zero it (fresh
slate) and to keep it (otherwise nothing will set the sv48/sv57 bits in
the register, since we don't actually read the associated devicetree
properties after this point).

=46rom my point of view, with this niggle resolved, I'm happy with the
code that's here but I have no opinion on whether or not this should be
done in the first place. Conditional on the comment,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


>  	if (!acpi_disabled) {
>  		riscv_fill_hwcap_from_isa_string(isa2hwcap);
>  	} else {


--riYNickt+IUsKtV0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaraMwwAKCRB4tDGHoIJi
0nlxAP9aQI2jdznCg+jCY7tUqZzI3gd60ouoaT+AFmAELGGeYAEAqUvmaoS3BvOB
WWgD6+OQ3LY0LzP7qzJrOQaSmbN2UQc=
=FTwT
-----END PGP SIGNATURE-----

--riYNickt+IUsKtV0--


--===============4591930951246171894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4591930951246171894==--

