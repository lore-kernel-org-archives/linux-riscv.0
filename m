Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161FBC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 21:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e19UT19EvuF3aPJh8GCrkGrmlENR0y3MQBSNSltq/PU=; b=yeonNjfksE7+A4RxGb5NDpZbZs
	oQAQFxPmanFxmOyAZlXPhn+h+VtfFWDFz6GDo68qNx3eVxonALePPlo8IPY7Oy4Urk9tNuK27Cyv7
	Sd2mhin1psW7YivgORMFqrvt4IRT6hF4zAV9C7PeVTanU0KfA1E16yuwxAyXw4i8sIo9EVpsUBzFA
	fBT8kK6gr2KQZUIk6eiP8smmauKTl2lJsW2oCbBVwOUDslWLTWU/4ULPDmFSfftzsnb4qiPZFNwUL
	n7AeK33h16oATqme7ZXERjIxJ0Kz43Se6jzs5hS0mTYdhDbyuk/TjjT3zkf8NK4Az2uW8+VRdvY3f
	UjHzbYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Xqw-00000006XSz-2YSW;
	Fri, 10 May 2024 21:32:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Xqt-00000006XRu-0XmT;
	Fri, 10 May 2024 21:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FE4A61ED0;
	Fri, 10 May 2024 21:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4010FC2BD11;
	Fri, 10 May 2024 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715376745;
	bh=HaAF5YLZNnHFDlTcRRRh1aLznDIBDt54LRmZro1kBkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PW0loYjBa6QcXh8gmikKKdFQ+JniYLnMAwVmZvGkjTJ0rDFzoJZbvYtI56baJyF+I
	 gc2m1x1XG5f/Df6pBje4TguN/vGK8UrmL+3rV64DotR+AG/+iwJMfgQx78wYWNpv6X
	 kb1gvVD0w4RjMFvfoE1zDAPMNGRkLXkcCJ6AcvZPHLmFJkW5zLMyZoTpIuQOf++BXu
	 5cqXNmgNIDj8OhwCxbZDyuQ34sZWdpai2kLZHn/qPXBqevODaevVM4e+5E8A8fWiYw
	 7ZqOFAvSOJLpZR1pveFlSDZhpQyySDjVqIbFXdbrunnUNYO+a9bnZBV0h32zvviK8d
	 T/Or0mgVLdhXQ==
Date: Fri, 10 May 2024 22:32:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Message-ID: <20240510-unexposed-desecrate-e30674d4530b@spud>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
 <20240507-divisive-swoop-c2737a2d9a9f@spud>
 <20240510-childcare-outlook-d18e3cc5ccb3@spud>
 <Zj6QxisrBZSWq7ax@ghost>
MIME-Version: 1.0
In-Reply-To: <Zj6QxisrBZSWq7ax@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_143227_277658_A660340C 
X-CRM114-Status: GOOD (  24.89  )
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
Content-Type: multipart/mixed; boundary="===============5399179359574608460=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5399179359574608460==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a4gruBJ406lMx+Li"
Content-Disposition: inline


--a4gruBJ406lMx+Li
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 02:25:26PM -0700, Charlie Jenkins wrote:
> On Fri, May 10, 2024 at 09:50:32PM +0100, Conor Dooley wrote:
> > On Tue, May 07, 2024 at 06:03:19PM +0100, Conor Dooley wrote:
> > > On Fri, May 03, 2024 at 11:18:21AM -0700, Charlie Jenkins wrote:
> > > > All of the supported vendor extensions that have been listed in
> > > > riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
> > > >=20
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > >=20
> > > This seems fine, thanks for updating this interface :)
> > >=20
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Hmm, actually the automation on patchwork is complaining a bunch about
> > the series, but I think that's mostly false positives except for this
> > patch. The nommu defconfigs are prob the easiest way to reproduce this:
> >   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:41:55: er=
ror: 'struct riscv_isa_vendor_ext_data_list' has no member named 'vendor_bi=
tmap'
> >   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:42:60: er=
ror: 'struct riscv_isa_vendor_ext_data_list' has no member named 'per_hart_=
vendor_bitmap'; did you mean 'per_hart_isa_bitmap'?
> >   /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:43:60: er=
ror: 'struct riscv_isa_vendor_ext_data_list' has no member named 'bitmap_si=
ze'
> >=20
> > Cheers,
> > Conor.
>=20
> The false negatives always throw me off.

Aye, it's pretty frustrating for me trying to report anything. Any time
a bunch of headers change produces a bunch of file rebuilds and
therefore warnings. That should in theory be caught by the fact that we
apply the patch & build, jump back to HEAD~1, build that & grab the
"before" warning state and then jump forward, rebuild the patch and
gather the "after" state. The idea is that that is an apples:apples
comparison as the same files will need to be rebuilt for both but it is
falling over somewhere. Maybe I'll have time to look into that soonTM.

> The errors are also offset by
> one patch.

Ye, that's my bad I think. In a rush off to another patch before the
thought I had on it left my brain and just pressed reply on the wrong
email. Sorry bout that :)

> This was actually introduced in the following patch "riscv:
> Introduce vendor variants of extension helpers" because I accidentally
> fixed this issue in the patch "riscv: cpufeature: Extract common
> elements from extension checking" instead of the one it was introduced
> in.


--a4gruBJ406lMx+Li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj6SYwAKCRB4tDGHoIJi
0qSAAP9DtyG6cFxATpySce/LDWJjuSKIYinHHmeKGVGjDvqZkAEAkXi4b5NHBscV
XEmApTynzq59bPinnFytkPxtGEnfKAw=
=Z9vu
-----END PGP SIGNATURE-----

--a4gruBJ406lMx+Li--


--===============5399179359574608460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5399179359574608460==--

