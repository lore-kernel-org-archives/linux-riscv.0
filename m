Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F2EC636CA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 22:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB74E61380
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 22:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB74E61380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUCcln6A/NPfU0uWQEQnfWvDv7XYMlPNqVFlaRPZcUw=; b=t14ckrz5uEb7EH
	9mX/aZzQX4kLcCJz4Qc/EqGS2cudBVTcpvVzCCCVOJ9T3tXJzR8UI+oWhT6lhDeS7i8sjBin8P5fa
	BuX9OSG473gYHPCDWqxF5XYMP+TssFGWez59jv5AKgNqJR0kN/D7bzq6P6zhUy/GnD0sHkPTjAS3u
	VzvyWon2D38OyqnZJu6d1tGZBI1NWO7hko/34VagTlTmDjHZwnj73jMi7YB+qjj0XAd8pNP+mwifn
	6YllAZjHlq37K6RlmRbxs/0ykyuRqP8V06Wg73xxX5zWBQBpphEqBF8UOcJC5x4CL5bl262AnCjvu
	2dvdbYxARQczM4thSMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4WSk-005Uuj-4j; Fri, 16 Jul 2021 22:37:42 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4WSg-005UuN-RK
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 22:37:40 +0000
Received: by mail-yb1-xb35.google.com with SMTP id r132so17317298yba.5
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AajCcLGQreUgC8barCBgEJa8ujUXbuUEsJRU4Qb14aU=;
 b=Sv5vIvLuksdalgYv854cCR5xM6eJew5RcXNKQwFwgbqF1Ehmn5Kd7tVcMxeIPJnyrn
 8SorwLdMZd6pb/iZ6PeIMTUjMHWlP3ppT+vVYF+NXORQcXt8QY9zWk0zwGMsabUoW4HJ
 Y7fp8Etw3VJnZC+FTTI9MKjiGJgfKkVyaxJHhiOsnEf8UxoH0oexUy01NRW68E8jX7i+
 fDPyI2wBDoZKHQYShfZgLCQvq18xsWJRQuF8UqYsRC50XJ+CWFZV2KGU6Cl/KPC+2xiu
 fqw1l4JEeiGNRM76GYBP33Z861L+X7AcJdTxu94y1fXkVY4lscem/DaBIi6cz9VZrOME
 0Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AajCcLGQreUgC8barCBgEJa8ujUXbuUEsJRU4Qb14aU=;
 b=KBzMdI1dR0hl2pGuF0TiyyskkIzN9a0pww2lu8HCWxCV5e7NL5gc0sszwhNKuE09n1
 mevpu0y8ubRoYgu8xXdudFh21AaXA+JL+w0E3brkmu/Yj+qugFBJ3/X3Ox10jD123gqX
 1PngfqsXtZ0lhsYJ1Fbzqks4fvQMk5RKtAobrPMwk1ErwtDsTsEevAiYSIpKMSBtul6Z
 lA78yPP+B2+pkqNpENsv/uh+jnTJM2NjnSftKBRKeN8ySSBxoL0w597IE49dDdHCfewK
 UWBZgK2SxtSJPQq0jGEfeNovc985nGXUv0IJdjkrZVJvXNhwTwjG4dkbyJL54M2RknYZ
 kqyA==
X-Gm-Message-State: AOAM5339V6hOcCeyqoFAUWt1aYOSkNVzICFITEM0uiokoVGjj4Lit0jb
 uIstXJXls2c+W0aidKw4ADlcOyTo7DB5+5H9yJJo5jBi
X-Google-Smtp-Source: ABdhPJwjmjTOyEafGU8JB1kr3VsLd5fMQRUpWIGYYsUyYB6b9iMnoU2I+2ryII51GLlG2/dqEdRE4j3pJN2OUpl7THQ=
X-Received: by 2002:a25:2c01:: with SMTP id s1mr17155432ybs.387.1626475057553; 
 Fri, 16 Jul 2021 15:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210712174849.2202287-1-ben.dooks@codethink.co.uk>
 <CAEUhbmWmrEuwdy8OPhF1p1Sb7779QiWkx-Ca1OG5VQ38dxChLw@mail.gmail.com>
 <36a5d9d8-67be-e128-2798-5bf1989ce06d@codethink.co.uk>
In-Reply-To: <36a5d9d8-67be-e128-2798-5bf1989ce06d@codethink.co.uk>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 17 Jul 2021 06:37:25 +0800
Message-ID: <CAEUhbmVMc+rNs3ghu0pE_4+W8SzEgZ-ykeNDjriqPPZ6Zxhv+Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: add correct as-options for assembly in modules
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_153738_948251_1E7FB4B2 
X-CRM114-Status: GOOD (  22.26  )
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

On Fri, Jul 16, 2021 at 11:33 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 16/07/2021 11:44, Bin Meng wrote:
> > On Tue, Jul 13, 2021 at 2:28 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >>
> >> When trying to load modules built for riscv which include assembly
> >
> > nits: RISC-V
> >
> >> the kernel loader errors with "unexpected relocation type 'R_RISCV_ALIGN'"
> >> due to R_RISCV_ALIGN relocations being generated by the assembler.
> >>
> >> In commit 7a8e7da42250138 ("RISC-V: Fixes to module loading")
> >> the fix for gcc adds -mno-relax to the command line when building
> >> C files. However this was never applied to assembly flags, and gcc
> >> does no pass -mno-relax to gas when presented with a .S file.
> >
> > does not pass
>
> I'll see if I can make this simpler. Should this get done for a v2?
>

Yes, please send v2.

> > FYI
> >
> > The GCC bug was fixed recently via:
> > https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857
>
> thanks, I think it still useful to fix this in the kernel.
>
> >>
> >> The fix (other than making gcc always pass -mno-relax to gas) is
> >> to add -Wa,-mno-relax to gcc to make sure the as is invoked with
> >> the right options.
> >>
> >> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> >> ---
> >>   arch/riscv/Makefile | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >
> > Otherwise,
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
