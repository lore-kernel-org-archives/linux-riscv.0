Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE45CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/v4QfcqAEc3iHRjrM7PImln0A4Y5pTBNwyaqjOR0ma8=; b=KZnR7csysv/CizDfgbgaTh7/+N
	bSf3ikgUwLInqGZ+IQm7uWXry9Nnl0L7TB+sx9sSUPVCp4KWP5q8gIWQI+au3/CVfO9OuPh4RQdMA
	8Ryvh0PHxrWzL9ph68iwnhCQ5LPmykRXElC/yIwl54oZFeeFr5TFTPS+7iutl2WSOdRWPbTkK7P3/
	wGT7eBbpnZn6bJfBr32jGxoplywots3FVI22kNDxA7KhrlCi7buT8GJKm0b9UuNAYo26wbk5OnYP0
	RSKRmtEQCz0JHH7fq1qSr4GPnlV7dtBPSOOuI71/i7Lnr1pNHLosclhsKB8CQHgBa3hk5rmZbHKXg
	MUyXIbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJ9T-004L7G-2b;
	Fri, 30 Jun 2023 18:47:27 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJ9Q-004L6g-1M
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:47:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5577900c06bso1631650a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688150842; x=1690742842;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDeUgk8u4frArpfMVDM55aE/xcXSay9wQzPSdheHYEA=;
        b=g9IPKSF0UQ1vFNaIem07DEhkl4m0lUJjPbUrP2177eRfDGX/u8dPqYnTmHDYMckCWC
         8s5+YawaKSJTH7qJ3J7hXEJbCi5FVCg+KukwrqfYJmPbUK4qLe6n6YUe8105hL48buA6
         MBZNIEGl0V25BtMZTeDYFHXOfoQFrJc2RcKkGd3sSri53zeq5KbHpbkjlsSJTczCbHi9
         vV6uKnR3jJFo14jMSpje8B7pWTu58VlbZeIR5UL90xDqFZT8IPQ5FxxEl7RC0/MX/aac
         BwjB2QS1DLXyMYvvkiOWZlWxOJj/d6TJkcRkPm5RLPA1EpHiEpL3JX2f8Mk8vVtBwCGb
         lIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688150842; x=1690742842;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDeUgk8u4frArpfMVDM55aE/xcXSay9wQzPSdheHYEA=;
        b=NbCdLqg0WkRhd+j15m2Vh4jDTLQCfCfiNjw12T/QvmKyy0PWjdNf5koSzwVmVRR1Ut
         F5eXHSILy2+4ZSaVCSMfeUpinsxC9sGXj3bH1GpU64aqjKHMgi+Psfj5lYZCssRTYhl8
         fD6zjp8o3jgKo/PUlEjVwFA13isFVVUlMl/bhCmJuth5ycucDxtSCx+WU8y5wDIY/YbC
         5qA0zAPRznDGXp24TvFXL20ViOD3Z5YPCB9jYzwbFw3hO8C1qEthwlrHc7ElSUS7cgzi
         ln017emMSZoOPCW47Z5Gm34o7YFJIfPufwmQE2IRjobeqzmzfFA4zOJ9tX0HCBixAZhp
         B+7A==
X-Gm-Message-State: AC+VfDxJRme1pKxpq6gZ9VY+XCMFfSjRQsUZMPh/G8oYXMBtZlXUzJ6o
	MyGrSZ9f17kx8l6QL7h4xEN1bTLIXZfxGzWz+mI=
X-Google-Smtp-Source: ACHHUZ4xPTrBqSmUI0B2MxLjDx5UgVEfQBqv0zte5PY3szQ4Oagy9fKcFzSILPmAALNHi1CYib6bQA==
X-Received: by 2002:a05:6a20:3d89:b0:12c:9100:362f with SMTP id s9-20020a056a203d8900b0012c9100362fmr4200760pzi.4.1688150841660;
        Fri, 30 Jun 2023 11:47:21 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 3-20020aa79103000000b00634dde2992bsm4165174pfh.132.2023.06.30.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:47:20 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:47:20 -0700 (PDT)
X-Google-Original-Date: Fri, 30 Jun 2023 11:46:35 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
In-Reply-To: <CAHk-=wgqQCAtA4cVev0g3A6RCD16s1p-_TAUeVkGE0_yS2ehyA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-784b868b-bc5c-44b4-ae82-3929f67ac5dc@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_114724_684838_7BD610FE 
X-CRM114-Status: GOOD (  28.10  )
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

On Fri, 30 Jun 2023 09:46:39 PDT (-0700), Linus Torvalds wrote:
> On Fri, 30 Jun 2023 at 08:40, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> There's one merge conflict in MAINTAINERS
>
> Yes, but your suggested resolution is wrong. That "ACPI SERIAL ..."
> entry was moved downwards to be in the right place alphabetically, so
> the entry next to your new RISC-V entry actually needs to be removed.
>
> You seem to just have kept it, so your resolution caused a dup.

Ah, sorry -- I didn't look all that closely because it was just a 
MAINTAINERS update and I knew you just take these all as hints...

>
> The hint from git is the '++' at the beginning of the line:
>
>> ++ACPI SERIAL MULTI INSTANTIATE DRIVER
>> ++M:    Hans de Goede <hdegoede@redhat.com>
>> ++L:    platform-driver-x86@vger.kernel.org
>> ++S:    Maintained
>> ++F:    drivers/platform/x86/serial-multi-instantiate.c
>> ++
>
> which means that git thinks that your merge added those lines from
> thin air (ie they didn't exist in either parent).
>
> NOTE! A '++' line is not a sign of a mis-merge in general. It is
> *purely* a hint. It happens for perfectly fine merges when you either
> end up moving lines around enough that git doesn't see where they came
> from.
>
> Or, perhaps more commonly, when the merge conflict was due to both
> sides changing the same exact same code, and the merge resolution
> comes from neither one directly, but is new code that has combinations
> of both changes.
>
> Anyway, don't worry about it, I appreciate the heads-up regardless and
> I always do my own merge resolutions. I just decided to try to use

... and ya, I figured it was better to just send it anyway.

> this as a "this is how git works" moment.

Awesome, thanks.  I poke around the git merge resolution stuff, but I'm 
never 100% sure so I usually just look at the resulting output files and 
then just paste in whatever git says as a heads up ;)

> Basically, trivial merges where things were just added or removed next
> to each other will normally not result in "++" or "--" lines, so it
> can be a hint that something went wrong if you *thought* your merge
> was trivial, but git gives that kind of output for the end result.
>
> But don't think that "++" means "wrong". It really is just a sign that
> maybe the merge resolution needed a lot of care. And sometimes it's
> entirely a false positive - if git *really* understood merges 100%
> correctly all the time, we'd never need any manual conflict resolution
> at all ;)

OK, I think that makes sense.  Hopefully I can remember next time one 
comes up.

>
>                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
