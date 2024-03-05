Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B904C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 17:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD5540K9BpUwJsBizWg1CiCHazkudYqVGw/z4rgdwUE=; b=gcNjArSD5iytNbqI1VkUUzMAhi
	odqS+3fiYH5mp6NfNgrEaGeFokufZzUAVRQAwu9f4HYekBK34HBEtKg9E/dQX18IuVVNlN+vmEUzl
	JvAucOEj4NyKB9PvcLNhyqGdfaQKbJ7Q8Gxkk8BPdPSod2G/66TGcBPoZS/+1ulcpRgVmVttqskYW
	5jeG7D3HB//zWK9Nt8cmMR/Vdd+DBmQneX592yHJ3YoHASw9RkaWyP8naNXDsGuS+p5X471/xUirO
	l8bAxiB6Y40cWXBX6XvUbr8Je3Yjll6TDZiQdBbkOQh27wTP/O+MCot3D3+u4USpGhV4ZQfMsAH2T
	RytA1agQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYTY-0000000EfQA-3tro;
	Tue, 05 Mar 2024 17:21:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYTR-0000000EfOk-3VsE
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 17:21:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7C92CE1CE8;
	Tue,  5 Mar 2024 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADEAC43390;
	Tue,  5 Mar 2024 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659263;
	bh=u/5agPX/lDQGtNbFvNrArovCNgzjSoaqePko/71LzPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLh68MSAY+lVY1J2FtZLY48K1b81meFAuTM98dQCDx/YN8N8VdfVtxT1fwI6ZEBTH
	 kmXVOwXzXuoC/fKP+poyLcgqsH1MVL0JExkC5jZdgoGEV94kG7Whw2oGB9Sb0/va/i
	 sPom6z6JzJENMaaZMWFNlmXkbwY9oSCWEjrEUnu0jDtgd7WNgq36ld5OLZRXf1h+Vs
	 +uVjvKqF+1Z0nRHxf0cZgLMVagOXc6c74/+dPJeYsgJO6ObDWXVsB/dpH6/wfw0V0q
	 eqm5suN4eKt4cFETc6ZVGggx+JROVMqGCEN0NO/d6TqX6RGKv6bgdQGJn9SVEmskHw
	 BiJv3YSN0VM5A==
Date: Tue, 5 Mar 2024 17:20:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU
 for K230
Message-ID: <20240305-fascism-enrich-06483ddeb149@spud>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
 <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_092106_253195_0B30D295 
X-CRM114-Status: GOOD (  22.97  )
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
Content-Type: multipart/mixed; boundary="===============8343042689889878648=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8343042689889878648==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kCqjEWLK9A+dep2C"
Content-Disposition: inline


--kCqjEWLK9A+dep2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2024 at 03:47:15PM +0800, Yangyu Chen wrote:
> On 2024/3/5 07:46, Damien Le Moal wrote:
> > On 3/5/24 06:05, Yangyu Chen wrote:
> > > Since K230 was released, SOC_CANAAN is no longer only referred to the=
 K210.
> > > Remove it depends on !MMU will allow building dts for K230 and remove=
 the
> > > K210 string from the help message.
> > >=20
> > > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >   arch/riscv/Kconfig.socs | 5 ++---
> > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index 623de5f8a208..b4e9b7f75510 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -75,13 +75,12 @@ config ARCH_CANAAN
> > >   	def_bool SOC_CANAAN
> > >   config SOC_CANAAN
> > > -	bool "Canaan Kendryte K210 SoC"
> > > -	depends on !MMU
> >=20
> > This seems wrong to me. The k210 support does require no-mmu. So why re=
move
> > this ?
>=20
> It just allows SOC_CANAAN to be selected when MMU=3Dy. With this patch,
> nommu_k210_defconfig still works.

I think the concern here is that this would allow people to build a
kernel for the k120 with the MMU enabled, not that the existing nommu
build will be affected.

Maybe you could squash in something like the following?

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index b4e9b7f75510..75d55059163f 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -72,15 +72,19 @@ config SOC_VIRT
 	  This enables support for QEMU Virt Machine.
=20
 config ARCH_CANAAN
-	def_bool SOC_CANAAN
+	bool "Canaan Kendryte SoCs"
+	help
+	  This enables support for Canaan Kendryte SoC platform hardware.
=20
 config SOC_CANAAN
-	bool "Canaan Kendryte SoC"
+	bool "Canaan Kendryte K210 SoC"
+	depends on !MMU
+	depends on ARCH_CANAAN
 	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
 	help
-	  This enables support for Canaan Kendryte SoC platform hardware.
+	  This enables support for Canaan Kendryte K210 SoC platform hardware.
=20
 endmenu # "SoC selection"

(Which reminds me, I really need to go and finish sorting out the ARCH_
stuff)

--kCqjEWLK9A+dep2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZedUegAKCRB4tDGHoIJi
0mvGAP46YoIzshNQyc4YEgagEXQXzIwdeALQV+PKRlM2tCe2FQEAvnZO3VGbXelI
c9WuUEV6/uQa3XYyXDrSIxQdWFWinQo=
=oH7D
-----END PGP SIGNATURE-----

--kCqjEWLK9A+dep2C--


--===============8343042689889878648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8343042689889878648==--

