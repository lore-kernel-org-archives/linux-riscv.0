Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9F8C46467
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JND4jmGk/hpdDEpjiQpmRXG2piag4GkqKeuUI+Ozv+k=; b=ROf+Til8M1uC9p
	FEDG4sqOdKPPQ4LIiJWDhU4iEP2kEWWKiu46C1QglBljgIOykgsnC/r5sY/9oSxwUNgIGb1+vIFWH
	FbIzqscz0yKm56O+Br3Zzv4De5Whk1oJCYSfE00T37ZBOq7Q8tlHHyDRNjYrUDjfixuDtooeuZ23U
	+EOc0MN5/hWwKGdU3RBsHMsTY/8beA2aqu7z9yZLntwCveTCaSPjXnGNg46i8kYyM9UgGgQjKF8H0
	BgTjxBTEL1+Rfv8FjWemo9uYVsQ0IctW5jUSlhqQH2O3Y8GLEzC2yqysSrPWFzvLo7UOhadXmz90T
	SvdF8Uh47+iXgLekMjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMIj-009Xa4-Ot; Mon, 16 Jan 2023 10:01:13 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMIO-009XUH-Cd; Mon, 16 Jan 2023 10:00:54 +0000
Received: by mail-qt1-f173.google.com with SMTP id a25so17051933qto.10;
        Mon, 16 Jan 2023 02:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcfbiaOtd0rIUu3J0LzMQ7r+7EcuQP5IsDRStK58JTY=;
        b=vQmX3KPSps2EKYN+lkwP49lCCKpEEB1rfuHg5tVWE6Si8dMkJ8pe4wb3BIqEUaUM4c
         oFimYCjqJBpDHdZ6sqcyxCZtoHKcd+sX2ld/ZFv2//S8Xi/Lv/Jy78OSRsdDOTEnVq40
         paPqATGR4F9EkPjkl6ITffxVh3KXoBviDwM67mQaCl9YXCieSy9DXYbg1uWevDf9naMM
         XnBqfdvZ440ztO8+elNIXdbQs6J7KJWA4cy02/5mRSYoC6jNjzHjBdKLRI3hWMGebmg4
         TUqbiCGKEnqUP2ReB6dLfgbLvvreuzWfTLNQluB//6ig1E0nkN9DiAE9je17FGMDlEGV
         hxSw==
X-Gm-Message-State: AFqh2krHVNYyla3bDu1Q9OOuchCE52G4aWer/djPPcyKobvbytuA79aU
	OABiP0wZeFxxMW3xqumGpWt134bY9F4U0Q==
X-Google-Smtp-Source: AMrXdXu2qFgE2Fligqs695XSk2vR8SK8e0aVIRme0nCiQ7j9VhnY7MCtZEMtYzFOL/5cWtuonWJ+Lg==
X-Received: by 2002:ac8:45d3:0:b0:3b6:31e2:f539 with SMTP id e19-20020ac845d3000000b003b631e2f539mr3707748qto.5.1673863248401;
        Mon, 16 Jan 2023 02:00:48 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id v9-20020a05620a440900b006fc6529abaesm18071345qkp.101.2023.01.16.02.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:00:46 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 203so29631017yby.10;
        Mon, 16 Jan 2023 02:00:46 -0800 (PST)
X-Received: by 2002:a25:46c6:0:b0:7b8:a0b8:f7ec with SMTP id
 t189-20020a2546c6000000b007b8a0b8f7ecmr4703291yba.36.1673863245804; Mon, 16
 Jan 2023 02:00:45 -0800 (PST)
MIME-Version: 1.0
References: <Y7P9IcR7/jgYWMcq@osiris> <20230105095426.2163354-1-andrzej.hajda@intel.com>
In-Reply-To: <20230105095426.2163354-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 11:00:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Message-ID: <CAMuHMdUhPjya8zWMxEN8U8pjf4M2u_+HOfxQ2NP1XOcX9EpAKg@mail.gmail.com>
Subject: Re: [PATCH v4] arch: rename all internal names __xchg to __arch_xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Mark Rutland <mark.rutland@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_020052_471936_8A18B116 
X-CRM114-Status: GOOD (  17.18  )
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

On Thu, Jan 5, 2023 at 10:54 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: squashed all arch patches into one
> v3: fixed alpha/xchg_local, thx to lkp@intel.com
> v4: adjusted indentation (Heiko)

>  arch/m68k/include/asm/cmpxchg.h      |  6 +++---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
