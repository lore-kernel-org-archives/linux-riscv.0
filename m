Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AA2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptJq3COoOr8GgGJf+r/F++JVSkrkRDhTMeg5l30zUrc=; b=MyAp4m2Bm+m2s+
	7sFPfP/rC04uQYYDtzAtRA13LnsTP5VITK4qb2H2km4M7vOmE2i6WL2c4YpiFtDyLu+jNU4Kz3Fni
	LALaD/gFgf1jx39BHiuR3/GxbBmoGHlqw1Rv5GOXVEjX7S++s97NMTreAFPlWRoCeTeAlZsxnX71H
	1eAblUewMnSutPG/WOzfKy1chmJm4BL5iksIerwXqapir50V8k/CIieW3UGyXY8AcO9Xxol46cfow
	fmsi+Kjf3UI6BNdswe49BroDlJ1lp21z91L00eHwtjs201kQ9O0ystTBrrBScpPnszQmNnzfoNNBm
	kHI/JYsj7fA6eiAA2N/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGz22-009ITK-DX; Mon, 07 Feb 2022 08:05:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGz1z-009ISL-9e
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 08:05:52 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 192so11638628pfz.3
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 00:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NM//vzHJXC7wtiEIkUqyxs4RVdOqre3GtFkBni2nGNg=;
 b=CPAAqs2kh2QC3R8xpXymC9JpYNqnh64DBF1Oczs5drnfgjlEg7Jf/9EvkIQDaHixT0
 Yv/BAZcMDsmdSn8BPpCEIHbbZrfYTqZAt4accszm9vVphvX9rK/DQUWWKnnpvYajf3dJ
 F6iFHUeet7eo6lj7Z75iQRaz4Edds8fgTzfjwrU7KZkp4Y39H3RAWAHK/2+ae7ce1Lru
 LPmUvbHwLN8pv3qx6/gY9FF1CJhpvcMvVAaKoc9+mgdHQ8EFzlib9BrEgimYxzxY6riA
 GZw8jpquYGrcobBW14OphRRGUMaA4lOUrnfNaOtH7dFZRUu6czfKNEPMgblPNRAVAu+u
 k+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NM//vzHJXC7wtiEIkUqyxs4RVdOqre3GtFkBni2nGNg=;
 b=xJmiTq0+d7/4SJ+bfik1YaABbyRfehPxg/CqWojFtDN2F4AVTFUvxs0+hKkkxayrsX
 dA2hBOhUpYzhR4rDkHjmmmCWmcfQ8ltbKJ8za7NlecZ9d1ottpAIomm3F5YwImkFAnPG
 An6hpE/mx3kEo7+BEFQCxoVaYGKPgnE1yDPUeUcyNMVVq6oLjvjMhugDCtTtAorxQ9cZ
 NlavpeUhQYVTASixSv8mx1lsCVBdovWdUFL6FR7B6UVijo1ha2yE18KE+fLeHssGoDBr
 cuC8sA0J23ZhUzL5q4Yqy3KOrJD89MuO5/llJd2E+nX1+NgIZX8zeppKHWwZiSIOA+DR
 JClw==
X-Gm-Message-State: AOAM530AUSqoTWoPM3mSnEmnrCQwIobUUWI6gzq7dfr0cHghBN6B9ygJ
 15/aNDcV/1MhTyCoku3LLwa9rk5PbB16cJug+C8=
X-Google-Smtp-Source: ABdhPJyr4F7x3v0nRm2LnGvfdUjEsSwLIM6AzecdGCMtE37ynvDeR5GSB5npooK6FQ/pSm4NqbbnCJj7CH/jBncOkMo=
X-Received: by 2002:a63:141f:: with SMTP id u31mr8677881pgl.614.1644221150056; 
 Mon, 07 Feb 2022 00:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20220206174359.2986-1-jszhang@kernel.org>
In-Reply-To: <20220206174359.2986-1-jszhang@kernel.org>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 7 Feb 2022 10:05:14 +0200
Message-ID: <CAEn-LTrZwq1-6F8PWScGPp1TRk1eaB-7qOrvPjyLhK=OzDTQBQ@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_000551_361677_71356293 
X-CRM114-Status: GOOD (  14.08  )
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

On Sun, Feb 6, 2022 at 7:53 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> After irq stack is supported, it's possible to use small THREAD_SIZE.
> In fact, I tested this patch on a Lichee RV board, looks good so far.

We went from 8K to 16K somewhere in mid-2020 on riscv64 because we
were seeing some random crashes in various distributions (Debian,
Fedora, OpenSUSE). Thus we matched what other popular arches do, i.e.
16K.

Thus I would be very careful going back to 8K.

david

>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/thread_info.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 67387a8bcb34..fdbf3890a1ab 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -12,11 +12,7 @@
>  #include <linux/const.h>
>
>  /* thread information allocation */
> -#ifdef CONFIG_64BIT
> -#define THREAD_SIZE_ORDER      (2)
> -#else
>  #define THREAD_SIZE_ORDER      (1)
> -#endif
>  #define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)
>
>  #define IRQ_STACK_SIZE         THREAD_SIZE
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
