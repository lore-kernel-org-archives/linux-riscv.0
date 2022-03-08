Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39006C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 00:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xp2FxT95gicYGHklVOOoivFHxwXlsuMF1C2+4LjsZpk=; b=a+tbnYrPgmZOpYL0sJHkP7YTRA
	4bhuQyesq6da3KYjcDPRckLdn6TLr+73G+xzv31H5A4JpX6wYTWa6eFmX8hNS9nVM0llMtcYzFakH
	L6CNUeHmS8dcPBNbDt72jzg5p6cNDM1EL4m7CjcoXrl85zRD9V0otvHMexeP/LI3wFzuqTH7i4P9q
	qv1sxGUaxynfRTZ688vQ497IvhuWvRpte9oZf1qII62xtME16QNVXbdZSeRXoJ7VkwnbU36Tt2cQc
	GPH2t7RD8BcGhzg7uYGYPbnRDXuCdGiAeus16GUW6/rvYRTsOgXhGfpmjsb+laM6WXoHsqYN6bHqn
	zaYvK5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRO0j-002D2x-7U; Tue, 08 Mar 2022 00:47:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRO0c-002Cze-C1
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 00:47:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id t5so15926669pfg.4
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 16:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Z3vRo10Wl+7jtROQ3NcA2/Sz6dcGf3qK3XrF5dhiTp8=;
 b=Fk5e2IOgLbFQibmbcrQzBi3ZvXg2L+NFmP0X9uMd2tV3cqc33VFQOdUl6HPs7/zjTa
 f3TQdU6FBt9txnkiRlDQYjFgIoob0IwPWj/yrwHehgHYXSnKOEDNnqzYw+X4jm9rKadH
 jntJPxS+XBdlmURV3EW+SKgpEHjSgo3TA7X3r3LXJJiXUO7QEAvBt+YTBxMLnmPWGbpB
 51RUPWFWuDQxDhRgwi9vxWzZO6mR75P4uWGUamUXxJQKGZ98EcxSsJ+51R2JNRPSQ5rn
 Hveav6mNiYYWEOIqQqmHrE0T+kCO+IerKBs8uRnac1kmh/2XDksXr0gV5PQQ5739MXBg
 NfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Z3vRo10Wl+7jtROQ3NcA2/Sz6dcGf3qK3XrF5dhiTp8=;
 b=J1IOI2DW8J6UvvlEQtfe9FRr0fvH20v9IYg191PKF7K8HqAsBH4XAg5M3dWyBtvmEU
 l3DzrQMpcIQiePWBc6TcalXLi4ioCXGz0QX53BAtPnzMZ4i0iQFU/LkHVztqMvVzRiGX
 OO7PQ7EV4awgOWt8PBhLzul10iMD40XvyRxYfcHeG+5kRQTp14jKkMKauKWIBB3nHTYx
 iGXwyTUEw/iadokj+Dxv+wk3jbwmnms3fwKlhfw1OmJvKLfvwZm+CN7ogklJefGBuPza
 9YwMc8kTz+bdR693GyYHgOdJNIgzsN62KNng1bEnH2T2GMOcNgILPZBdPtHr6L9/apJR
 o9mA==
X-Gm-Message-State: AOAM533nU169vj/bQDmtT1zagvisBh7Q6QrzpzO0ZwTy2D8dFeuWn4SF
 KJ1gxGFcSgdkatdxS3Cb5ZoPvQ==
X-Google-Smtp-Source: ABdhPJzszLD2yh8rubnAl7Yhc3hCEakyc528uDFLXyLuuCacFlly/z/Ep3la37EzfRgTGgakY1lW4A==
X-Received: by 2002:a63:6ac1:0:b0:37c:9116:ae5a with SMTP id
 f184-20020a636ac1000000b0037c9116ae5amr12098557pgc.249.1646700445593; 
 Mon, 07 Mar 2022 16:47:25 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056a00228900b004f3ba7d177csm16821180pfe.54.2022.03.07.16.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 16:47:25 -0800 (PST)
Date: Mon, 07 Mar 2022 16:47:25 -0800 (PST)
X-Google-Original-Date: Mon, 07 Mar 2022 16:46:33 PST (-0800)
Subject: Re: [PATCH v7 00/13] riscv: support for Svpbmt and D1 memory types
In-Reply-To: <20220307205310.1905628-1-heiko@sntech.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, 
 guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org,
 drew@beagleboard.org, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>, wens@csie.org,
 maxime@cerno.tech, 
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, 
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-4052f547-4a01-44ca-9286-97cc57819fbc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_164726_439487_54A38D10 
X-CRM114-Status: GOOD (  42.05  )
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

On Mon, 07 Mar 2022 12:52:57 PST (-0800), heiko@sntech.de wrote:
> Svpbmt is an extension defining "Supervisor-mode: page-based memory types"
> for things like non-cacheable pages or I/O memory pages.
>
>
> So this is my 2nd try at implementing Svpbmt (and the diverging D1 memory
> types) using the alternatives framework.
>
> This includes a number of changes to the alternatives mechanism itself.
> The biggest one being the move to a more central location, as I expect
> in the future, nearly every chip needing some sort of patching, be it
> either for erratas or for optional features (svpbmt or others).
>
> Detection of the svpbmt functionality is done via Atish's isa extension
> handling series [0] and thus does not need any dt-parsing of its own
> anymore.
>
> The series also introduces support for the memory types of the D1
> which are implemented differently to svpbmt. But when patching anyway
> it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
> location.
>
> The only slightly bigger difference is that the "normal" type is not 0
> as with svpbmt, so kernel patches for this PMA type need to be applied
> even before the MMU is brought up, so the series introduces a separate
> stage for that.
>
>
> In theory this series is 3 parts:
> - sbi cache-flush / null-ptr

