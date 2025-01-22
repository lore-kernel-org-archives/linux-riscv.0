Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A535C0218C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8bDkxeRgCbMLYHzpoTERG9BwJ05+S1dlhqwcRwwNtc=; b=zdHoeC6lKRQtatS6szxCpvW6r5
	vaaeWzbhYptlFlX2w58ShCQS5bFGLpod21sJebQAf/xI0U/1tWfTQb2bQAtrjr8+Ny8720xfBML6B
	+EdoJB5Qqk1/uDdGqfH0B58RoPXMwAcXkBPfqjAwdTCeXpx7hJ22djzTzQ3c1b8s84MarfyD7GpP6
	gc5RzMEt20vhQ+fVSWjBkoVs0mRJeFHy2vlZ+tIMCwvRu82KN3tzBP4R/6cfA9XTlEvob+GquKGtK
	AdZEz4IxC/MYEGmGoSxv7Syg5BAIbF55TnXV8G3+Oki5n9UtWJKYRmO3+Qo1yX0H+jGos1KnhvkOg
	dLfe8Ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXaz-00000009squ-11ZJ;
	Wed, 22 Jan 2025 10:04:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXa2-00000009si3-39nP
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 10:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80B44A41F37;
	Wed, 22 Jan 2025 10:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26600C4CED6;
	Wed, 22 Jan 2025 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737540205;
	bh=Dtna4X4kUOTIn/2TE5vGjCOO4vkwDc6jwkfCRfVrpKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ji74LSfJVkRnyAqWpsATfujRQZH0P4tlRY+6ea3/hknDY3aO0WaocKjlcmU8P3kES
	 zkyBt1CjiQIK72ZjLTnmdh7UAK6t8iK2OjxGiRNleasyfcnNC2w78IhHYWYJ8eUzYS
	 15UcMapTO/b9tXWUgdIZ9Jxus/GeARMkhbUNhLOPkEM9E4d1bDTOqtO9H9bA5jCN8m
	 zV9WYXmrpdquWrr0SlMoE3x2faSRe/od2/h9V8wgojFA8EP/1XtETu1KJ6OB4iEvi/
	 7/gVMKdYGfcoGZtL73MRl4iorRI+yu9yUER62a5l/dvCN37GdVvzk+T7TmlLunr2r8
	 M+pxM6F1iflEQ==
Date: Wed, 22 Jan 2025 11:03:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com, Sean Young <sean@mess.org>
Subject: Re: [PATCH v6 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <dlnfivdhol7faotaqygpvdi2zbgpwrvcruppbkgfleoa6msxib@voe7dhqvfmy6>
References: <cover.1733281657.git.unicorn_wang@outlook.com>
 <4a7db3ecac9ac2b00c063360334834d6656672e3.1733281657.git.unicorn_wang@outlook.com>
 <e2we4klv7w234zyc4vnbcydieyhcte63sdwcp43vmolmlasv5f@scsiepnnw3db>
 <BM1PR01MB2545319120D9B3932C8C8806FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <BM1PR01MB2545319120D9B3932C8C8806FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_020326_858107_3A3DF827 
X-CRM114-Status: GOOD (  13.75  )
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
Content-Type: multipart/mixed; boundary="===============2211281369831798941=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2211281369831798941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5rqt2gca63irfwgt"
Content-Disposition: inline


--5rqt2gca63irfwgt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
MIME-Version: 1.0

Hello,

On Wed, Jan 22, 2025 at 04:58:26PM +0800, Chen Wang wrote:
> On 2025/1/21 19:14, Uwe Kleine-K=F6nig wrote:
> > On Wed, Dec 04, 2024 at 11:17:18AM +0800, Chen Wang wrote:
> > > +	ret =3D devm_clk_rate_exclusive_get(dev, clk);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "failed to get exclusive rate\n");
> > > +
> > > +	ddata->clk_rate_hz =3D clk_get_rate(clk);
> > > +	if (!ddata->clk_rate_hz || ddata->clk_rate_hz > NSEC_PER_SEC)
> >
> > Please add a comment about why you check for > NSEC_PER_SEC.
>=20
> Seems no need to check this (> NSEC_PER_SEC ), I will remove it in next
> version.

The rational is usually that

	mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC)

cannot overflow. Your driver relies on that, too. (Which somewhat
proves that a comment is indeed necessary :-)

Best regards
Uwe

--5rqt2gca63irfwgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeQwmgACgkQj4D7WH0S
/k6shAf/fIa202RMQ1Kz8jovEjXgT90JjSA2u7S9Tm5/BH9nwdVWhEKmGiUDt+PW
x2wPFGiwq08fsW3RVGuXA1sZMQmYnAm3K0gsNh9XNr557m5jW/u+yGw4WI16VDLk
GACo6JbF1yQ/C5FJqmi+m9+5cx5fRR1/ISVo27hQegVxl0g7M673FLOLTwv2frMQ
KwYqvRUzgL3A3GW0IPiUuDYclqCI9kWi2E3lr6acoYwI9s3RvewJ27M9EtO1tKCk
YDpyhU/0WeZQB49lv1oc0RmXDaT70v1Asv0HMX8QN4jS4EIVUPTF3Nsl/wxXPe0y
Kg3T05a+4P4pB6gHuDMTdUVgqpGvwA==
=/wBO
-----END PGP SIGNATURE-----

--5rqt2gca63irfwgt--


--===============2211281369831798941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2211281369831798941==--

