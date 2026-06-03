Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2E4CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPiCaW5GqDHThwKIEQcAAHFPO9UmquDXpKMcMniSNcM=; b=aigbDme4ndQQDgaNoCqfVZ0AD6
	7i3gDBKD13W2/qF4219zmYrlQlqkmiZ6NSEfLIZJ0MpS5ksXtvBactFQKekHMRSCGV23HG+ND3/EC
	wfhwN8NXXncBtdPTDpCuSoqBsz+AND3q0jzm291pmAJJ6ye4KSCIUEoevS3voOTVHc3Tk5QWWR+/L
	lJgy420/3AR9E0oQ/piDMUkErw+GQxael1m1zqS/H7DL43NXxpBZXD2SneNbMyM9WgNkKlqVXS0cP
	cjw1tBhW+fNAOB4xqNQVABQlsMI7L9S0UBq25s8KN/rcA1zJdLWeOuSTvyhpo1LEQfHGASwwz0Ujr
	6scgxhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoga-0000000FXDd-1Cfi;
	Wed, 03 Jun 2026 16:43:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUogX-0000000FXDA-2A2s
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 16:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC6354448C;
	Wed,  3 Jun 2026 16:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955271F00898;
	Wed,  3 Jun 2026 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780504996;
	bh=Z4JstCrvgUHq+IUxWBlO/QMKc5rWKAgnPJ1UKfXNnss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C7BrbTckQvXcWoV7k+AEBCsEVHxBwBKyRVbQMNUucK6Up4k+mlR/D2B+ty9bTqLC6
	 TXyYpg2iAmZbYrcSf/IMx42niQl+mHUvOCBb0t+zktt8WMQQcFeeZ+L8BsSY4TYrFe
	 SMxLlsrDm6jSETCY+mtmezh1ig1ZWzqM8StHwFWddZgXGWQRMy7Lzaz1dLLvobS5Ii
	 dA0lkSooslWUAphAp8eOjJTAjX54a8pnk1nPZ0IJK6im27QMOvdGhM7NfhvaKPvaXt
	 s7dJq2RJ1BZSMP41cVQv4yxHtDPtyuHL388CA2+C9GMN7wvIH310E7UgCTsSDcd20Z
	 it1IkgBNDLRfQ==
Date: Wed, 3 Jun 2026 17:43:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260603-groin-valid-a1d4445f7a6b@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260603055347.66845-4-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_094317_574868_A875DBA5 
X-CRM114-Status: GOOD (  11.06  )
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
Content-Type: multipart/mixed; boundary="===============2035295789982390597=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2035295789982390597==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFVpdkwrvTMCfj3J"
Content-Disposition: inline


--nFVpdkwrvTMCfj3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:

> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)

Half frequency? Slew rates are usually measured in volts per second, not
hertz. Do you know what the slew rates actually are and could put them
in here as the real units? Or is it just "slow" and "fast" in your docs
with no precise numbers?

I've got no questions other than this, so once this question is sorted,
I'll be happy to ack all the bindings provided they're effectively the
same.

> +                1: fast

--nFVpdkwrvTMCfj3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBZnwAKCRB4tDGHoIJi
0vpAAPiFQ0YARyxgZCQaUynrtzsvBAbt0yy5kxy2vpklo/C5AQDWjzznOIi1/0El
tLNQlHJKrwJ3v5PG6RXO8m1+IwCdBA==
=GdZR
-----END PGP SIGNATURE-----

--nFVpdkwrvTMCfj3J--


--===============2035295789982390597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2035295789982390597==--

