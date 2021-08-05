Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8753FC4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:41:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4389660230
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4389660230
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUPUC7n+YPmwvP2SOB8qppAaToqUYEOLnxBWoSRHXR8=; b=Pgik4ZB+9MoYI4
	s0qfCH7ge+umvhI4ZSMxxm+IGWcSuftlgCoUzYbS8iOda2UbAH+/G/2akdLD6AleMy7xjjRpVvHC0
	1bLcHVAEyrd5q0TSlxtFvMVFegmjD7aVlDATgvd8O1jjfNXKw9l3Yys3ScdFRhswZ76aS7XbkhlKH
	F6w1rWThR1UhFETSaIujUmneFEDK5FZRHC0AuBwhpUD3o95vVjBGBLRyb6L1zab8SCnu3jrSFrMj7
	YwLyWR36pprzVF9jz++Cu19h3jERihpM8qdC+tVKvnoUpSJgxqb9cx4VVjCxH/w+OzcPKgu7fEm8G
	FGJzW5nxgB9wyZql36vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiIA-00AXjf-Lb; Thu, 05 Aug 2021 18:40:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiI7-00AXiq-Px
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 18:40:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id u3so12946800lff.9
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIMmN8s4yzOklVrFNPAhUIzghEwqDAddYwZBgHlhoQY=;
 b=Jk7ddJUfGVWAW2ritnMlzyPA56WazGgdT9bYKCAeF8cea10/iq+6gu5FhADG0nfih3
 uweNh2YYjGYUKbEFzyrkb6j+Xh2YzwgQ3+I4Xx4DMLeoAweSMgkjqi7L1PxYh76UDNAW
 ExElvdu6nX016+ipoQ3CaGLSvqE+cWzD9SYQAfgRJKCN1LE4TgT4YtrVOyKwRgf3cNwG
 GRTlr0UMYxHWHudYO0vYXiTGwUMRM8rjcbWOyTAmMDpiSJgV6qcwhwT1JifdPRIaFdFM
 1tYmnkT0+O6gC2408aDLeHYLF/0eN5kQbgv4DF+h8b8QJ0aS0n5HDTF63mO3w32Na8+n
 N8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIMmN8s4yzOklVrFNPAhUIzghEwqDAddYwZBgHlhoQY=;
 b=aVd9xWG/IqVgd8qE1Wg6VWtnJd4yM7556FdMCtDGGScC3FPmVyJWU4hxDa0awqIBmj
 /ypiGGvg9miEg/zuBAFbrI90Y7CPwjw9lomE1Tlrnl2sCNSneufrm1rzd+I51VlP+cqr
 qkleR+F52DVQoTovq4HHeN+Qy1XzBN1BkEN4mAcb7MHWTk1r+MvQLQ7Dn2j3qLJBlgqQ
 /TpPEITsHjYQ9Z9MMSSstxIAfcsFjLKq0Ad3i/b3SwW9Q+dyZbgeKojOJQxMeDjxEwQ3
 /7lkQA1TDSxQEwILqHNmApxZcoz3TirdgcgDqSxc5tyQ8s3tJ55hfBhKQV41/JAU5u1D
 /Jqg==
X-Gm-Message-State: AOAM531R1Pd77M4jRj9uyCVe052dYXr7ROz87AMj7OrmREib6qfAYRRC
 b1W6cbQMmNuNNIcu6xrCqQ8y+BedbQpAVbJYshe6CQ==
X-Google-Smtp-Source: ABdhPJwKZ0bGNLeTtSOs0C2EEHN8+kzI+49yaZkYoccxWYUpb641owH5DpLRRXUpUFAvyXvR4ehtxAApRyk4oi8LQKI=
X-Received: by 2002:a05:6512:71:: with SMTP id
 i17mr4612395lfo.368.1628188825887; 
 Thu, 05 Aug 2021 11:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com>
 <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
In-Reply-To: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Aug 2021 11:40:15 -0700
Message-ID: <CAKwvOdkVuzD68bQuAWS7fS0tat_wdR0bxb=Eh=Te84RtoRgZ8g@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Khem Raj <raj.khem@gmail.com>, 
 Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Matthew Wilcox <willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_114027_898229_252CA8BD 
X-CRM114-Status: GOOD (  21.27  )
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

On Thu, Aug 5, 2021 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 3, 2021 at 8:43 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > diff --git a/Makefile b/Makefile
> > index 444558e62cbc..b24b48c9ebb7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -845,7 +845,7 @@ else
> >  DEBUG_CFLAGS   += -g
> >  endif
> >
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),0)
> >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> >  endif
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index bc74afdbf31e..807f7c94bc6f 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -41,7 +41,7 @@ endif
> >  ifeq ($(CONFIG_LD_IS_LLD),y)
> >         KBUILD_CFLAGS += -mno-relax
> >         KBUILD_AFLAGS += -mno-relax
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),0)
> >         KBUILD_CFLAGS += -Wa,-mno-relax
> >         KBUILD_AFLAGS += -Wa,-mno-relax
> >  endif
>
>
>
> Please drop these two hunks.
>
> I will apply my patch instead.
> https://lore.kernel.org/patchwork/patch/1472580/

Sure.  Will send a v2 with Matthew's suggestion as well.

> When we negate a flag that is enabled by default,
> which is a common way?
>  - set it to '0'
>  - set is to empty
>
>
> So, I was wondering if we should support
> not only LLVM_IAS=0 but also LLVM_IAS=.
>
> What do you think?

LLVM_IAS= looks weird (so I agree with Khem's response), but if it's
common/expected then maybe if there's a way to write a concise check
for either =<blank> or =0?  I don't feel strongly about how it's
specified to disable the integrated assembler, but let's sort that out
_before_ I send a v2.

How can you tell the difference between `make CC=clang` and `make
CC=clang LLVM_IAS=`? (maybe that doesn't matter here, as either imply
"don't use clang as the assembler when compiling with clang")
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
