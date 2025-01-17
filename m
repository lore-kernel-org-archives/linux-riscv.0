Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726D0C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vkY8OaAGgBXMEmpN93G3GNADTV+7wa6RVbwaOuwCJU=; b=GfGjdC9LK/v2mw
	5IG8hrSxV4YIGXDEad3jlIbib/pYCUojkj5EEgjpI96STKXxWdl5bQXRIllf3/qQIRPEXyKYNp5bu
	GM2F7HtQ+HVOAV3GBkSFJsFEuzCDrIU7Y8tpOqzp7d5PiHPKFAnFq+oGmJb9p22J1Knuq9aiM0P1/
	wzZCopxdpXI39GRHrGPHmUIvwAP+ESxZBEwEa5mEM3aRszjES/49QrTDEyKX4B9Xmf1c/6lJILIUN
	mh4TAFez6B+zwjm9wavkVFMJA+Y/+k/lvJXH+aH8qlbJZdSFYtEMkqPuIUpPbwQ5TczVBrn3wgpRm
	e8l49UEguuqzfgKHvHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrjq-00000001CXT-1Sol;
	Fri, 17 Jan 2025 19:10:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrjn-00000001CWP-1C26
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 19:10:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21628b3fe7dso47181995ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 11:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737141034; x=1737745834; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=684EKr0SGhUio1SIgzlKBAWtDnxxSNa6bhJ5P1eZdns=;
        b=2LF3olz3mHcpjxF6VuOyavsV0xLI92hGNJreo2+LhxTFO/V/7R0mflGkuf7hzqYG6y
         NKqKbCREImDnL96XgJ8Le6dQUwOFlOAg/kTtgoTtcJ0E/d2wzxXKpWj2QKCcIs1qykcf
         IUF4tCAtSLPHQ87UC3B6ZuHNGCMgjM5G6/H9L5VYeuFHdf38oGHJzXf5gH2uH+FKEdQf
         FN7Cc1ghu4QRtzm57GQLpW7c6ca1xP1nEaqRYzlGB2HZUz7WaeWjrUzK4a890Rnj76TU
         bf4i9SUVberQ6Il4Cz4bYHLLY0n9L9CO+tgCuyoPA1Jgm/PhnQXctiJDiTqUv0GYVqY3
         V2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141034; x=1737745834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=684EKr0SGhUio1SIgzlKBAWtDnxxSNa6bhJ5P1eZdns=;
        b=c4vlIabAIe/breFCKRNKXsJGhOYOgZ0Ujf9QYMo9CRxp4454H7BOgNQTSgh9rTlLnK
         henKPbMzOGY9lixiuEcDXRetJ6vtdSjsO+0RRIuXsQVzyasEM6uMGDhklado/HbX78Gb
         cz6E1ohHrU5mWy27DSxKHZT9yaEmBXCTW3rzcJkaiGRGf5VNXy4lv5LIKTa51TRPYzSq
         bI9N8Ab4HDxplTxUKjj0TIS5vBJ/8VFQBlc6UVM1yjw+sxudvaNjaQIygH06iO0GIqaU
         oVQf2vMVYadNHtOUXxnAAir6xdEBPmNoWTAYLvglBsSihO6chQb/HaSzqWEZKbt+ngHI
         1r8g==
X-Forwarded-Encrypted: i=1; AJvYcCVUofFSm5cgbdcGhGqnkbT7sGfj7kjzbsU8Pvb4EHEJ226AZd0QOxhYKaOq6El5FDWyyFrMKQ5kVrhNMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Be3OMa9d5X2CZdDgajN1b7WCllUpINCJT7unNjqL8REBH2Fd
	yV6zSVvhjkI9327Wbad3X9JQc4d56u8lLU+GoB6Q7kiWn37IwozPij2tJyhOtm8=
X-Gm-Gg: ASbGncsUa/P6F+JWVscZzzP1KDhzTpZcDB7CeeJU0lF4xWAxqJpgpK8jqK3nDlaBKnx
	+U9/XWADZ68NYDmh5Ji0zSG0cHBEoHi4IN/nNPBJKvaKp1KJzbW4rNb3TS4h1m+3tyT9X/49NlO
	Ax7QaV+V1nf7eAMfPzEyWeyBrLjvZmZHNpZA2iYBJ376N1RVPVy25h9HLmtMRvUSUykOL66A7nU
	KP75lwg73Wr01eE0kNCAcVl35PmA2zhIpKQwUeSfeEhEmzPeZy3
X-Google-Smtp-Source: AGHT+IGsACICx7JMdEWk9qCqqQIm7K1lBo6FYA0XbVmB0NbXALlZ/AHrDJ962xz49A5qW/XaxM8X1A==
X-Received: by 2002:a17:903:41c3:b0:216:4883:fb43 with SMTP id d9443c01a7336-21c35594385mr60556265ad.32.1737141034238;
        Fri, 17 Jan 2025 11:10:34 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9ee18sm19645235ad.52.2025.01.17.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:10:33 -0800 (PST)
