Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C97DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 16:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CC16023D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 16:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11CC16023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMT9RzCyh9jvbedt2qygpNFBDOwGTzKCtsUsV2lLCLs=; b=mBp8ewcc/d02q0
	PFTwWRbeUafTyVnLjw7HMiY1VGBghBKerLsXdBmnLCHxkUkSiqPHVoj92r7BvIn6RyuI2b6eCvCq7
	gr3WxR/SdR//e1v2o54BWzglXDeor5fTY18Mn0JD5yl4MDa/E5MZdtZX570JHLDMZWdwW1ZxZtKNH
	/rEjetrVrreRgboPrQnOP4ldDdPcBh/7AEUjaNlJbvZ9gZewIA7GA4r+GyjTgwfOBYd5Ukt6sWpWc
	zs8cinAduEyvSIYu4xufwIUA2bM4ZiMvsiQ8smTQ8oBFDXnfLB7kGB6INYEMjdkb2ewuRY7Vag1bB
	aXqfw9DNf++AFrGi/ffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mONJI-00AQVT-UH; Thu, 09 Sep 2021 16:54:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mONJE-00AQRp-VL
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 16:53:58 +0000
Received: by mail-lj1-x235.google.com with SMTP id p15so4041213ljn.3
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZAGO3iBrhQAq7cxABN7v0YxXWtGf0YiblsBwMfWyrc=;
 b=OWJMz8LLr85sFM8RFy9k59A+OTyiaRWf0ZZ0n6Rcq7tOz8KHuQoirSrp+zkJs09eDI
 qXHOeRQalPKLdGml0NfQEcoEgcJ4RTyh7hAsLCSL/ndaFI7PDIP4NyPdrC6LqlqN47u+
 Tal0cn+jttYnbxNfFIYPgA5YVSh9fCfn1aRs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZAGO3iBrhQAq7cxABN7v0YxXWtGf0YiblsBwMfWyrc=;
 b=WmAdmw5hi1KBAfOQUv4TZSf+4d2To9EH9Qjv+LoJ3XvqMj2zUl+HWrvnWEa63jnAPI
 6Mj3ii50PUvnyBXr52Zmv/CbIp5YVJmOdZ1+VA6i32snIpMmfCvxFh6qYqNQgusv/2DO
 qykpgmGfvpm1g4WxXyD15qq2c6JJ9aq9H8+GQz0VUgcXt0BkI2pB9tPPNx9SHWjBRNM1
 BW4/0sdSWVCT56Njvg9lrNdXWgWi8/e9Xp7f/zb/4EpmEzHBSCM3xWcqJw8OAG6he/hj
 /6rSSC5faReNJrcoS/8Ve3+ox1+wTQ/CnSjNeGoC9GJxjtdEaxk+xYrthBb4Cj8zI1Ve
 c9oA==
X-Gm-Message-State: AOAM532o5l3SOmFe2aHASP4hFxnKp/D15Tfi4QT07W9d2Tnql42rRjxz
 wQEafbGpgP1zaWjiVrXCOnUe7WbR6ElZyh+/HgU=
X-Google-Smtp-Source: ABdhPJyORdwhtfn/vhMXD1FT15oVuG+Xl2bYk0JyHu5tZiKDLtbrma0MhgrKjq9AoXs/PG7HH0lOWg==
X-Received: by 2002:a05:651c:1b3:: with SMTP id
 c19mr732878ljn.16.1631206433658; 
 Thu, 09 Sep 2021 09:53:53 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id p5sm42252lft.302.2021.09.09.09.53.51
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 09:53:51 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id f18so4941848lfk.12
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 09:53:51 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id
 k37mr583246lfv.655.1631206431030; 
 Thu, 09 Sep 2021 09:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
 <CANpmjNNCVu8uyn=8=5_8rLeKM5t3h7-KzVg1aCJASxF8u_6tEQ@mail.gmail.com>
 <CAK8P3a1W-13f-qCykaaAiXAr+P_F+VhjsU-9Uu=kTPUeB4b26Q@mail.gmail.com>
 <CANpmjNPBdx4b7bp=reNJPMzSNetdyrk+503_1LLoxNMYwUhSHg@mail.gmail.com>
In-Reply-To: <CANpmjNPBdx4b7bp=reNJPMzSNetdyrk+503_1LLoxNMYwUhSHg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Sep 2021 09:53:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZqRFx6Oh8ZBer2THTMcjdbwZb5X3fCLBHmyuC9jPDhA@mail.gmail.com>
Message-ID: <CAHk-=wiZqRFx6Oh8ZBer2THTMcjdbwZb5X3fCLBHmyuC9jPDhA@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
 Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_095357_042298_593231FA 
X-CRM114-Status: GOOD (  14.69  )
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

On Thu, Sep 9, 2021 at 4:43 AM Marco Elver <elver@google.com> wrote:
>
> Sure, but the reality is that the real stack size is already doubled
> for KASAN. And that should be reflected in Wframe-larger-than.

I don't think that's true.

Quite the reverse, in fact.

Yes, the *dynamic* stack size is doubled due to KASAN, because it will
cause much deeper callchains.

But the individual frames don't grow that much apart from compilers
doing stupid things (ie apparently clang and KASAN_STACK), and if
anything, the deeper dynamic call chains means that the individual
frame size being small is even *more* important, but we do compensate
for the deeper stacks by making THREAD_SIZE_ORDER bigger at least on
x86.

Honestly, I am not even happy with the current "2048 bytes for
64-bit". The excuse has been that 64-bit needs more stack, but all it
ever did was clearly to just allow people to just do bad things.

Because a 1kB stack frame is horrendous even in 64-bit. That's not
"spill some registers" kind of stack frame. That's "put a big
structure on the stack" kind of stack frame regardless of any other
issues.

And no, "but we have 16kB of stack and we'll switch stacks on
interrupts" is not an excuse for one single level to use up 1kB, much
less 2kB.  Does anybody seriously believe that we don't quite normally
have stacks that are easily tens of frames deep?

Without having some true "this is the full callchain" information, the
best we can do is just limit individual stack frames. And 2kB is
*excessive*.

                     Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
