Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398EBC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYMudR+9bCahAgOTq60qP44qw/v44Rnf22od7+B8+AA=; b=GN448Qwmay/siWhqRyNFqgah5u
	CkhjrOc/chbXqfo6l3zibHy0EKbyVHDugXloaw/CZ4abJbRFWSToPCngppXWN3KuEqOSbiXk6GGZx
	9se++T6QN6RH2emMF04yBo4hALwcSRz1G6/5zUw++NEmrHnU+yuiHYC/3u3Kni/yZ5DkO7wHLUdAv
	FpILXSoqeugyC1QYC92dg7EE7LG24v7u5ipQJ7ZKvfgOZYLsfl24R5sHhsVkm73oETaQiNAuUSS+a
	7xZmSmLQDahX20i7J0X90j9uQs2lrQ86nRdQiRxwpLVnsdrLAyWyTeEeZUyCJWNpww61RSC7wdcfD
	h6ZkKbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CA8-000000035Fz-2Csr;
	Thu, 09 May 2024 22:22:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CA5-000000035FB-2njs
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 22:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EA7861DFD;
	Thu,  9 May 2024 22:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F940C116B1;
	Thu,  9 May 2024 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715293368;
	bh=t3AE0C2YacrUZCTb4JRj3hzsa+lHuEvQQO/PQSjoxNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMrZFnIShdbR6UvQ01rcp+t1LeIHoY5Y2AD+JRKCHUBoS0NA48p0xLWusq5PPoEfX
	 FE3e8OnlE0uxdq8cvSJDbZIsuAu4/IX3P57NaXUGqyLDgdSbeDoTSjl29Y+pg68HtX
	 g+wEsi+avkRq7uNrdLBzNTge88GJ2sOi1PhKgMp13WZK3fh7bDMaqi/YUSdUQdEY5E
	 yqznvKm1XK8vv0D+cKhoBpvCDOcjSnyKq7oJBXr5GTjfClVWnwK9Y9/hnG7FH29vtu
	 vqtks0t3/Ft8vxVis2DUczaQTTa0zzGoSA2AZ3PWKpfVSLBNY8VoKRV+xI0SGiRS8W
	 VqayPJ/5ZbbSA==
Date: Thu, 9 May 2024 23:22:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Joel Granados <j.granados@samsung.com>,
	Jerry Shih <jerry.shih@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240509-irritant-morphing-a25428a4f750@spud>
References: <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain>
 <20240418173946.GB1081@sol.localdomain>
 <20240418-sterling-sanding-d59c3b0a2aaa@spud>
 <CABgGipU74TA3KgCH4pPuRefbnYt3q6RKcQwfyspenisEtY6eqw@mail.gmail.com>
 <20240509-mandatory-monsieur-dfa4d7881fa9@wendy>
 <20240509-habitable-unrefined-02322f228d5a@wendy>
MIME-Version: 1.0
In-Reply-To: <20240509-habitable-unrefined-02322f228d5a@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_152249_822816_C732569F 
X-CRM114-Status: GOOD (  35.06  )
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
Content-Type: multipart/mixed; boundary="===============8864279152708612001=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8864279152708612001==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TLKFE95zt1kQU6Bl"
Content-Disposition: inline


--TLKFE95zt1kQU6Bl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 09:25:25AM +0100, Conor Dooley wrote:
> On Thu, May 09, 2024 at 08:48:09AM +0100, Conor Dooley wrote:
> > On Thu, May 09, 2024 at 02:56:30PM +0800, Andy Chiu wrote:
> > > Hi Conor,
> > >=20
> > > Should we check if "v" presents for vector crypto extensions in
> > > riscv_isa_extension_check()? We are not checking this for now. So a
> > > kernel compiled with RISCV_ISA_V still has a problem if its isa-string
> > > includes any of vector crypto ("zvbb, zvkg, etc") but not "v".
> >=20
> >=20
> > Yeah, one of the things I took away from this discussion is that we need
> > to improve the implementation of both the methods we have at the moment
> > for drivers etc to check if extensions are present and usable.
> > In general, I don't think checks like that are "safe" to do in
> > riscv_isa_extension_check(), because the dependencies may not all have
> > been resolved when we probe an extension (Clement's current Zca etc
> > series improves the situation though by only calling the checks after
> > we probe all extensions).
> >=20
> > The simple V cases are all fine though - the DT binding and ACPI rules
> > for compatible strings all mandate that single-letter extensions must
> > come before multi-letter ones. For riscv,isa-extensions we control the
> > probe ordering and probe V before any multi-letter stuff. Additionally,
> > we should make it a requirement for V to be present if things that
> > depend on it are.
> >=20
> > That said, is it permitted by the specs to have any of the extensions
> > you mention without the full V extension, but with one of the cut-down
> > variants you mention here? If not, I'd be more interested in figuring
> > out the non-extension dependencies: whether or not the kernel itself
> > supports vector and if the kernel has opted to disable vector due to
> > detecting that harts have mismatching vector lengths.
> >=20
> > TL;DR: I think we should add some checks in riscv_isa_extension_check().
>=20
> Also, unless this only becomes a problem with this series that adds the
> cut-down forms of vector, I think this is a separate problem to solve
> and I can send some patches for it (along with some other cleanup I'd like
> to do as a result of Eric's comments) and you can just submit the v2 you
> were planning to without it. I can't, off the top of my head, think of
> why this particular series would break the vector crypto stuff though,
> the problems with enabling extensions seem underlying.

Here's something buggy that I chucked together as an idea of what I
meant:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Driscv-check_vector
Beware, it is entirely untested :)
It's based on both this series and patches 2 & 3 of Charlie's series doing
the T-Head vector stuff. It really needs Clement's extension_check()
rework that I mentioned 2 mails ago to function correctly for any of these
vector subsets. Without Clement's stuff, it'll have "random" behaviour
depending on probe order for riscv,isa and a determinate, but incorrect,
behaviour otherwise.

Cheers,
Conor.

--TLKFE95zt1kQU6Bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj1MsgAKCRB4tDGHoIJi
0vmgAQD45tbvFJoRsUpsMY9T6rtZpE9/d1MUPNtjjZBcCvk81wEA9NHuzDQWVqos
TKv6UR8HGOSqtTdK0XRrTlDGxoRiZQo=
=ulWy
-----END PGP SIGNATURE-----

--TLKFE95zt1kQU6Bl--


--===============8864279152708612001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8864279152708612001==--

