Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4131C79FA1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90rplJWulx4i8RHNSO9wJzf/lGnRfHVRt0atPyxB+So=; b=cIOOER+xedZ4sSPN+DoEfzn6Ov
	3C3jzEWEaRagP/YOgD3L58l37s5QJBMsSZUE0T/FjHIZ7NUFHcpICSNw//mHdqxv3oG3P2bw8YgRG
	rC0qVhjDKx+am/UNhKCqDGcLrIz0zYaTXSlET8KPNv8HrRo+IgkZG2tNMp0eTCVN5pGRP7OFhCYa8
	u7DjLE+hMFXj4CT1sYV9u8TIWvgMVFrv24pGac/quS/+8P6n3iQuc9HU0o+EBU7S+GcG7nxWXVKmc
	RNPq/6AwFXyIIxz+B1GWX5Rhujvs6BnDcz2wrIH/ch9rNmujdfk62PxxJaCrdgBE5taww2GL2goI1
	QLZ8QlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c5x-00000007Hbj-1Exc;
	Mon, 07 Sep 2026 16:21:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c5t-00000007Hb7-1DwU
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 16:21:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90AC7601DB;
	Mon,  7 Sep 2026 16:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3901F00A3A;
	Mon,  7 Sep 2026 16:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788798076;
	bh=JazYIWzsxmmFatUCV1zgP83ZeRa+rMhqoz4z4b8bYBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TUG4x7CI4m4GOYj6Y5eJNR7LoQND20qyPwjeTkCIqFyR5QkcLKw3gEh23WHOkpG+m
	 KwzQ44LYWRlUl2F9ZYNRjy3/JPTSWrtFjsCH/41jLYXbA5Bsak3ZG2kq9GSRaRLTB3
	 jRgdKZhf5FtuTuycJ53bwpuioujAhyPlbGXUw9UhmRGhtg7VkqYNNlRHs/vABnryIO
	 u2pusvL9pmFFC2xqRBEYZO4Ng1mm7m3JptTpd8TZ30s72TlN0Ku4chHqWVmEFIaqLQ
	 75xou+QD5B6iTI0vcNoHo4VFYo82RqNhqdUMAKNHyCUE694j+CwYkSAHyObl4QBGjS
	 8/PAYX2ZQ0p2Q==
Date: Mon, 7 Sep 2026 17:21:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 4/5] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 under
 NONPORTABLE
Message-ID: <20260907-backless-theatrics-f19e489bc63f@spud>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260907151437.7603-5-jszhang@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============9074276209267376381=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9074276209267376381==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AdSlj0bZSJkbuFZS"
Content-Disposition: inline

--AdSlj0bZSJkbuFZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 11:14:36PM +0800, Jisheng Zhang wrote:
> In last commit, we have optimized the pgtable_l4|l5_enabled with isa
> extension alternative mechanism, thus a typical access_ok(addr, 1);
> is compiled as:
>=20
> ffffffff8001dd30:	1141                	addi	sp,sp,-16
> ffffffff8001dd32:	e022                	sd	s0,0(sp)
> ffffffff8001dd34:	e406                	sd	ra,8(sp)
> ffffffff8001dd36:	0800                	addi	s0,sp,16
> ffffffff8001dd38:	00000013          	nop
> ffffffff8001dd3c:	02a0006f          	j	ffffffff8001dd66 <foo+0x3e>
> ffffffff8001dd40:	60a2                	ld	ra,8(sp)
> ffffffff8001dd42:	6402                	ld	s0,0(sp)
> ffffffff8001dd44:	57fd                	li	a5,-1
> ffffffff8001dd46:	83a1                	srli	a5,a5,0x8
> ffffffff8001dd48:	00a7b533          	sltu	a0,a5,a0
> ffffffff8001dd4c:	00154513          	xori	a0,a0,1
> ffffffff8001dd50:	0141                	addi	sp,sp,16
> ffffffff8001dd52:	8082                	ret
> ...
> ffffffff8001dd64:	bfe1                	j	ffffffff8001dd3c <foo+0x14>
> ffffffff8001dd66:	0180006f          	j	ffffffff8001dd7e <foo+0x56>
> ffffffff8001dd6a:	60a2                	ld	ra,8(sp)
> ffffffff8001dd6c:	6402                	ld	s0,0(sp)
> ffffffff8001dd6e:	57fd                	li	a5,-1
> ffffffff8001dd70:	83c5                	srli	a5,a5,0x11
> ffffffff8001dd72:	00a7b533          	sltu	a0,a5,a0
> ffffffff8001dd76:	00154513          	xori	a0,a0,1
> ffffffff8001dd7a:	0141                	addi	sp,sp,16
> ffffffff8001dd7c:	8082                	ret
> ffffffff8001dd7e:	60a2                	ld	ra,8(sp)
> ffffffff8001dd80:	6402                	ld	s0,0(sp)
> ffffffff8001dd82:	57fd                	li	a5,-1
> ffffffff8001dd84:	83e9                	srli	a5,a5,0x1a
> ffffffff8001dd86:	00a7b533          	sltu	a0,a5,a0
> ffffffff8001dd8a:	00154513          	xori	a0,a0,1
> ffffffff8001dd8e:	0141                	addi	sp,sp,16
> ffffffff8001dd90:	8082                	ret
>=20
> As can be seen, different branches for SV39/SV48/SV57 are still there,
> since access_ok() sits at hot code path, why not reduce the code size
> to optimize to make the instruction cache happy?
>=20
> Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE, so that
> the embedded platforms can choose the best option themselves, while
> still keep the feature of unified one kernel Image for all SV39, SV48
> and SV57.
>=20
> Before the patch, vmlinux built with pure RISCV64 defconfig
>    text    data     bss     dec     hex filename
> 13439437   6790446  483221 20713104 13c0e90 /tmp/old/vmlinux
>=20
> After the patch, vmlinux built with pure RISCV64 defconfig:
>    text    data     bss     dec     hex filename
> 13314445   6787934  466837 20569216 139dc80 /tmp/new/vmlinux
>=20
> .text section is reduced by 122KB!
>=20
> And after the patch, typical access_ok(addr, 1) is compiled as:
> ffffffff8001809a:	1141                	addi	sp,sp,-16
> ffffffff8001809c:	e022                	sd	s0,0(sp)
> ffffffff8001809e:	e406                	sd	ra,8(sp)
> ffffffff800180a0:	0800                	addi	s0,sp,16
> ffffffff800180a2:	00000013          	nop
> ffffffff800180a6:	60a2                	ld	ra,8(sp)
> ffffffff800180a8:	6402                	ld	s0,0(sp)
> ffffffff800180aa:	4785                	li	a5,1
> ffffffff800180ac:	179a                	slli	a5,a5,0x26
> ffffffff800180ae:	00f53533          	sltu	a0,a0,a5
> ffffffff800180b2:	0141                	addi	sp,sp,16
> ffffffff800180b4:	8082                	ret
>=20
> only 12 instruction!! For refernece, before the patch, the access(addr,
> 1) needs 32 instructions.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig                  | 24 ++++++++++++++++++++++++
>  arch/riscv/include/asm/pgtable-64.h | 12 ++++++++++++
>  arch/riscv/mm/init.c                | 10 ++++++++++
>  3 files changed, 46 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e9476b8cbeb0..4cdb1e3f34be 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -602,6 +602,30 @@ config RISCV_ISA_SSQOSID
>  	  cache partitioning scheme and use the MCID to track how much
>  	  cache a process, or a group of processes, is using.
> =20
> +config RISCV_ISA_SV48
> +	bool "Page-Based 48-bit Virtual-Memory System"
> +	depends on 64BIT && NONPORTABLE
> +	default y

