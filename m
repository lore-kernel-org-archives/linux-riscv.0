Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792CBC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 22:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C220422DFA
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 22:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C220422DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lAMFAt+R8EcoNCJjX0HEXkqJ0K0S6ZD8kZZ/hVUAkNM=; b=nI2iTDQCagfte+79jrIEva992
	TYsatQPBvWqdUcCQLtm6I8S2163w4ZIZ7+KAn4zurLjV8ej4ykYDy6SPRx/O11OS4V7AK8KND2xjh
	ezyY2DLfysCsJgS521+KjOeU9t+Q7UGvEGY9pov+1V7gD2z5GHmHdegelmb3hta2MuKTFvDmXAt4x
	MzCH9ThGh+h+bL5halAS79OXzO62ftXJhDCOvEnF8Q/eg4ZSHbh56hz5TscvoyGk75wR0hpHKE8zx
	PZNf7SxvRu5uh82HKwQxx8JJTsVSzeMJb1XyCd6o0pVYizUuEL7hFcaqlJ5Va7YIJ4jlYECD1iYvj
	/qCBy+CgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwuas-0006Pg-Bs; Tue, 05 Jan 2021 22:14:22 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwuao-0006Or-5E
 for linux-riscv@lists.infradead.org; Tue, 05 Jan 2021 22:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1609884844;
 bh=Akq1tCzOrH1xiiw0JByliJwuWqpFfqfeL3h97Gehb3Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=PPrT1ZKwNdw2YiEW7joY3becyNjQK8GD/ZQb5PzbTi2RaSBk6wtI8YnvlK/w3yxiN
 ZXpd/zxXF08t/vUjAuQZChXSGDbNHWNbYzoZhtntK25Z28x5lGwAg1TYWJateGkxQm
 rt833ZQcFZ7GJr55KP7vcDMzhXqOyfTwbl8tH++4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1k7Z5O2SpK-00uusx; Tue, 05
 Jan 2021 23:14:04 +0100
Date: Tue, 5 Jan 2021 23:14:02 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v3 3/5] soc: add polarfire soc system controller
Message-ID: <X/TkquplML5INtZg@latitude>
References: <20201223163310.29122-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20201223163310.29122-1-conor.dooley@microchip.com>
X-Provags-ID: V03:K1:nIcxYDV20l0/8DyaPjDAuGxdNyqjJZIMd7NUiUPag8lQcVINg4U
 tTRPXH1hSXVBXy1+tOQwqB6hTG1Zm1hW+1kVbvW43XV2tOhm2hCp73zCBsnkQaaRfPv43AF
 RRxS90l8wQxf3K9eCcoLYb2YRwMGFuYAFgN1X9bcuzgWb8BPfkKHMPnWdYEVJaG++a41pgt
 dn5uPEqv96BQv3RXlahXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vx/O7sD3hGM=:F10vPCdKP6pJhYycrUd5P/
 yxwWDzpiNUFfICbikFZYdLFldsf4p5U9dGPrwUhbFJMBfhMyWIqKYMKptXQ0WbMKMHyHOrzWQ
 iv+BId+Y11LTj94Za71fh3IqJAQS2g8p8PNrxM3O3DsNBRsFpV+7HUDLVAleq4y9d5X32WwTg
 lgeTTGvnOZAXdTs0vuN5eA4SIFyakKGA5laGBZ9H23C335O2b3qXW/7aiug9th+tw3NSNAbPR
 bU3OX3Nh7f8tQ+bU61iMxXczTINcgtrxZEpsfxi0mg4yKdlMhCFVkPliWvPH9LBmfDmlASouh
 3HucCpMAWe2LaXUdyL7B5/d5yQh73qjFDO+BVpP5g89oxyT/+1FSaVcRsNYYUdBDihPEYDKQM
 pUcCf5VOdzxiTyZecNqoa+USVlAZjhcS6HPO3jehdyO6JyC5hTC91nnji3Z461F5/L9soH1U8
 l7/EvXkLLeLv2onyD3hdbrkI5//ShBNnCGYz7JrzdrkrIJtAVn18hOMys/64w8U2QlH3huvsn
 bgPWfvA0ZFrDIi9XgAvdyVF17YjKid+Ecxk084wVVxXjymDgZUNA/0Q22oTQ+d9sfE2k+K8mU
 uHrMAZuDN5rO6pOldgLXyVB5iyUSQdAhFYEFryGc2X6TbcG2xiGRodmegNZHOfe8+1yHMF0dk
 OApLN/BCWOo3pb0QKWCx5XjcznFy1YKlTNoY15nbVmXEldJyhaW5UrzXHIqf+NqCXsaf853J1
 kozqvCHwFb9wg4k6d5f5XHYBDLeq2elKBuOGepOXA7xJYcWSJ+8934NPjIc/wRvYQmUhIRG5m
 8pOK7hxsn68HUZm9o+Ly9OOc0UAVFVxVIDSTI8OgIA+MqxTkeOnDbwzO6a1OCPC5R0NAkVG/P
 J80kR+U0APznVZYF8uPw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_171418_484148_5D7319B2 
