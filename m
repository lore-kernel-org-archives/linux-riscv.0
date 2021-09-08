Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BFDC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 22:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F29610F8
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 21:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0F29610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8waARoHajC7AzR5LyEBDnG3WoR8MnWQ9/i1j357E0s=; b=iepfF2Eww4Scgu
	lty/ShGvm3Esxl0sDsoOk27uig2GDIP24ENW/pu/7A4sLwcd8Xyh2kmOYyeXabOWbHNviv2cWWM/b
	G0D7HVgeEtsfDqTnKShgNKIU8gx4SD5yynPjRHz4htxv+Yo+4XozSYhKwvZOwB+eUAd7ahN6G0gag
	Z6p5aRIBHoJt/26mR4++5PLiWHIiI/e3lJ7GUE7M9PquNsiobSGJM+Nmp1OMcKje0enfpX488nctp
	qbUWEtVjRM7tL5/VUlifFqzbVvJFPpaHm3SXaI/dRM8tr4oFX0f+0QDVrszypKcDYWc+YGsANpXPd
	3GgoScZdHM1xtD6vLSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO5b2-007fhF-1w; Wed, 08 Sep 2021 21:59:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO5ay-007fft-N5
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 21:59:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id u9so5380909wrg.8
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 14:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+LR8frgXEe3ow5R83HHc128uph7ex7SBJh9j6e+S9jU=;
 b=Db08IbxJ13EWKYQNGZ2BEuYsakhUSoIWFEo23AxCjh0j+YYZUAYir81XobnmhdiQFC
 1iSVB74cCVzPUS1vGu59yP4rT4pCrd4YDNYH7j7c3dsrwlrdxSnP4oy0loI6+6CtalWJ
 LKXTNXMJVTgRiy0U9o3cqCOmJTqWvfPGpCabxpOLQ71sUgtL4uo66+t8MWgMPhYieet8
 sbMaCQLCKSjeTPhIL7lYpAIf6SX9Jo+Y3p5sQFLYc1YSIVTP9WSd2LfIphpbBDvU1LVL
 4TTP9wwvFOJnOuTkfJZQqhMJ1gBJZD4IDEXw290MmI/VunlC/CDYSxsp1JwZn9nDgCqs
 99DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+LR8frgXEe3ow5R83HHc128uph7ex7SBJh9j6e+S9jU=;
 b=j5BXrJNINVKNHi8SyU7OmJPGZF300aDh3JW2rcFOHPouI6bCjx3xDbcbVJLFAfASn8
 PfqB/wdCu5eXnEPbXHkfHe1x+vmivVlAl2lifQJ/aEPwO6UCawj2gWMysXuLkmDwkIrI
 Jai4YN4+1ts+9baDQLGYS8qeEqznMlY2ClnPXH6WlzM3yVhg8xOoTOXZK4B6/HK5zYMH
 oyecha7+85fEpxFlf5lgsKipXd7TLnwHNDewOKJMUhOxbeFVPVDVQJ6C/e9Ay2DLi56t
 LZbuyD0izxMYGE2KpXajs+m440SihQWa8OrGXyK6X67lnpV4N0gayqEAuR6kLMwuzmI3
 sEtw==
X-Gm-Message-State: AOAM531eBjxGD+Hp4zBFDk9m3SfLfT/+51jtGN+ysgY9TtUCoL58eh8W
 exlpCbdy1E4B0or5VXIaIZmPoQ==
X-Google-Smtp-Source: ABdhPJy9LuBylSkfGDLomcMbGliUY/gfERj/SWVa0XWOQWuMBf30BqzMK/CEeBFTW6NaaPpKmnfwMg==
X-Received: by 2002:adf:f208:: with SMTP id p8mr418298wro.379.1631138342436;
 Wed, 08 Sep 2021 14:59:02 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:6c42:a08d:7652:61ef])
 by smtp.gmail.com with ESMTPSA id o10sm358689wrc.16.2021.09.08.14.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 14:59:01 -0700 (PDT)
Date: Wed, 8 Sep 2021 23:58:56 +0200
From: Marco Elver <elver@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
Message-ID: <YTkyIAevt7XOd+8j@elver.google.com>
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_145904_801753_BFB90D5D 
X-CRM114-Status: GOOD (  21.74  )
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

On Wed, Sep 08, 2021 at 02:16PM -0700, Guenter Roeck wrote:
> On 9/8/21 1:55 PM, Nathan Chancellor wrote:
[...]
> > I have started taking a look at these. Most of the allmodconfig ones
> > appear to be related to CONFIG_KASAN, which is now supported for
> > CONFIG_ARM.
> > 
> 
> Would it make sense to make KASAN depend on !COMPILE_TEST ?
> After all, the point of KASAN is runtime testing, not build testing.

It'd be good to avoid. It has helped uncover build issues with KASAN in
the past. Or at least make it dependent on the problematic architecture.
For example if arm is a problem, something like this:

--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -71,7 +71,7 @@ config ARM
 	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
-	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
+	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL && (!COMPILE_TEST || !CC_IS_CLANG)
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_PFN_VALID
 	select HAVE_ARCH_SECCOMP

More generally, with clang, the problem is known and due to KASAN stack
instrumentation (CONFIG_KASAN_STACK):

 | config KASAN_STACK
 |         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 |         depends on KASAN_GENERIC || KASAN_SW_TAGS
 |         depends on !ARCH_DISABLE_KASAN_INLINE
 |         default y if CC_IS_GCC
 |         help
 |           The LLVM stack address sanitizer has a know problem that
 |           causes excessive stack usage in a lot of functions, see
 |           https://bugs.llvm.org/show_bug.cgi?id=38809
 |           Disabling asan-stack makes it safe to run kernels build
 |           with clang-8 with KASAN enabled, though it loses some of
 |           the functionality.
 |           This feature is always disabled when compile-testing with clang
 |           to avoid cluttering the output in stack overflow warnings,
 |           but clang users can still enable it for builds without
 |           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
 |           to use and enabled by default.
 |           If the architecture disables inline instrumentation, stack
 |           instrumentation is also disabled as it adds inline-style
 |           instrumentation that is run unconditionally.

This is already disabled if COMPILE_TEST and building with clang. As
far as I know, there's no easy fix for clang and it's been discussed
many times over with LLVM devs.

Thanks,
-- Marco

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
