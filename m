Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB871EE645D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 14:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ea+GHQaZc9D4Nw72uiT5VV9HOOfIE82QwLRaWSDtmI=; b=T0HwB77HSYCcpxjnVzWsGCqBIh
	iNrKkbXjaDYoFtpZZxKyu0RlDbkiDO36fnZEd5ky3LD1Wyo/3zg6HzFYPDPvhzx+1/lCpLJ6iP005
	nhbHvsXyS7oNntUkF29b5sKr8oSxOUEMNTIhw5rGKKVxJ/O/4UivV7sI41v+IZO/ZAEeiAfese7Eq
	92YglC8oCt+QRE15mVnkTElJfvuexzvK3WSxntzK/NEdOsIqdUPbLiy9wY/Pw8aNUqV/ATRbn4Mhg
	Af0RjkuNijPkBcQNwa5iwcAjUeA3v5OZ47Neu2ESDu82d2OWxubuX7Q8BnFQQ4aji3WxO3wg5FvmQ
	eTZcEKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9eX-00AsEX-2d;
	Fri, 15 Sep 2023 14:18:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9eU-00AsDr-2C
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 14:18:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ACB46CE296B;
	Fri, 15 Sep 2023 14:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33293C433C8;
	Fri, 15 Sep 2023 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694787510;
	bh=NGHyNfngYAoRYPFTNCehZc9kQqdxb/OpDzME1uzZLxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqAfXzb/dZXYaiwskKA5YNGfPCbSuNQl9f66a8h27Cnuou+XHGq+dQvzv8g4NNZT5
	 zEjBpJqXz1wZqeffS2g5wIEztBcFRqcZIfdnO15tx31hFIr4ykCeErVMV+L83UO+f8
	 joyEDx1yenRjihRF0LyDocrmppGqqzPIJDQzevhtAwsZ6lXrcIleAXn3cAwrQCxZFN
	 RBZhlA6cz5bA15WjjBG8NZxY9LFbCfy8CUu/yZNcTI6vgHZ32v2+foXOqTQwXM0QdV
	 18bQzJfdDRvdcQgemwwVf8UH1Aarlczb5rVpVJt9s8x6hccEDObhT+ju9CELH6yIrq
	 TgKhairxl/eHQ==
Date: Fri, 15 Sep 2023 15:18:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Wang Chen <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 03/12] dt-bindings: riscv: add sophgo sg2042 bindings
Message-ID: <20230915-reoccupy-clustered-231e58a00f3c@spud>
References: <20230915072242.117935-1-wangchen20@iscas.ac.cn>
 <20230915-boxing-emporium-669d2715a347@spud>
MIME-Version: 1.0
In-Reply-To: <20230915-boxing-emporium-669d2715a347@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_071834_895249_9363045B 
X-CRM114-Status: GOOD (  18.58  )
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
Content-Type: multipart/mixed; boundary="===============1056742828391663784=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1056742828391663784==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5kwtB/G/oIJ2SyNw"
Content-Disposition: inline


--5kwtB/G/oIJ2SyNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 03:11:04PM +0100, Conor Dooley wrote:
> On Fri, Sep 15, 2023 at 03:22:42PM +0800, Wang Chen wrote:
> > Add DT binding documentation for the Sophgo SG2042 Soc [1] and the
> > Milk-V Pioneer board [2].
> >=20
> > [1]: https://en.sophgo.com/product/introduce/sg2042.html
> > [2]: https://milkv.io/pioneer
> >=20
> > Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> > Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90f13281d297..0e0d477dab38 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20063,6 +20063,12 @@ F:	drivers/char/sonypi.c
> >  F:	drivers/platform/x86/sony-laptop.c
> >  F:	include/linux/sony-laptop.h
> > =20
> > +SOPHGO DEVICETREES
> > +M:	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > +M:	Chao Wei <chao.wei@sophgo.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
>=20
> I would like to see an Ack from those you are volunteering here.

I'm going to assume that you also add coverage here for the dts files
later in the series, but since the thing isnt't threaded it is hard to
check easily. If not, then a MAINTAINERS entry covering them should be
added, featuring a person that is going to monitor the lists, apply
patches and send PRs to the soc maintainers.

As a last resort, I can do that, but I don't have this hardware and
would rather someone that specifically cares for this hardware does it.

Thanks,
Conor.


--5kwtB/G/oIJ2SyNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQRnsQAKCRB4tDGHoIJi
0milAQDChQzQ2fACthHIoqVBo61pfNxHONif3TV7/ItXZYpXmgD+KlVm9OHBkyJ2
QkzEmFmLHELmhoQTeGYPQPnb/MjeuwA=
=CP99
-----END PGP SIGNATURE-----

--5kwtB/G/oIJ2SyNw--


--===============1056742828391663784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1056742828391663784==--

