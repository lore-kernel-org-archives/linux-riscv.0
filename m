Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4DEEE6457
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pY0LrRr0ZfLwjxstN/nAyg2+NUxl9XraDmCMIGtEDTk=; b=RB9lIiHI1fvEQOoEMsgwwNGm5L
	JtmdZ1WOqJsLzpgraTyyPK/Z0siFrQbTy5AOwWlrR6Nqc1YisW3n6ZxybIo76ILBytKkI7kQgGhCC
	nzg53doXFusu+SgfjzMaIicVckXKbjvLVZxjyRQyXnQ2zgVGwR681v35wGbTm34UCLpT7nZ9oZ1sO
	AF4Coecf91kq2cSExnq68h88LF59V/4Zd8EyKRuLJAq98Cjf1Ww+PY2HtqqU0agfr0pW2tdyjgxfG
	H8Qt1nX149rd0XzkdSkzRQUQANbA1BBFM9IUgTA3O13lEv9hzORPWMp5qgd5HfXvrrcVIoiW9dvMj
	pkGSW5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9XW-00ArVC-0t;
	Fri, 15 Sep 2023 14:11:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9XT-00ArTq-0W
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 14:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 10603B82AE7;
	Fri, 15 Sep 2023 14:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E978BC433C9;
	Fri, 15 Sep 2023 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694787069;
	bh=Io4WAeudrk6GrRUOfTXXAh8NLlPv6VHeQ/TAl6xHSRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7rJ+eYzqTMUXBOSTFHpxp1WJQ6MKXSbTfvNzDre5bFqK6ccE7GeDMFSFwYXs8Vbe
	 4r3L9hm5BhzxmXngtgLNSdNaALsZWyFldO+7eENEcETHGxqI/cR46PSmsNaOi2jO/C
	 0Nr7BkWEzmHmcvhOxLTkRGKeXNriT33DZBnT9n2Q0kVydqnJIQtDCSsiqqB6kQJS8i
	 re6zDjDnwjmSnBPp68kY7qMVCR6dQjyRWrM2rEV7AynCzakeQRdNws61Mez0GT5Exg
	 AX/8kF+tyk+YVp8EGaHFaqMFtfPNgIHa859dVFMEOVDmmL+zuD/Q/DH4F4jiZq3fUw
	 f7iirUQz0muPA==
Date: Fri, 15 Sep 2023 15:11:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Wang Chen <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 03/12] dt-bindings: riscv: add sophgo sg2042 bindings
Message-ID: <20230915-boxing-emporium-669d2715a347@spud>
References: <20230915072242.117935-1-wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230915072242.117935-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_071119_341906_C895FC67 
X-CRM114-Status: GOOD (  13.20  )
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
Content-Type: multipart/mixed; boundary="===============2974790574450118254=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2974790574450118254==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7mnyoaMGIeydQZQF"
Content-Disposition: inline


--7mnyoaMGIeydQZQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 03:22:42PM +0800, Wang Chen wrote:
> Add DT binding documentation for the Sophgo SG2042 Soc [1] and the
> Milk-V Pioneer board [2].
>=20
> [1]: https://en.sophgo.com/product/introduce/sg2042.html
> [2]: https://milkv.io/pioneer
>=20
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..0e0d477dab38 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20063,6 +20063,12 @@ F:	drivers/char/sonypi.c
>  F:	drivers/platform/x86/sony-laptop.c
>  F:	include/linux/sony-laptop.h
> =20
> +SOPHGO DEVICETREES
> +M:	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> +M:	Chao Wei <chao.wei@sophgo.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/sophgo.yaml

I would like to see an Ack from those you are volunteering here.

Thanks,
Conor.

--7mnyoaMGIeydQZQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQRl+AAKCRB4tDGHoIJi
0ji5AQCqmobFFy4Yzr1rP3PjWE6fjopsBHPqt6RocnjXhOSzqQD9F1AsZRZN+teA
oT85ufv9f6HJpdZ8+sI+t+j9LbEQmgc=
=jVSa
-----END PGP SIGNATURE-----

--7mnyoaMGIeydQZQF--


--===============2974790574450118254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2974790574450118254==--

