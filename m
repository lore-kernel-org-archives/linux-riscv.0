Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1585EC7618E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtfiRkorylnYV+1HWoe1YPnKoN9nlvsV4FjO1f9wuS0=; b=NUHGZxiKRa/kuW533UnTkvejWM
	RqEcOl3/gdthPrilrHWB9nf4XiAJGCJfGpYkHRAmds76J7MnkNV1qo2jdqwoeblKDu+eIlnre7rJQ
	fRbEHDyKd9IR3PxNK32VSk5XB49O5RB55l47aLcX6QvVJyf9sBhsZ7UYvhb0FK79CvTTaVlfD4UfD
	KcQRcqz9iClGQrIAAoZGEohzriegXHVVNY3FgTnVZn5PgYdgdnTzHX53nVzpmA9xfZm6CZ0iVd5us
	nsyCO0GNVHZ0uQLBOmE0soSkzhDFXa02KNzYt9GVIj9Qsm/vqDipZ3Nt5icW0bqc3OeP9649Ywmtc
	rLSk/8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pct7I-00HLPo-0p;
	Thu, 16 Mar 2023 19:18:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pct7F-00HLP7-09
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 19:18:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 207A1620EE;
	Thu, 16 Mar 2023 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D0DC433D2;
	Thu, 16 Mar 2023 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678994298;
	bh=U6/3MAM8lEWJuAQad1Q+TVX2oTsNcl0STc3k5xy9Klg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lka3LA3zNxRuOKAFjjixGSIQqsYiL+s0wuBpCboYGUB+hn39p7r+N9ZHBasxkdnyb
	 4JSSvT96btScmpf0WgeEX29S62/0B301LF49slJPT5Z0XJEhHOrzXTm1hOQ03rtDP/
	 XbzEMb5/S1Rx3gdNkhmMaZ+5U/zWhgPN6skkB8J79ghJkpmb1htrW7LAOPrDYW5Ewc
	 uPHZPuIYSC8ya9qx8xt1HMHWoK3sd4uhVWfW0MtgXlmhOG+gwTy1XznsCAwW1V79lk
	 vMJix/0BhIo+9Dkjd2gLc+Kf36QBHmsmh4vWdWXtquzrQJWBE/zF5SdrR0PfkLyFod
	 QvYWz9NCaDZqw==
Date: Thu, 16 Mar 2023 20:18:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 2/5] i2c: microchip-core: convert
 SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Message-ID: <ZBNrd5ww9YD3xQTS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
References: <20230309204452.969574-1-conor@kernel.org>
 <20230309204452.969574-3-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230309204452.969574-3-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_121821_183978_03968FE1 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: multipart/mixed; boundary="===============8436347528875760326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8436347528875760326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TIODK/DyJw5FNTCf"
Content-Disposition: inline


--TIODK/DyJw5FNTCf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 08:44:49PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the Microchip FPGA
> i2c drivers to use the new symbol.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied to for-next, thanks!


--TIODK/DyJw5FNTCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTa3YACgkQFA3kzBSg
KbZWQRAArPUHPGdzaDCWZYxs1RoufYMPW3mLcn2mvcWqFmxkR89/yXReohhpb09D
99smcOSUtpAXFkzmCoCc4KlsUQDmUqG8Zy8dJ70//YEbx1IZddE8OkDOu2WwMToX
WY3AQ7Xkfa3Ror25SeitAVTnpP3XnFTR/jPl4d6Vz7ug5vGIcleqJRs5AOShZfdH
nDRdXQfayeVeWfjA/zSp4XM4ahx5ZaLAyqyOQEUmx2IZDJGcaUZXc4K2SeHoeJ9e
KYrhY+SHfwTSqNoPB7bUUfrz11Ub6use6WHLLZPMGUYzkuHyhpkFUxAInoZPpVgd
dhpTUodP5iZHalX4Z2ZFCX1ciYuowOQN5fr5dFZBBM87cxE9OMd/eaGC3dVMe98U
LqAmJzWg1+E38GswGLZdgRWtuhSwMxvSGm5bRxlZlyoOdBXEFlTjOB1WAKGyduzs
raLno/7NRrdQvPzV9/DVXNQQ4ERA5hInN6Ax1bhqApMNouaxsTqv8leU+AVFL+Tg
JVU1OFGedAfBYFHySpAEO3AeNV1hWKBMkccjWZHMwExC86r3dGFfc4KYo8/OEM//
/yjIwK1DuOLfH7CoM/F/wsK4Ga8XmuIg7z1/34m5Z7iKfsz30zmlDxHHKeMLm5RF
XoBHu7Mq3A0osybzaKLJWmXXYW9G3/kIIeXGZhQNoCb999t+8+I=
=WGcd
-----END PGP SIGNATURE-----

--TIODK/DyJw5FNTCf--


--===============8436347528875760326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8436347528875760326==--

