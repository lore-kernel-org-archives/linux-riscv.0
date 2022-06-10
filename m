Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCF5C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SbC4SzlkSlMf0m1KaUbokcaco+a+5DmVllVS3MpLt0=; b=zss/+0W7ocAHMQ
	Y9RLZjOK7NVs9EKxa5JPnMKt5E2QcmSzlmsji1/A22aZ6mc8WaKzUkqXyWKgDYy4DmTS0F+gjE+o0
	owyE4jv8Ff7sZTdtDiyEuOlE5UbVo8+VAgcuBB0z0G06KbeJEh9rFzKp1M+Z/oBqamHy9aGSFmtSE
	H+iyBMnSooYKlbu6W1DfPeYqpo632H26mqfqs850ifK7z8z2p2jwoooCCp5LSEMzbHsYjjnGwK4sf
	+UbSm0WXCU2s4f0iYYcAma+U9XEFzaKAz76PTXvZif8wvmJvk7EKcl1uLErd2oVo98wvobaOvfYTh
	Nf1iyhjf4BXpcEdfrPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzchU-007rqz-GX; Fri, 10 Jun 2022 11:21:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzchI-007rlf-Pu; Fri, 10 Jun 2022 11:21:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A52061FF1;
	Fri, 10 Jun 2022 11:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D55C3411D;
	Fri, 10 Jun 2022 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654860059;
	bh=xP5iYMV7lF2tEmzcBQ+jmLwPazuiglMxmNPs6b0I0/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WpGddpvWv1wRH7zaLOcFreox7kAsZxznDXf1IJ775RtaTYZd85HBrIgC6GCJU7ySu
	 YN7fHFfU4id+21vDKbwcQbSHhKrvoS42v04G+2Zvn8i2c9QmdXKskN3Sq0s6Hs4vUY
	 kr0CBZgiQU0megrVUCVewzV9GQI/XNCeBP7QsrCS3LfHjX48SulJL+syyFH6zBNIUF
	 GLsC9CTF3VjfoK37lQgLWabmb2x5YoRdlVZbk2B9yyhtsdNuWcsjbFZm6KYaXqTTnw
	 46qMDgmHAXv0v7eYlxpw2b8yBWGEgrEOCInbmNSKBJsdmrBnqiwXOhKTgMLKR8/2l/
	 dqP2E2YzOyTFA==
Received: by mail-yb1-f172.google.com with SMTP id s48so184912ybi.0;
        Fri, 10 Jun 2022 04:20:59 -0700 (PDT)
X-Gm-Message-State: AOAM5308Ayzvd1mVNRrv8oV+0XeVJnUNU4AufUBsDmdLFva2sTgiyYPN
	4OjK7beRM9OvnE/Z4Q/Xegl60k4K7OPE2R0IFxg=
X-Google-Smtp-Source: ABdhPJwW7AgFca3wNHZohnSbkTgJQBw/fxL1AiQUUZkoXlebPze1b83w86K0iW12ZT4jzD5smdkaHxw4868lc9szGl4=
X-Received: by 2002:a05:6830:9c2:b0:606:1e0a:cc8d with SMTP id
 y2-20020a05683009c200b006061e0acc8dmr19092482ott.265.1654860048097; Fri, 10
 Jun 2022 04:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220607093805.1354256-1-mawupeng1@huawei.com> <20220607093805.1354256-7-mawupeng1@huawei.com>
In-Reply-To: <20220607093805.1354256-7-mawupeng1@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jun 2022 13:20:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGMHn_jsMe2WxWZ-s_QV==1tc5k=xpbNXuDbGp0qF534w@mail.gmail.com>
Message-ID: <CAMj1kXGMHn_jsMe2WxWZ-s_QV==1tc5k=xpbNXuDbGp0qF534w@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] efi: Disable mirror feature if kernelcore is not specified
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <keescook@chromium.org>, songmuchun@bytedance.com, 
	Randy Dunlap <rdunlap@infradead.org>, damien.lemoal@opensource.wdc.com, 
	Stephen Boyd <swboyd@chromium.org>, wei.liu@kernel.org, robin.murphy@arm.com, 
	david@redhat.com, anshuman.khandual@arm.com, thunder.leizhen@huawei.com, 
	wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, chenzhou10@huawei.com, vijayb@linux.microsoft.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_042100_950371_8AC553E2 
X-CRM114-Status: GOOD (  29.55  )
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

On Tue, 7 Jun 2022 at 11:16, Wupeng Ma <mawupeng1@huawei.com> wrote:
>
> From: Ma Wupeng <mawupeng1@huawei.com>
>
> If system have some mirrored memory and mirrored feature is not specified
> in boot parameter, the basic mirrored feature will be enabled and this will
> lead to the following situations:
>
> - memblock memory allocation prefers mirrored region. This may have some
>   unexpected influence on numa affinity.
>
> - contiguous memory will be split into several parts if parts of them
>   is mirrored memory via memblock_mark_mirror().
>
> To fix this, variable mirrored_kernelcore will be checked before calling
> efi_find_mirror() which will enable basic mirrored feature and this
> variable is true if kernelcore=mirror is added in the kernel parameters.
>
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>

This seems like the wrong place to do this. If mirrored memory is
irrelevant to memblock, it should ignore the attribute. So I think
this check belongs in mm/memblock.c instead.


> ---
>  drivers/firmware/efi/efi.c | 3 +++
>  include/linux/mm.h         | 2 ++
>  mm/page_alloc.c            | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 79c232e07de7..8a5edcb0dd82 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -454,6 +454,9 @@ void __init efi_find_mirror(void)
>         if (!efi_enabled(EFI_MEMMAP))
>                 return;
>
> +       if (!mirrored_kernelcore)
> +               return;
> +
>         for_each_efi_memory_desc(md) {
>                 unsigned long long start = md->phys_addr;
>                 unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bc8f326be0ce..741ac7d022c3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2540,6 +2540,8 @@ extern void get_pfn_range_for_nid(unsigned int nid,
>                         unsigned long *start_pfn, unsigned long *end_pfn);
>  extern unsigned long find_min_pfn_with_active_regions(void);
>
> +extern bool mirrored_kernelcore;
> +
>  #ifndef CONFIG_NUMA
>  static inline int early_pfn_to_nid(unsigned long pfn)
>  {
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e008a3df0485..cf6f70aba787 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
>  static unsigned long required_movablecore __initdata;
>  static unsigned long required_movablecore_percent __initdata;
>  static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
> -static bool mirrored_kernelcore __meminitdata;
> +bool mirrored_kernelcore __meminitdata;
>
>  /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
>  int movable_zone;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
