Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98104C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyCTHaPoO3QTnm8T2nS0aXTqOia+JDuIjt2kL+0RgaM=; b=ICluw8X3AWSwuhgO3SuDXoN9Lb
	mUiRd51FaLnbvgtaEPISUnCE2asfK6dDwvmUbMBgi0H2V/eHuUtAMKrW7KdIlxsXkvoJ/OpwF6/0o
	Ipa2TMYn0XqsAj4RwMXsBe5YiLKuAKhWE8bieo6l4eDl4Jp9wiksnvnvMjHqIwqkonUf+i8aMtNRe
	/OuQM8Dw2N4WU6ceVnFRo9eTdEui/twzO9K8kfQwfCawr1T1TFdO5nOrOi+//XL6zfomrlrM9Jyim
	ir/DGe9bZtI7Q4NvzjBkQ7hkxKwk1hm+FcblVZ27Nj7BsxhfE8QiJPgbQtHNIor9nh9gy6IpPOsDu
	Nwd48k5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vRV-0000000H9Yq-1ssg;
	Fri, 03 May 2024 16:07:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vRS-0000000H9Wc-1nds
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 16:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 730C961D9D;
	Fri,  3 May 2024 16:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DEBC116B1;
	Fri,  3 May 2024 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714752441;
	bh=W91kcN7nrkWghZ/PoRIVOeNh3GWbeg+b2FW9mH1axwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBrMuUW0rIzSheM3VMg+BPEExT47shrT6vDtXPA/mYlO86AKvbLspq93o37ooLZkg
	 TO5HSnOpCGfcdQnvry6z4aKC+RE/RiIfy+5xFk913pofDAHOZ0obuDJ52RhY1kn3pk
	 7yV5Cb/Yd///3aCUP8g0WFLWZKHfaM8SdG+3yxo8t80O+/r1jIgXarRWvlLaPekLtx
	 /rCBufHXZw0XInJ70OUguiUwEgfn0jO2MuVX/JLR8GgtZmsIqEP6dHx0eMEuk2j7D6
	 e2K4jV1VytMBye349sNgGR0yTODH9wmFJHsjXJPiT/kr0oQTW5CWkmkFP6WQkxdKEq
	 0w1WXOw120J6Q==
Date: Fri, 3 May 2024 17:07:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Message-ID: <20240503-undress-mantra-e5e46b2f6360@spud>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <20240503111436.113089-2-yuklin.soo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240503111436.113089-2-yuklin.soo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_090722_534762_CBCA859E 
X-CRM114-Status: GOOD (  16.51  )
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
Content-Type: multipart/mixed; boundary="===============1828011286870470359=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1828011286870470359==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KxAjTyFg5buG+CKV"
Content-Disposition: inline


--KxAjTyFg5buG+CKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 07:14:30PM +0800, Alex Soo wrote:
> Add documentation and header file for JH8100 pinctrl driver.
>=20
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>

> diff --git a/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h b/incl=
ude/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> new file mode 100644
> index 000000000000..153ba950c062
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2023-2024 StarFive Technology Co., Ltd.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH8100_H__
> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JH8100_H__
> +
> +/* Pad Slew Rates */
> +#define PAD_SLEW_RATE_FAST		1
> +#define PAD_SLEW_RATE_SLOW		0

Should this really be in the bindings? I don't see it having a direct
user in the driver.

Also, if this is the only header you have, I think the RFC tag could be
dropped, since there'll not be a header we need to worry about getting
into U-Boot etc with values that may change when the SoC moves from an
FPGA etc to tape out.

Cheers,
Conor.

--KxAjTyFg5buG+CKV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjULswAKCRB4tDGHoIJi
0gziAQCOhL3Nl0Z9Etl6BrrDO57we/UhOPrfgVEhlu3CnukqOwD+JLtE6cJPbh5t
83xkoNV1bF4rXWsE5iiR7H8VKiAfEQc=
=Lyzr
-----END PGP SIGNATURE-----

--KxAjTyFg5buG+CKV--


--===============1828011286870470359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1828011286870470359==--