X-CRM114-Status: GOOD (  14.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, anup.patel@wdc.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, lewis.hanly@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3508457004247040347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3508457004247040347==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzfUsh6qR7gklPXt"
Content-Disposition: inline


--lzfUsh6qR7gklPXt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Dec 23, 2020 at 04:33:10PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> This driver provides an interface for other drivers to access the
> functions of the system controller on the Microchip PolarFire SoC.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
[...]
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_GEMINI)	+=3D gemini/
>  obj-y				+=3D imx/
>  obj-$(CONFIG_ARCH_IXP4XX)	+=3D ixp4xx/
>  obj-$(CONFIG_SOC_XWAY)		+=3D lantiq/
> +obj-$(CONFIG_SOC_MICROCHIP_POLARFIRE)	+=3D microchip/

CONFIG_SOC_MICROCHIP_POLARFIRE is more specific than a flag guarding
the microchip directory should (intuitively) be (because there may be
Microchip SoCs that are not Microchip PolarFire). Fortunately, since
mpfs-sys-controller.o itself is guarded by CONFIG_POLARFIRE_SOC_SYS_CTRL,
using "obj-y +=3D microchip/" here should work without a problem.


[...]
> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, v=
oid *msg,
> +			      void *response, u16 response_size_bytes)
> +{
> +	int ret;
> +
> +	mpfs_client->response =3D response;
> +	mpfs_client->response_size_bytes =3D response_size_bytes;
> +
> +	mutex_lock_interruptible(&transaction_lock);
> +
> +	reinit_completion(&mpfs_client->c);
> +
> +	ret =3D mbox_send_message(mpfs_client->chan, msg);
> +	if (ret >=3D 0) {
> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
> +			ret =3D 0;
> +		} else {
> +			ret =3D -ETIMEDOUT;
> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction ti=
meout");

\n is missing

> +		}
> +	} else {
> +		dev_err(mpfs_client->client.dev,
> +			"mpfs sys controller transaction returned %d\r\n", ret);

\r\n is quite unusual and probably unnecessary in printk-style
functions, \n is enough.

> +	}
> +
> +	mutex_unlock(&transaction_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mpfs_blocking_transaction);


Best regards,
Jonathan Neusch=C3=A4fer

--lzfUsh6qR7gklPXt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/05KEACgkQCDBEmo7z
X9uW3w/7BWkX0EOwMcLup/IOp5yIzP/Pc8Jh3HP7N1inwHaB+g9ot2514xdnMYSy
A07zImFXlaCbw0T+qXpUQfLAlt4DZs/24ysSnJ5wPHp5yFXt9e4M5i6S5k6mCsv3
B4+MnwY2AyD6MwTJ0jYOJYCsc5Pvi89v4hFPGsXZOieebXj1RZMDJ4mmfI6z/Jru
+l+o86J9tX09sOz4eBDXf4+pNcaqoaLuMNDdrJVZJcVuTRtsbhV+U39d6b8czYsE
u/xzdmK4lt0zJg5ZdpEPrU+WDWAbihyQ4o40iO4J0f4g7vEwX/68oHMoBffCDoNX
0yXjbTaCiHRQacS83P+nAkAUe4a+3Mw6Cvq1T3eWIqJVTqgYXIhyo64K8rlKo2GO
v3bSKKCCtWvmXCtcXFEp3YjMfsnurDijUbblAMowAsyJ7pOtp19A1c2TbXb8tftd
YQFms3A4yBFtKjj0D0LNjoUFtRg1lD1fzDRuF2Dep5rF3Q8WRgCscigy8nHsvqRy
cpDpdx2sbCXh4dYqAb0OUsIlas+Iu/xahlu/vvWhJg2s2SQhM319LuJgAf8sEJ7X
XkmtvuM3q3FqAMXaIbmVSCo8bKHa5bZCY2BGFIPkCxE4uGZ4RcDt2dQHvv4alWq/
43chRCnLrzlZlJ3c5f5J+rPbS5qWmDdCeylPoxDA6T61i1DVn2A=
=juh7
-----END PGP SIGNATURE-----

--lzfUsh6qR7gklPXt--


--===============3508457004247040347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3508457004247040347==--