That first patch looks like an acceptable candidate for fixes.  If 
there's a regression that manifests I'm happy to take it, but if it's 
only possible to manifest a crash with the new stuff then I'm OK just 
holding off until the merge window.

> - alternatives improvements
> - svpbmt+d1
>
> So expecially patches from the first 2 areas could be applied when
> deemed ready, I just thought to keep it together to show-case where
> the end-goal is and not requiring jumping between different series.
>
>
> I picked the recipient list from the previous versions, hopefully
> I didn't forget anybody.
>
> changes in v7:
> - fix typo in patch1 (Atish)
> - moved to Atish's isa-extension framework
> - and therefore move regular boot-alternatives directly behind fill_hwcaps
> - change T-Head errata Kconfig text (Atish)

I was just poking around v6, so I have some minor comments there.  None 
of those need to block merging this, but I am getting a bunch of build 
failures under allmodconfig

    $ make.riscv allmodconfig
    #
    # configuration written to .config
    #
    $ make.riscv mm/kasan/init.o
      SYNC    include/config/auto.conf.cmd
      CALL    scripts/atomic/check-atomics.sh
      CC      arch/riscv/kernel/asm-offsets.s
      CALL    scripts/checksyscalls.sh
      CC      mm/kasan/init.o
    ./arch/riscv/include/asm/pgtable.h: Assembler messages:
    ./arch/riscv/include/asm/pgtable.h:323: Error: attempt to move .org backwards
    make[2]: *** [scripts/Makefile.build:288: mm/kasan/init.o] Error 1
    make[1]: *** [scripts/Makefile.build:550: mm/kasan] Error 2
    make: *** [Makefile:1831: mm] Error 2

Unfortunately my build box just blew up so I haven't had time to confim 
this still exists on v7, but nothing's jumping out as a fix.  I've put 
this on the riscv-d1 branch at kernel.org/palmer/linux, not sure exactly 
what's going on but I'm guessing one of the macros has gone off the 
rails.  I'm going to look at something else (as this one at least 
depends on Atish's patches), but LMK if you've got the time to look into 
this or if I should.

Thanks!

>
> changes in v6:
> - rebase onto 5.17-rc1
> - handle sbi null-ptr differently
> - improve commit messages
> - use riscv,mmu as property name
>
> changes in v5:
> - move to use alternatives for runtime-patching
> - add D1 variant
>
>
> [0] https://lore.kernel.org/r/20220222204811.2281949-2-atishp@rivosinc.com
>
>
> Heiko Stuebner (12):
>   riscv: prevent null-pointer dereference with sbi_remote_fence_i
>   riscv: integrate alternatives better into the main architecture
>   riscv: allow different stages with alternatives
>   riscv: implement module alternatives
>   riscv: implement ALTERNATIVE_2 macro
>   riscv: extend concatenated alternatives-lines to the same length
>   riscv: prevent compressed instructions in alternatives
>   riscv: move boot alternatives to after fill_hwcap
>   riscv: Fix accessing pfn bits in PTEs for non-32bit variants
>   riscv: add cpufeature handling via alternatives
>   riscv: remove FIXMAP_PAGE_IO and fall back to its default value
>   riscv: add memory-type errata for T-Head
>
> Wei Fu (1):
>   riscv: add RISC-V Svpbmt extension support
>
>  arch/riscv/Kconfig.erratas                  |  29 +++--
>  arch/riscv/Kconfig.socs                     |   1 -
>  arch/riscv/Makefile                         |   2 +-
>  arch/riscv/errata/Makefile                  |   2 +-
>  arch/riscv/errata/sifive/errata.c           |  17 ++-
>  arch/riscv/errata/thead/Makefile            |   1 +
>  arch/riscv/errata/thead/errata.c            |  85 +++++++++++++++
>  arch/riscv/include/asm/alternative-macros.h | 114 +++++++++++---------
>  arch/riscv/include/asm/alternative.h        |  16 ++-
>  arch/riscv/include/asm/errata_list.h        |  52 +++++++++
>  arch/riscv/include/asm/fixmap.h             |   2 -
>  arch/riscv/include/asm/hwcap.h              |   1 +
>  arch/riscv/include/asm/pgtable-32.h         |  17 +++
>  arch/riscv/include/asm/pgtable-64.h         |  79 +++++++++++++-
>  arch/riscv/include/asm/pgtable-bits.h       |  10 --
>  arch/riscv/include/asm/pgtable.h            |  53 +++++++--
>  arch/riscv/include/asm/vendorid_list.h      |   1 +
>  arch/riscv/kernel/Makefile                  |   1 +
>  arch/riscv/{errata => kernel}/alternative.c |  48 +++++++--
>  arch/riscv/kernel/cpu.c                     |   1 +
>  arch/riscv/kernel/cpufeature.c              |  80 +++++++++++++-
>  arch/riscv/kernel/module.c                  |  29 +++++
>  arch/riscv/kernel/sbi.c                     |  10 +-
>  arch/riscv/kernel/setup.c                   |   2 +
>  arch/riscv/kernel/smpboot.c                 |   4 -
>  arch/riscv/kernel/traps.c                   |   2 +-
>  arch/riscv/mm/init.c                        |   1 +
>  27 files changed, 546 insertions(+), 114 deletions(-)
>  create mode 100644 arch/riscv/errata/thead/Makefile
>  create mode 100644 arch/riscv/errata/thead/errata.c
>  rename arch/riscv/{errata => kernel}/alternative.c (59%)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
