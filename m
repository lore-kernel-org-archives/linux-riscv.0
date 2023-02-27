Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F76C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3tJsaoCo4nfjmSCd8nN7dj/wZM9AwAekTg9ISxd0xc=; b=dGK8a3L1B2giMWCJYZqOY/vk+L
	bz95Tgjuxo8KAeuRDxtZv0m5zN5G5hTPfpfNa6gKemYYOkIUJY/iRHGFIX5lSFR6kbKHAtiFhDzNW
	qifTmmEKuudiC49CeK6CxlJCvgAIIUm02kLah3hfq1kpZH2sOwW0aQtZmMkHrYtBqRkqjBgp+WHV+
	uizU9LlI+DBlJKhtyHJq8opYyPTwgOMzHSYiTIvPp8bAFw5CryhWv0TZrOdtCLkOD+4ec7dwWtDgd
	EQEJLOXiZi/MLJQLIrL73g3dbRsLL7Fw+0Osx1SQn9+r3Wyn9/mZ0v4MAWpt//I1GCMSgjENa2T3l
	2xlSoLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcfy-009bdy-Ff; Mon, 27 Feb 2023 12:32:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcfu-009bbZ-9g
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 12:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677501134; x=1709037134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RO6aTFXermoMWjG0Tt8TtnTKM9NV8n7SoUu00FD0WU8=;
  b=YhAEJsPfxZbnuiHhCIBLZYver8h1CR+Df173v8x0z073dyBSIaOdWFJi
   4c3DyP/oE0hjgcUzeIK0jpOl8E6xmhw3debdcB9kPpT+5XKE/KXS3bg1m
   492tLY1jHtqO1SZ8pqjiMc/sV9ps2Hr5rZix2u4FjHX4M4+YC/pUHGmwd
   Dj+xAxVjtFKJ2Pt/+4at6q0zrl6Gz57hDIiWkMtJ/p1Mmn2GhNnNTjZ0u
   wrDYiS+T3nV6Li6HV/quR+0prVTyGkbKQmLguTzcgah27hIttdnFLL1jy
   ZyUzt4NqDFgBzkkTrmq1cc1LBZywaP4WzG/ATFy3GHRYwZqrhhFi2KEZW
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,332,1669100400"; 
   d="asc'?scan'208";a="202701616"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 05:31:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 05:31:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 05:31:43 -0700
Date: Mon, 27 Feb 2023 12:31:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Ard Biesheuvel
	<ardb@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, <nathan@kernel.org>, <llvm@lists.linux.dev>,
	<ndesaulniers@google.com>
Subject: Re: [PATCH v7 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <Y/yilORflGv3vXjX@wendy>
References: <20230224100218.1824569-1-alexghiti@rivosinc.com>
 <20230224100218.1824569-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230224100218.1824569-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_043214_467783_0B3CE4BF 
X-CRM114-Status: GOOD (  20.83  )
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
Content-Type: multipart/mixed; boundary="===============7941095156392935807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7941095156392935807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ORzwRGnfaATysc6"
Content-Disposition: inline

--8ORzwRGnfaATysc6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex, clang/llvm folk,

On Fri, Feb 24, 2023 at 11:02:18AM +0100, Alexandre Ghiti wrote:
> Add 2 early command line parameters that allow to downgrade satp mode
> (using the same naming as x86):
> - "no5lvl": use a 4-level page table (down from sv57 to sv48)
> - "no4lvl": use a 3-level page table (down from sv57/sv48 to sv39)
>=20
> Note that going through the device tree to get the kernel command line
> works with ACPI too since the efi stub creates a device tree anyway with
> the command line.
>=20
> In KASAN kernels, we can't use the libfdt that early in the boot process
> since we are not ready to execute instrumented functions. So instead of
> using the "generic" libfdt, we compile our own versions of those functions
> that are not instrumented and that are prefixed so that they do not
> conflict with the generic ones. We also need the non-instrumented versions
> of the string functions and the prefixed versions of memcpy/memmove.
>=20
> This is largely inspired by commit aacd149b6238 ("arm64: head: avoid
> relocating the kernel twice for KASLR") from which I removed compilation
> flags that were not relevant to RISC-V at the moment (LTO, SCS, pie).
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  5 +-
>  arch/riscv/kernel/Makefile                    |  2 +
>  arch/riscv/kernel/pi/Makefile                 | 37 +++++++++++
>  arch/riscv/kernel/pi/cmdline_early.c          | 62 +++++++++++++++++++

+      4 ld.lld: warning: vmlinux.a(arch/riscv/kernel/pi/string.pi.o):(.ini=
t.sdata) is being placed in '.init.sdata'

I'm getting 4 new linker warnings with LLVM=3D1 clang-15 allmodconfig
builds - but I don't really understand this issue.
Is this spurious, and a just consequence of...

> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
> new file mode 100644
> index 000000000000..4002ed94b6d3
> --- /dev/null
> +++ b/arch/riscv/kernel/pi/Makefile
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# This file was copied from arm64/kernel/pi/Makefile.
> +
> +KBUILD_CFLAGS	:=3D $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> +		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
> +		   $(call cc-option,-mbranch-protection=3Dnone) \
> +		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
> +		   -D__DISABLE_EXPORTS -ffreestanding \
> +		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
> +		   $(call cc-option,-fno-addrsig)
> +
> +CFLAGS_cmdline_early.o +=3D -D__NO_FORTIFY
> +CFLAGS_lib-fdt_ro.o +=3D -D__NO_FORTIFY
> +
> +GCOV_PROFILE	:=3D n
> +KASAN_SANITIZE	:=3D n
> +KCSAN_SANITIZE	:=3D n
> +UBSAN_SANITIZE	:=3D n
> +KCOV_INSTRUMENT	:=3D n
> +
> +$(obj)/%.pi.o: OBJCOPYFLAGS :=3D --prefix-symbols=3D__pi_ \
> +			       --remove-section=3D.note.gnu.property \
> +			       --prefix-alloc-sections=3D.init

=2E..this?

> +$(obj)/%.pi.o: $(obj)/%.o FORCE
> +	$(call if_changed,objcopy)
> +
> +$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/string.o: $(srctree)/lib/string.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +obj-y		:=3D cmdline_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-f=
dt_ro.pi.o
> +extra-y		:=3D $(patsubst %.pi.o,%.o,$(obj-y))

--8ORzwRGnfaATysc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yilAAKCRB4tDGHoIJi
0vndAQC4f+NCDSCyNXYj0njkGSVRxmlHAyLfwBzffl3veDQDTwD+Ll58OPQxpsri
ApRUvSTvYGRl+S21vQH6TERahcXL2gI=
=2KwQ
-----END PGP SIGNATURE-----

--8ORzwRGnfaATysc6--


--===============7941095156392935807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7941095156392935807==--

