Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BE0C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+z1fuwB0bCUeFOy8ix8eLyM4qrwRAxtxpjKss6AzeQ=; b=WzG95ixWQadur+9XsSV/on5p4a
	eo9bLc97GkT/2/bk+D7MRIhdl3xkHJfxMIU/C9AUB69AL9KzGLa2Q51j9PReryEoU6GRp9iYKT8kQ
	SLqXeYrUeLyY9NNLM1maL+5jsiShhho8BxS7KHMd+jDsvJnpBv5Eita14dJZY9tCFf2Hn3zpShL7B
	37gWom51AaD//XDx/LmLi0fLURkxUPCdkt4yMZnkOWZswLtbe4f5XF9LXgGBaEKcgpo0PW292EqPj
	K4OBCE5tvH1Cy0K/zAymil4Fp2mhC/7/A527kBCKgG7cfMH+PUZQNGgtLIQMHU41CoeThyBWFZ1CU
	7jDCPv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAv1d-00AnUz-2U;
	Wed, 06 Dec 2023 16:45:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAv1b-00AnU8-0A
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 16:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 06A82B82303;
	Wed,  6 Dec 2023 16:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6345FC433C7;
	Wed,  6 Dec 2023 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701881124;
	bh=P064BleAcaaGYhhLYVjCCsTlgPSnJdkpYELnbMw15OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuR24vb/Pb1Pbt9Itc3plkdQp03Y6Tb4sEZVG1gMg+gQtRCd1T75ZKfVN5qvVAEAd
	 wNEwEBl/EIKXg0auBxpidjXNEN7qHuzHfAFrvSh8lzbJnNOmLcrvmH39HHncVJ0HNJ
	 X+vjTBpvYbe631vKNhFBsNtEcW3cRsijHQPB8EvSJ9W6s6r2Twnf7UA46q5ek+HNbK
	 6Bd9o2P9svh3VLEtqbX7Rbos43lggpFKy7a2FCRWR1YOPwLUZ9Aa+2cSn8K4eQrPjH
	 Jyo5sSj9fpCF19kvQzYLiFhicP7ImdLYCNGVB5M3a+vmcMvePrxDE930n17fyT4r80
	 l4kaWOls3Jx+g==
Date: Wed, 6 Dec 2023 16:45:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v3 0/6] Initial device tree support for StarFive JH8100
 SoC
Message-ID: <20231206-sizzling-whoopee-9e2a6755cd05@spud>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_084527_244358_B65629F6 
X-CRM114-Status: GOOD (  10.55  )
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
Content-Type: multipart/mixed; boundary="===============2040373948130597939=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2040373948130597939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mvCQXmL2zJOZIJ4J"
Content-Disposition: inline


--mvCQXmL2zJOZIJ4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 08:14:04PM +0800, Sia Jee Heng wrote:
> StarFive JH8100 SoC consists of 4 RISC-V performance Cores (Dubhe-90) and
> 2 RISC-V energy efficient cores (Dubhe-80). It also features various
> interfaces such as DDR4, Gbit-Ether, CAN, USB 3.2, SD/MMC, etc., making it
> ideal for high-performance computing scenarios.
>=20
> This patch series introduces initial SoC DTSI support for the StarFive
> JH8100 SoC. The relevant dt-binding documentation has been updated
> accordingly. Below is the list of IP blocks added in the initial SoC DTSI,
> which can be used for booting via initramfs on FPGA:

This all seems okay to me. I'll need an ack from Emil though before I
can pick it up.

Thanks,
Conor.


--mvCQXmL2zJOZIJ4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXClHQAKCRB4tDGHoIJi
0nNvAP4yMSbYutcx19sUnchUK4oprRmm58ZSWOHLFlwc38O6IgD6A+QJdSBMlToS
DL2kVUQR6O7/8oliZG8v92JpZ4zIGAM=
=Sstp
-----END PGP SIGNATURE-----

--mvCQXmL2zJOZIJ4J--


--===============2040373948130597939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2040373948130597939==--

