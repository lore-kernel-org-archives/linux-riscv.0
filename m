Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A4EC021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBiGs+F1BOBbz4az/CwcmzvXM+YFzcnExGMZfjNRaVM=; b=NjEgiLyCztO+xa7u+GhygtCyUC
	2Vs3p/BZSfXnwk6HKC5pI6J56S22d+1DMIhkzHkSJnerj0FBoS8LS7obySweV+lvKMItKay9re8XX
	0ufkDO3OWzGhwwYOkM8LVXEX8uWACsrDMxf6wBrskg/P65PPb6A6V30bCyZNtLJJW76v9T6J9pJ2w
	FWTuG5NiUOptHs6wNsQjs71oH2zXLVUpW1ZnxKMJ+SJ8zU08x+2OKrfPTaTR56AHCyQj8EcOiOOMN
	2I2F4xyCcZ576PBYffOjeHekZyIfMdlJ3F/dolmTxdqfEARxwEioLFKGyc3vJwEOTVpA2RxCsKhqU
	8VNXVCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQzZ-000000094dD-17P8;
	Tue, 18 Feb 2025 17:02:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQzX-000000094cG-0Jod
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 17:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EECDA41475;
	Tue, 18 Feb 2025 17:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0710C4CEE2;
	Tue, 18 Feb 2025 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739898158;
	bh=hxZMRmhOej47toRK0ik8X/JMRjiOAT/0BXqJA9WLLpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0rViv0sVQMs1kcS09YPvJGHeRgaoq1Jl9rlYGzR4H9ea6gvTt6GDQSQFfi39D5MW
	 Lx0wkdSCEG6bIPhtC94JRqFKxcR9OBZYlYA+INqx3FWi7nUQh5Y/aBXq+qiEQI8EyK
	 sgbC8X2HWlAbIc9fuXT0ZQxNxgZ72DWakw6ivVnB1ou4fdsrCeyCZ4yfUuuaCeWVwa
	 wWyeva0LHupfTEwL4WJKQ17ZCeLMaJObNQO+uNdz0eByJHKyYmltmKp6BsTPAPUv83
	 i+OgfxTIjVRcgGpIVjTZO2yfanb7r58xBadVfuw1off27um1zAjgVgWHynyitiYJap
	 Hs4iFjifok+cw==
Date: Tue, 18 Feb 2025 17:02:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/3] riscv: canaan: Add support for K230-Canmv clock
Message-ID: <20250218-poplar-iron-c894fe8deca6@spud>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
MIME-Version: 1.0
In-Reply-To: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_090239_239683_09382DAA 
X-CRM114-Status: GOOD (  19.44  )
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
Content-Type: multipart/mixed; boundary="===============2261778275971920813=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2261778275971920813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbLHPbgA0NhUTES7"
Content-Disposition: inline


--kbLHPbgA0NhUTES7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen,

Is the driver in this series satisfactory to you? If it is, can I send
you a PR containing it and the binding so that I can apply the final
patch in the series (and merge the basic support for the k230 soc)?

Cheers,
Conor.

On Mon, Feb 17, 2025 at 10:45:15PM +0800, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC and 4 internal
> PLLs, with the controller managing these sources and their derived clocks.
>=20
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].
>=20
> Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arc=
h/riscv/boot/dts/kendryte/clock_provider.dtsi [1]
> Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8=
229DAA58E08@qq.com/ [2]
>=20
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>=20
> ---
> Changes in v4:
> - Remove redundant onecell_get callback and add_provider function
> for pll_divs.
> - Modify the base-commit in cover letter.
> - Link to v3: https://lore.kernel.org/r/20250203-b4-k230-clk-v3-0-362c791=
24572@zohomail.com
>=20
> Changes in v3:
> - Reorder the defination and declaration in drivers code.
> - Reorder the properties in dts node.
> - Replace global variable `k230_sysclk` with dynamic memory allocation.
> - Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
> - Use dev_err_probe for error handling.
> - Remove unused includes.
> - Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2=
ca52d@zohomail.com
>=20
> Changes in v2:
> - Add items and description.
> - Rename k230-clk.h to canaan,k230-clk.h
> - Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917=
e80ed@zohomail.com
>=20
> ---
> Xukai Wang (3):
>       dt-bindings: clock: Add bindings for Canaan K230 clock controller
>       clk: canaan: Add clock driver for Canaan K230
>       riscv: dts: canaan: Add clock initial support for K230
>=20
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml |   43 +
>  arch/riscv/boot/dts/canaan/k230.dtsi               |   32 +
>  drivers/clk/Kconfig                                |    6 +
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/clk-k230.c                             | 1347 ++++++++++++++=
++++++
>  include/dt-bindings/clock/canaan,k230-clk.h        |   49 +
>  6 files changed, 1478 insertions(+)
> ---
> base-commit: 7fdb24bbac37ce692346d60b89f5aa29844b8b88
> change-id: 20241206-b4-k230-clk-925f33fed6c2
>=20
> Best regards,
> --=20
> Xukai Wang <kingxukai@zohomail.com>
>=20

--kbLHPbgA0NhUTES7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7S9KAAKCRB4tDGHoIJi
0rI1AP9y8hypNtdPcY14Ojl+N98Ywv6/Uwj7IvHIC4k2+k80ZAD/RhGE8a8Zix3V
2BB5hrI/mGOw51ydyOw7cdBuw6S8nAk=
=hINT
-----END PGP SIGNATURE-----

--kbLHPbgA0NhUTES7--


--===============2261778275971920813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2261778275971920813==--