Date: Fri, 17 Jan 2025 11:10:31 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH 6/6] selftests/nolibc: add configurations for riscv32
Message-ID: <Z4qrJyj6BtD3bYF3@ghost>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
 <20241221-nolibc-rv32-v1-6-d9ef6dab7c63@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241221-nolibc-rv32-v1-6-d9ef6dab7c63@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_111035_586224_71B88A67 
X-CRM114-Status: GOOD (  14.39  )
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

On Sat, Dec 21, 2024 at 03:44:33PM +0100, Thomas Wei=DFschuh wrote:
> nolibc already supports riscv32. Wire it up in the testsuite.

Good addition!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> =

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> ---
>  tools/testing/selftests/nolibc/Makefile     | 5 +++++
>  tools/testing/selftests/nolibc/run-tests.sh | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> =

> diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/self=
tests/nolibc/Makefile
> index 78f47e85b389ac229ac13f3e7c8299fb3ec92197..7d14a7c0cb62608f328b25149=
5264517d333db2e 100644
> --- a/tools/testing/selftests/nolibc/Makefile
> +++ b/tools/testing/selftests/nolibc/Makefile
> @@ -52,6 +52,7 @@ ARCH_ppc64       =3D powerpc
>  ARCH_ppc64le     =3D powerpc
>  ARCH_mips32le    =3D mips
>  ARCH_mips32be    =3D mips
> +ARCH_riscv32     =3D riscv
>  ARCH_riscv64     =3D riscv
>  ARCH            :=3D $(or $(ARCH_$(XARCH)),$(XARCH))
>  =

> @@ -67,6 +68,7 @@ IMAGE_ppc        =3D vmlinux
>  IMAGE_ppc64      =3D vmlinux
>  IMAGE_ppc64le    =3D arch/powerpc/boot/zImage
>  IMAGE_riscv      =3D arch/riscv/boot/Image
> +IMAGE_riscv32    =3D arch/riscv/boot/Image
>  IMAGE_riscv64    =3D arch/riscv/boot/Image
>  IMAGE_s390       =3D arch/s390/boot/bzImage
>  IMAGE_loongarch  =3D arch/loongarch/boot/vmlinuz.efi
> @@ -85,6 +87,7 @@ DEFCONFIG_ppc        =3D pmac32_defconfig
>  DEFCONFIG_ppc64      =3D powernv_be_defconfig
>  DEFCONFIG_ppc64le    =3D powernv_defconfig
>  DEFCONFIG_riscv      =3D defconfig
> +DEFCONFIG_riscv32    =3D rv32_defconfig
>  DEFCONFIG_riscv64    =3D defconfig
>  DEFCONFIG_s390       =3D defconfig
>  DEFCONFIG_loongarch  =3D defconfig
> @@ -108,6 +111,7 @@ QEMU_ARCH_ppc        =3D ppc
>  QEMU_ARCH_ppc64      =3D ppc64
>  QEMU_ARCH_ppc64le    =3D ppc64
>  QEMU_ARCH_riscv      =3D riscv64
> +QEMU_ARCH_riscv32    =3D riscv32
>  QEMU_ARCH_riscv64    =3D riscv64
>  QEMU_ARCH_s390       =3D s390x
>  QEMU_ARCH_loongarch  =3D loongarch64
> @@ -135,6 +139,7 @@ QEMU_ARGS_ppc        =3D -M g3beige -append "console=
=3DttyS0 panic=3D-1 $(TEST:%=3DNOLIB
>  QEMU_ARGS_ppc64      =3D -M powernv -append "console=3Dhvc0 panic=3D-1 $=
(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_ppc64le    =3D -M powernv -append "console=3Dhvc0 panic=3D-1 $=
(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_riscv      =3D -M virt -append "console=3DttyS0 panic=3D-1 $(T=
EST:%=3DNOLIBC_TEST=3D%)"
> +QEMU_ARGS_riscv32    =3D -M virt -append "console=3DttyS0 panic=3D-1 $(T=
EST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_riscv64    =3D -M virt -append "console=3DttyS0 panic=3D-1 $(T=
EST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_s390       =3D -M s390-ccw-virtio -append "console=3DttyS0 pan=
ic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>  QEMU_ARGS_loongarch  =3D -M virt -append "console=3DttyS0,115200 panic=
=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
> diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/=
selftests/nolibc/run-tests.sh
> index caa1ae40fe9a2faf8931c299aacd19716227e2b8..67fefc847d77165f817c3befa=
578cfa27e6f93d8 100755
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -17,7 +17,7 @@ perform_download=3D0
>  test_mode=3Dsystem
>  werror=3D1
>  llvm=3D
> -archs=3D"i386 x86_64 arm64 arm mips32le mips32be ppc ppc64 ppc64le riscv=
64 s390 loongarch"
> +archs=3D"i386 x86_64 arm64 arm mips32le mips32be ppc ppc64 ppc64le riscv=
32 riscv64 s390 loongarch"
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
