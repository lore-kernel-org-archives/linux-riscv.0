Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7DEEDEC6B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=39IX3jJeZ3TY2diwVwpJV2GUwj+rj4Y71w9N6txwrxA=; b=3UJPWsRz1lbiLRNs0AF+uHuIsA
	+ktw+J+RLfpYf4oqEq7rvR3ln5rGeFlON6Ug4+hHm0Y8likOlHARU+zaa/e9nuHiJBnkrSAl8wKFx
	mjP/BZk+oOXOQbUdkckXfuzlX+6mjW5BmO/ubH0xLb3nxg3dXRmU84rUtir1k1O56oWb4zXvEKn+s
	x1AegDrXMMJBGA0eLRP2xXLXNDw+arHI1rWeZ+GIvyRE+mYeXFEQZyZ7StK47V1Z3mRVag/VDz02l
	Fi1lxuoB+gDRgVe6WZMHmKVkmW/FfLGEPa4ui49o/0uBGWFT+qgrRRtHaqfKcOmNwFXJHJbWKU7iH
	pLncYrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQtM-0067S6-2u;
	Wed, 13 Sep 2023 14:30:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQtI-0067R4-0C
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 14:30:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bdf4752c3cso50027895ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694615449; x=1695220249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgJ7ho64PWmdEQGindJ/iYi2WUEGv6uVRhh7Nn8vnYw=;
        b=AhVDyBAaylyrlskXgKayjVQfToPJBcqQ6I0E+WwHMWN0HDIcjAUy6JTEkVKgHg+H87
         bL69r+DdyOaNZe9pYIV+Vlxg/bEo/GEBPMRnTpdfAkVjR1kih0yvKy8KZm0wmc3bAEee
         KYVBR7gWOlQg4x86fG+smYj410FoIdCp6Vi1hKw+LR4UND7soT7uWlf6rwxpkrevaqfp
         ki1gricZv9kb2HfosQs7xuNZs19gBeqaNAXjNJGoe5XUhRYIjUdK5LD4zMz+PLQ2OJ4y
         ti/7VaWgindqjUoW609yaVvMPngrVK5c8NmDBJAS/gd/fVa65WwOENv1WFaFiNFidrMA
         WIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615449; x=1695220249;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgJ7ho64PWmdEQGindJ/iYi2WUEGv6uVRhh7Nn8vnYw=;
        b=gbzlQwurLP1SIfbC7M6kqJEQII2nrhxIxn0Ys6KqB3p8vFS3VzFgIFn5wQXisDMhyD
         lCZVEB5yl2GFgcpGcZ18RaQ2b2ErRrNkwsYStXf/PvrGDbcr5RRhKdu8MBCGW9AzSJ0g
         ySszSXFWmTcQ4MWe5Q10VTAJ4ZymCCPxJuKC+uSG7ERrwhIGDRSDm4hi888f641aSu7n
         eYyONzC20t1818HPQ2U5qtccQ1M/Yn/SCrU5q4oWgBbU/Ki+cBDe1VzZjCbMK4ad3tDH
         KVdJZKrQdWcMj6b9z7TDB4H1G3pkz8wkYCm5TbxJhvARHKGX/WIUwhkULA94fblXOckq
         hhxQ==
X-Gm-Message-State: AOJu0YypksiJ/mrZHOn0Rhvix0vicV4wc8X1WqWjPmFypY+E5VjW+MYh
	kxhIJ2vK3jajc4VQL30CD3noQg==
X-Google-Smtp-Source: AGHT+IFciMNiqnHPYKPekiNiuVG7fgj773Kwcez4AWuo7gjkj8DCSJSLDiz4+6TJK6xgnOVclPuY/g==
X-Received: by 2002:a17:902:e84a:b0:1b5:64a4:bea0 with SMTP id t10-20020a170902e84a00b001b564a4bea0mr3495622plg.10.1694615449079;
        Wed, 13 Sep 2023 07:30:49 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001bb1f0605b2sm10543211plg.214.2023.09.13.07.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:48 -0700 (PDT)
