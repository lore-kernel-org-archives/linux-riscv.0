Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34893C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUi1ifapllOF3iihi2uTIT7juJkdUEbTnianMj8fv3U=; b=gSuBCbJ0051mT0
	J7rC4ailBxshe0KC/lyPxDUkcIqLtA37qft98NspUnNUi9n3+UTbKqPUQeZHpN/ynxsrg6c7PNLM7
	s11Q7R/fLRr2AHTPLhgpqZ4tuy2OZ3KYkCJl6yfk9M9JmfgtHBAaDE2R6vi8O5RMFlAQa5oDxGave
	hfHfZ8YUb1jT/2V/zVyDDOPaDU+oA6IeAodlOcQIED7yOrAggWfS02BojsjS0qe9XhEyrk/Nas73m
	2meXPxiGFI5Vpm0NncjY8NVh3RD6ps3L1LMeYISH5mK3xvbHI1zNKj8aZ4oUPl2G+YmxBVtMkMVlj
	G9Zuk2k6/EOQP9G5SDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrnr-00000001DM4-0h51;
	Fri, 17 Jan 2025 19:14:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrmb-00000001DBH-1qj9
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 19:13:30 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso4323244a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 11:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737141208; x=1737746008; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8UTpND2Rbn4HNA2BJ/vgMhdK6LbSWDbzp+NEMICmPTw=;
        b=LerAlsq+VKHRtZlxkrSDvakWucT5+idOo1jl0UGUlm7GYEljLVajB/3wUc1eNHScz8
         Y8lwxT6Cuz1j7IzV2RPRvDjQx25xkeIt3qVhULhhz6qaMnf2QGb3mpxzuMWscAo5n5Tq
         GIyRIYi4K7Hav8Yru3MPusu7B9Hc5Fg3TTdvxAZbYArSoK+u7+RT+Nvu7u2QkCpAGAw6
         jDGfTw/ETiJiuTaCQz6vOIRof5KnVeD17PzIRccJ06T7BpZ5BMXZo0UQ53XjiNXiLxvc
         uR5Mlua8U+hZEszyVxQEgG8eRQH/6PUHG7WQTpy9RJqS3/x2c76ZWm7jOQmSIzTT2dNV
         uWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141208; x=1737746008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UTpND2Rbn4HNA2BJ/vgMhdK6LbSWDbzp+NEMICmPTw=;
        b=rCSw/VRyvTe3yMvdh632lv/grikGGYrafaK85HlLeTG9k4E86E3ory8yfEEWm/dduZ
         o96/6GkWnbX4x7HsttqvlsiwT3c0aKFOSGFy8KnKEF+Gy2rnI3o1lcjtUKPiEVYH5bYc
         8KehhXDyR6g79ZDU5+em7C5br3cddLt7pj51adwTj+sKjSTfzakjlORT+m/gFX9Au/Zi
         CO5xZOlzSAdWMXdcYCKXGUGaZV/2kVWiuH2K09MLzLZB+2ltGh4/c2mVcBpW8D5sSeBk
         jPM3LYlw5S2ur7ksUq53sXPtDYCULcT5FEzSp7cPE0Du6lkWlaJqJojChh1G1OaovZAf
         hl0w==
X-Forwarded-Encrypted: i=1; AJvYcCXoOCWy52KzHsHjwCWDu7u+83QwBz+82yf8piYBwnD7Cgcq/dSMvRcDXGrajGGhjY6GSsE8hDIYyD11Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3JaDwolU/tgNGbFRErU8+yia9DTmPmFG+KlZOyIppnbHsU/wm
	rPqlDFFmKByWZxS8+3/Iwm9QsjjNFQaXzLd6g8hc2lVNDsHRsifz1wxa/yx7YkM=
X-Gm-Gg: ASbGnctD2nHR7Lu/lHmv8zvybCat787YarVwRxp1yqIad5QcQRT9lFd0+FWQzafXc5U
	u1qrPFVXQXZu8woorLRa2370N8mkScrAcslR1CeQB6IBa5ZWP1KHlgipCI95XaKbjNrblRT4dY6
	QxmWTs17QDHNXREVHYAv9Hy8cyLbbaBxnSk5Fm4TMz1n9I1bkr5VNiHJ9LJ5+yjpZC6qILgpY9y
	m4+keQnLoQhGd2XgEHunfu0J+dQl2yP96hb4v8+9ERQlVGQVyRZ
X-Google-Smtp-Source: AGHT+IH7BbQoFrPmcbzptHUlbfYyMs/PsV9xf+OzCx7xvhWju21hjcZsAHHc9/vuu5cfPYcSDek9fA==
X-Received: by 2002:a17:90b:534b:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-2f782c92720mr5484902a91.13.1737141207119;
        Fri, 17 Jan 2025 11:13:27 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c335093sm5637495a91.48.2025.01.17.11.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:13:26 -0800 (PST)
Date: Fri, 17 Jan 2025 11:13:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH 5/6] selftests/nolibc: rename riscv to riscv64
Message-ID: <Z4qr1KMVbjGbYcFV@ghost>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
 <20241221-nolibc-rv32-v1-5-d9ef6dab7c63@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241221-nolibc-rv32-v1-5-d9ef6dab7c63@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_111329_483512_929A93B5 
