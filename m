Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EACF8FA9E
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpEYXqdjDAnh037hzlcUeW4+xq9qbXPm7J7pK+Fpjto=; b=UX+mJH6RwQrDDk/VMN+YxNGoM0
	cam3WOdAwJyemX0xUC7PR64/NKM/ZhKVNIBpX8fIJgsTK+khauU/9GsFV9h3NYdnCg+rlc7Nw9mUT
	wetMNTsmpFIt5FA9H7c8p0U/D9hyU/zyTfxSqUUzyrLBszgNr4PjT9iQXlioEoBBCOhg7QCK3ob8g
	7bRGI7vlZtEdW4hCrT0nhsCPHbYxnKIg82QD2VgvAosNc3SCVfNRhojO+4HCqc0sJQYnubYzjuG1t
	owL3glDBYg3w0cj4FtRJj1foPtmMo7WyTOWrjJb5Z9kfjlrAoB0rh2ifZPT+/hcCVCn46SE8wCdOb
	QfjCoQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEYc-00000008wjt-2jiL;
	Tue, 21 Apr 2026 17:06:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEYc-00000008wjm-0Sxn
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 17:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D86360142;
	Tue, 21 Apr 2026 17:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8CAC2BCB0;
	Tue, 21 Apr 2026 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791201;
	bh=n9q2YS34fFqkMay4N+lrMQ6uuGLsXgDbtgaWIG/8SM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bO4OxqpEB8Ksu5d8yRsywLSimntqw4XXcKF3CTq9kev447dZxtsLNhObrlrPi5rLx
	 iJ2JP2yzyGPcBcVMQrxRu5DpsbY8wiFWP2ACE9RRpjCNwfZeYzYhcVbyH8FqX6GK4U
	 tYKJRq5oqK4hH0nfZoFXSl8JxHh6AK5V+s6lX4b2cnnEV/JHZc4aZcuOe8t+Yib7tv
	 kPtFhsexarv+ygf60/1hgQKduc6SJ8PDddEAKbw5Ka+6Mq1TfUkEzSxL/xCtsvKjoC
	 OmWwJHj2TCvbVEfY1a9A9DESsOvFz3xUI9HWQO5xKn6VearSXDypD9EYlRL9IktN02
	 oEE0Wsj05B0Hw==
Date: Tue, 21 Apr 2026 18:06:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: serial: snps-dw-apb-uart: Add
 UltraRISC DP1000 UART
Message-ID: <20260421-appraisal-tainted-b7a645d2225c@spud>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
 <20260421-ultrarisc-serial-v3-1-3d7f09c2420e@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260421-ultrarisc-serial-v3-1-3d7f09c2420e@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============7782279203371454971=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7782279203371454971==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zHuIrEG4DhXTeSjJ"
Content-Disposition: inline


--zHuIrEG4DhXTeSjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 01:58:51PM +0800, Jia Wang wrote:
> UltraRISC DP1000 integrates a Synopsys DesignWare APB UART, but it does
> not provide the standard CPR and UCV registers.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zHuIrEG4DhXTeSjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeeunAAKCRB4tDGHoIJi
0nzSAQDvCtu1nSoeOKO9tXUdFuzztRfU72U5K8KI6YemMiMozAD9Gigo3rI7k19t
W1NBojmzXptO+2Q9T9Ko2ihw3/6yFwM=
=Kb8+
-----END PGP SIGNATURE-----

--zHuIrEG4DhXTeSjJ--


--===============7782279203371454971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7782279203371454971==--

