Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3882C54E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 01:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNGGQtYbVhUYoAGxa057xk7fSEALuRuxRGz4tV3JdHY=; b=OAufs73/WvaScJ
	EMMl32BjqiFZ0yZDAg60CnzZ4b18Z9xNaUDG2JAcoMqk8yzrMz11q9cesg4tTGZ2ub5suU/Koy+E3
	+FYck+w7A0T/BchJMVkm6AK6BPP/4fqjz/L5SZjeEldZ9cyBRsgjmaOlU6MUcXl7TT8igKsIoaexA
	sWe26Ho5Ru2zpN+s8DBVW6ua8ZTQPWkC1OvUsIDEQNkEP6fL1+G6EGwkwf49/g9gz/7F42i11qYE9
	3bLRuqDOhB46UtRsjJBFf+Z3QaD+foSEbfcJpQjS6CKsXgzajoBfUYlrLwpdZTHLhYqHMBnRo6Ir/
	AK6jyKacQqxCDHKdUlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkD9C-00000008IlN-3wKj;
	Wed, 13 Mar 2024 01:11:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkD97-00000008IhS-21XV
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 01:11:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e5eaf5bb3eso4895364b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 18:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710292264; x=1710897064; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZVTEdL4tspWGYZt6WUdOVkVxO9G+Bnl9WSMo6I37UI=;
        b=ScUeVd0olJzg/NjUMu6UtaHIDOKT1mMYQ1ZUaQzpbyFhu8T1cjwQF8B+vY87Z4O1Dh
         DLnf8bsEiDLaEa+jlQMa5LSzw3ar4tvkgAWXfDonjB5WFFlw/M8UT6xmtfGrEu5lM4VV
         MX5xc2A6vkviKHYxTVAwUQ9XbTUHPa2/43v6/ZNx+yKD5UJf2lrWIwK26d6hU0gThJWP
         TGJcAghKsDbshl+Q7Jbgzf5vjpPRyZL/Sns/9OlOrwhhcT2sAccM5Pso02w/7Vk4DnQw
         WFBuw5tXUAzizaAFRB62+bonu/DYcy6XoeCB2ZgCTKI8dvtf7BYrJeYqVCXzQnPrnECe
         l1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710292264; x=1710897064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZVTEdL4tspWGYZt6WUdOVkVxO9G+Bnl9WSMo6I37UI=;
        b=eje9KNN1qdi9ej1ZqBbW1Nyg4xl063ygSgGTJa4UUTRPhTe4fMQEtUL+3HPZi8Gn36
         T77FSS72PwoLJpH3rHA90hQvPDGR9kUWAewQfkk9/dG3pyc6Z1F6/b6xiGix7tpoicxK
         UulWSNCHYQzwx327JAFQYLWQyMNcZHESjV1AybHmPOZWCSbl/Yp/kz87OEn5X61OiZBU
         HuLa03CgoiFfjnDuDv8yRPnNEJ3VwBhotj5YOAfttNCx5GsHhA0j3eo1bn9ixK1Tsa+Z
         pykG+BYlghNBVgQN63s+wzxlxI/c0I2xwEJOpqS8IMRflySsGTN/Po3dqJXs8JiGAD8R
         SPWg==
X-Forwarded-Encrypted: i=1; AJvYcCXCmX8iFyDypPAZa4GMi1ApHf/NA+RpNtdluwfi7Fkjw8KQxj9ZvYNhaC3z7ewCA3Lv7Dz7sk0l2HbGQL5rf9XGaOJgmC2oAZ8khvTwDwlZ
X-Gm-Message-State: AOJu0YwPAJ+5YRPoBuEjbLfg0jPtHEjH+n0NkeJZWscl6Z8aIzGh/ka0
	CpV8Pu+BWy0mNTuB3brZAcQKLc+NueFHQXmhkIxRejBKs75a7N4plE1qZ/+28rw=
X-Google-Smtp-Source: AGHT+IF3xwXoWk7UDjbgIIi2TOB7cq2R7KvxH9ZhaPo/B3eQFdlHc8H6tyaNvFMqdYNDUub+oREQiA==
X-Received: by 2002:a05:6a00:198c:b0:6e6:673e:3447 with SMTP id d12-20020a056a00198c00b006e6673e3447mr1126901pfl.14.1710292263967;
        Tue, 12 Mar 2024 18:11:03 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:733c:479a:4b7b:f77b])
        by smtp.gmail.com with ESMTPSA id hq22-20020a056a00681600b006e635740126sm6747332pfb.112.2024.03.12.18.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 18:11:03 -0700 (PDT)
