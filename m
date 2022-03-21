Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+GHr8OS2FSw1pCZzvnpXwjPLVeLF8HRcfYuJp+xUC8=; b=v1NcSqLg9pGE6m
	qagPfadlllaQges1R2hby/kFsuiEmzVxFyMzZIKj9B/FiNiyPpC3DP+eOSOA8X1GC0tsM7YIzA28L
	mqptGSrWrRylk2KPLXf7SxcTWbqnk5aIfbqlPURbNIvr3/17sKke9SgqescSzdaNvZWQW5FKF0hG8
	Y9lDJzusnIA/DimY7Pf8sbocR9ikMc1IEcbZYT2OwTi9cDAlxvjsfKi+QG8EeYncTDsowNIkGmUwv
	8dCUqxkQgRRUq5P8Ecp3XJBZ50+QwSUO1/5FyMIWnSA+SDgY9+a01S1S0ev2C/Tmb37JpQCp3WBBT
	xTyIq4OAw7uilQOEOsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJVY-0085y9-0e; Mon, 21 Mar 2022 14:59:44 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJVV-0085xi-Bo
 for linux-riscv@lists.infradead.org; Mon, 21 Mar 2022 14:59:42 +0000
Received: by mail-oi1-x22a.google.com with SMTP id j83so16484548oih.6
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJYydfA3R0CNKR7cdtXJjXTVmaYiDknLd1vXKzC0V/8=;
 b=stXTTAi5wE0xqE4kwPEOIgYBNpVunqU2fg0R9UeIFDHzc5XqPiwRTRBwRTmPpf3flB
 +PMTt72OicVY1FvLxV4w9X1ZGDtl/lkeL/0yO/3zix4ptrS4OrXgn+26ruWIfqJJa1NK
 R0dueF59KHry1bnzbAbORVjel4gGxEbpYIVqmrG3FmZTHyI8zB9Yui6RvtcXTAcDEGeh
 EOsrozTu+iXDDjtU9Wpauj0c/rziClopaD6/kSf3+xyW2CkRoXg/ELC2P1Q86FkRREIp
 /Uf6Fz5/mRi/kl2jf0a5046bmWHjhQ0IT0CGnxR3VvIVwbjpsXz4hLz7bgKfe+RF2uIO
 O7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJYydfA3R0CNKR7cdtXJjXTVmaYiDknLd1vXKzC0V/8=;
 b=8EV7KhNbewW0Xi3asxUUNjx6BdZWLJVdQ6YFbXhFCEB2FVTvuI1QLm4byQOyZFG/2j
 6+pVxU40QS2St9h9QMdLWB5rlcPXtOdtHJXu7CeZ/lh84h5silCYughGLqXHIo1XXwR3
 x8qi7QxW81TfQncKVDswEU0Rc5yaCtaSxHiZ894Kvp2JHVf9Hy5UB4Qeq9ksU/Y+suHw
 N4da2Ea5wLsAmYAsMvtS09hQUnJgLh5/wCjJ/zj2P53wYyyANInTywTX++7MOaxo+nVQ
 Aks1h1x+skevmiyPyWP4dhaei/qh76Uc+O54N6bScFAzuTuVlc81MXyOjUwkOjM1Us2I
 wRpw==
X-Gm-Message-State: AOAM533xG2X5Q/GDtk+pYpUDWW9lvAiodvZtIlyDNbZe81rvkk/GoM3Y
 YnTGAJ4vwtj1q05eXizITKiLNpL092cEAIzSl76OQ5oTCOM=
X-Google-Smtp-Source: ABdhPJy2Ajxl4jt3AHym1tz10H41oaG0gAPoNcYgWPAaoqVoAb2lRq1Q6BQCCZpHMVdxDHrSIejnBhsruAK8Re4vGXk=
X-Received: by 2002:a54:4899:0:b0:2ef:3d97:2528 with SMTP id
 r25-20020a544899000000b002ef3d972528mr6394134oic.211.1647874778496; Mon, 21
 Mar 2022 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220314090652.1607915-1-dvyukov@google.com>
In-Reply-To: <20220314090652.1607915-1-dvyukov@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 21 Mar 2022 15:59:27 +0100
Message-ID: <CACT4Y+YA4eFJUe1Ozh--YBMfxZ-ByiMmg0qs6En+wV2-JhQ9-A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Increase stack size under KASAN
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 alexandre.ghiti@canonical.com
Cc: syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com, 
 linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_075941_447427_0A40808A 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, 14 Mar 2022 at 10:06, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> KASAN requires more stack space because of compiler instrumentation.
> Increase stack size as other arches do.
>
> Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> Reported-by: syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com
> Cc: linux-riscv@lists.infradead.org
> Cc: kasan-dev@googlegroups.com

ping

> ---
>  arch/riscv/include/asm/thread_info.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 60da0dcacf145..74d888c8d631a 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -11,11 +11,17 @@
>  #include <asm/page.h>
>  #include <linux/const.h>
>
> +#ifdef CONFIG_KASAN
> +#define KASAN_STACK_ORDER 1
> +#else
> +#define KASAN_STACK_ORDER 0
> +#endif
> +
>  /* thread information allocation */
>  #ifdef CONFIG_64BIT
> -#define THREAD_SIZE_ORDER      (2)
> +#define THREAD_SIZE_ORDER      (2 + KASAN_STACK_ORDER)
>  #else
> -#define THREAD_SIZE_ORDER      (1)
> +#define THREAD_SIZE_ORDER      (1 + KASAN_STACK_ORDER)
>  #endif
>  #define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)
>
>
> base-commit: 0966d385830de3470b7131db8e86c0c5bc9c52dc
> --
> 2.35.1.723.g4982287a31-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
