Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C07EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKdTE+YnHOWroZedjs/XIxioT65DbXk/9Igz41HTnd8=; b=lMe/OClvxnc3IyxzH/WNkwpDwG
	Eck4Crk8rB8MaqGNO3MDsE/SRpzzaOt3FvDl54X8hHyjNqX0niIYbdFep+FMwatAex3O5nwWkWLjR
	XjURBh76Mici+CUdXC8uTew2YQgW7YBGn0Xjf5z70vo0s/Lzh9tBcbj570e9UvEca8lrCfQlwScZy
	rOcPLsYj4MYqDOYooqOQNl+Hg9WkVmZ8wewhM9gt7x+DSiVmNxRewaCq2PbrUHLGrr6K1wWoM4bTd
	0359PuHTps0k3jm9YhlrCYItayvfRWtIUPps+Byog777pTDvYpkcv2JbPpXeHE5c6eKKyfCfMNw7e
	bSPIlvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWa5-00BgIe-1w;
	Thu, 20 Jul 2023 16:32:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWa3-00BgGi-1U
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 16:32:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E53A261B8A;
	Thu, 20 Jul 2023 16:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349B0C433CB;
	Thu, 20 Jul 2023 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689870762;
	bh=BWdCrFmpxyBYlw8r5cwZXw29k1AMvOqH50MyuBtkGAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VkeBV3L4Opf0ORaPITshAX9YPA5Y7i4VAz8fPFmhzDe0SjeZI6LGQTFmCq5jlh9IU
	 i9+zTzlykI0YptDOTTDiiWHsi/dOnLs2qoAa18LSxzVaCYIQUdmKft1/GNL8c5wWDd
	 JBmO33/dn0bZGPY7lA55iDO9lUgONUxdP3A6NKC6YDv13nhx2FP9Xmyf/tzaaJi2Ae
	 ft1NkB8cUexYsdwBWf1Lnap23eqt8hhq7NMcK/wtK/qlfCveoyTNc8T2FBxazmN9Lv
	 q/pJuhJjfyeKwafoBlQeHgXVmjv21/1i4fX/sGiCqqBEabvXQoY5FOOCEwOSKRW403
	 SiQN5oQF865Ww==
Date: Thu, 20 Jul 2023 17:32:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 0/9] Add STG/ISP/VOUT clock and reset drivers for
 StarFive JH7110
Message-ID: <20230720-enjoyment-gestation-adb8baa9aaf1@spud>
References: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_093243_588320_67B25C91 
X-CRM114-Status: GOOD (  17.39  )
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
Content-Type: multipart/mixed; boundary="===============5928883103648770403=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5928883103648770403==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vhTePwvhqc04hvmz"
Content-Disposition: inline


--vhTePwvhqc04hvmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 07:38:53PM +0800, Xingyu Wu wrote:
> This patch serises are base on the basic JH7110 SYSCRG/AONCRG
> drivers and add new partial clock drivers and reset supports
> about System-Top-Group(STG), Image-Signal-Process(ISP)
> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC. These
> clocks and resets could be used by DMA, VIN and Display modules.
>=20
> Patches 1 and 2 are about the System-Top-Group clock and reset
> generator(STGCRG) part. The first patch adds docunmentation to
> describe STG bindings, and the second patch adds clock driver to
> support STG clocks and resets as auxiliary device for JH7110.
>=20
> Patches 3 and 4 are about the Image-Signal-Process clock and reset
> gennerator(ISPCRG) part. The first patch adds docunmentation to
> describe ISP bindings, and the second patch adds clock driver to
> support ISP clocks and resets as auxiliary device for JH7110.
> And ISP clocks should power on and enable the SYSCRG clocks first
> before registering.
>=20
> Patches 5 and 6 are about the Video-Output clock and reset
> generator(VOUTCRG) part. The first patch adds docunmentation to
> describe VOUT bindings, and the second patch adds clock driver to
> support VOUT clocks and resets as auxiliary device for JH7110.
> And VOUT clocks also should power on and enable the SYSCRG clocks
> first before registering.
>=20
> Patch 7 adds struct members to support STG/ISP/VOUT resets.

> Patch 8 adds external clocks which ISP and VOUT clock driver need.
> Patch 9 adds device node about STGCRG, ISPCRG and VOUTCRG to JH7110 dts.

b4 did not detect this correctly, but I picked these 2 up too.
They should be in next tomorrow.

Please let your co-workers know that they should resend anything that I
didn't sent a thanks email for today, as it failed to apply (eg DMA,
eMMC).

Thanks,
Conor.


--vhTePwvhqc04hvmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLlhpAAKCRB4tDGHoIJi
0pKSAQDFCDfQMvi4yv9+Tf0xlqT4YwJIY33dn1oTYWiDjF5HUgD/XBWnMLctc9VN
l2Gvi7R1GuFnkUjc2SjU2w7UPnb0HQw=
=8f8y
-----END PGP SIGNATURE-----

--vhTePwvhqc04hvmz--


--===============5928883103648770403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5928883103648770403==--

