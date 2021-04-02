Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1219AC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 08:41:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A036610E8
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 08:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A036610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XjQNJR0S1aUxyTn7ajyigXZ8EUI8S8nB7dCFc7OpkNE=; b=MrNH6ig6/7PNDy4pC0X+x898T
	pcoIo1ngnFItC4+CcLATwfOsag8fVd2AG5GxFCKMld+AwX66IapVd6i1AHZouNVv66jruw644R/9M
	iKaN23j8bsfLFHcduzY/NWrPcBx6R/inb3V744sKePtJH6s9N3plxBFT8bnSfqWP4BFpzViCaNx1T
	H+wkj6M3Od0gcMHsoBa8lF3OQDoTMK6HoQzcTHLngMl8t9ARdVO5fiMlGJnlMexW/EimoFVrfx2nd
	X3X/wGqxy3UGS/C1sad0Z1y9j1L9j1QaAhKsY07e+HhPFNH3xdMU3c2JRKCQ46A2P/67meLeOriPr
	8BHKaKR0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSFMk-00CJhB-43; Fri, 02 Apr 2021 08:41:18 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSFMf-00CJgI-Kr
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 08:41:15 +0000
Received: by mail-qk1-x732.google.com with SMTP id q26so4732252qkm.6
 for <linux-riscv@lists.infradead.org>; Fri, 02 Apr 2021 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Oq6IecKAdRhb0vISLYp5X5UHBzYjzxfpkAIMVbe92U=;
 b=Fjps3LQD0JVSTFEjcIJsN/pB1IYiA7TeDmRcqH6s+eEYlwyNlSHz9uRMvQ2GLPPIiC
 l/wX05Tqh0BIrKwfFyba/hVXWtCj6dqOAdWNkCW/Jsbpo6vHVBn1fJVPSLf7SaVBhAyL
 mEKzmhe7TOP82udk5b4ri0mtvsNWubfjW6dKKg0367P4w0zSCHl+Y7M7DVaMWLfzkY/a
 PM6O9aMLLhWenH7pWtIX/J6ZWhqxcGqLP3nJB4sugvZ0wJvBVrghMZkCaxRE2nENLKJM
 w3yaZNMpHhvuDvxcikMZe78A61aD4BVCBJrQX6X7ZjdEJ2MOANUTykWjSoo68oJX8wzP
 7WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Oq6IecKAdRhb0vISLYp5X5UHBzYjzxfpkAIMVbe92U=;
 b=nz1kyUD+IcqQjRqFWB5nabNdfXfZFZLQ0/rEEPEgGJiPC7ya6FZEWOzpM5zrkYk7BQ
 PRo2XPdXqu+g8wHabGGQazP7vyQuU0DkmBkgYyoE1h152eT2ZwPaC0cPbmZ/L5erHNVk
 fyidZztxlybwuZaIqqSgGX6Gwy8w9mwW1FBy0OZRm/j78pt/Jk70rTs+Yvjs7E0u7Mt8
 SRtg3eYivIQwgnxNMgsXoyLPWlCX8lBhGwglwr6uwEqxqkmlFeIU11ypxUfXXN9v1NdF
 C6IausyYM4b1ChdMzc79pF/Br421/iGZurlk0zhEyo7OwE7bstczW5Lqr27Tyze74fXb
 Gs9Q==
X-Gm-Message-State: AOAM532r7CeY6E5BfIUhO1zjkfztcci4GgkAm6p5H8zLmuhFuZRF+UHD
 Tz/VNb03vjX7qqlQmIorl6YxFrgwjtd190f0dEoIdw==
X-Google-Smtp-Source: ABdhPJwrAo1Q5aKgc8eUtKDaWI3azIH3Umeg+GTujtQJ7/TfRZUOok4RQrD42IYHB25KLC6DFD2BGY/v4Dape3KfFt4=
X-Received: by 2002:a37:a7cb:: with SMTP id
 q194mr12418288qke.350.1617352870441; 
 Fri, 02 Apr 2021 01:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2103302221590.18977@angie.orcam.me.uk>
 <mhng-08e5e4fb-8a42-4f7b-8ceb-ff549784100e@palmerdabbelt-glaptop>
In-Reply-To: <mhng-08e5e4fb-8a42-4f7b-8ceb-ff549784100e@palmerdabbelt-glaptop>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 2 Apr 2021 10:40:58 +0200
Message-ID: <CACT4Y+Z0PaAuUFrOBenztWkw8OV=J-qaeD1FASPM4ufcLg5a5A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: macro@orcam.me.uk, Alex Ghiti <alex@ghiti.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Linux API <linux-api@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_094113_853579_E31CE19A 
X-CRM114-Status: GOOD (  26.93  )
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

On Fri, Apr 2, 2021 at 6:37 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 30 Mar 2021 13:31:45 PDT (-0700), macro@orcam.me.uk wrote:
> > On Mon, 29 Mar 2021, Palmer Dabbelt wrote:
> >
> >> > --- /dev/null
> >> > +++ b/arch/riscv/include/uapi/asm/setup.h
> >> > @@ -0,0 +1,8 @@
> >> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >> > +
> >> > +#ifndef _UAPI_ASM_RISCV_SETUP_H
> >> > +#define _UAPI_ASM_RISCV_SETUP_H
> >> > +
> >> > +#define COMMAND_LINE_SIZE 1024
> >> > +
> >> > +#endif /* _UAPI_ASM_RISCV_SETUP_H */
> >>
> >> I put this on fixes, but it seemes like this should really be a Kconfig
> >> enttry.  Either way, ours was quite a bit smaller than most architectures and
> >> it's great that syzbot has started to find bugs, so I'd rather get this in
> >> sooner.
> >
> >  This macro is exported as a part of the user API so it must not depend on
> > Kconfig.  Also changing it (rather than say adding COMMAND_LINE_SIZE_V2 or
> > switching to an entirely new data object that has its dimension set in a
> > different way) requires careful evaluation as external binaries have and
> > will have the value it expands to compiled in, so it's a part of the ABI
> > too.
>
> Thanks, I didn't realize this was part of the user BI.  In that case we
> really can't chage it, so we'll have to sort out some other way do fix
> whatever is going on.
>
> I've dropped this from fixes.

Does increasing COMMAND_LINE_SIZE break user-space binaries? I would
expect it to work the same way as adding new enum values, or adding
fields at the end of versioned structs, etc.
I would assume the old bootloaders/etc will only support up to the
old, smaller max command line size, while the kernel will support
larger command line size, which is fine.
However, if something copies /proc/cmdline into a fixed-size buffer
and expects that to work, that will break... that's quite unfortunate
user-space code... is it what we afraid of?

Alternatively, could expose the same COMMAND_LINE_SIZE, but internally
support a larger command line?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