X-CRM114-Status: GOOD (  17.33  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 21, 2024 at 03:44:32PM +0100, Thomas Wei=DFschuh wrote:
> riscv32 support is about the be added. To keep the naming clear and
> consistent with other architectures rename riscv to riscv64, as that is
> what it actually represents.

Seems like a reasonable change.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> =

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> ---
>  tools/testing/selftests/nolibc/Makefile     | 6 ++++++
>  tools/testing/selftests/nolibc/run-tests.sh | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/self=
tests/nolibc/Makefile
> index e92e0b88586111072a0e043cb15f3b59cf42c3a6..78f47e85b389ac229ac13f3e7=
c8299fb3ec92197 100644
> --- a/tools/testing/selftests/nolibc/Makefile
> +++ b/tools/testing/selftests/nolibc/Makefile
> @@ -43,6 +43,7 @@ cc-option =3D $(call __cc-option, $(CC),$(CLANG_CROSS_F=
LAGS),$(1),$(2))
>  # configure default variants for target kernel supported architectures
>  XARCH_powerpc    =3D ppc
>  XARCH_mips       =3D mips32le
> +XARCH_riscv      =3D riscv64
>  XARCH            =3D $(or $(XARCH_$(ARCH)),$(ARCH))
>  =

>  # map from user input variants to their kernel supported architectures
> @@ -51,6 +52,7 @@ ARCH_ppc64       =3D powerpc
>  ARCH_ppc64le     =3D powerpc
>  ARCH_mips32le    =3D mips
>  ARCH_mips32be    =3D mips
> +ARCH_riscv64     =3D riscv
>  ARCH            :=3D $(or $(ARCH_$(XARCH)),$(XARCH))
>  =

>  # kernel image names by architecture
> @@ -65,6 +67,7 @@ IMAGE_ppc        =3D vmlinux
>  IMAGE_ppc64      =3D vmlinux
>  IMAGE_ppc64le    =3D arch/powerpc/boot/zImage
>  IMAGE_riscv      =3D arch/riscv/boot/Image
> +IMAGE_riscv64    =3D arch/riscv/boot/Image
>  IMAGE_s390       =3D arch/s390/boot/bzImage
>  IMAGE_loongarch  =3D arch/loongarch/boot/vmlinuz.efi
>  IMAGE            =3D $(objtree)/$(IMAGE_$(XARCH))
> @@ -82,6 +85,7 @@ DEFCONFIG_ppc        =3D pmac32_defconfig
>  DEFCONFIG_ppc64      =3D powernv_be_defconfig
>  DEFCONFIG_ppc64le    =3D powernv_defconfig
>  DEFCONFIG_riscv      =3D defconfig
> +DEFCONFIG_riscv64    =3D defconfig
>  DEFCONFIG_s390       =3D defconfig
>  DEFCONFIG_loongarch  =3D defconfig
>  DEFCONFIG            =3D $(DEFCONFIG_$(XARCH))
> @@ -104,6 +108,7 @@ QEMU_ARCH_ppc        =3D ppc
>  QEMU_ARCH_ppc64      =3D ppc64
>  QEMU_ARCH_ppc64le    =3D ppc64
>  QEMU_ARCH_riscv      =3D riscv64
> +QEMU_ARCH_riscv64    =3D riscv64
>  QEMU_ARCH_s390       =3D s390x
>  QEMU_ARCH_loongarch  =3D loongarch64
>  QEMU_ARCH            =3D $(QEMU_ARCH_$(XARCH))
> @@ -130,6 +135,7 @@ QEMU_ARGS_ppc        =3D -M g3beige -append "console=
=3DttyS0 panic=3D-1 $(TEST:%=3DNOLIB
>  QEMU_ARGS_ppc64      =3D -M powernv -append "console=3Dhvc0 panic=3D-1 $=
(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_ppc64le    =3D -M powernv -append "console=3Dhvc0 panic=3D-1 $=
(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_riscv      =3D -M virt -append "console=3DttyS0 panic=3D-1 $(T=
EST:%=3DNOLIBC_TEST=3D%)"
> +QEMU_ARGS_riscv64    =3D -M virt -append "console=3DttyS0 panic=3D-1 $(T=
EST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_s390       =3D -M s390-ccw-virtio -append "console=3DttyS0 pan=
ic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_loongarch  =3D -M virt -append "console=3DttyS0,115200 panic=
=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS            =3D -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $=
(QEMU_ARGS_EXTRA)
> diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/=
selftests/nolibc/run-tests.sh
> index e7ecda4ae796fbf0d389f20144511e66ce4f0b30..caa1ae40fe9a2faf8931c299a=
acd19716227e2b8 100755
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -17,7 +17,7 @@ perform_download=3D0
>  test_mode=3Dsystem
>  werror=3D1
>  llvm=3D
> -archs=3D"i386 x86_64 arm64 arm mips32le mips32be ppc ppc64 ppc64le riscv=
 s390 loongarch"
> +archs=3D"i386 x86_64 arm64 arm mips32le mips32be ppc ppc64 ppc64le riscv=
64 s390 loongarch"
>  =

>  TEMP=3D$(getopt -o 'j:d:c:b:a:m:pelh' -n "$0" -- "$@")
>  =

> =

> -- =

> 2.47.1
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
