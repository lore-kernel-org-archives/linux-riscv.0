Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E451DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bjyTx5JL6IhXYMP5KF3kwQsDds5zcVZvTOhguh4kBvM=; b=b+1Ht3EWT49OZDeJXLshAFRV7w
	jU5D9+zqkDf+P5LSmEgxkxlzXjOeiyrLLE66YVuCTLqRcZO3hG5q/ThROwZjSkuuomMvvHg//euV/
	8pQDMMt3+rPr+HoBJ63PphHmaI57UkxJxrQmYsOwWunVvHkpawbC8sdL+nZJjLbuyiGcQ1A+p3sjh
	d+SFLmcU7BzmaxOFFT4WHo5CaMNOyOJjd4OCkUwAXvlWNgeNDLWgHelsz/3f8/Nz37imZwTtxqmgM
	YZZ02PNuDaYW7+RGueFbCgG2H9GcPJQYDGhPGNkRcfNHsMnFNCPkWvc6+w3je5jvsAGeewHkm/2IQ
	d/B7Kdag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZkU3-000IJ2-28; Thu, 31 Mar 2022 02:24:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZkTz-000IIb-TY
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 02:24:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e5so22157132pls.4
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 19:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bLMvLJJFTTmnxhwMXncQg6uKBGHqt+TMaS5Swg1qtTY=;
 b=P0+PdTbCgdxzx5Ecu2iu5B5MNFg4Phl10mw16mT5wgQWLcSo4zDF1Cu/rWPTDKKAjv
 N+OhVapRPmlRHWQmREvIsdcJIZeoMhLQFU1i3yxH9AQtuOEF5LruCaeqn6Gskp23lRrN
 H9TAtZ39yEPTO7uJgeljhiqUXjAi3AONTyW/LtA7axkfhwJ1MkI/ByXzvcoI7UYdd0bm
 OtQi8LqzzcTqwIe1sl6xoAig/BFaIL00GhWJN41hede0BiMUKo4zbJgpoTUsryjgQqE1
 MkHhaumSRG8aaKxyB78l9NF7roqHtDi+6Y13hLqH4l6Aqiw0NPZoU1kUSvTFrAtEeFW4
 sNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bLMvLJJFTTmnxhwMXncQg6uKBGHqt+TMaS5Swg1qtTY=;
 b=oAUgUvsp4BCa8b1HV9QI7yx1h7jxPQxTQy+ZS/1LerFrHl4nMVOTeAteP2X245uGDD
 ICyL2wIdzd78HVW6u6FxLl6H5z/r4AUxi72cHYz+GsHawM3aVnRMv8k7IvBZ5R4NIsE2
 Sd9KSaYIClgz7sQOpawOVC8DyItW5zQBtMJI7FyWMSYU9rZloMVDD06P6FnSc8qoF7kM
 tRUDwj/QkpD9ol0qSP4i8SpXw+bibmLr4U3TcjdRx4d/bzlfHeAxFMFfHxiJgdqavvC+
 thwOA78m8dSewKOzGTqnDknoN2LWLgRyMdkqn3FJuadCR1vkk0VKvZngwr0P6Q6cU0Oh
 KC5A==
X-Gm-Message-State: AOAM533ZnsEYk3sbhIjWqguab5Yo6Et57fYuNM7J+kVaDGYKSSLvyOKW
 6bPoWu7/wjseqShOvZdgWZzsyg==
X-Google-Smtp-Source: ABdhPJz23UgbrFTHE97IK6+XFdVb+eM237LbXxjvInI+00RE4uYvNl+kQxmBtWASHnOsUtz9BZ090w==
X-Received: by 2002:a17:903:2351:b0:154:5ab7:873d with SMTP id
 c17-20020a170903235100b001545ab7873dmr2952252plh.57.1648693458221; 
 Wed, 30 Mar 2022 19:24:18 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k18-20020a056a00135200b004fb18fc6c78sm21471532pfu.31.2022.03.30.19.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 19:24:16 -0700 (PDT)
