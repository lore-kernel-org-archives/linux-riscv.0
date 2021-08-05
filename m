Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D000CC4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9090E61151
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9090E61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaSpVWEmpAN1hAHUd9Gl+Npoj1tY2oLhAZgrdvwUcio=; b=rT8Bu9eB5k71iV
	L4glXLpC353o2qvzNnTlrlzAmLRdNr1P8g2aJNr2SwHy/BjtswfUVEzx62kA42cyr2diKZIJ5Xx1n
	o+fzJ7HHGbpngwANWmozvWyVKQCafa7bHAsXDHoHS4mayLZ9SCvzl3eSuvOwaggYSW8vuyLh4T2GB
	qKvFFnhN1z21JrKk58FQDi2LF8+iwlaBC8NvDGvC36Y1weZpXMdqnIIfPscCsHes5qoij2ty2mn4/
	RtdeVUG69wuF/wsVnfuTA3H4ZFfbJbseS/NL8iFcGkrScnSejGnRNJ7tnBKaNImXyxFt+h0o35pqw
	nPqDiYUPA613lRk+DqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBi0i-00AWfl-Ul; Thu, 05 Aug 2021 18:22:28 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBi0g-00AWet-8W
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 18:22:27 +0000
Received: by mail-lj1-x231.google.com with SMTP id u13so8306052lje.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LNpT8+EvILfJwMhJDbf0NVaUrZW6zw0xKERByrH5p/E=;
 b=Y2oK9TpDhBO7ojoFD7/ZGm1Vo4Q4+SveD8msknb3vaTKUGGyIi7lO02RrvoHgt+oFU
 eLoj0GPIulWoDqtcS/1D6J/RO07/jT5HY76dgvqoYHM7yxInkwOqPjJl/c+Evze2+mgN
 Yg/mZLJ9Tj1NX1d4prbdV1Yyb2fC0mJ4qyn6BsHr2GPVNJLmRIaH0ufv2gF/s21HQfF0
 x8DNVd0msrA6o/siIIKWBuWCUvrk8G32z6H6laIAVGXZLbI60vhZlhaVzK3C1Fuy4haa
 Vy0D0PaQ5ZcXJrhKOmbCJMW6vCV5E8I3Pog57qHQwxW8sQGHtqlbQiqVHwuRpOA3O5WN
 3lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LNpT8+EvILfJwMhJDbf0NVaUrZW6zw0xKERByrH5p/E=;
 b=IM/9JkyPfNHJBWrfeBReL08zGfQOSH2oP7rGtrHe4QJKccqwdLgcB8q/yUM5kmdUCm
 qH9hxWyfD/qoeNvKCmIce/gkgad2oiJGxQCofy59IAlsPQYXVjprrS+y4w3+x3G5mnqS
 2s0XqBmbmGuMEhTL3pzEVmIDuV74dtLAedL2RXvKFKpaYhgLhCfsszAIHJdAOGR/Qu9r
 w+diKB01PTHTxcWfXd+3IeXOxFn1eKRZyue4lhj/Fc4JnUaylt/YeHhP2bVw5dErh1Xm
 NnpnHpH/HxsNDjtZza3Ab6XwydFQplelEuZeGB2XQDcZN6Z1HlIVEhtPMZ0rLaefZTzq
 2vqA==
X-Gm-Message-State: AOAM533UaN8B/U29ICmfCHCmeCo5DlOhWXM3dG1Vwh9Xj2IKJGPGkBfl
 OydTM1+x/ylqfpSdFg6ce+/nP8/FrZ5NBaWi3Qc4tw==
X-Google-Smtp-Source: ABdhPJzG4CnCEu4/HQYiDExo1dwwbMB/7DskuDEQchiSBg4779eMZg08PYrCHI1U+FwCgq4FcQXBPxK8q6kT+eH7xOo=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr3939091ljq.341.1628187741325; 
 Thu, 05 Aug 2021 11:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210805150102.131008-1-masahiroy@kernel.org>
In-Reply-To: <20210805150102.131008-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Aug 2021 11:22:10 -0700
Message-ID: <CAKwvOdkoMnqoz_if9_W9x-WEq3Eu85t6P8sDSUXThypMeT6wiQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
 Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_112226_347703_2C7A2894 
X-CRM114-Status: GOOD (  22.15  )
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

On Thu, Aug 5, 2021 at 8:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
> and it should be used only for that purpose.
>
> LLVM_IAS is checked in some places to determine the assembler type,
> but it is not precise.
>
>  $ make CC=gcc LLVM_IAS=1
>
> ... will use the GNU assembler since LLVM_IAS=1 is effective only when
> $(CC) is clang.
>
> Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
> sense, but the build system can be more robust against such insane
> input.
>
> Commit ba64beb17493a ("kbuild: check the minimum assembler version in
> Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
> because Kconfig checks the version string from the assembler in use.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile            | 2 +-
>  arch/riscv/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4ab151060931..8b56c9692c3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -844,7 +844,7 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..dcfbd2a87d41 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -41,7 +41,7 @@ endif
>  ifeq ($(CONFIG_LD_IS_LLD),y)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>         KBUILD_CFLAGS += -Wa,-mno-relax
>         KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
