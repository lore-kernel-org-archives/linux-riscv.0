Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F24C61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 06:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hq/25Aovqtrm30Debk/YxZ5PFsGdHDC23x9Zasw/4e4=; b=gIxiGB/gLPoMSHB4nKW+SLeFDv
	vXvoFwRNk7FjShde3gQy0q1vf4Gnw/FJUUU+SwJG/yNd5fIdUIuuI+LVZDJ0xoYtpOkfQMo2rZBID
	wtapRE49EMy+KnZTvrncoI1eRyIz9GhVXWYzE/8P2FD5xo/lL9urZPXY14jc+t/tWgQdToPXlid0p
	ahntnklVE1suV3JFyhg+jpNTNaJuAHywG+rsg8PeMLDbY6aWprncD1g3a9Mal7envfEjUTMlmQYhl
	Iczxc3WwFWsBEWIgvj3BdDVRRtF6aXebYx0h2DAZu5iqh1iz9WK6Unxi97chSoltZoB4VG7JTTPiR
	JU0YOpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HuU-0000000B3h5-44ZX;
	Tue, 01 Sep 2026 06:23:54 +0000
Received: from out-147.mta1.migadu.com ([2001:41d0:203:375::93] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HuR-0000000B3gW-2w83
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 06:23:53 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JYWgi8laE2xRmYqAktJ5/SY0SxkpUmzm3vsS4saBqCs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788243827; v=1; x=1788848627;
 b=tvZJo/lONEGG33RxIAI2uh4WeJpN8rDLDnOe1iyzX6NjrztypfMyq0QXvRzmk1xta8zfPdaz
 BOVmEewBVrrKENqDk0K0EKH+4jRl86fvdem/AV7JFLL2hKgh8uw3W9cGGs2OH/JoRkAN7cJC+So
 biHGz89sN9qpjOcvNDQn/elA=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 8f859e5041177fe5;
	Tue, 01 Sep 2026 06:23:47 +0000
X-Mizu-Trace-ID: 8f859e5041177fe5
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 14:23:42 +0800
Message-Id: <DL3RJ2VF605G.2L1HBQB1CUEGA@linux.dev>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-doc@vger.kernel.org>, "Jean Delvare" <jdelvare@suse.de>
Subject: Re: [PATCH v4 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: <sashiko-reviews@lists.linux.dev>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>
In-Reply-To: <20260831163256.784771F000E9@smtp.kernel.org>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
	<20260831-ctl2301-v4-4-b335d52a0570@linux.dev>
	<20260831163256.784771F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_232351_881570_7671B519 
X-CRM114-Status: GOOD (  19.51  )
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
Content-Type: multipart/mixed; boundary="===============5558288337128573369=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5558288337128573369==
Content-Type: multipart/signed;
 boundary=f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 04:32:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] TEMP12_TO_REG and software caching logic fail to align with
> 12-bit hardware truncation, causing sysfs cache inconsistency.
>
> [...]
>
> @@ -121,6 +126,9 @@ static const unsigned short normal_i2c[] =3D { 0x18, =
0x4c, 0x4e, I2C_CLIENT_END };
>  							    127000), 1000)
>  #define TEMP8U_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), 0, \
>  							    255000), 1000)
> +#define TEMP12_FROM_REG(reg)	DIV_ROUND_CLOSEST((s16)(reg) * 1000, 256)
> +#define TEMP12_TO_REG(val)	DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
> +							     127937) * 256, 1000)
>  #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
>  #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, =
\
>  							     127875), 125) * 32)
>
> [...]
>
> @@ -594,6 +692,21 @@ static ssize_t set_temp8(struct device *dev, struct =
device_attribute *devattr,
>  		return err;
> =20
>  	mutex_lock(&data->update_lock);
> +	if (data->kind =3D=3D ctf2301 && nr =3D=3D 1) {
> +		temp =3D TEMP12_TO_REG(val);
> +		err =3D i2c_smbus_write_byte_data(client, LM63_REG_LOCAL_HIGH,
> +						temp >> 8);
> +		if (!err)
> +			err =3D i2c_smbus_write_byte_data(client,
> +							CTF2301_REG_LOCAL_HIGH_LSB,
> +							temp & 0xf0);
> +		if (!err)
> +			data->temp1_max =3D temp;
>
> [Severity: Medium]
> Does this sequence cause the sysfs cache to become inconsistent with the
> hardware state?
>
> The TEMP12_TO_REG macro scales the value but does not align or quantize i=
t
> to a 12-bit hardware boundary, leaving fractional bits present in the
> lowest 4 bits. Here in set_temp8, those lowest 4 bits of temp are masked
> out with 0xf0 when writing to the hardware register, but the unmasked tem=
p
> is saved in data->temp1_max.
>
> If a user writes a temperature limit that is not a perfect multiple of
> 0.0625 degrees Celsius, will this cause the sysfs interface to return the
> un-truncated value immediately after the write, but later shift to the
> truncated value upon the next device poll?

This is a bug. TEMP12_TO_REG() currently produces an unaligned 8.8
fixed-point value. The register write discards bits 3:0, while the cache
retains them, so an immediate sysfs read can differ from the value read
back from the device after the next update.

I will fix this in the next version by quantizing the converted value to
the CTF2301's 0.0625 degree C resolution before using it for both the
register writes and the cache update.

                                            - Troy

--f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapZvbiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/UBQD/Y06tRaTFNMju
NM/etVWC7V4lTIYgMiT04x1oaUoz20cA+gOu2r4waOeMxc0picDYJZruXgDd4WEC
8kbzz6TfWb8A
=zcf8
-----END PGP SIGNATURE-----

--f5ad3a7a520e0675d3a1ee0e96ded0c415497e37ee75d1d57e33fbe0b954--


--===============5558288337128573369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5558288337128573369==--

