Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AABC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+myquhSFlU/FqMjGCdYIEwJ7IuzKAfO/f5KRdIsuqrU=; b=rlhHSHmMrTdLQmC2qZgBnAuje2
	ECDmTscxo3CBaWdCoyS7qaY05q/8BUHniKoBWCjfK5KgyVTQD9ClRq2PIKVYeZSoZXCSSWkqwsEgc
	A3jUSpuAQFinGGymZxPPTSDpGLBNMMu48ul8PR0bSfCMgnMQanAuxhEe16euYfZXSCLqkoDcHtFYO
	McydEDfK8KjeCpfZTP8KvbO7TTTZRzVDwdwF5S6G/24UUI2/H8EeZzMZ0U+LACuYS8kOMR01EUgMc
	RL5yQk7MQYtzIxwZApb5TEqBQkpQI5ojtY7keFzriABkkW2mTrzpFbrsn7E7ercx/d2nqrmwcnghl
	abBPQvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EOi-0000000AOll-3OMW;
	Wed, 01 May 2024 18:09:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EOe-0000000AOkj-3YSU;
	Wed, 01 May 2024 18:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65914619D2;
	Wed,  1 May 2024 18:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDBDC072AA;
	Wed,  1 May 2024 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714586975;
	bh=GUrIh8yHkkjlZaW0ktFu8P9XlYLMGXvdBwQsqt4psgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJfy5onHBA+Zu1aUXMBi8sapeke4esXCAUWp5juWXi/8n05Rz+T2GKXlpuVUu+jBZ
	 bKxuby08Bzoblsk+ckGyQOU+0nTrIPPwTUSk34LPpqqKDlO1cAoYbdNuFXavu1AXpE
	 5/KA643kPVn1GLgV03XYS+pEgxXoPNxxpy6dKIL3o+jwR8LE31mDecnTA+VuS5dEAK
	 29Q+NccXCflx8gXcd7GXSSSn8pSxdqnAIFm9+AWOs3kd6aChniYKKNxyTm2uyPNUcV
	 cqra5dfmJOx5ys95/whQYG8wntuyTx2c7sNMFRm9Xk1n2AWaPhyY0Y0AlCqMOcMJu1
	 uNT8H3oBxBYPw==
Date: Wed, 1 May 2024 19:09:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240501-moneyless-shifter-a54bbaecc4e7@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
 <ZjKBKg5zzikR5ngl@ghost>
 <20240501-banner-sniff-4c5958eb15ef@spud>
MIME-Version: 1.0
In-Reply-To: <20240501-banner-sniff-4c5958eb15ef@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_110937_321668_099819CC 
X-CRM114-Status: GOOD (  23.10  )
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
Content-Type: multipart/mixed; boundary="===============2203767765399315680=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2203767765399315680==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yAv19tBoV/9fOzJc"
Content-Disposition: inline


--yAv19tBoV/9fOzJc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 07:03:46PM +0100, Conor Dooley wrote:
> On Wed, May 01, 2024 at 10:51:38AM -0700, Charlie Jenkins wrote:
> > On Wed, May 01, 2024 at 09:44:15AM -0700, Evan Green wrote:
> > > On Fri, Apr 26, 2024 at 2:29=E2=80=AFPM Charlie Jenkins <charlie@rivo=
sinc.com> wrote:
> > > > +       for (int i =3D 0; i < riscv_isa_vendor_ext_list_size; i++) {
> > > > +               const struct riscv_isa_vendor_ext_data_list *ext_li=
st =3D riscv_isa_vendor_ext_list[i];
> > > > +
> > > > +               if (bitmap_empty(ext_list->vendor_bitmap, ext_list-=
>bitmap_size))
> > > > +                       bitmap_copy(ext_list->vendor_bitmap,
> > > > +                                   ext_list->per_hart_vendor_bitma=
p[cpu].isa,
> > > > +                                   ext_list->bitmap_size);
> > >=20
> > > Could you get into trouble here if the set of vendor extensions
> > > reduces to zero, and then becomes non-zero? To illustrate, consider
> > > these masks:
> > > cpu 0: 0x0000C000
> > > cpu 1: 0x00000003 <<< vendor_bitmap ANDs out to 0
> > > cpu 2: 0x00000010 <<< oops, we end up copying this into vendor_bitmap
> > >=20
> >=20
> > Huh that's a good point. The standard extensions have that same bug too?
> >=20
> > 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> > 		bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
> > 	else
> > 		bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
>=20
> I suppose it could in theory, but the boot hart needs ima to even get
> this far. I think you'd only end up with this happening if there were
> enabled harts that supported rvXXe, but I don't think we even add those
> to the possible set of CPUs. I'll have to check.

Ye, you don't get marked possible if you don't have ima, so I don't
think this is possible to have happen. Maybe a comment here is
sufficient, explaining why this cannot reduce to zeros?



--yAv19tBoV/9fOzJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjKFWAAKCRB4tDGHoIJi
0kU9AP4s89glK6UnykI5g5cj0b710rlhFt08mdDjYgdqVE4BzwD+Pa0gATqWhdOe
sO8sV3u9SVcK+K5gu/2K3mQMzB+OYQE=
=r/pQ
-----END PGP SIGNATURE-----

--yAv19tBoV/9fOzJc--


--===============2203767765399315680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2203767765399315680==--

