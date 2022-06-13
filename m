Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A546BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjhlDPOlb3lknhs9luSR9hNBETChbf11krD9JUi+j/A=; b=BkTmFq2z/J0Cch
	vM1a6Fn3BUSbDR2qLebxDy+Z0IzKBWQHfCGmB/TdM6GiBYAIj/aRxo84SGM2mRuOOtsb5xTeptEee
	OvDpGhbgQtZfbvzvDdOn9JB5wNSg1T/6LikdF6BbeuFqHyPK6YEsX9/qXH4dZsUkhh81slSCLxLY9
	oLo+wI8L/wuuLxTOxbAXHqlhwrGDrSj98rUPXjMQmzlGoME9VYFwQ2kuXOzDgqkvR6R8kdRIQuQVJ
	kH3WptipbW8Rs5X2MfTlTm02Hwixd3eD+uage3kYsAK4CL1P/5YN/erwaLflQ51HsS6sqmAIPpgGV
	f8p+8mjfQT9gzMY5EXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gbT-002bWx-8k; Mon, 13 Jun 2022 09:43:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gbF-002bRR-Jd; Mon, 13 Jun 2022 09:43:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DC4F61388;
	Mon, 13 Jun 2022 09:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C30C3411E;
	Mon, 13 Jun 2022 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655113388;
	bh=ulBYdazc2wFX860EwjmZxCF5MO+a9+ET23gEIOuI9uU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tsoF5PUgEdm+pCcqk1wEO/j63pF1rIMskWsdXvKiw9oelaPCL63JkGSUZBVCW+Up8
	 OdU4GgnikAs86gCW772iq2GdT/k7Lw+tK0SF9qk5BpHuIEaEFUzwMfJZkEeMuabWWC
	 23ktv6pcWgBceNYn0HIZowp9HjxC3oKlMAX9/XsQ1JxxQXpaOZ4Yxdc/d8yBv+Flew
	 vBwy+eYVEmw4iXocJ6jhRQd+xEfLUKwyl2ToUDONmUKCOX4odS9gvX9y1u0vN7Lr9F
	 F28Txo+thuVrxRbkDkQXaIUYDC+KI6tPhQhBsX1pIERKoIU28SNqeSzj+8kzUA1+32
	 kWU82zQ+k1m+w==
Received: by mail-yb1-f170.google.com with SMTP id t1so8967410ybd.2;
        Mon, 13 Jun 2022 02:43:08 -0700 (PDT)
X-Gm-Message-State: AOAM530GhP1WIsC1p4cdwsMgPaOEWRvd2ufjYHhFCWt+uvrJjzzHuvjn
	vzoITZQmRFjDSHH+Wj90njxqDW5jOuD11wlc6yo=
X-Google-Smtp-Source: ABdhPJzmP9blBBv2mg91KpFnNjYRBYxTtwemJ3QI215u5foHBkyL5k8czGe5M8VE60LXBByru/7LVHtt6lQCMWUK07g=
X-Received: by 2002:a05:6820:1501:b0:41b:d535:325c with SMTP id
 ay1-20020a056820150100b0041bd535325cmr5522819oob.60.1655113376804; Mon, 13
 Jun 2022 02:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220613082147.183145-1-mawupeng1@huawei.com> <20220613082147.183145-6-mawupeng1@huawei.com>
In-Reply-To: <20220613082147.183145-6-mawupeng1@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Jun 2022 11:42:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFn_FKt2jLJOntvT0FBtL9b=VWZdrBFpn48LBMDLy1WBQ@mail.gmail.com>
Message-ID: <CAMj1kXFn_FKt2jLJOntvT0FBtL9b=VWZdrBFpn48LBMDLy1WBQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] mm: Only remove nomap flag for initrd
To: Wupeng Ma <mawupeng1@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, paulmck@kernel.org, keescook@chromium.org, 
	songmuchun@bytedance.com, rdunlap@infradead.org, 
	damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org, 
	robin.murphy@arm.com, david@redhat.com, anshuman.khandual@arm.com, 
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com, gpiccoli@igalia.com, 
	chenhuacai@kernel.org, geert@linux-m68k.org, vijayb@linux.microsoft.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_024309_749896_D7E23366 
X-CRM114-Status: GOOD (  22.90  )
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

On Mon, 13 Jun 2022 at 10:00, Wupeng Ma <mawupeng1@huawei.com> wrote:
>
> From: Ma Wupeng <mawupeng1@huawei.com>
>
> Commit 177e15f0c144 ("arm64: add the initrd region to the linear mapping explicitly")
> remove all the flags of the memory used by initrd. This is fine since
> MEMBLOCK_MIRROR is not used in arm64.
>
> However with mirrored feature introduced to arm64, this will clear the mirrored
> flag used by initrd, which will lead to error log printed by
> find_zone_movable_pfns_for_nodes() if the lower 4G range has some non-mirrored
> memory.
>
> To solve this problem, only MEMBLOCK_NOMAP flag will be removed via
> memblock_clear_nomap().
>
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

This needs and ack from the arm64 maintainers, please?
And also please fix the subject to include 'arm64'


> ---
>  arch/arm64/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 339ee84e5a61..8456dbae9441 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -350,8 +350,8 @@ void __init arm64_memblock_init(void)
>                         "initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
>                         phys_initrd_size = 0;
>                 } else {
> -                       memblock_remove(base, size); /* clear MEMBLOCK_ flags */
>                         memblock_add(base, size);
> +                       memblock_clear_nomap(base, size);
>                         memblock_reserve(base, size);
>                 }
>         }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
