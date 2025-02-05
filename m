Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42012C0219A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QthZfGlU9XSRLLRNtdrhq6wcU6g1L4zETMByaqkjDK4=; b=zjQg7yo8g0sTsF6mZi0FcBWEQP
	IG3h6flsN188BAbgPqany4anYKl50qjXcqNBgv53gC5XgGwNRl4vEdSUBo0ABn4sltz5p4+NqOOBh
	Crj1cEZtRaQnLFSVxDUvZPztBWXqD+e/BPGDPqS6sJF+BPDHgNrCFHAI0ifVJcIYI/OLwagVmqtEd
	iNqtI04PuiTNDqva638uLoL6yac6V3kwYZevYxOJQExk3okQvc0d4+5zNZlszYV4NN/X7itVVwwZX
	Iz8wmozXBmtNTKIVKr14JpuSFBYm1o4MU9pUH+3L6RGTeD/PlPFoVdE3cMPVLnPK6mffO9zwdXuwX
	jtizGQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVC-00000004934-16kk;
	Wed, 05 Feb 2025 17:47:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiLO-00000003zjk-2LBU
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 978B4A43850;
	Wed,  5 Feb 2025 16:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22FDC4CED1;
	Wed,  5 Feb 2025 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738773221;
	bh=b5FN7Zyasw9i6k/qcwNoo9FUtmrLQ8B6OivoODJIKDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8YpoFAhfLezEahtdBWj0U53UKdwR0eKTTpmFc45NYdUJd4kEArGbxvC7zWh4W3EJ
	 ipI44W0xTeEkgpdHil7mH4HwQnFgRvq/59rc1JsG76rCfk/QLSU0VbPPlYKOiw9kOu
	 RwBRKK24eF5jwlxMK7k5kkfd0h6kCao4ozQJ891u4aTnxK/HOAiCBNZAlmq8OdcPWR
	 ubS/SCeFpU15OTaRQmG31CeEDMG0Xl+vO61Fy0jIvAjJNO+nzE7341nSFqlNxMDDPi
	 iJaVF3/W+nrON3KOqHpC6OBiA3uiGZdW7GEagW2vjSn9fI4PKDuLOXVJdeEij7cuXO
	 LsMffDRf0nsBQ==
Date: Wed, 5 Feb 2025 17:33:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com, Sean Young <sean@mess.org>
Subject: Re: [PATCH v7 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <o4j72fdw6v6aiuvgeufugzptmfpmpws26zp5bf27hdq2i6cng5@yqmdasof3ynp>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
 <ae8ea1bf0bb0a09336cd8b7f627a994630524bba.1738737617.git.unicorn_wang@outlook.com>
 <ivgsidvdx2ypntnlopww6fiwyuzj2sadt3znyofr54dsz3c5d4@3mr25vhwlwy3>
 <PNXPR01MB7488BA555BDE96E59741DBACFEF72@PNXPR01MB7488.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <PNXPR01MB7488BA555BDE96E59741DBACFEF72@PNXPR01MB7488.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_083342_663244_ACAFD93B 
X-CRM114-Status: GOOD (  13.93  )
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
Content-Type: multipart/mixed; boundary="===============5197279928282460171=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5197279928282460171==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gcbt5fz4vt234fhk"
Content-Disposition: inline


--gcbt5fz4vt234fhk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
MIME-Version: 1.0

Hello,

On Wed, Feb 05, 2025 at 08:57:20PM +0800, Chen Wang wrote:
> On 2025/2/5 18:06, Uwe Kleine-K=F6nig wrote:
> > I was tempted to apply this patch while reading throug it until nearly
> > the end ...
> >=20
> > > +		reset_control_assert(rst);
> >=20
> > This is wrong (well, or unneeded). With
> > devm_reset_control_get_optional_shared_deasserted() the devm cleanup
> > cares for reasserting the reset.
> >=20
> > > +		return dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> >=20
> > If you want I can apply and squash the following in:
> >=20
> > [...]
> >=20
> > ack?
>=20
> Ack.

Great. Pushed to=20

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

with the suggested fixup.

Best regards
Uwe

--gcbt5fz4vt234fhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmejkt8ACgkQj4D7WH0S
/k6tmwf/VsE147RXuGyKeMumDiqov5FrMqU5PIEyDnZc7Wz4rEBB71mQ7o0iiSMF
tgfgCnylkVxBX9w9F4AliHkHFPYsQuGv6ibyrBim3M0JCI1M4AMTwpfmbSdPxYm4
GufsQGUIGAIME0Hey4bsHiPFla+LOk02vO9Vcrba1eZDkn9cqfbhhWsOFTe31oR5
EmQLlLt/n5w7JkCrknvMW4MuzSXRCgVgEyqVJyGEKY1ZHR8uxxhgwNTnHmH6Wjne
/bSaEcAtxHyCAkO/vBx9LUdtpR2hbBoDH/80OmXYfWJ+uVWx854v8VBe9Xvuzb41
x2EjvqOV1TcK7+7KZPb8C0D3I5PU8A==
=pX1Z
-----END PGP SIGNATURE-----

--gcbt5fz4vt234fhk--


--===============5197279928282460171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5197279928282460171==--

