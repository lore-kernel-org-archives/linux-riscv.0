Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B825AC3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmYBsLU/uJ6BCnpHHh0LgzFm+kw8E4tcpOcsI2cJQdU=; b=nYrn9j7RpTFZGvpYgeZz7TAxIV
	BNFUt2e9pZ5QKgV+VVGDbeDu+T8ZgXB83PZuoSaCkP7zH7iD747XfUOC6OiiLfBvgkFe4CMIMG8ti
	JMw5lFTrPfmBUyxja7xa0SralRcsBFej7WBT/8k6jc0PynKoWzpjuQLVtsoue+xZDPTlVB120/HWf
	VGZbKHS5zkFcsBTUEj3EHE45RFllhBBRfbI1YWxG4ri/t73koXmUTnfQM+usrIuao7sXPgdny06tB
	6BWziEFek3EruX8Mcbz8gt6RYjI/l4CA6FEUbEhXDug+7rYSid3G73/w4/zhvs+xs+TDfcDTE4juE
	ALTZzAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrDz-0000000AuVc-3v5u;
	Thu, 27 Jun 2024 15:39:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrDw-0000000AuUa-1dkB
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:39:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4787161ECA;
	Thu, 27 Jun 2024 15:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35CDC2BBFC;
	Thu, 27 Jun 2024 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719502786;
	bh=Ywx8pgA49G69DV3dqyJz6NtRDDw0b8MnCogTK2pHYOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVx9fyYPbM6G44pHTfQyI5umZjBKQU707w9S1MdX8L73Q8lJcDUB1/l7i7JuigntQ
	 V7AaHYrk0TscJQninZ6TloyAmYwVdEvIt9YlnucjFmmUzlc4+lpLR/HhfLB5iuOz85
	 KjqjRq1+ZXxJChF3GSoqahnjhGHlmooNhyFc7e4vVS2Ph7/lnmEOgc0FgIRmJwZX05
	 cliOI60EaO8105GJDjWgR8wMDycYwiYVNhp+jwhJO288xuQGHFjSfiDLhNxy29B4yL
	 Pp1k+Djq+JO81hntJo13fZkPMk/h1h2zUDZSiM59jOWC3cBZPxAdBI2YN+QGodHD+C
	 CWcs7RXdZ0ghA==
Date: Thu, 27 Jun 2024 16:39:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 00/10] riscv: add initial support for SpacemiT K1
Message-ID: <20240627-flinch-rented-1f2a2e5d73ca@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083948_629383_B584F73B 
X-CRM114-Status: GOOD (  17.84  )
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
Content-Type: multipart/mixed; boundary="===============8091634480889279112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8091634480889279112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B/g3FF/HUcTA5w9b"
Content-Disposition: inline


--B/g3FF/HUcTA5w9b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:14PM +0000, Yixun Lan wrote:
> SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vector
> 1.0 and Zicond evaluation now. Add initial support for it to allow more
> people to participate in building drivers to mainline for it.
>=20
> This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
> bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> Zicboz, which does not in the vendor dts on its U-Boot. Then successfully
> booted to busybox on initrd with this log[3].
>=20
> As previous discussion in patch v1[4], maintainer expect more basic drive=
rs
> ready before really merging it, which would be fine. For other follow-up =
patches,=20
> that are clk, pinctrl/gpio, reset.. My current goal would target at a hea=
dless
> system including SD card, emmc, and ethernet.
>=20
> P.S: talked to Yangyu, I will help and take care of this patch series, th=
anks
> ---
> Changes in v2:
>  - fix timebase-frequency according to current setting
>  - add other uart dt nodes, fix input frequency
>  - introduce new uart compatible for K1 SoC
>  - add 'k1' prefix to bananapi-f3.dts
>  - fix k1-clint compatible
>  - fix some typos
>  - Link to v1: https://lore.kernel.org/r/tencent_BC64B7B1876F5D10479BD191=
12F73F262505@qq.com

I will take a closer look at this series later, but there's a few
patches here missing Acks that I gave alongside some nitpick remarks.
Could you look at v1 again and add those to whatever other comments I
leave when I take a closer look?

Thanks,
Conor.

--B/g3FF/HUcTA5w9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2HvAAKCRB4tDGHoIJi
0tlKAP9lICc0h2PXA8woQQ1/YJesp1lYcTXaG9wmSbBAioDPdwEAjAML4ZKw+0ho
TiRw0/v5b6+QjdIR1CH3r6zIy7etrg8=
=/Fdc
-----END PGP SIGNATURE-----

--B/g3FF/HUcTA5w9b--


--===============8091634480889279112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8091634480889279112==--

