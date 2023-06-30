Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EBCEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIyubAnMqz0TU1CYOY7g9+uPIuTpRI95fnA/wHyXzVM=; b=n0Fnw+8NsPUo0W
	GJPpAycrmAhAUFKjH1HvMGguQfMnbupwkg9E7Vo0u5fmdZaJS0lTiZ86vkjsNMXYOGyZbwG3N6YOS
	pQvKzR6BDl3IhVb34dd/ekG8qUL9/SiBY/zgOzM5fHmpODdhXyBDyb8z+fiX8a7ZuiW43idmna7VG
	CPvVvgm4W1SfhvGX/CdRzTt99OwRIJH5lKTDIZu1K1yl0zO57zlyIxjyAGmNHduR70onNq3suPPqC
	rJOeOipAkVM3N6TZNOolOu0UqJ1ppERKzt08GjINOzJnWEO8d6p8o6fViUV4BvBh0tnbMLApNGp1F
	UQwPhrgojUYV9cBBCmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHGz-0045XZ-1k;
	Fri, 30 Jun 2023 16:47:05 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHGx-0045Wj-1B
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 16:47:04 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6a152a933so32702821fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688143618; x=1690735618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sYWz+2+v0oWfMG7VOE8sajye5qUMu35LIpd38kZpYk4=;
        b=bE7AM12LzqFtQydt+UMBpdsl/D7OThQhEDvxHSgy4Y99IiBMNaWCq/5iTk3EZQH1NG
         xBQUEDlDuz7pPAdHmHLJnXU0YpY08GpSc+Bg+bHCisWYhFjOjJF3TP092RbotfvyB10+
         Uf/ICMbczWGwMd79Sy9q4ZC1tXR8hyvKJKcQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688143618; x=1690735618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYWz+2+v0oWfMG7VOE8sajye5qUMu35LIpd38kZpYk4=;
        b=X4aeJ5fKJS5WFUTnF+XgN84yb8MlxiHzIcPYlpTddkgPsM/38K+lCG5kj2+rov+D9q
         o0lEq30VCFOxbhuLdxJyyyQ6+ZMlPNrrPN4fQ92zevUZCDSZqXdXz7B5N806i7Cgjr2b
         ULqSTsJrZsZ9hz32rOVY/XvJnxbQ+sM5sq9sN08VqY/Jr4x0SoK27A4QvwAnrkPnUYuG
         zC24p+A2i9rrmxyGrnLvP0VTnJZpnyMWe5hUD/9YTqDAbnowUs1kvFYAZPQZqbJNQZyl
         ImBWGEjYE8YMLAlUazsvrEJWVy76dRiFYnhAv9MKg7WP5cQLHOPCHLM3faveigJonEXT
         fhVw==
X-Gm-Message-State: ABy/qLakbf9LLdymJV0WyUZfysFmDWNC/ksMAL/NYKMpwn4uTo39wyPT
	15RvlcYbuJMNS1wRRDCjnIKu+xlviF7ln7jxtYLSnhtY
X-Google-Smtp-Source: APBJJlEqzF1SfoKCUGnPGx1OKxnZGxU46txFFVdHX5xI811rbdYGWHkcQRutX97Eq2zKtuv1d6vrFw==
X-Received: by 2002:a2e:908c:0:b0:2b5:9d78:213d with SMTP id l12-20020a2e908c000000b002b59d78213dmr2424416ljg.16.1688143617771;
        Fri, 30 Jun 2023 09:46:57 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 5-20020a05651c008500b002b6c5bbc9aesm862063ljq.91.2023.06.30.09.46.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 09:46:57 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fb9ae4cef6so3378546e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 09:46:57 -0700 (PDT)
X-Received: by 2002:a05:6512:3dac:b0:4f8:4245:ed57 with SMTP id
 k44-20020a0565123dac00b004f84245ed57mr3479038lfv.35.1688143616777; Fri, 30
 Jun 2023 09:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
In-Reply-To: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Jun 2023 09:46:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqQCAtA4cVev0g3A6RCD16s1p-_TAUeVkGE0_yS2ehyA@mail.gmail.com>
Message-ID: <CAHk-=wgqQCAtA4cVev0g3A6RCD16s1p-_TAUeVkGE0_yS2ehyA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_094703_432092_4D210AC7 
X-CRM114-Status: GOOD (  16.10  )
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

On Fri, 30 Jun 2023 at 08:40, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> There's one merge conflict in MAINTAINERS

Yes, but your suggested resolution is wrong. That "ACPI SERIAL ..."
entry was moved downwards to be in the right place alphabetically, so
the entry next to your new RISC-V entry actually needs to be removed.

You seem to just have kept it, so your resolution caused a dup.

The hint from git is the '++' at the beginning of the line:

> ++ACPI SERIAL MULTI INSTANTIATE DRIVER
> ++M:    Hans de Goede <hdegoede@redhat.com>
> ++L:    platform-driver-x86@vger.kernel.org
> ++S:    Maintained
> ++F:    drivers/platform/x86/serial-multi-instantiate.c
> ++

which means that git thinks that your merge added those lines from
thin air (ie they didn't exist in either parent).

NOTE! A '++' line is not a sign of a mis-merge in general. It is
*purely* a hint. It happens for perfectly fine merges when you either
end up moving lines around enough that git doesn't see where they came
from.

Or, perhaps more commonly, when the merge conflict was due to both
sides changing the same exact same code, and the merge resolution
comes from neither one directly, but is new code that has combinations
of both changes.

Anyway, don't worry about it, I appreciate the heads-up regardless and
I always do my own merge resolutions. I just decided to try to use
this as a "this is how git works" moment.

Basically, trivial merges where things were just added or removed next
to each other will normally not result in "++" or "--" lines, so it
can be a hint that something went wrong if you *thought* your merge
was trivial, but git gives that kind of output for the end result.

But don't think that "++" means "wrong". It really is just a sign that
maybe the merge resolution needed a lot of care. And sometimes it's
entirely a false positive - if git *really* understood merges 100%
correctly all the time, we'd never need any manual conflict resolution
at all ;)

                  Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
