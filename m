Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F16ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D447Woc98Ip+7NDsN0SoL1fqyNeggaHI7IXR9DgjY8I=; b=Z3dYVmvyO1+eHB
	jZgiOXvfU0Fw9tGr6sddMPGif5qSOoR+0l2y/2HEXSa2OUZHQA8gT4u3U6F9snkdKqRDD+3NxVa1R
	qNVN8PoFurXsq1nBso1zdY9SLw//lYI76H6D42WYsls7kHxMC1zQz1pS86y3BaUgvJhbl1wWTb187
	aJHpf2knoU6cS5K/8pOeFKc/RCiaiBZ9Xd+w4IWVZWizGeS97eTEtEjYV7xh1BxUIfWk/jZKY9Ir0
	yQ6ADddyCthsRfwu3Przt5T0H/iOnpnI1dKH63dro2Z1z6xDfVlTHsGl+PAs11JbiaxXmUJm7CfeI
	54YybmkQmBHDH6aIkciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0WF-000zkh-VB; Fri, 02 Sep 2022 06:51:12 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0WA-000ziN-4N
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 06:51:10 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-334dc616f86so7911047b3.8
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EQA9P2uBBDCHCvw8Byykk86FMd4V6ZGLYaGLzxfJwKk=;
        b=VYQqBcpd3dle7vN23JoePGUfMHK1D4urkKRVql0Og7tAIeonfIEccSM2ZiKQXwEdwY
         Tz8bXC0HOH1uqtRKdTf7cTZJqWlos07iIdLAgvqYik+3fX/V/cK2vz3EBKeBnVw8JwA4
         cIA2gjUXkXIHCiOfMgbLjNCCrhIXiGFFIKN0BPnK//8loKAVWPTP6jxWWRJRmQ4an2hH
         UBDuPaZn0BwXnME8S6SP6Al5EticaolX4UFM/H4mnrGwLYDX936arZw0Mn5jGGzzfqYW
         jVQXl9nGyJVlvpey+XqJtO7qk6I32F5llyt3okXdBpUHFuK/YFZvgyLI7ukK2iU1mVbd
         6buA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EQA9P2uBBDCHCvw8Byykk86FMd4V6ZGLYaGLzxfJwKk=;
        b=S+Bei0btdiEakPj3MldHbryuFGMFPGMMUd0X2aYotDzLhPfkQVguuEQiZWJbovT8ID
         W6MKVpbkOjwd4x5okXa7fK6JZ4C+bfRCo/h6V5iLlLS6FAhhsTJzo0+D2MiFPdHMyOPb
         nkp5S51E0dniXZSZDExG0oGE1jy6QUJ3qx6B8pKWA3qKeW/j0RLb2yLhCFgUHLf7bJ3f
         ZQwBESTeqgTCUzWZX+L/G7ivX7xgZdK02mVtNI4b5JbgwLZxeV9ELDuKoZutJ3JVfpLc
         Gi/sjxHaFhOl/1dIKCMBtlu1nmbswnAfxmKoIW8cQwhj2sVPULggg/ePAHYwTo54yYyT
         tdgw==
X-Gm-Message-State: ACgBeo2umIgXpYwHSgEIRF+IhBu+D8kABC4uKeT3kkKJB4g0jHxipLWd
	U+Mg8SZgUcSHGb/q9DYxD4XO36pEOGxel4ev15hJCg==
X-Google-Smtp-Source: AA6agR6ayopQajWgDcxEhFJEvi/rOdtcT7/9F90QspUV9aH8OLsyBX4oAy6TaSQu5v4yAigBNsBGbX4ZeJhBS94YJJ0=
X-Received: by 2002:a81:1913:0:b0:341:d4b3:3f8 with SMTP id
 19-20020a811913000000b00341d4b303f8mr9891186ywz.153.1662101462689; Thu, 01
 Sep 2022 23:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220902034352.8825-1-palmer@rivosinc.com>
In-Reply-To: <20220902034352.8825-1-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Sep 2022 12:20:50 +0530
Message-ID: <CAAhSdy1Sn3xyKnuUgSNGwfYB0Nvuh9EVe+E23kzMb=Q=adhmMg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add support for Ztso
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_235106_383052_B3758EAD 
X-CRM114-Status: GOOD (  29.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 2, 2022 at 9:17 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The Ztso extension was recently frozen, this adds support for running
> binaries that depend on TSO on systems that support Ztso.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> ---
>
> This is very minimaly tested: I can run no-Ztso binaries on both
> yes-Ztso and no-Ztso QEMU instances, but I don't have a yes-Ztso
> userspace together in order to make sure that works.
> ---
>  arch/riscv/include/asm/elf.h   | 18 ++++++++++++++++--
>  arch/riscv/include/asm/hwcap.h |  3 +++
>  arch/riscv/kernel/cpu.c        |  1 +
>  arch/riscv/kernel/cpufeature.c |  3 +++
>  4 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 14fc7342490b..7a17d2275b76 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -14,6 +14,7 @@
>  #include <asm/auxvec.h>
>  #include <asm/byteorder.h>
>  #include <asm/cacheinfo.h>
> +#include <asm/hwcap.h>
>
>  /*
>   * These are used to set parameters in the core dumps.
> @@ -31,10 +32,23 @@
>  #define ELF_DATA       ELFDATA2LSB
>
>  /*
> - * This is used to ensure we don't load something for the wrong architecture.
> + * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
> + * prevent them from even being loaded.
> + */
> +#define EF_RISCV_TSO   0x0010
> +
> +static inline int riscv_elf_tso_ok(long eflags)
> +{
> +       return likely(!(eflags & EF_RISCV_TSO)) || riscv_tso_hw;
> +}
> +
> +/*
> + * This is used to ensure we don't load something for the wrong architecture or
> + * variant.
>   */
>  #define elf_check_arch(x) (((x)->e_machine == EM_RISCV) && \
> -                          ((x)->e_ident[EI_CLASS] == ELF_CLASS))
> +                          ((x)->e_ident[EI_CLASS] == ELF_CLASS) && \
> +                          riscv_elf_tso_ok((x)->e_flags))
>
>  extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>  #define compat_elf_check_arch  compat_elf_check_arch
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6f59ec64175e..4e1d94c43d51 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -36,6 +36,8 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_s                ('s' - 'a')
>  #define RISCV_ISA_EXT_u                ('u' - 'a')
>
> +extern bool riscv_tso_hw;
> +
>  /*
>   * Increse this to higher value as kernel support more ISA extensions.
>   */
> @@ -58,6 +60,7 @@ enum riscv_isa_ext_id {
>         RISCV_ISA_EXT_ZICBOM,
>         RISCV_ISA_EXT_ZIHINTPAUSE,
>         RISCV_ISA_EXT_SSTC,
> +       RISCV_ISA_EXT_ZTSO,
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 0be8a2403212..d8371c249cc8 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -95,6 +95,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>         __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +       __RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3b5583db9d80..b8ab2b0a9e78 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -25,6 +25,8 @@
>
>  unsigned long elf_hwcap __read_mostly;
>
> +bool riscv_tso_hw __read_mostly;

This is not set anywhere. Maybe riscv_fill_hwcap() should set it ?

> +
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> @@ -204,6 +206,7 @@ void __init riscv_fill_hwcap(void)
>                                 SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>                                 SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>                                 SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> +                               SET_ISA_EXT_MAP("ztso", RISCV_ISA_EXT_ZTSO);
>                         }
>  #undef SET_ISA_EXT_MAP
>                 }
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