I don't understand how you've got this set up here.
If this is genuinely non-portable, then you should not set the default to
enabled. However, I'm not really sure that this is actually non-portable
at all....

> +	help
> +	  Add support for the Page-Based 48-bit Virtual-Memory System.
> +
> +	  Enable this option for systems for which a 39-bit virtual address
> +	  space is insufficient. But if 39-bit is enough, disabling this
> +	  option will result in smaller kernel size and slighly better
> +	  performance.
> +
> +config RISCV_ISA_SV57
> +	bool "Page-Based 57-bit Virtual-Memory System"
> +	depends on 64BIT && NONPORTABLE
> +	default y
> +	help
> +	  Add support for the Page-Based 57-bit Virtual-Memory System.
> +
> +	  Enable this option for systems for which a 48-bit virtual address
> +	  space is insufficient. But if 48-bit is enough, disabling this
> +	  option will result in smaller kernel size and slighly better
> +	  performance.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "Svpbmt extension support for supervisor mode page-based memory ty=
pes"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm=
/pgtable-64.h
> index 7e30ec0e9f6c..f2d29da93eea 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -16,21 +16,33 @@ extern bool _pgtable_l5_enabled;
>  #ifdef USE_EARLY_PGTABLE_LEVELS
>  static __always_inline bool pgtable_l5_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV57=
))
> +		return false;
> +
>  	return _pgtable_l5_enabled;
>  }
> =20
>  static __always_inline bool pgtable_l4_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV48=
))
> +		return false;
> +
>  	return _pgtable_l4_enabled;
>  }
>  #else
>  static __always_inline bool pgtable_l4_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV48=
))
> +		return false;
> +
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
>  }
> =20
>  static __always_inline bool pgtable_l5_enabled(void)
>  {
> +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV57=
))
> +		return false;
> +
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
>  }
>  #endif

=2E..because the code here won't enable sv57 etc if not supported...

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2a2402d79bc4..90bb85c5f167 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -844,6 +844,16 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
> =20
>  	kernel_map.page_offset =3D PAGE_OFFSET_L5;
> =20
> +	/* Fall back to Sv48 if Sv57 is unsupported on non-portable systems */
> +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV57=
) &&
> +			satp_mode_limit =3D=3D 0)
> +		satp_mode_limit =3D SATP_MODE_48;

=2E..and neither does the code here.

> Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE, so that
> the embedded platforms can choose the best option themselves, while
> still keep the feature of unified one kernel Image for all SV39, SV48
> and SV57.

NONPORTABLE is what you're meant to depend on when the kernel that gets
built cannot run on platforms without the feature.

> +
> +	/* Fall back to Sv39 if Sv48 is unsupported on non-portable systems */
> +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_ISA_SV48=
) &&
> +			satp_mode_limit =3D=3D SATP_MODE_48)
> +		satp_mode_limit =3D SATP_MODE_39;
> +
>  	if (satp_mode_limit =3D=3D SATP_MODE_48) {
>  		disable_pgtable_l5();
>  	} else if (satp_mode_limit =3D=3D SATP_MODE_39) {
> --=20
> 2.53.0
>=20

--AdSlj0bZSJkbuFZS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7kdwAKCRB4tDGHoIJi
0jegAQDoDc/mqNU0RCn/UBMRnMksVBFmhS0F5WhOTcTLFOp0VQEAgZdo239DkGMM
/T8qR45ts+DKQdXa4W7G37IJJqfYhAw=
=xHUT
-----END PGP SIGNATURE-----

--AdSlj0bZSJkbuFZS--


--===============9074276209267376381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9074276209267376381==--

