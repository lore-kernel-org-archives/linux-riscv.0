Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CA9C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 20:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D43E60C3E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 20:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D43E60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyjKy14DDeJ3VSKoPy9WmI9ygYAnou+sZQjsWZUo9Hg=; b=mPy+GhnKl/g2lJ
	GxTHHnnUiENhbj++j7uIWN3yCdYNrfE4BjkcFXA/iZcvrQsJhmqHc4ZoJGYdRrGRn/Fk614Hiuggp
	Acmcx03F/lADW4eOu85GswcP3zWrlB/k8dIO5lEaaw+YU8plGF4BWawhRZtKCtSK6nCu5LyVO4SSv
	Bh4NNLnTYFftcOtYzFN2Z1VdE4a6SSMBCeil1MAxKV3647Lbyn+POLFjDtrW6kWDx6xUY4CIciqkV
	EguaG0ENags4OVyC/KR0b+BrwGdG4udJRJa62+Mf7xQWQKU3t8JK8YoahP1NOOPFCviOwFNPLWLWO
	Iiky2WZwQrfWDwRp/btA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Tbe-00GFJf-Fk; Tue, 27 Jul 2021 20:23:14 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Tbb-00GFJL-Uh
 for linux-riscv@lists.infradead.org; Tue, 27 Jul 2021 20:23:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id z2so23973147lft.1
 for <linux-riscv@lists.infradead.org>; Tue, 27 Jul 2021 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8tgMLXTJ1SBcDGWx17C0v5tiHolFuBjYw86xA1bG74=;
 b=U6mBUsPGKwWcrEmoYPcYgKProIZbRrYMiosS6T3aoDN9LLzyyc8prcY5H9PIbXxG+W
 UNPn3sO+j2UXGnfWxMMgFxDHUaFPRT7nnx2HUm2TeW4ta2KtPlm8X7CJJHUIrOGAijY8
 Gah6b4nuuw4nL8qVuGMwtQbo3tZ5QzP3aCXxGa/bH59iAHj7f4uSVEY3SqqFaBabOPJM
 pMal4SeuPkFZPDndDERKMy2ZD1M/XAozv7ye7Tj/vaUWP8+nPmGGYY8mEzU9D63Ila5A
 cHjFJhzMVQw4LJzzdUNHdYnauh9RRlgB58HNhyACUaOdT2v+35LfMfgACU+rIx8ZIIML
 vx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8tgMLXTJ1SBcDGWx17C0v5tiHolFuBjYw86xA1bG74=;
 b=dNG9xEus+K3mSNOz2AnPUoZp2j7Nrir4vlAe9rd7/LyJJQXsI7lE0QhNeJSf0mu19K
 4LFOPqJKplzNU4OZFeidJY4OouFhTCDAQjLqWbtBFerIC4tL0aGN1scLf5OkbWlEg9AF
 0TpLv2ZWsl08IrBWZlUaAE5RRqVqEpXOeTVwPU3pU52uume1UqOdLp6qXdW6XSSMw3BM
 Xdj34zE3G3fT39ZAe9iu0ZN6i2PnlLIl97L67aLtUgbJ57UjQCYptZvH6+Orpi5w8jaW
 OQLAtn9EzMiothhDHsttt8P0jcup2Zh/VSqJAwDIllIb2tmKK2QFAajgnH6QVnzYGVGw
 kd+w==
X-Gm-Message-State: AOAM531uFkUQSCUz3+Cqx3my/2UFzCUnkKlsf+AfFuXVbeo+2sxCBvbi
 BNRjpt+x2jI9Bzz8ydvB2VacoBtAHExOof48Yb7xLw==
X-Google-Smtp-Source: ABdhPJzdaRQH9pyr2T/gZsZ8ivEYx6SASES3CMPSDNWNn2meu1Xd5zjm8uRkS2VO5/uvgBDWKtgfRjt7HzCMSahnwIc=
X-Received: by 2002:ac2:596a:: with SMTP id h10mr10624232lfp.374.1627417390116; 
 Tue, 27 Jul 2021 13:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210719205247.1023289-1-twd2.me@gmail.com>
 <CAKwvOdmNji0AbYUiOSfb5cLD+g7YCpXk4oDupa8gTfgzYmxvBg@mail.gmail.com>
 <8a21bac5-2445-2d4f-3639-8660285a626b@gmail.com>
In-Reply-To: <8a21bac5-2445-2d4f-3639-8660285a626b@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 27 Jul 2021 13:22:58 -0700
Message-ID: <CAKwvOdmr7t6jxWPyZ9U9vyFzk4H0toJKMFTSj6SXVNkK057VSw@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
To: twd2 <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com, 
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_132312_036974_69F10E12 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 22, 2021 at 1:23 AM twd2 <twd2.me@gmail.com> wrote:
>
> Thanks for your advice.  After some investigations, I find minimal code
> that can reproduce the issue I have had.  The bug is filed at
> https://bugs.llvm.org/show_bug.cgi?id=51161.

Perfect! Thank you for filing that. Let's get that fixed up, then
revisit LTO for RISCV.
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
