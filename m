Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607F5C07E9B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E4C61029
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E4C61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScX94be6W7lsPqIpB7Z91Ew7GN2WuZaY5pD/5cDPvxo=; b=Q6SWfjAAbMTCMo
	M1bWdZGmexwFd4FjhhM3xOxOoH0PAjgqcvDLcIcaLwXVgXEARPWSgEi5DgGyJyr3vXa8iTDisq4vk
	kzKRe8u3qWNb8w92lJtrFZ4sXtUZq+ku/ZZu81/32HFCTq24/kIOS95k/UvTL5wColl5QTcnUsgKK
	2wi865XjXYgx0pThP7zcbdK3AqqL0YEHyYHjautwyGnxbm9zzULm6zYkFWfvE9W+SJRU7X0xAkO2c
	Z42D3luVCK43Am1dWQ8tv/Ha7ooJW3da7YHZs/FojBxaBinkfCvnpsKm439ydipyQYarhu+yYxtj/
	ijWb2uqnKpM37CbTSs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5afg-00BMFa-17; Mon, 19 Jul 2021 21:19:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5afc-00BMFA-Qu
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 21:19:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id f30so25974435lfv.10
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9qDrq4AbH3hwU6UfXhx8gnxQTtjJy9c/sgGGRSWzBFI=;
 b=pNrqSToWjHJ8anQvv3/get8e/OOw8HGOFgpg6OUshb2VmzjZ2e9u7m8wgO/fUfQf3D
 o80Ts1jiRG/ZdSUP0cWjsixD/4PrFBEvTD+Bzkck8/X4DuYjgtEhf7nhcFPKmcTyPqqY
 DBpoMOomWKRolAaBD2TyhtcO5HPRG5wAa1i6L1YSH7yZgxc47LJdezV6q8GRW7pYJ+Qn
 4OHT/EOTmtPR82l4S+vF4dxGrPqk6MIWylqfl60uWRd6XRAIysGFHIZR/Nl0TBkIH6x+
 /qaQ+dK5JdOhZutnroI60qQRWfyEtbOwZu1FMVYsc/EAD6k0zWPI2uTLPMH4Cj2L9JI9
 Yxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9qDrq4AbH3hwU6UfXhx8gnxQTtjJy9c/sgGGRSWzBFI=;
 b=qevvQVmnGmrUH3QaUXIyb/gmZiuyRSMAWDLNPewucNdcvR6gtZxivgRfU8QkQTvfTs
 fj/uiQr9qtgEHgjOl+VGAdcC40M0H57vGnKnv97XVTqIpnGPMf6DCLEk2pOyMON6rUWM
 cecvRdcd3Rct3zbPqXLzwv+zPMc5El6d/bQFWqGXj8w3iVee0n31jF8cxhchVI9Ecu+Y
 lO95TBOSsL0S76UpbLRSV94cdZc6XKjlr2JJWjTx+6ShyWhPa7CkC0hVPuMVUvrrSp71
 jxLXVenLH6J7mwwYxw+qsItYgdOie5PCWXML2e7QpRkzcHLi7Ih0JGAkL/Dx1dMKHFuB
 96Mg==
X-Gm-Message-State: AOAM532ZfmLhlEoB1QmBBkbhXK56vDy0t/XZFDmA/JoLxwxM4J4PNG+d
 3pqnGNdSOd7IdeVlUpMYG7gQmlWkw2h7SMu1ksEtBA==
X-Google-Smtp-Source: ABdhPJxugl0NY5GsQdKHLATn66sInk+DacJ6hC3N7Y7cbtULVh0D2+si8Xr5WdoT1b0R9jpF+XC2/LL4hYABmkU8sa4=
X-Received: by 2002:a19:4916:: with SMTP id w22mr20368641lfa.374.1626729563130; 
 Mon, 19 Jul 2021 14:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210719205314.1023455-1-twd2.me@gmail.com>
In-Reply-To: <20210719205314.1023455-1-twd2.me@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 19 Jul 2021 14:19:13 -0700
Message-ID: <CAKwvOdmanKSL3hLM4HjyeZg+K7pAWCHDuKeBfU4YSGzEyH_CaA@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: build: Disable LTO for the vDSO
To: Wende Tan <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com, 
 Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_141924_926982_A655E0D3 
X-CRM114-Status: GOOD (  15.64  )
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
>
> Disable LTO for the vDSO as done for x86 [1] and arm64 [2].  This also
> disables CFI for it [3].
>
> [1] https://patchwork.kernel.org/project/linux-kbuild/patch/20201009161338.657380-28-samitolvanen@google.com/
> [2] https://patchwork.kernel.org/project/kernel-hardening/patch/20201211184633.3213045-15-samitolvanen@google.com/
> [3] https://lore.kernel.org/bpf/CABCJKucpFHC-9rvT7uNF+E-Jh20fz69zdO49_4p8G_Sb634qmw@mail.gmail.com/

It might be nicer to use the typical form for commits:
commit <12 char sha> ("<oneline>")
rather than a mix of patchwork and lore links.

Do you have a list of diagnostics produced when building this object
file with LTO enabled?

>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 24d936c147cd..4535a77792be 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -30,7 +30,7 @@ obj-y += vdso.o vdso-syms.o
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> +CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_LTO)
>
>  # Disable profiling and instrumentation for VDSO code
>  GCOV_PROFILE := n
> --
> 2.25.1


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
