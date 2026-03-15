Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E6FD58B1A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6/QJBHicgjvfWnleSIjB6dlB/CZbX0m1R2jcKLJ4Aw=; b=R9ckO+0ZEjzKOLZtHgQT1NdVN7
	hs4f2BgpqoEARdDXgsVNDbZxlHKGjrMVJqNDWlAGOjgWN9zXOddbndtsw+/FBFzkWbDlZiPxJv4ka
	pBaFfVATYGP6DmN9EhoDVVnNYvNO/9+2mq/QivFI5dwU4cPmAtNTbIlpiJjShj+WnMHNypkjssMPz
	k0/K/4RQ049e57o2ItYW/C70GLTaAVo3tHLln6b49bMa9IvG9gMsJLDuIVG/he2v0uQWF2VAKnBnx
	Zf+3cfeA621crZs9fIzmmHUj6BWIOLcNlPaNGzJglJArlhLlCkewfCsNMU/vtb6/bT1zQPSQXhTul
	gdfw1mGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kEM-00000002aS8-48Fs;
	Sun, 15 Mar 2026 12:06:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1kEK-00000002aRZ-2CVl
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 12:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E11C4004F;
	Sun, 15 Mar 2026 12:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE61AC4CEF7;
	Sun, 15 Mar 2026 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773576359;
	bh=l67yryRnjt4eHFTNrM4PyDXl+WM1ez2ttvW7tVoQF1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tv6BQ9PhM/O1IWOCbyGKnOljvGKShDhSbiIo1kfV7C51QEPbsjQqFDHYCHfm+GZVo
	 Ixai2HHt3vPvQVc4++uDCmsOgVhPlU0+u+O4e7BrUxiTSy7KbRbmDXLWEYpOhlUL/i
	 dppMKyiSW1twuEtgFe/qOyMYSZ/dpDICzkROlRlvHxk+sl+5+ZW4P+kRHazhggrB8g
	 K3j57aY18TBOem6UV+FbZIdvLeuy3qigt9BsLOlBVtTID+zGYNgDhD5yDvx52tx6wE
	 fADbCy9Uso7gu1259YZYXKOPyf4ppUhyH9fcKL9btCvflH2bCB7gMaPnrDaV1rZuw9
	 ke7DaSVaaNASg==
Date: Sun, 15 Mar 2026 12:05:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of
 Svpbmt "XPbmtUC"
Message-ID: <20260315-uptight-kinfolk-e4fece4d3447@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
 <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_050600_796267_EC6E80BF 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Type: multipart/mixed; boundary="===============8358232637544358714=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8358232637544358714==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ClXvIVeaEZNbVPHZ"
Content-Disposition: inline


--ClXvIVeaEZNbVPHZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 02:33:16PM -0700, Bo Gan wrote:
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index fa591aff9d335..faec169004b4a 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -1118,6 +1118,14 @@ void __init riscv_fill_hwcap(void)
> > >   		riscv_v_setup_vsize();
> > >   	}
> > > +#ifdef CONFIG_RISCV_ISA_XPBMTUC
> >=20
> > Code like this needs to be unconditionally compiled.
> >=20
> > > +	if (!of_property_read_u32(of_root, "riscv,xpbmt-uncache-bit",
> > > +				  &riscv_xpbmtuc_bit)) {
> > > +		riscv_xpbmtuc_mask =3D 1UL << riscv_xpbmtuc_bit;
> > > +		set_bit(RISCV_ISA_EXT_XPBMTUC, riscv_isa);
> > > +		pr_info("Using XPbmtUC bit=3D%d\n", riscv_xpbmtuc_bit);
> > > +	}
> > > +#endif
> > >   	memset(print_str, 0, sizeof(print_str));
> > >   	for (i =3D 0, j =3D 0; i < NUM_ALPHA_EXTS; i++)
> > >   		if (riscv_isa[0] & BIT_MASK(i))


btw, not sure if you saw this comment, about using IS_ENABLED() rather
than ifdeffery.

--ClXvIVeaEZNbVPHZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabagogAKCRB4tDGHoIJi
0r34AP49ylCNDRGFQceatVi18SbN8zTJ9+pAO8n99b3xWxlDBgEA3lisTiKeXeZn
f7QBUbuzAv6Iwmj4Qt3Iv30NPyrktw4=
=ifwS
-----END PGP SIGNATURE-----

--ClXvIVeaEZNbVPHZ--


--===============8358232637544358714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8358232637544358714==--

