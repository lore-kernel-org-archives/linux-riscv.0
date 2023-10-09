Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D69ECD6125
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mykJq1/4CeKB8pADKpiwrIwJ9PM8CqCMsnJfG0+jIAg=; b=anzdCB+2dd0mS/f7QL7Sd7+gjN
	RuCBGNLXJfVH4DIf9yRoWik5BdGv7Xh/TWqy6kdGAEp4apruF20uph9t7ne6ZUL9IMuzmOr8zs7BR
	Lr9NgG7/t6eo1YZAlX5vIWeBVifjqlkyCo97N76e373ExLEVxliBKTb17sO4VRNXJFDcujenQbRJC
	vKsPoH7kYTOEA4eaag+3eAyay1KcBb2TbjuwpSMYGZtFtmsfdvnDcFiRu4Li21ucU+TDK2I2Nq6Oh
	+UjuOLDIe2lQnRfOSJJVyxRnhtuaMfq6K2de1Kt9y7go6xXBUs6aM6YtuOOo1DexKGVwDWhH5KDh9
	Gia2HuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpvLU-00BRMY-0D;
	Mon, 09 Oct 2023 18:51:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpvLR-00BRHo-1M
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 18:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3E6ECE17F6;
	Mon,  9 Oct 2023 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32660C433CA;
	Mon,  9 Oct 2023 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696877465;
	bh=EWYoHUxU9PfwIcw6RRafcY/b9jcGCDKgwtSwZ93vXkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRF0Ttm8MJ0ovlRSLQWoooPhqsT+UAvgs1OOYowfWsb+HQKayDzkMSozkTrJldIA+
	 6bDX75HHnX6Tv7XDvSJxmv/d2Csx6YSHWU7b9AQV4JjRuNa+zNsIXEV2g+BhxAitg7
	 QCtH7GXLcozgItxfOnEUwUdUCjV8yFsv6L9qjvd187YXfEixVcGKGBHx4TV0Yv/Fh2
	 J8BdOK0pbJIfxECi9BLj9KueY8NlSYhJ6b4kecg8GzPjfA0wSGxNPlKUJ9nvFb/Xsm
	 VSAHOAj/da4x8EvrhWD6gcWglOBtkIpel9cd2+8omHCgi/lpYLQ37JiUO104Xh6Auy
	 Xb8DuPZBDAMKQ==
Date: Mon, 9 Oct 2023 19:50:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, devicetree@vger.kernel.org, guoren@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
Message-ID: <20231009-pretext-snowy-1cfb49990ddb@spud>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
 <20231007-grasp-retake-0463858c13df@spud>
 <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231007-kennel-lustily-59b0a9867aaa@spud>
 <MA0P287MB03329460B9F3B79B1148A6FDFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231007-green-correct-11d08f650ddd@spud>
 <MA0P287MB0332B11A8481F491E4F0536DFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332B11A8481F491E4F0536DFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_115109_822134_21C5E09F 
X-CRM114-Status: GOOD (  26.11  )
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
Content-Type: multipart/mixed; boundary="===============7740353703828891328=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7740353703828891328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LPpjd4457YnzLrjL"
Content-Disposition: inline


--LPpjd4457YnzLrjL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 08:48:34PM +0800, Chen Wang wrote:
>=20
> On 2023/10/7 20:36, Conor Dooley wrote:
> > On Sat, Oct 07, 2023 at 08:25:55PM +0800, Chen Wang wrote:
> > > On 2023/10/7 19:04, Conor Dooley wrote:
> > > > On Sat, Oct 07, 2023 at 06:58:51PM +0800, Chen Wang wrote:
> > > > > On 2023/10/7 18:17, Conor Dooley wrote:
> > > > > > On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
> > > > > > > From: Chen Wang <unicorn_wang@outlook.com>
> > > > > > > Changes in v5:
> > > > > > >      The patch series is based on v6.6-rc1. You can simply re=
view or test
> > > > > > >      the patches at the link [7].
> > > > > > >      - dts: changed plic to support external interrupt
> > > > > > >      - pickup improvements from Conor, details refer to [8].
> > > > > > Did you? I only see them partially picked up. I'll just replace=
 patch 8
> > > > > > with the patch 8 from this series I think.
> > > > > Yes, only the patch 8 of this series(v5) is updated for plic node=
=2E For other
> > > > > patches, I just cherry-picked them from previous "sophon" branch.
> > > > But added my signoff? I ended up seeing my signoff on the patch whe=
re I
> > > > disagreed with the commit message, which was confusing to me.
> > > Oh, I used to think I can keep the exising signoff and I didn't mean =
to add
> > > it.
> > I added mine when I applied the patches. It no longer makes sense when
> > you resent another version.
> >=20
> > > Anyway, I agree your suggestion to create a new patch with only one
> > > change should be better, I will follow this in later work.
> > :)
> >=20
> > > Regarding your changes on sg2042 series, I have acked in another emai=
l : https://lore.kernel.org/linux-riscv/MA0P287MB0332BA73D0135CC73CAEA16DFE=
C8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/.
> > > If anything else required, please feel free let me know.
> > An ack on Jisheng's series for the cv1800b would be nice.
>=20
> Done, I have reviewed and acked all the files related to sophgo.

Cool. Both your and Jisheng's series should end up in linux-next
tomorrow, I've pushed both to the riscv-dt-for-next branch.

Thanks!

--LPpjd4457YnzLrjL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSRLkwAKCRB4tDGHoIJi
0rW9AQCgH7wH465HHkJZUgXkFxDSIGwT+zdKUMYezzCSJmzTiQD/RSTBvwNO9iLX
1JL/GhqiRgflLbNTazQ/f2/5CdoDRgA=
=mpd6
-----END PGP SIGNATURE-----

--LPpjd4457YnzLrjL--


--===============7740353703828891328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7740353703828891328==--

