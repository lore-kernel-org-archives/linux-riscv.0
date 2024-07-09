Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80692C3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKLmmdJYhJYUhphKdje3TWvayq7hTZzItZcuRtZxI90=; b=zzHasg9AD2PbcIxBp/n0MIWehX
	tV/J9/zV7klpuz0jWpfrJaIR+9u+XSkP5LpFZk0xMcKBauUHE0e6Us0ULNRMIc/+RQvlzqQz3T2J1
	nnx+wRIlh+SEyc+9s6fSktICtAIIIUp89ItBP7u8PdlYvJd7Oh0oXcS2DxX9BBdc1rNC8j06HA0Gg
	41ve0WIquhI98UZET25c5lv1DvFDLobWEmygLrQAb098PdKfioudOhq7kc512csyIZX9qjVTGgkGI
	turKJuU8sfFWDqvae+/P0qrGJiM2D89c4j4iFZqyGOHRkiOG1chUpiipfDw3HnulJD2bpsngdiuE8
	lBrU/7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7Vo-00000006gSk-0cKc;
	Tue, 09 Jul 2024 09:51:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7VX-00000006gMz-1qhu;
	Tue, 09 Jul 2024 09:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CD2061298;
	Tue,  9 Jul 2024 09:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0883C3277B;
	Tue,  9 Jul 2024 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720518693;
	bh=bL4qqpnXgSeE002tT5hkhdq/LTVBpp3383J8u7fQ4bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3oZYSxhrUHeBC7D3++kc3VMMIROXNpVTp/zPdT90QqvPQgNm5XI2F6MBXPM/+UA3
	 UH9RuK2MShKrBmUTslqSXwP3Vk6xC9PEhP727zHiCfE1dR9NNi04itTL2M4g2JPGca
	 DYbyB6fhgfRRpxw2TSGozYaH9fBkaZqsPy7wqUTf/Em/9DzIDZtwFFcgksMprYZaEr
	 aZMcxEFFAdQ80JKr95+yYz7gtnWdrvetTEsvaLEIzp8rQlJK8hzi7OlJIcFemoHGE/
	 v0rnx/MlMCVg9pE9T6LJmQXapizmm4+K4joqB3CEAt9ivGtpfDOMHt/a2HbXmnnjPB
	 mBMeYRnBPpOlQ==
Date: Tue, 9 Jul 2024 10:51:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	Saravana Kannan <saravanak@google.com>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into
 a platform driver
Message-ID: <20240709-mutt-truffle-3ac954bc00ba@spud>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com>
 <CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com>
 <CAK9=C2WP2+gKScUFuoE9782gjSfnDtcLAw01eCwram3LMAStBg@mail.gmail.com>
 <CAJM55Z8ti-ePT0t714h1Za9X3Ns3=Fw0pCu3NZ=7eT76JU_p5g@mail.gmail.com>
 <CAAhSdy1pesbdTfWnFURMJRcy2ujjX+cXtt-cfLDj2CQf2Ua_gw@mail.gmail.com>
 <CAJM55Z_=94+aMv=ywhih44eF0pR2WXiyx3FcrwRaX6tZto4gpQ@mail.gmail.com>
 <CAK9=C2XWjtWtV1WbQrX4Cg8KyzjVevMjG18YTgQJbZxi61BFjg@mail.gmail.com>
 <ZoydV7vad5JWIcZb@ghost>
MIME-Version: 1.0
In-Reply-To: <ZoydV7vad5JWIcZb@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_025135_637506_0873E133 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: multipart/mixed; boundary="===============6969095393270508878=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6969095393270508878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bSqWFTNZ10MZH6YN"
Content-Disposition: inline


