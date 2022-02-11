Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4395FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 00:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/32E1+4xbdTrVCOTw1qtQSLjbtQH/7MdH7foubjNkD8=; b=kEPoK/ymTHwe/r
	izMpIAfCIjkjUo7vHudk3j2tGMNwqFvjMplMa7Hp7xZqmf1AdbLioJxsXtmcCIpfUk6IDh8rgU07D
	yZUqttdAIEnJBB2at+hvZr1T8ydx5Ed9mMUv/ur+Y+rr1R4hjbJmp+bDXusZSca3Gnv9amLwFi+oe
	Zm/d7aHveFTAgHpfxyWzpYyRErm/PYeF7kR1I/Nl0uzSzH8UbOdzMLTtOiHqjttG4ai+BB3XnAN3W
	1SI8wXLIO+JdCKrE73jZ1Cytbx8IpWlkw6cED3krV9H4I0qI4GCgrmyKbp7ueD70j64pIVnveBHSU
	d0e0CBqoypNFsh3JNRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIJlM-005JFW-UQ; Fri, 11 Feb 2022 00:26:12 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIJlK-005JEw-5j
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 00:26:11 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id c6so20348238ybk.3
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 16:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=83N6vWrDkZWain3/17uq/dXBQLDHd+VSAFLGYlPzOiw=;
 b=ImzKyXL9JdkGxreq3TljkBiZd1/U2yOKqNjkNfES3hHIqCkqc0E0m7Oc1VYnpT7xre
 T1ktfUfsg9ZAC6caxpY83Ize6AJQM2iG+kiFsOG7ZDmqX+9xTYM5FrZ0/HrQzj73phmk
 rrpWGoclZftkmpWT+Ivndn2D/r3rIUPv5ByNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=83N6vWrDkZWain3/17uq/dXBQLDHd+VSAFLGYlPzOiw=;
 b=h5CZ8UOGIMd3zIhalS/6scGJiGbPS8+7gUSp34Cge3qwb4/e4kJf1tFo/sYvyUJY30
 /GJWrgWveu9NzjXJhC+KZ0LfuyJwVf3KHxhus+Spw0ztONukEGnQi9MwrHgYwHEWHSS1
 oaWfkeRcD+aj/GHNysg8bAHs//l9nqq6L6dCrE3ciwjr5UfKDvZTt7AosGzQMRHhcONz
 rJ4MvZ7NzIONA4/jmg3LjsDYyTmfNctv1GTGtzpVsiv98bmr8n8/nTKOwNB+wBJGso5a
 GC0qi8Gj+t6GWw9NIxrHF5sjdN4BEXae3079q4f0CHUSnGFO9iH0bt8GFP0IrZ4y7gdG
 qo4w==
X-Gm-Message-State: AOAM532zDm28XcaTlYXHXfSOwLFCsaybD8JoXHe+t4QiSavbObRJ1+2P
 xHJ3NWXZuEUJ8ZbJGrfjDHw3K66kHxdsopPHfa4R
X-Google-Smtp-Source: ABdhPJy4a/432gjLvmZVWdj5crHbM/KsVz7OqHnLg1XVpmyOGMdekEAT80M2FEW71WD3+vYj/xMBF2lWxTdBiWgGtNQ=
X-Received: by 2002:a25:c344:: with SMTP id t65mr9155165ybf.10.1644539168913; 
 Thu, 10 Feb 2022 16:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20220209123800.269774-1-heiko@sntech.de>
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 10 Feb 2022 16:25:58 -0800
Message-ID: <CAOnJCUL5w4+_zJvu-BxP+LGN2ohv6arY+uh0DOU586v_5mCE8g@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] riscv: support for Svpbmt and D1 memory types
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_162610_242374_75761E0D 
X-CRM114-Status: GOOD (  37.56  )
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

On Wed, Feb 9, 2022 at 4:38 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
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
> The dt-binding for svpbmt itself is of course not finished and is still
> using the binding introduced in previous versions, as where to put
> a svpbmt-property in the devicetree is still under dicussion.
> Atish seems to be working on a framework for extensions [0],
>

Here is the patch series
https://lore.kernel.org/lkml/20220210214018.55739-1-atishp@rivosinc.com/

I think we can simplify the cpu feature probing in PATCH 10 with the
above series
which simply relies on the existing riscv_isa bitmap.

We also don't need the separate svpbmt property in DT mmu node.
Let me know what you think.

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
> The sbi cache-flush patch is based on Atish's sparse-hartid patch [1],
> as it touches a similar area in mm/cacheflush.c
>
>
> I picked the recipient list from the previous version, hopefully
> I didn't forget anybody.
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
> [0] https://lore.kernel.org/r/20211224211632.1698523-1-atishp@rivosinc.com
> [1] https://lore.kernel.org/r/20220120090918.2646626-1-atishp@rivosinc.com
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
>   riscv: move boot alternatives to a slightly earlier position
>   riscv: Fix accessing pfn bits in PTEs for non-32bit variants
>   riscv: add cpufeature handling via alternatives
>   riscv: remove FIXMAP_PAGE_IO and fall back to its default value
>   riscv: add memory-type errata for T-Head
>
> Wei Fu (2):
>   dt-bindings: riscv: add MMU Standard Extensions support for Svpbmt
>   riscv: add RISC-V Svpbmt extension support
>
>  .../devicetree/bindings/riscv/cpus.yaml       |  10 ++
>  arch/riscv/Kconfig.erratas                    |  29 ++--
>  arch/riscv/Kconfig.socs                       |   1 -
>  arch/riscv/Makefile                           |   2 +-
>  arch/riscv/errata/Makefile                    |   2 +-
>  arch/riscv/errata/sifive/errata.c             |  10 +-
>  arch/riscv/errata/thead/Makefile              |   1 +
>  arch/riscv/errata/thead/errata.c              |  85 +++++++++++
>  arch/riscv/include/asm/alternative-macros.h   | 114 ++++++++-------
>  arch/riscv/include/asm/alternative.h          |  16 ++-
>  arch/riscv/include/asm/errata_list.h          |  52 +++++++
>  arch/riscv/include/asm/fixmap.h               |   2 -
>  arch/riscv/include/asm/pgtable-32.h           |  17 +++
>  arch/riscv/include/asm/pgtable-64.h           |  79 +++++++++-
>  arch/riscv/include/asm/pgtable-bits.h         |  10 --
>  arch/riscv/include/asm/pgtable.h              |  53 +++++--
>  arch/riscv/include/asm/vendorid_list.h        |   1 +
>  arch/riscv/kernel/Makefile                    |   1 +
>  arch/riscv/{errata => kernel}/alternative.c   |  48 ++++++-
>  arch/riscv/kernel/cpufeature.c                | 136 +++++++++++++++++-
>  arch/riscv/kernel/head.S                      |   2 +
>  arch/riscv/kernel/module.c                    |  29 ++++
>  arch/riscv/kernel/sbi.c                       |  10 +-
>  arch/riscv/kernel/smpboot.c                   |   4 -
>  arch/riscv/kernel/traps.c                     |   2 +-
>  arch/riscv/mm/init.c                          |   1 +
>  26 files changed, 606 insertions(+), 111 deletions(-)
>  create mode 100644 arch/riscv/errata/thead/Makefile
>  create mode 100644 arch/riscv/errata/thead/errata.c
>  rename arch/riscv/{errata => kernel}/alternative.c (59%)
>
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
