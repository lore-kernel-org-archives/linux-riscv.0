Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B2AC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 20:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmFaS+kRyurNRw+c95UOVAtHjN2yBo5vNV6+/KirLEE=; b=ZYMlNbk654TLP8ZS485yOrttMP
	JMxgDAXzQ4IRVmSVfgdA52DQFa7QGcBGVaXq0lARgXbRHbX3EPJizRkgw/K2Sp3Wjsowlhhgx0iEZ
	003aXskp3Ixr/rGpAsEFF/mFEYnamFCoabI1IRetNmrpUI59FmvfLzZrk0JqBGT0hIgaTMPONkrAN
	xI9+Jcjy6UONUPOsxmBgDkfHp7d8cw7f5GrVdeAcdK60w2KuKtUe5WbjqaSyhN9Y3jHYWMO7KsMv0
	0D9YGmQ0BqCWk9pfsJEpRlD0kI2Qwv+ZHd7SW/2Qpe0CYErDKzWnC/gmheUrjHAvUQ4LBezD1dvnJ
	1Wop8MDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyFH-00CJsk-Po; Fri, 20 Jan 2023 20:44:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyFE-00CJru-GA
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 20:44:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4BFD62060;
	Fri, 20 Jan 2023 20:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675F5C433D2;
	Fri, 20 Jan 2023 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674247455;
	bh=Vt8oiZbQmXunlXHeri8Xgh7T7MbWYfRl0mIFfOXZhl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FraY02Z+vIyhI39A2tB238RgSVTmrc5QEqs8Q7NpfJERPTu4+eYfQ1w6qkNU6sxUZ
	 K4nQG7utxJXOGG/nocXL6uDfGxn6zhHKCxGd3a9EXY4u9AR8KEX8LvAh7WIzfnIQFD
	 MDWWpp39FJE7RCiBAQ9JswhfnBlV8lSVaQ+qzM/iG3Sn7whCUn/Y0DtJjp+mjHp43C
	 jr+0nqt3d2UO9CeFKAOqCaj4L2+WARiArorPGIBGaDK0iYZwiz886+BxlyZzxHdQ9X
	 /lITu0zq1vVEVb6dQ/SfmcGzx5OmjAKJXp8av9OCLJ0FVelFDh6QXjXvCfmRK3j9Yv
	 QUTiYmHr9YlqA==
Date: Fri, 20 Jan 2023 20:44:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <Y8r9GuyUAfJWYY5Z@spud>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
 <Y8pJ4y7FyBDQPqIT@wendy>
 <056f0d30-d340-fdc4-3744-1cdedd8b4048@gmail.com>
MIME-Version: 1.0
In-Reply-To: <056f0d30-d340-fdc4-3744-1cdedd8b4048@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_124416_658503_9BD04440 
X-CRM114-Status: GOOD (  30.27  )
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
Content-Type: multipart/mixed; boundary="===============6708898707956636228=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6708898707956636228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="axrD9d1syAKU/5YD"
Content-Disposition: inline


--axrD9d1syAKU/5YD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jesse,

On Fri, Jan 20, 2023 at 12:39:06PM -0500, Jesse Taube wrote:
> On 1/20/23 02:59, Conor Dooley wrote:
> > Since you'll have to re-submit, making sure that allowing !MMU on rv32
> > doesn't break the build due to canaan k210 drivers being enabled despite
> > relying on 64-bit divisions, I've got some nits for you.
> Not sure what driver needs 64bit, but sense !MMU was only selected by 64B=
IT.

LKP reported a build error for it:
https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/

> This should work.
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..b9835b8ede86 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -43,7 +43,7 @@ config SOC_VIRT
>=20
>  config SOC_CANAAN
>         bool "Canaan Kendryte K210 SoC"
> -       depends on !MMU
> +       depends on !MMU && 64BIT
>         select CLINT_TIMER if RISCV_M_MODE
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY

I don't think this is the correct fix for the problem - the drivers
really should not do implicit 64-bit divisions IMO.
Linux has division helpers for them in math64.h.
None of the other SoCs have a dependency on 64BIT and I'd not been keen
on adding on here.

I suspect the fix is as simple as the below, but I'd need to go test it.

Thanks,
Conor.

--- 8< ---
=46rom ecfa79ad1b24f68cfccb77d666e443293d52d066 Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 20 Jan 2023 20:36:29 +0000
Subject: [PATCH] clk: k210: remove an implicit 64-bit division

The K210 clock driver depends on SOC_CANAAN, which is only selectable
when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
have been sent for its enabling. The kernel test robot reported this
implicit 64-bit division there.

Replace the implicit division with an explicit one.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.c=
om/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Since it was always guarded such that it only ever built for 64-bit, I
am not sure that a fixes tag is needed, but it would be:
Fixes: c6ca7616f7d5 ("clk: Add RISC-V Canaan Kendryte K210 clock driver")
---
 drivers/clk/clk-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 67a7cb3503c3..17c5bfb384ad 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw *h=
w,
 	f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
 	od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
=20
-	return (u64)parent_rate * f / (r * od);
+	return div_u64(parent_rate * f, r * od);
 }
=20
 static const struct clk_ops k210_pll_ops =3D {
--=20
2.39.0


--axrD9d1syAKU/5YD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8r9GgAKCRB4tDGHoIJi
0kllAQDKgK/+5PpYdTkzPe0Ai+nKWB4Wc4qSfHnfZoIl5Y7ibQD1FwXPEeo2EZBb
EiqR1/R9JwfcXsFaHsw51dpTq066CA==
=734a
-----END PGP SIGNATURE-----

--axrD9d1syAKU/5YD--


--===============6708898707956636228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6708898707956636228==--

