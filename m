Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59630CAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V990YlRWMUFNdn9N7ePczwRoGVz8A2M8MZ7yaQjdLs0=; b=xWUD46MpRfNtdpw2COElMKwMsd
	Q8Xq3xKOfNrVtNwwuEw0kZdKDMfHXRDv//kr8SgINWQaoWkd8mCjlIpISPYLlXrjhxKxs5YmicOt5
	7Aj1hv7Efg9nB3vnATu4WCs09Uto8qHughQK0BEjcHQYEAzTXZmp/BopjEcBTtotwAiKmvUAbNTsQ
	4d6dQcY59Jk18iRsqGGCUntxcQwi/vuPCp14UYEWN7JQXpGACeYSaLHY2Nf8jdIGReVT8b2eQz9BA
	Pm8PlSuSvGtbJ1thnwP7BhUI+Yj5Y5sqy47S1XYROQQTkPxbgKZquqD/41p2JSkIjmMmfS1SU6sNp
	8s8BicYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18NI-0000000Ed6I-2IWi;
	Tue, 23 Sep 2025 19:08:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18NG-0000000Ed5e-0uJj
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D143A43DC9;
	Tue, 23 Sep 2025 19:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F04DC4CEF5;
	Tue, 23 Sep 2025 19:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654505;
	bh=/oko3GJ0c3Ps6VD1HRcbOt4yyfXiylFIVm0FvKl7VWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0aHUkUfGiipbWUkL4pI6Z4NZvNfClCr1uJDctIBqiY7RYIHFsREswxH3jgnJFseH
	 O6sEW+VigOVhoborHB4QRoWe7iwXPmua1yOAARrIQ4IyRTE/TPrEFIW5LQs3hFaBUS
	 xSArSJTjd81ScRyqJsqnIvIltN5F7g/sSSVxa7QgXPL0H2J8BNADw6v3xknCUcSmpy
	 E+d40iBhGW/xdWFwfgEGSukPcAf3S2e2dyhMYknSPln95Z3aXjDd1zb+Q7zOMSu36J
	 IjdN+KjLhIoN35OuS7EX5ZTcUuphMAz6BF8QUEwkKJ5AbmiDs4sP4c4/3S+vgT8kfJ
	 MFfUbqVJjbGCA==
Date: Tue, 23 Sep 2025 20:08:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/11] riscv: dts: Add initial Anlogic DR1V90 SoC
 device tree
Message-ID: <20250923-overshoot-ancient-4f7cf5570b56@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-8-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-8-64d28500cb37@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120826_266771_C545745B 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4064983760360744771=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4064983760360744771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6yVWL28TGn3RScTs"
Content-Disposition: inline


--6yVWL28TGn3RScTs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6yVWL28TGn3RScTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLwJAAKCRB4tDGHoIJi
0pljAQCHomHCirCJIk/0haJUJMrTJD2Y8uhiq8/1y/5ivI3xcAD/Zocsc/2+a/In
UlAr8HoqRAFdDdVnsuCdaQy4ySW7Hgs=
=PzzZ
-----END PGP SIGNATURE-----

--6yVWL28TGn3RScTs--


--===============4064983760360744771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4064983760360744771==--

