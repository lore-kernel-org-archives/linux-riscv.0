Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C49DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rRUEIkeFV2V1HEwLgGE3Bg1OvEYT+NkV5OGFKKFGyw=; b=f3Yim4ebD+KLHJ
	0vc0WizIbg/R10q7hKW5u5wVcC0AYcTH1Vmrn+ekrxVq6b47NsJe3equXyWBn8RWbN7nloxR+HvJH
	WuV/Cqa0tq6ObxO/qaGP4P8R1Qug7J4yWaWeYmx+6FPkXWuWvnaWinVYaKF8CahC3EYDfcw1EG3Km
	L8XlSwCKc5sdjaLYguhTR8LId9xmGFHazsL757hDuDDKXQV9mxzlPxiRIIH8mWOUCN8eDhqZA2WGO
	fwwAl3IZLSy9Z4Os3+g/v7g74n+ifkSwbmL3OlQxHcix76mtmeIn660sZpxJ6oF4CESGNxP5Pj9tm
	tDjOZSNR99E76razU0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbDF-005JxX-Vp; Fri, 25 Feb 2022 14:04:50 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbD6-005Jth-Hi
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 14:04:46 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 32D213FCA4
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645797870;
 bh=EdlAiChWlSjnHqMEl5+rYYw1D6uhL90FBdNameorEkY=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=m1l0dzVf8w1Zu+gnZs/TAnoE1EpMKEsbLzsyJK8jptGTHc6BXyRnAK3BX8Y6qqA0M
 zWwVrfcaMZwOz50+cj056w97z3Bhiahn2+8LGSObf51pf8/V7gJ2FUmZvkNlk1XXDj
 4x1pLEOLEPqVTBO3KlXNGya51fGV9DOFwskJk4eZwqv5nEpyxgcHYJSGawsQ2cQnyP
 jC1olzt8mgPouZ7a03X9qdWnebpLyZ9wvrOB47afKRpBKvxr/SId9+Ak33M5Y4as/6
 rj4+Uv0w7RkEKM7fFOf1k0jyzK+xuAKHLPD+CMSdXov6Z+5pUmpHWRkHC5cPtiC1I8
 WhFnEFzYcKSSw==
Received: by mail-ed1-f69.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso2364792edz.14
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 06:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EdlAiChWlSjnHqMEl5+rYYw1D6uhL90FBdNameorEkY=;
 b=VznsytoWh6jJu/ZrJPDH10ZhdH8XZhNO/0NYDHMeYKSlGJU7ueRQLzcRkz6bnsnbcm
 pAsfebsZeXhMu3qSGF1lrfUKHzMTSDkTGLhsGwyb+yCdRyG/uMNsCZeo2UzWgSdqr2BI
 wRpzESdByiTY5xdJaMIfOCEny8ie0La0whhKygf2TqRBjkSdygwQCFR0mqvlqJqR8qZ8
 2bqwF7EcQcaLfNUwR2bCoQIuFiNATDtQtNA1SpxhuTuIycEcJlHAE/RCqKQjll9DzKf/
 UW7cs6GOSJHnkhl1vb10TizmNy4NtFwapZjMnST2RxiIRFd2oR/5txaFlwLkFjVjZns0
 8/KQ==
X-Gm-Message-State: AOAM533UlJyBqOB4hyTJI7iDJFCDF1runNcOqYIJCiHl2J8O1Dt/PRB7
 LGSnZI3aXqKoZr6IsTXWo1GQbvOYgg8/Mhl6YNoqnReY8c6ZUEJNbQElGHD539L/pDq0A4D6n8E
 79u35SWtAjt5LXRtQgYd9TwDhYIl3zvTdy2KKHRDs1S1Spvd8og8kzYO+aBSdyA==
X-Received: by 2002:a17:906:80c7:b0:6cf:9c76:1404 with SMTP id
 a7-20020a17090680c700b006cf9c761404mr6139742ejx.207.1645797869863; 
 Fri, 25 Feb 2022 06:04:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy58ysZOvpIViio0ackgH6hqMa45e2gHNM9hRoMYG2+WXwxSh1SWsVVOz2IW4eWXRM5aQLW16HKIdbbE0nHQv0=
X-Received: by 2002:a17:906:80c7:b0:6cf:9c76:1404 with SMTP id
 a7-20020a17090680c700b006cf9c761404mr6139716ejx.207.1645797869620; Fri, 25
 Feb 2022 06:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
 <CANpmjNN304EZfFN2zobxKGXbXWXAfr92nP1KvtR7j-YqSFShvQ@mail.gmail.com>
In-Reply-To: <CANpmjNN304EZfFN2zobxKGXbXWXAfr92nP1KvtR7j-YqSFShvQ@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 25 Feb 2022 15:04:18 +0100
Message-ID: <CA+zEjCtuwnKdi8EuyGWaYNFa7KsYcH9B1mYke6YALo+C1Nq+Dw@mail.gmail.com>
Subject: Re: [PATCH -fixes v3 0/6] Fixes KASAN and other along the way
To: Marco Elver <elver@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Aleksandr Nogikh <nogikh@google.com>,
 Nick Hu <nickhu@andestech.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_060440_757190_D5455FDB 
X-CRM114-Status: GOOD (  21.09  )
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

On Fri, Feb 25, 2022 at 2:06 PM Marco Elver <elver@google.com> wrote:
>
> On Fri, 25 Feb 2022 at 13:40, Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > As reported by Aleksandr, syzbot riscv is broken since commit
> > 54c5639d8f50 ("riscv: Fix asan-stack clang build"). This commit actually
> > breaks KASAN_INLINE which is not fixed in this series, that will come later
> > when found.
> >
> > Nevertheless, this series fixes small things that made the syzbot
> > configuration + KASAN_OUTLINE fail to boot.
> >
> > Note that even though the config at [1] boots fine with this series, I
> > was not able to boot the small config at [2] which fails because
> > kasan_poison receives a really weird address 0x4075706301000000 (maybe a
> > kasan person could provide some hint about what happens below in
> > do_ctors -> __asan_register_globals):
>
> asan_register_globals is responsible for poisoning redzones around
> globals. As hinted by 'do_ctors', it calls constructors, and in this
> case a compiler-generated constructor that calls
> __asan_register_globals with metadata generated by the compiler. That
> metadata contains information about global variables. Note, these
> constructors are called on initial boot, but also every time a kernel
> module (that has globals) is loaded.
>
> It may also be a toolchain issue, but it's hard to say. If you're
> using GCC to test, try Clang (11 or later), and vice-versa.

I tried 3 different gcc toolchains already, but that did not fix the
issue. The only thing that worked was setting asan-globals=0 in
scripts/Makefile.kasan, but ok, that's not a fix.
I tried to bisect this issue but our kasan implementation has been
broken quite a few times, so it failed.

I keep digging!

Thanks for the tips,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