Date: Wed, 30 Mar 2022 19:24:16 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 19:24:15 PDT (-0700)
Subject: Re: [PATCH v8 00/14] riscv: support for Svpbmt and D1 memory types
In-Reply-To: <20220324000710.575331-1-heiko@sntech.de>
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
Message-ID: <mhng-0ebca9a9-133b-44d0-92cb-ffd2ec192475@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_192420_053496_6178A696 
X-CRM114-Status: GOOD (  35.31  )
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

On Wed, 23 Mar 2022 17:06:56 PDT (-0700), heiko@sntech.de wrote:
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
> changes in v8:
> - rebase onto 5.17-final + isa extension series
>   We're halfway through the merge-window, so this series
>   should be merge after that
> - adapt to fix limiting alternatives to non-xip-kernels
> - add .norelax option for alternatives
> - fix unused cpu_apply_errata in thead errata
> - don't use static globals to store cpu-manufacturer data
>   as it makes machines hang if done too early

I'm still seeing a very similar failure mode.  There were a few merge 
conflicts when I tried to put this on top of my merged first PR, I've 
put what I'm testing at riscv-d1.  Not sure if I'm missing something.

>
> changes in v7:
> - fix typo in patch1 (Atish)
> - moved to Atish's isa-extension framework
> - and therefore move regular boot-alternatives directly behind fill_hwcaps
> - change T-Head errata Kconfig text (Atish)
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
> Heiko Stuebner (13):
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
>   riscv: don't use global static vars to store alternative data
>   riscv: add memory-type errata for T-Head
>
> Wei Fu (1):
>   riscv: add RISC-V Svpbmt extension support
>
>  arch/riscv/Kconfig.erratas                  |  31 +++--
>  arch/riscv/Kconfig.socs                     |   1 -
>  arch/riscv/Makefile                         |   2 +-
>  arch/riscv/errata/Makefile                  |   2 +-
>  arch/riscv/errata/alternative.c             |  75 ------------
>  arch/riscv/errata/sifive/errata.c           |  17 ++-
>  arch/riscv/errata/thead/Makefile            |   1 +
>  arch/riscv/errata/thead/errata.c            |  82 +++++++++++++
>  arch/riscv/include/asm/alternative-macros.h | 121 ++++++++++++++------
>  arch/riscv/include/asm/alternative.h        |  16 ++-
>  arch/riscv/include/asm/errata_list.h        |  52 +++++++++
>  arch/riscv/include/asm/fixmap.h             |   2 -
>  arch/riscv/include/asm/hwcap.h              |   1 +
>  arch/riscv/include/asm/pgtable-32.h         |  17 +++
>  arch/riscv/include/asm/pgtable-64.h         |  79 ++++++++++++-
>  arch/riscv/include/asm/pgtable-bits.h       |  10 --
>  arch/riscv/include/asm/pgtable.h            |  53 +++++++--
>  arch/riscv/include/asm/vendorid_list.h      |   1 +
>  arch/riscv/kernel/Makefile                  |   1 +
>  arch/riscv/kernel/alternative.c             | 104 +++++++++++++++++
>  arch/riscv/kernel/cpu.c                     |   1 +
>  arch/riscv/kernel/cpufeature.c              |  80 ++++++++++++-
>  arch/riscv/kernel/module.c                  |  29 +++++
>  arch/riscv/kernel/sbi.c                     |  10 +-
>  arch/riscv/kernel/setup.c                   |   2 +
>  arch/riscv/kernel/smpboot.c                 |   4 -
>  arch/riscv/kernel/traps.c                   |   2 +-
>  arch/riscv/mm/init.c                        |   1 +
>  28 files changed, 629 insertions(+), 168 deletions(-)
>  delete mode 100644 arch/riscv/errata/alternative.c
>  create mode 100644 arch/riscv/errata/thead/Makefile
>  create mode 100644 arch/riscv/errata/thead/errata.c
>  create mode 100644 arch/riscv/kernel/alternative.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
