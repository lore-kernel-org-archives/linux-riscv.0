Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7CC77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Nlu6tqDOq5AqImQqr+X4cbmIOK2GtbjEJ4RSf6mGyMs=; b=uJbTzgL56GiVDuqCvmtS60VWVY
	attpkjJzqBKEgkhKDq5mgIz+al+p6qoWk29pR7nXBYcDjsLcpgemddCnrwwEHsy+irmtCUT9q9KPa
	Y4ns9MJOa/dUd3pBy+fmObGQqcS1boQS2Qz67DUzbYfYph61HYXA8+BbqFlc0akKyW+N9iHmTqfzC
	9Q/MfBDJns40RWTYK490RLsHr4FBjZT7Czbq3zGGblvP4wzl3BjPLJU+rkZpG+fvII1TmgXlb1ZAg
	lpQNf9ra1uTBpkImLDrUcgOU+i57uRev+KaFuwsiU01NJRB6qduAEtoMCq4pw+38M6cVQl3c3cvgY
	7b4LY57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDVC-009zWE-1H;
	Thu, 11 May 2023 21:07:06 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDV8-009zUN-2K
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 21:07:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso4727448a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683839219; x=1686431219;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mHqF4/JjdpKe8ASv/vN6H3swZ5qcQIML9L8rM5BB7E=;
        b=n6HY2+Nq9GGr41ea6rQojwEB+tNaXMjIMiihRWXmLHyw4dD4SuaYeXaby0Y7aU2SoV
         LS45oeITrFECNFB8Uamv1SroyM0EsOgFTvUtIBjX5Y1ypIEPduw/muMyARgRs2Gz7SU1
         /iXH3GGXtWpTzHTW4zBlpSJZM+AVqYKmBhWI3+iV06EbKDc9iy6n8RWF3vOLdrayfuLV
         wl9LPwGZGWW5VdApmJgMMZKrpZBjSUUtNV/f/u3mJmikrASm4yCUEKUHbjliCqn5ONVi
         VSdl3F7dLvcdefCq7h7I058ZPxnxJfB38pO3CMvrD2lJO2zbIBKSesS3B1sK57EhSIRW
         uCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683839219; x=1686431219;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mHqF4/JjdpKe8ASv/vN6H3swZ5qcQIML9L8rM5BB7E=;
        b=ORvBAc4SwZCyZlC9g1crbG/EPzplI/hTfkzUX/inwhD4hAWgobUHybqHHxNZBK71c9
         UVIMmaEHqP7Io/qLacSGmyNVMQbg6hNLq0b0QB0F5z4DYpjHvyfpGwjPb/TTc75S0T3c
         PeyimSEnW9l3/Q7fKWmPmQYE8AbNFP9J29qcr27C3U3kLTKPbPR+pNGgJr2WcoZML4sx
         rXOM4EGQxVi0Y9baUKgGloAD2JzC6L0sxm0VloFPtNO9DRFJzxvINlXyODyql3dwok2n
         Uj3N4W8JR5EXcr358e1IlM98f5nFMSH1uUwuJb4eLbzPzT9nlZnmnZjpeIjfwEKw26Ww
         pCfg==
X-Gm-Message-State: AC+VfDzZU0TH7FfTpzjl+7yxE7v5ItVyxGG1gPXcOcxJleYoBsEyMs8r
	GaZtc7V6XfF3bnNj4OPPviowkciLVNZiYJK2vBg=
X-Google-Smtp-Source: ACHHUZ7dgKYpkFgXhO5Y/oHHmnxrZLy8LMoxpUhGHni81Ka9s4CEYwV+nnTDhHnC7XjI0LkCZUM/ug==
X-Received: by 2002:a17:902:dad1:b0:1ac:86b5:70eb with SMTP id q17-20020a170902dad100b001ac86b570ebmr17261062plx.39.1683839218968;
        Thu, 11 May 2023 14:06:58 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902bb9100b001aaef9d0102sm6362457pls.197.2023.05.11.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:06:58 -0700 (PDT)
Date: Thu, 11 May 2023 14:06:58 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 14:06:38 PDT (-0700)
Subject: Re: [PATCH 0/4] Zbb + fast-unaligned string optimization
In-Reply-To: <20230113212351.3534769-1-heiko@sntech.de>
CC: linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
  Conor Dooley <conor@kernel.org>, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, heiko@sntech.de,
  jszhang@kernel.org, heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-03f60cb6-6146-4149-aaa1-d5daad1eba74@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_140702_757312_D4A0E1B3 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, 13 Jan 2023 13:23:47 PST (-0800), heiko@sntech.de wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> This is a follow-up to my Zbb-based string optimization series, that
> then adds another strcmp variant for systems with Zbb that also can
> do unaligned accesses fast in hardware.
>
> For this it uses Palmer's series for hw-feature probing that would read
> this property from firmware (devicetree), as the performance of unaligned
> accesses is an implementation detail of the relevant cpu core.
>
>
> Right now we're still in the middle of discussing how more complex
> cpufeature-combinations should be handled in general, so this is more
> of a concept on one possible way to do it.

Sorry for leaving this dormant for a bit.  There's been a lot of 
discussions and I think the general consensus is to aim at taking these 
combined workloads only if they are a performance win on real hardware.

I think there's no Zbb+fast-unaligned hardware availiable today, but I'm 
not 100% sure on that.  If there is and someone can show benchmarks then 
I'm happy to fit something like this in somehow, but otherwise I think 
we should wait and see if this matches what ships.

> Dependencies:
> - my Zbb string series
>   https://lore.kernel.org/r/20230113212301.3534711-1-heiko@sntech.de
> - Palmer's hw-probing series
>   https://lore.kernel.org/r/20221013163551.6775-1-palmer@rivosinc.com
>
>
> Heiko Stuebner (4):
>   RISC-V: use bit-values instead of numbers to identify patched
>     cpu-features
>   RISC-V: add alternative-field for bits to not match against
>   RISC-V: add cpufeature probing for fast-unaligned access
>   RISC-V: add strcmp variant using zbb and fast-unaligned access
>
>  arch/riscv/include/asm/alternative-macros.h |  64 ++++----
>  arch/riscv/include/asm/alternative.h        |   1 +
>  arch/riscv/include/asm/errata_list.h        |  27 ++--
>  arch/riscv/kernel/cpufeature.c              |  33 +++-
>  arch/riscv/lib/strcmp.S                     | 170 +++++++++++++++++++-
>  arch/riscv/lib/strlen.S                     |   2 +-
>  arch/riscv/lib/strncmp.S                    |   2 +-
>  7 files changed, 245 insertions(+), 54 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
