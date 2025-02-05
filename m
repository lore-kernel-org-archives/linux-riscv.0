Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50891C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P/ojtSQUuzCbki/HJv62yKu2FEUv4KgsPvMQde0DXg=; b=XgxZa94IoKNbLiD9Txtqk/J3an
	EjTMauTV/UvPSF4y8g0GFJZtIoyi4lp+kuvylKnegsptB6L9hTm3HpwHiBJZOFkIIZmz6QIr4NrYU
	ImDWju4jiv4xsHJI8T12iMyMXSRz6QZt8gxm3pMpBojgcT4a+/Kyjd1fdSkhxgkFPN5ZQ6kwxuZ06
	fF8kpx0X7iq2P/8LwMm5Qlenf12ePIlghWNybMMChxK4rFBuZl6oyFU3z3mqmFOySVy8q8nFFzYOP
	TLnj3BgHJ9uaYm7m88VDtkNu+U9p31XR1MsjRiM/bZScDdaPKsVDVn/mb3we7yAUqxoncGAMyCP5p
	VlbYD1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcT9-00000002qe6-0KQO;
	Wed, 05 Feb 2025 10:17:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcIU-00000002oTU-2tFU
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED9EF5C6309;
	Wed,  5 Feb 2025 10:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FB5C4CEE6;
	Wed,  5 Feb 2025 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749977;
	bh=9blT37ja1It8cIhR7kixRLVaycXv9QA1EF5U7E97CRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Irtg16TbS6QQCIbILy3pcNRCMUzDzpvr3vV+8DhTru2TPzZf/se2KD0QWwzUuSwks
	 vUnsJATiQuhIMSPXM67wQqGJ8vzvvFZcnOs9J+jRUXlrTpUhMPBlleXmZhVghGMJZ7
	 +6+/KchLtz+CAiMaZlbWj8WAHFF3/u3Kl2cPbamT++o/A0gSsq3a2fJ5D+uuoOIidd
	 GstmXsz7816VPsbghfD3jkuKgnyF428dhiEOzheitLJtMV/KKvl0biAhMgWyRvKahh
	 645jzng7TUffgormBNR0owQGm6uJY15dqHcvmUL6XtIesGA224LxFZrUr+iPtZYj2U
	 eeZzw8J5aAHOA==
Date: Wed, 5 Feb 2025 11:06:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com, Sean Young <sean@mess.org>
Subject: Re: [PATCH v7 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <ivgsidvdx2ypntnlopww6fiwyuzj2sadt3znyofr54dsz3c5d4@3mr25vhwlwy3>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
 <ae8ea1bf0bb0a09336cd8b7f627a994630524bba.1738737617.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <ae8ea1bf0bb0a09336cd8b7f627a994630524bba.1738737617.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020618_829130_B819F217 
X-CRM114-Status: GOOD (  16.06  )
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
Content-Type: multipart/mixed; boundary="===============0898617750329289272=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0898617750329289272==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="arbxzkuj76u4tbwm"
Content-Disposition: inline


--arbxzkuj76u4tbwm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
MIME-Version: 1.0

Hello Chen,

I was tempted to apply this patch while reading throug it until nearly
the end ...

On Wed, Feb 05, 2025 at 03:01:13PM +0800, Chen Wang wrote:
> [...]
> +static int pwm_sg2042_probe(struct platform_device *pdev)
> +{
> [...]
> +	rst =3D devm_reset_control_get_optional_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");
> +
> +	chip->ops =3D &pwm_sg2042_ops;
> +	chip->atomic =3D true;
> +
> +	ret =3D devm_pwmchip_add(dev, chip);
> +	if (ret < 0) {
> +		reset_control_assert(rst);

This is wrong (well, or unneeded). With
devm_reset_control_get_optional_shared_deasserted() the devm cleanup
cares for reasserting the reset.

> +		return dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> +	}
> +
> +	return 0;
> +}

If you want I can apply and squash the following in:

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg204=
2.c
index ce8cf8af3402..ff4639d849ce 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -174,10 +174,8 @@ static int pwm_sg2042_probe(struct platform_device *pd=
ev)
 	chip->atomic =3D true;
=20
 	ret =3D devm_pwmchip_add(dev, chip);
-	if (ret < 0) {
-		reset_control_assert(rst);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register PWM chip\n");
-	}
=20
 	return 0;
 }

ack?

Best regards
Uwe

--arbxzkuj76u4tbwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmejOBQACgkQj4D7WH0S
/k7xhAf+NrI5L589ZuQPvEDwS8Qwb4XlzoNnmEFCbOWCj0645JBLD/7WjiTYpfMg
Kgq30Y3aooAF7lznjQC3Dhgr8AmTEVevm2Cq+zvW0kVXG0AfzN8EZTd72OYJz6xB
Zibrt+MCzUt45EOrPwYjdndRLjo/M7N35/M24oWLhXKr7bw8DPqGFQwR0Baz/SoX
jVW41leLuAm8skH4my6WfNcsjCkhF25vo0LQDkUBqJ8jLCxdQ0QmnfzIaDu9nMUe
GUStrmWJIDzQDCtn6RNIQNPEYv72rjF2BtOVTRxCfD3VBKiOk9TwWA1wLtTVN6Ig
hFHjxG2+crhEqJZBaoVZd6malV3W4A==
=0gIf
-----END PGP SIGNATURE-----

--arbxzkuj76u4tbwm--


--===============0898617750329289272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0898617750329289272==--

