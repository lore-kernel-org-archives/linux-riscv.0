Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9EDC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 04:00:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B081A22473
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 04:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B081A22473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miYTBxsgE0wbcXEqVjv9K8icMgEMGraU/+WsmR5sWGY=; b=x+9XHyAo03QEAZ5b4HbYJsnmM
	uIUVnOUwyjLsnNPvkKCk7ZNGV/ZWzXY3mCkDBvlUNDDNx9IIO4perVFbGULk0m+x4hGHlDLp9vSyX
	9AFP0ewbknd6CpToZShzH3koeXK26+RY7lXXZN3DIjHjB7iBybYOyTsAG66mzZdBavneA6/5pf4ns
	RTVCamwT8AdqURGBe1N2e+nbsBO+CcgkGbsQuotQ5Y0P13xYUiALC+oUfrNURVKdjH6Ax3j607QPa
	drJfjj5/rE0JFfltWTzEzxyAihzgFrm5zMDo9Jgtr5FsvVMwYzU9EYlMEbfjgUB2HKucyQy7L/oRm
	O3DMpGlzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyoNN-0002P5-9a; Mon, 11 Jan 2021 04:00:17 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyoNK-0002Nm-K4
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 04:00:15 +0000
Received: by mail-lj1-x229.google.com with SMTP id f11so2016690ljm.8
 for <linux-riscv@lists.infradead.org>; Sun, 10 Jan 2021 20:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHEcr4bSN1zx2FiEMYBhMzgQIQxqAhuq0PemUwVcZMc=;
 b=17Yxy068PsRgBYF8Z92oLby9dxH4xCw0G3KUSVK5aO7ukRRPstyXKGXxnHINqOemMp
 bU+NJ7KZAgJRAVo1zy+w+gzx0dM0gHBT+TQt0yxMMgKCsw5tPTwi5KdwHDmcU01JhPNV
 Bq9F+wWEQQ5tV7c9UmvAI+X3CWzL3R0e2Vo4y/OJhC+Q/1amaASVE7w5mH5k+bbFG1jA
 wRgBprCrTIrNPjuO56ZRm3Vjyv4ZJsDDjbmGyCJXoMCA2T0TBPAWe+/DQKLeJZ+CIrJP
 7gPBedFvoO6wG3diINpIwu3pGaOmD8MLRNwJOiAvB/SGca5vL0Y3LUbVHbfy/laplQwT
 s0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHEcr4bSN1zx2FiEMYBhMzgQIQxqAhuq0PemUwVcZMc=;
 b=nyLejlIC16KakXoVBCid3pbtByTzoBoNUfjfWlRJbrji9RBx+QWT/yKBXHxYpgS814
 pmprjWx3AOapyks94Q0DkrzCQeL37cyw4kh5phtbU00KF8nKtU/SACTzgn7LsdXo5jBT
 gvPZZ2t7v46z6qfKsueNxpElm7DS8woCfgy2O4RxLEeK5sKNylE6YWnNJy1gkMkSMHpn
 y7YxRKz8QO0BVJTxbQ77bxC2QT/is6MqufejwjVXCNnLqaEnXyGuNhrqpXa/e36nE/Vh
 efdF6eLjon2f5msGUpiJxngA5t4Ye5KiH75pnXGPK3AnKoxbGynSObWYGopg/iY67LcR
 H/Ug==
X-Gm-Message-State: AOAM530uAYBR8NH+miuF+sBS5JQIJbYKH+HXFTiCaxRJe7E0DGj2jWRU
 eHZUjn4ENb3Kc/GLVlDqtviMbJ6w7P08FTDH//tG+g==
X-Google-Smtp-Source: ABdhPJx0b8YVu7rdN1I7HqOu9IoKI4q9eHnmGHiqxjmUPNYuhHmSXBuJjGwjX9ZjFoRWPWz4LF2jbblYZ1gYh8hSE7c=
X-Received: by 2002:a05:651c:202:: with SMTP id
 y2mr6385586ljn.162.1610337613243; 
 Sun, 10 Jan 2021 20:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
 <20210107092652.3438696-4-atish.patra@wdc.com>
In-Reply-To: <20210107092652.3438696-4-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Jan 2021 09:30:01 +0530
Message-ID: <CAAhSdy3XsG3J1nE-nQhiJe5vVTa-1f09t=FY4AMRv7HtdoK=-w@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_230014_708559_BD9D88A1 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 2:57 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> allocation if it is requested to be aligned with SMP_CACHE_BYTES.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

> ---
>  arch/riscv/include/asm/cache.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> index 9b58b104559e..c9c669ea2fe6 100644
> --- a/arch/riscv/include/asm/cache.h
> +++ b/arch/riscv/include/asm/cache.h
> @@ -7,7 +7,11 @@
>  #ifndef _ASM_RISCV_CACHE_H
>  #define _ASM_RISCV_CACHE_H
>
> +#ifdef CONFIG_64BIT
>  #define L1_CACHE_SHIFT         6
> +#else
> +#define L1_CACHE_SHIFT         5
> +#endif
>
>  #define L1_CACHE_BYTES         (1 << L1_CACHE_SHIFT)
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