Date: Tue, 12 Mar 2024 18:11:01 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robin Ehn <rehn@rivosinc.com>, Stefan O'Rear <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] riscv: hwprobe: export highest virtual userspace address
Message-ID: <ZfD9JV51GER/8OOX@ghost>
References: <20240301164407.475957-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301164407.475957-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_181105_695492_732B005F 
X-CRM114-Status: GOOD (  30.40  )
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

On Fri, Mar 01, 2024 at 05:44:06PM +0100, Cl=E9ment L=E9ger wrote:
> Some userspace applications (OpenJDK for instance) uses the free MSBs
> in pointers to insert additional information for their own logic and
> need to get this information from somewhere. Currently they rely on
> parsing /proc/cpuinfo "mmu=3Dsvxx" string to obtain the current value of
> virtual address usable bits [1]. Since this reflect the raw supported
> MMU mode, it might differ from the logical one used internally which is
> why arch_get_mmap_end() is used. Exporting the highest mmapable address
> through hwprobe will allow a more stable interface to be used. For that
> purpose, add a new hwprobe key named
> RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS which will export the highest
> userspace virtual address.
> =

> Link: https://github.com/openjdk/jdk/blob/master/src/hotspot/os_cpu/linux=
_riscv/vm_version_linux_riscv.cpp#L171 [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> ---
> =

> v3:
>  - Note: I did not added Stefan Reviewed-by since I did more
>    modifications than just a simple respin.
>  - Handle CONFIG_MMU=3Dn as well and rename the key to
>    RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS
>  - Add a user_max_virt_addr() macro to handle !MMU config
>  - Link to v2: https://lore.kernel.org/lkml/20240220110950.871307-1-clege=
r@rivosinc.com/
> =

> v2:
>  - Note: tried sysconf to export it but this is not backed by syscall
>    and thus does not allow exporting such information easily.
>  - Use arch_get_mmap_end() instead of VA_BITS since it reflects the
>    maximum logical address used by the riscv port
>  - Change hwprobe key name from RISCV_HWPROBE_KEY_VA_BITS to
>    RISCV_HWPROBE_KEY_MAX_ADDRESS
>  - Link to v1: https://lore.kernel.org/lkml/20240201140319.360088-1-clege=
r@rivosinc.com/
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 3 +++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/asm/processor.h    | 8 +++++++-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
>  5 files changed, 16 insertions(+), 2 deletions(-)
> =

> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index b2bcc9eed9aa..875d3122bd66 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -210,3 +210,6 @@ The following keys are defined:
>  =

>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long wh=
ich
> +  represent the highest userspace virtual address usable.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  =

>  #include <uapi/asm/hwprobe.h>
>  =

> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>  =

>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index a8509cc31ab2..341863d4d989 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -14,7 +14,7 @@
>  =

>  #include <asm/ptrace.h>
>  =

> -#ifdef CONFIG_64BIT
> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
>  #define STACK_TOP_MAX		TASK_SIZE
>  =

> @@ -58,6 +58,12 @@
>  =

>  #define STACK_TOP		DEFAULT_MAP_WINDOW
>  =

> +#ifdef CONFIG_MMU
> +#define user_max_virt_addr() arch_get_mmap_end(ULONG_MAX, 0, 0)
> +#else
> +#define	user_max_virt_addr() 0
> +#endif /* CONFIG_MMU */
> +
>  /*
>   * This decides where the kernel will search for a free chunk of vm
>   * space during mmap's.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9f2a8e3ff204..3630e3f30354 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -67,6 +67,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  =

>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index a7c56b41efd2..560ea41a716d 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -8,6 +8,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
> +#include <asm/processor.h>
>  #include <asm/sbi.h>
>  #include <asm/switch_to.h>
>  #include <asm/uaccess.h>
> @@ -202,6 +203,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pa=
ir,
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>  			pair->value =3D riscv_cboz_block_size;
>  		break;
> +	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
> +		pair->value =3D user_max_virt_addr();
> +		break;
>  =

>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
> -- =

> 2.43.0
> =


Looks like a great solution.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
