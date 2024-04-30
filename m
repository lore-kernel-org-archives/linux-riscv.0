Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86418C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP1/L2qGXXetDv8qnL2OAec9QmbKdH7EISv0mK25dXk=; b=kNq88dFsqMZYoQG4MieD3KpdZM
	1cFbkGaCDNPX0qNipm1UZp4QPVSqdLQU2afoUT8U+Rd7LytzDpBKOGOGbPW+h2BPdbo9oeQW5x9RF
	/ezEPHE+PZNor+/aKis10jW/dGF4Reb33J9AWdiUuDmLq2EiJPmRWyQqjo/xJLSlg0RzctaOr8Wyg
	7otAQpMYY+8APvYrYJETfpo6on0CMsheZJTfPmTf+rvhbL5nxGVxPhlhvqOuMBIgw6IZYnqpthiLF
	3MRRV5PenCqZBvM2Ys1Fpo+qduVjc7i4iQtIS2tI5jX5FAYgTyTuSTHix2jzWhKIqQ1pOrilPuwz6
	MEENeFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lQb-0000000698z-0HiM;
	Tue, 30 Apr 2024 11:13:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lQY-0000000698H-0Mov
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 11:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 865DC60C75;
	Tue, 30 Apr 2024 11:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A1EC4AF19;
	Tue, 30 Apr 2024 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714475617;
	bh=muqIjVHzEEG31WNmMmWpy+dDISrb8zNJmjv3GCbIVe0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=A8WKV1IiC2YbOETMl3IwqBVrJwEyUixq5N0/xh7CbUanUOA9PF10Z/sODAuJTZ1B7
	 dKZDkKK72C/tIsxotGu/eQVuq0xsdtmX5MtV9EL2TWz9Me8RdWHM2hQREMeFkmO8u+
	 ZuuEN/XBBIBymUUOgnNw/E7CWJBH7m9YOqb47x2QHJMj9/FEFguvnykzMVIbOqTCbf
	 Nu99AxmdjhKV5NZEb765CHHOfyMWOv+G7Bm2n3J4Dt8eHR70l2eekpQxCOQVwsPCil
	 mtfV4HTRdCgM+Mj/FSxkuxVuO2v/CO+xJFaL4wJ3jv0paUWqL/Jos1ri/krUsUEKBu
	 L1GN5kUrOrTdA==
Date: Tue, 30 Apr 2024 13:13:33 +0200
Message-Id: <D0XEVRFIP18W.2QSS5RI8KJT03@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add sophgo spi-nor-controller
Cc: <dlan@gentoo.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jingbao Qiu" <qiujingbao.dlmu@gmail.com>, <broonie@kernel.org>,
 <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <unicorn_wang@outlook.com>, <inochiama@outlook.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
X-Mailer: aerc 0.16.0
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
 <20240427075426.662671-2-qiujingbao.dlmu@gmail.com>
In-Reply-To: <20240427075426.662671-2-qiujingbao.dlmu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_041338_401740_D380BB8D 
X-CRM114-Status: UNSURE (   5.16  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2394114033357258227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2394114033357258227==
Content-Type: multipart/signed;
 boundary=ae9f0f2df1a869383dbbc955fdbb73d48e8e25c89c9e6058d7bd4b04b596;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ae9f0f2df1a869383dbbc955fdbb73d48e8e25c89c9e6058d7bd4b04b596
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Apr 27, 2024 at 9:54 AM CEST, Jingbao Qiu wrote:
> Add YAML bindings for cv1800 spi nor controller.

nit: SPI NOR

Is this really just an SPI NOR controller? Doesn't it work with
SPI NAND? Or in general, any memory like SPI device.

-michael

--ae9f0f2df1a869383dbbc955fdbb73d48e8e25c89c9e6058d7bd4b04b596
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZjDSXRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iJNAGAu32BEX3H9O4Pu7etz7CVD8z8oeIH+VWu
FhiufQ1Ev62lT1+WvRo8Ss00OwbKkTuIAYC4EmvZxvqIXaZUDHHxu8EeMSzG9jjD
lQNZ0+rPTwQUevpVOS1HsZsQ76GPaHGSKHI=
=ftlX
-----END PGP SIGNATURE-----

--ae9f0f2df1a869383dbbc955fdbb73d48e8e25c89c9e6058d7bd4b04b596--


--===============2394114033357258227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2394114033357258227==--