Date: Wed, 13 Sep 2023 07:30:48 -0700 (PDT)
X-Google-Original-Date: Wed, 13 Sep 2023 07:30:45 PDT (-0700)
Subject: Re: BUG Report: Some issues about vmlinux with emit-relocs 
In-Reply-To: <20230808085438.3445957-1-suagrfillet@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  suagrfillet@gmail.com, anup@brainfault.org, alex@ghiti.fr, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: suagrfillet@gmail.com
Message-ID: <mhng-0208249f-0619-4be7-bbc7-e1c0ee6e3c8c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_073052_332553_5BD3700C 
X-CRM114-Status: GOOD (  39.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Aug 2023 01:54:38 PDT (-0700), suagrfillet@gmail.com wrote:
> Hi, everyone:
>
> I encountered some issues when testing CONFIG_RELOCATABLE.
>
> The story starts with the issue "the empty relocations in .rela.dyn"
> mentioned in patch 1 of "Introduce 64b relocatable kernel" thread [1].
> And it had been circumvented by ld `--emit-relocs` option in patch 6.
>
> With the `emit-relocs` option enabled, the vmlinux would grow bigger,
> so vmlinux.relocs was created as a backup to generate the Image file
> and vmlinux objcopyed itself to check/strip all .rela* sections.
>
> Not sure there is a solution to fix the "empty relocaions" issue
> and get rid of the `emit-relocs` option.
> Until that, there are some other issues with vmlinux's `emit-relocs` option:
>
> 1. result of `remove-section` varies with different version GNU-objcopy
>
> - the sections of vmlinux with objcopy 2.31.1
>
> riscv64-linux-gnu-readelf -SW 00_rv_test/vmlinux |grep rel
>   [10] .rela.dyn         RELA            ffffffff80c26138 913138 2186a0 18   A  9   0  8
>   [15] .rela__ksymtab    RELA            0000000000000000 11529760 052dd0 18   I 49  14  8
>   [17] .rela__ksymtab_gpl RELA            0000000000000000 1157c530 05eba8 18   I 49  16  8
>   [20] .rela__param      RELA            0000000000000000 115db0d8 005400 18   I 49  19  8
>   [22] .rela__modver     RELA            0000000000000000 115e04d8 000300 18   I 49  21  8
>   [24] .rela__ex_table   RELA            0000000000000000 115e07d8 00cde0 18   I 49  23  8
>   [29] .rela__bug_table  RELA            0000000000000000 115ed5b8 0bd1e0 18   I 49  28  8
>   [32] .data.rel         PROGBITS        ffffffff816a5940 e21940 0d0df0 00  WA  0   0 64
>
> - the sections of vmlinux with objcopy 2.38
>
> riscv64-linux-gnu-readelf -SW 00_rv_newtool/vmlinux | grep rel
>
>
>   [25] .data.rel         PROGBITS        ffffffff816a6340 f77340 0d0cb0 00  WA  0   0 64
>
> The difference comes from binutils's commit c12d9fa2afe ("Support
> objcopy --remove-section=.relaFOO").
> The option `--remove-setions='.rela__'` wasn't supported before
> binutils/objcopy 2.32, so all of '.rela__' RELA sections were kept.
> And '.rela.dyn' section was kept due to the mismatch between the
> stripped 'dyn' section_pattern and the actual '.dynamic' section name.
>
> Should we kill the '.rela.dyn' section from the vmlinux ?
> IMO, some senses (like, kexec/kdump) will load/run vmlinux directly that
> needs this allocatable section.
> And from my kexec/kdump test with vmlinux, the 2nd kernel could start
> with '.rela.dyn' but failed if no '.rela.dyn'.
>
> How about keeping '.rela.dyn' section in vmlinux and
> making `remove-section` consistent with different version GNU-objcopy ?
>
>
> 2. the stripped vmlinux has huge symtab
>
> I found a similar issue[2] about the huge symtab of kernel modules.
>
> The aggressive link-time relaxations of RISC-V need sufficient
> relocation info and local symbols to rewrite the code at link time.
> That would result in a lot of extra symbols and relocations.
>
> Kernel modules are compiled `-mno-relax`. But the toolchain still needed
> to improve to emit fewer things under `-mno-relax`. Util that, stripping
> ko with `--discard-all` or `--discard-locals` would be an option to
> reduce the symtab size. (the Ubuntu fixing patch [3])
>
> While vmlinux now uses `emit-relocs` option that would aggravate the
> symtab size.
> (It would take a long long time to start when using the current vmlinux
> as the Crash's namelist. Crash is busy in symtab_init() function.)
>
> So how about objcopying vmlinux with `--discard-locals` option to
> reduce the symtab size ?
>
> (And how about adopting the Ubuntu patch into riscv kernel tree? )
>
>
> 3. suspicious relocations in vmlinux
>
> The vmlinux has some suspicious R_RISCV_NONE/R_RISCV_64 relocations
> emitted with the `emit-relocs` option, that would be detected by
> `tools/reloc_check.sh` and flush the console when making vmlinux.
>
> riscv64-linux-gnu-objdump -R ./00_rv_newtool/vmlinux | grep -E '\<R_' | awk '{print $2}' | sort | uniq -c
>       6 R_RISCV_64
>   20201 R_RISCV_NONE

Having R_RISCV_NONE in any binary is a bug, it's not a real relocation 
just an internal binutils thing.  There's another bug on sourceware 
about it, we're not quite sure what the right answer is yet:

https://sourceware.org/bugzilla/show_bug.cgi?id=30844

>   71307 R_RISCV_RELATIVE
>
> Is there a way/tool to get rid of these relocations from vmlinux,
> or temporarily silence the echo of those bad relocations?
>
>
> [1]: https://lore.kernel.org/all/20230329045329.64565-1-alexghiti@rivosinc.com/
> [2]: https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1036
> [3]: https://patchwork.ozlabs.org/project/ubuntu-kernel/patch/20220309161622.124754-1-dimitri.ledkov@canonical.com/#2855027
>
> Finally, you can try this temporary git-diff for issue1 and issue2:
>
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index a46fc578b30b..3324c3ede9c6 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink
> @@ -20,10 +20,10 @@ quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
>  cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
>
>  quiet_cmd_relocs_strip = STRIPREL $@
> -cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
> -                                --remove-section='.rel__*'      \
> -                                --remove-section='.rela.*'      \
> -                                --remove-section='.rela__*' $@
> +cmd_relocs_strip = 							\
> +	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_strip.sh	\
> +				  "$(OBJCOPY)" "$(CONFIG_LD_VERSION)" "$@"
> +
>  endif
>
>  # `@true` prevents complaint when there is nothing to be done
> diff --git a/arch/riscv/tools/relocs_strip.sh b/arch/riscv/tools/relocs_strip.sh
> new file mode 100755
> index 000000000000..20cb69cf041b
> --- /dev/null
> +++ b/arch/riscv/tools/relocs_strip.sh
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# This script strips and the relocations and the
> +# compiler-generated local symbols of a vmlinux.
> +
> +if [ $# -lt 3 ]; then
> +        echo "$0 [path to objcopy] [version of GNU objcopy] [path to vmlinux]" 1>&2
> +        exit 1
> +fi
> +
> +objcopy="$1"
> +objcopy_version="$2"
> +vmlinux="$3"
> +
> +# binutils/objcopy didn't support '--remove-setions='.rela__'' option util 2.32,
> +# use `--remove-relocations` to remove those RELA sections.
> +
> +if [ 0 -lt $objcopy_version -a 23200 -gt $objcopy_version ]; then
> +
> +	$objcopy --remove-section='.rel.*'	\
> +		 --remove-section='.rela.*'	\
> +		 --remove-relocations='__*' $vmlinux
> +else
> +	$objcopy --keep-section='.rela.dyn'	\
> +		 --remove-section='.rel.*'	\
> +		 --remove-section='.rel__*'	\
> +		 --remove-section='.rela.*'	\
> +		 --remove-section='.rela__*' $vmlinux
> +fi
> +
> +# discard the compiler-generated local symbols of vmlinux
> +
> +$objcopy --discard-locals $vmlinux

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
