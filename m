Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD78BC07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rxtn3O/EmT9MOu1uhnOCERP74NHUh+UjVEwayFgl50Y=; b=kkzPqtVbttoa86wDDqazmmDXte
	N0XD6iIgvRb0qvReVY4UOYh6X6IhDSg4l6M0mseM68gPnqXX5+H+dU2kEIEyEfO1870U50GYcMPWC
	iQFaOp2NXVPdi6We+UFeobMOcbhkFdca5zokvvnhVy3VOakTKJ8z6CXrzf22MZfImlt4PDBLPcxb3
	ZkdtQkc9rhPQTdGd6zF9FmItGOUR+VTIbIYl8Xx3YEw8uLFmikQnfakK7vrkPNkvtBYsBkCZJGqsz
	VGQ5KC131VB+31ifOByfpEcU48Gqo/8iQxTp6UQ//xZiqXnTYErDTV4qBFAd1tgfJMg8IbrvNYeKC
	pesZvWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdyh-00000004Zcw-2Qem;
	Wed, 24 Apr 2024 14:52:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdyd-00000004Za4-2pBQ;
	Wed, 24 Apr 2024 14:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D07BBCE1733;
	Wed, 24 Apr 2024 14:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCF5C2BD10;
	Wed, 24 Apr 2024 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713970321;
	bh=xPav91uI1ZNG9OJ6vetVcvDnMQMHSyXYAwBYPIfWJAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otlWOyP+tAKLOQY2jJz85UVBDjxfaJSShJb8fCwhde1QoWBVcXV9L8kOXZ7YiktDq
	 CRFb4dulN7XW95JUfM340CSKNKybZ2dJ/b22SsZmQHhpqofEEHEXAqU2wibXzCVcS4
	 HMfrS42NqBU81/dRPTkCtrvTtS8gTilQE5Db4nHV+I76fiYJBhDWN3DjU9kCwIeHh6
	 4jJBSNhlOmgAMqensikb4v8l+gbU3+tw7ozUQMwFHWkUnxOIf1FA6OpSCkGWp9J4rL
	 qB5hmqfwunYdSCmCdXGDOuwRopsL05J5I6EI7VnQPgdbplKA3I0ae1TvQI8BIOQKJG
	 eF4loR+GluPmg==
Date: Wed, 24 Apr 2024 15:51:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 06/17] riscv: Fix extension subset checking
Message-ID: <20240424-wildly-goofy-c81aac6f8cd7@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
 <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_075204_346587_461D1DBB 
X-CRM114-Status: GOOD (  22.85  )
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
Content-Type: multipart/mixed; boundary="===============3844148437147801347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3844148437147801347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ISCd5ZrJR7K6TsSY"
Content-Disposition: inline


--ISCd5ZrJR7K6TsSY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 04:22:02PM +0200, Alexandre Ghiti wrote:
> Hi Charlie,
>=20
> On 21/04/2024 03:04, Charlie Jenkins wrote:
> > This loop is supposed to check if ext->subset_ext_ids[j] is valid, rath=
er
> > than if ext->subset_ext_ids[i] is valid, before setting the extension
> > id ext->subset_ext_ids[j] in isainfo->isa.
> >=20
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypt=
o")
> > ---
> >   arch/riscv/kernel/cpufeature.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 48874aac4871..b537731cadef 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(un=
signed long *isa2hwcap)
> >   			if (ext->subset_ext_size) {
> >   				for (int j =3D 0; j < ext->subset_ext_size; j++) {
> > -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> > +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
> >   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
> >   				}
> >   			}
> >=20
>=20
> I think this should go into -fixes, let's check with Palmer if he wants to
> take this patch only or if you should send the patch on its own.

I think splitting out this and patch 1 into a new series targeting fixes
would probably make things clearer?

--ISCd5ZrJR7K6TsSY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZikcigAKCRB4tDGHoIJi
0lY6AP9fxMZ4oOWAWRpbaYHs+Q77SeZ+QaOXEZh098c2I789WAEAmdgrmjjeEcJ4
b2LKa6uCXOLW9VEFR/QJlfNVN9MYwgU=
=Z23p
-----END PGP SIGNATURE-----

--ISCd5ZrJR7K6TsSY--


--===============3844148437147801347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3844148437147801347==--

