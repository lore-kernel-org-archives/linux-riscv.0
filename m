Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380DFC07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:25:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8FE2610C7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8FE2610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kH9rMNvAdq67686PgaIueOc4PxqEMcLT6s6ugd+8W0c=; b=omfGoLL/trfIgq
	HgVgZovYNAbTFcuC5pnzVYFPh37Q2jOUn7TTDY/j+OybETi8WF8xJqJRpLxiSUtOlMvVRIpG1lJL+
	VNYYkgh/yzACof1tfFq9Rw2Bu5vogE0jaeOCILw3TK1J6KIMQ39WxYj41+j8BLVsa7u2+XLJTGk6A
	Pu1qOpjKlBTzX3VKTQxVW/fzm5MnxEulFG5KC3IcGFoX5WKFuySfckAPx46/wOxCDB2sYBYTARFy9
	CJVS60m91PAO8jUAwRlzCi7arYfiepx4mtVk4qBC1KxQw8SUWpuuGeKeGlP7dI7ydHlVoO2/DtTOH
	bW0JL6y1kITRJMvoBE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5alU-00BMec-0V; Mon, 19 Jul 2021 21:25:28 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5alQ-00BMeJ-Hz
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 21:25:25 +0000
Received: by mail-lj1-x234.google.com with SMTP id r16so28307407ljk.9
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Et4dge6Y/jTpFBPK+Pgbi+bw6foeZdWyNd8Covlgvm4=;
 b=n7HxxrtVtIuoqmJfsK/cbRsNFnBf+8Y1wlDam9rXSdUOf3m/aWfGYGv0Zxvzw4/chV
 mWjfwG2MEz4/+Nx5VJrzam8Txzup+4JKtc5EDtBGpKE5Cs1CO1hDrP/IgFriWqrV7j4Y
 m4xK4aF7mucUsZ1CcLOAuiT9AmtqXmiGxeUlftCflNamp3K+dcJh+wWBTNfvJF+lIKkC
 Mys5d6gQXE8GBd5FZlsOgPdEkIj4J3yYnV0Mra/BBI7I1mtFcjgIjk25eav835AtdiYP
 6GIHJ1AfjMjX8jQhxbvjrXOpQbFyeb7jopDrTjRdKyar1A9VcWg5/zJ4uc+ry9t18ymn
 3V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Et4dge6Y/jTpFBPK+Pgbi+bw6foeZdWyNd8Covlgvm4=;
 b=KujyqYW+Pjioo+8DnaWXpc+4spUpkA03tMDOr8kOUVZikpNSX6no11lZCoWx8QNHFm
 nQsBJ0Izi4zU/0QN7gGkVQBNqlzX3vIGb+nke/qzeSdYl2epA5+7uu3wMmvvQ0+Wz8fd
 /0N9TjYJw1BmD2snbB/qmclxAwv/dDwGS+y1GalIjbH7VgMZXnsBnqjtwo5FwGmuyBbO
 r3qHpBVdn9ZE98O4kos+LEKZlDwSbcIdnIoLNGWjGu1P5hWLvjVvf7wPV8yef+Oxelp1
 +wzbAKfok4JUH5aeBU2qAwAniDkNhWLYkIR0K7sbkVC571L/TSDFRbBjaO0j8x6cm8jW
 wvxg==
X-Gm-Message-State: AOAM5302ae+pwclUVNNOH4OBMCnG8BNnDXPYOWJyy6aXIq+dBCq8gHp8
 RGBaJ2DuomNd+mawBKuxby82tySSNPm30lB4+/co6w==
X-Google-Smtp-Source: ABdhPJziKgakHRk0cFr0ND5WSy57ViwPMTHLUow6+E346er/KfYWGUsZt3BYHeKorztTtAboYB3rcsJsDs8VFPXwsjI=
X-Received: by 2002:a05:651c:329:: with SMTP id
 b9mr24396863ljp.116.1626729922093; 
 Mon, 19 Jul 2021 14:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210719205339.1023572-1-twd2.me@gmail.com>
In-Reply-To: <20210719205339.1023572-1-twd2.me@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 19 Jul 2021 14:25:11 -0700
Message-ID: <CAKwvOd=H-UN7dgHYgsvubv7t82UiPaOHCF09GAi6kTvjxpT4iA@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: build: Allow LTO to be selected
To: Wende Tan <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com, 
 Nathan Chancellor <nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_142524_656737_B793D9BB 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, Jul 19, 2021 at 1:53 PM Wende Tan <twd2.me@gmail.com> wrote:

Consider adding a little more detail to the commit message.

In our experience with other architectures, we've hit numerous
compiler and kernel issues especially with allyesconfigs. Has that
been your experience with riscv?  It would be good to know if you've
hit issues with LTO plus certain configs, so that we have confirmation
others have seen these issues and so that we can triage fixes.

>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..b593e5031c79 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,6 +34,8 @@ config RISCV
>         select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>         select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>         select ARCH_SUPPORTS_HUGETLBFS if MMU
> +       select ARCH_SUPPORTS_LTO_CLANG
> +       select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_USE_MEMTEST
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_FRAME_POINTERS
> --

-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
