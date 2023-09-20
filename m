Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F2AC00E86
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Q7iy8u48G8gg1URGp6/ZyPTxmo98F3u3ZyumXyOoBY=; b=NfSEV8QOhWdJ49JGL+CLF8Bvvq
	BpGRtXGGPjQrd8Gybcn43q1jOQIFyLV+QQlcafAKEav8Uqce4xdt+5wBrIUY9LBKCMIGgXjysrVkr
	ohztgzKgznsyfJ4nLLoAUprCuACgjT7ZcQw8SMh1w7799UMa4rsBX6VkfsjIewM909tOAqLdkqdJ4
	HSd5FNjVyZ78HiB9jQmDvB2aFDk0AlWseNtUboM6rqONi4orBHwHOuw9FkTPKVAmXVMDG0uQyJvCZ
	AHE27CeBXaeEt2SsTm90WJBq1KpSBREVBGN3e/qQzeDr3QaYRjW6MUN356rIHJFxzKeM/P3XnHwPE
	0L7I+rdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizBA-003Vin-1W;
	Wed, 20 Sep 2023 15:31:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizB6-003VhK-1r
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:31:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6E536CE19A2;
	Wed, 20 Sep 2023 15:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A284EC433C8;
	Wed, 20 Sep 2023 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695223904;
	bh=vDRC+pMd+istEzU3u9J+6oRj4LV4EU2Hsm2Q37r1+P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XO1/tCZUlwCBIbs5u4A1SCtenBzkBrRpVAG6ciDLezz+sC9kS9AbSzaocGwlkjrBY
	 4rm6+nlC66Qe2H+5R9CvP6p5xzNMizWfig65dnrmSNHfASwkrnr4j/bggBQs8G0N89
	 CjGHKAdfXPMo4jRALmPujyADPdi7/YADRQ1XGVpHUJXZAAVcZ/3tyUHsFkD4ieZuDD
	 rFKOVJm0tO8zCn1hZDV6b8JrUZOdtAxh1gDwlbUXKHJ+M6lZdLSi9OZNZfyoCLBgZb
	 2QTwxYrl0oyiiGYUcN9KwuQo6KFm/s2zzYakos3Cvl2YMW2sp3owiNtTcigDwdWPq9
	 cQis8vO6XPLCQ==
Date: Wed, 20 Sep 2023 16:31:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: unicornxw@gmail.com, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, wangchen20@iscas.ac.cn,
	inochiama@outlook.com
Subject: Re: [PATCH v2 09/11] riscv: dts: add initial SOPHGO SG2042 SoC
 device tree
Message-ID: <20230920-e8d6af9c0c652631412606ab@fedora>
References: <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
 <mhng-09373969-fd57-4fa2-b0fa-470004f6e17c@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-09373969-fd57-4fa2-b0fa-470004f6e17c@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_083149_031210_D0569932 
X-CRM114-Status: GOOD (  20.26  )
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
Content-Type: multipart/mixed; boundary="===============6111100374562118344=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6111100374562118344==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iKhkmUT5MoZnUM4l"
Content-Disposition: inline


--iKhkmUT5MoZnUM4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 08:19:59AM -0700, Palmer Dabbelt wrote:
> On Tue, 19 Sep 2023 23:40:32 PDT (-0700), unicornxw@gmail.com wrote:
> > Milk-V Pioneer motherboard is powered by SOPHON's SG2042.
> >=20
> > SG2042 is server grade chip with high performance, low power
> > consumption and high data throughput.
> > Key features:
> > - 64 RISC-V cpu cores which implements IMAFDC
> > - 4 cores per cluster, 16 clusters on chip
> > - ......
> >=20
> > More info is available at [1].
> >=20
> > [1]: https://en.sophgo.com/product/introduce/sg2042.html
> >=20
> > Currently only support booting into console with only uart,
> > other features will be added soon later.
> >=20
> > Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 1744 +++++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/sg2042.dtsi      |  439 +++++
> >  2 files changed, 2183 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi
>=20
> Just an FYI: a handful of replies to this are getting blocked by the lists
> as they end up being too big.  I just went and allowed what was there, but
> future replies will probably require someone to be away as well and thus
> might be slow.

95% of this patch is the same, if people that reply are good citizens
& trim, it'll not be too bad. btw, if you want, you can add me as
someone that can click the "not spam" button.

--iKhkmUT5MoZnUM4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQsQVwAKCRB4tDGHoIJi
0uOsAQCyjy3WsBTXoTMVD+ypX+oNG+eBikmo/bWRi0/v9v+GLwD/VfFHnfj9JoEz
O1i5OsFBctQObbyWHyhshnVjKOXjSQQ=
=nmgF
-----END PGP SIGNATURE-----

--iKhkmUT5MoZnUM4l--


--===============6111100374562118344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6111100374562118344==--