--bSqWFTNZ10MZH6YN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2024 at 07:15:51PM -0700, Charlie Jenkins wrote:
> CONFIG_NONPORTABLE=3Dy
> CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS=3Dy
>=20
> A new warning is tripped:
>=20
> [    1.015134] No max_rate, ignoring min_rate of clock 9 - pll-video0
> [    1.021322] WARNING: CPU: 0 PID: 1 at drivers/clk/sunxi-ng/ccu_common.=
c:155 sunxi_ccu_probe+0x144/0x1a2
> [    1.021351] Modules linked in:
> [    1.021360] CPU: 0 PID: 1 Comm: swapper Tainted: G        W          6=
=2E10.0-rc6 #1
> [    1.021372] Hardware name: Allwinner D1 Nezha (changed) (DT)
> [    1.021377] epc : sunxi_ccu_probe+0x144/0x1a2
> [    1.021386]  ra : sunxi_ccu_probe+0x144/0x1a2
> [    1.021397] epc : ffffffff80405a50 ra : ffffffff80405a50 sp : ffffffc8=
0000bb80
> [    1.021406]  gp : ffffffff815f69c8 tp : ffffffd801df8000 t0 : 61000000=
00000000
> [    1.021414]  t1 : 000000000000004e t2 : 61725f78616d206f s0 : ffffffc8=
0000bbe0
> [    1.021422]  s1 : ffffffff81537498 a0 : 0000000000000036 a1 : 00000000=
0000054b
> [    1.021430]  a2 : 00000000ffffefff a3 : 0000000000000000 a4 : ffffffff=
8141f628
> [    1.021438]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 00000000=
4442434e
> [    1.021446]  s2 : 0000000000000009 s3 : 0000000000000000 s4 : ffffffd8=
01dc9010
> [    1.021453]  s5 : ffffffd802428a00 s6 : ffffffd83ffdcf20 s7 : ffffffc8=
00015000
> [    1.021462]  s8 : ffffffff80e55360 s9 : ffffffff81034598 s10: 00000000=
00000000
> [    1.021470]  s11: 0000000000000000 t3 : ffffffff8160a257 t4 : ffffffff=
8160a257
> [    1.021478]  t5 : ffffffff8160a258 t6 : ffffffc80000b990
> [    1.021485] status: 0000000200000120 badaddr: 0000000000000000 cause: =
0000000000000003
> [    1.021493] [<ffffffff80405a50>] sunxi_ccu_probe+0x144/0x1a2
> [    1.021510] [<ffffffff80405af6>] devm_sunxi_ccu_probe+0x48/0x82
> [    1.021524] [<ffffffff80409020>] sun20i_d1_ccu_probe+0xba/0xfa
> [    1.021546] [<ffffffff804a8b40>] platform_probe+0x4e/0xa6
> [    1.021562] [<ffffffff808d81ee>] really_probe+0x10a/0x2dc
> [    1.021581] [<ffffffff808d8472>] __driver_probe_device.part.0+0xb2/0xe8
> [    1.021597] [<ffffffff804a67aa>] driver_probe_device+0x7a/0xca
> [    1.021621] [<ffffffff804a6912>] __driver_attach+0x52/0x164
> [    1.021638] [<ffffffff804a4c7a>] bus_for_each_dev+0x56/0x8c
> [    1.021656] [<ffffffff804a6382>] driver_attach+0x1a/0x22
> [    1.021673] [<ffffffff804a5c18>] bus_add_driver+0xea/0x1d8
> [    1.021690] [<ffffffff804a7852>] driver_register+0x3e/0xd8
> [    1.021709] [<ffffffff804a8826>] __platform_driver_register+0x1c/0x24
> Emil[    1.021725] [<ffffffff80a17488>] sun20i_d1_ccu_driver_init+0x1a/0x=
22
> [    1.021746] [<ffffffff800026ae>] do_one_initcall+0x46/0x1be
> [    1.021762] [<ffffffff80a00ef2>] kernel_init_freeable+0x1c6/0x220
> [    1.021791] [<ffffffff808e0b46>] kernel_init+0x1e/0x112
> Linked as a fwnode consumer[    1.021807] [<ffffffff808e7632>] ret_from_f=
ork+0xe/0x1c
>=20
> The warning is not fatal, so execution continues until hanging at
>=20
> [    2.110919] printk: legacy console [ttyS0] disabled
> [    2.136911] 2500000.serial: ttyS0 at MMIO 0x2500000 (irq =3D 205, base=
_baud =3D 1500000) is a 16550A=EF=BF=BD[    2.145674] printk: legacy consol=
e [ttyS0] enabled
> [    2.145674] printk: legacy console [ttyS0] enabled
> [    2.155095] printk: legacy bootconsole [sbi0] disabled
> [    2.155095] printk: legacy bootconsole [sbi0] disabled
>=20
> I have not been able to discover why it hangs here.

FWIW, that's probably because the CCU is the clock driver providing the
clock for the uart, so when the sbi console goes away you lose output
cos the uart driver cannot get the right rate for its input.
You'd probably get further if you set keep_bootcon in your cmdline - but
realistically the clock driver failing to probe is gonna have a load of
knock on effects that it's probably enough to just have the failure you
link here.

--bSqWFTNZ10MZH6YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo0IHwAKCRB4tDGHoIJi
0vRfAP9bUI5Q8gO+0jDxlcnbZTpLWQkYqx7dZemPzbLJwoQxWgD/bpGeA4LqYj1+
AREvEnMKmNas6haB0YYEh9d10Wx65g4=
=hcxv
-----END PGP SIGNATURE-----

--bSqWFTNZ10MZH6YN--


--===============6969095393270508878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6969095393270508878==--

