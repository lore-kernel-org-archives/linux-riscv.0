Return-Path: <SRS0=s7xG=NB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E49C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 00:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4659160C40
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Aug 2021 00:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4659160C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioUAuVeRVOtypk38SUta12R2o379NAUfeQOJlyKN6Jg=; b=BIIVGFhDJw/YfD
	d8KOlHWA6CEWxBeu5uE2C5RUKix8AHbQ75BNAHrLyxUCzlE3oXz7RXkQ+kWzVq9+XvYkNWu/3Q+Ef
	8tMw3/L/JJKRqVtt/Up4ACOIcMy+RGRPLokHk2N5caZAMSzYGo7TARJd/aW84OUowZ8zv8rN9I2JE
	nksOwz+gJQBOSleiIi2MKpGyyXtlSKoAWzdJDeW9uYOiUpfk+3NQvSPLJPSMWj9PA78X5Vi9iLm3k
	EVbHZVwvka3Ci06HABd2Ol7RulDv2AXt8hSnrF0pEXXytPNz2JZMxDHEHFcZuK5cvAqZ/UqEFY0iu
	hQp8MN1uDeLh/nO5lBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDFIz-0029iV-4h; Tue, 10 Aug 2021 00:07:41 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDFIu-0029gk-6B
 for linux-riscv@lists.infradead.org; Tue, 10 Aug 2021 00:07:40 +0000
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 17A073Jp023192
 for <linux-riscv@lists.infradead.org>; Tue, 10 Aug 2021 09:07:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17A073Jp023192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628554023;
 bh=YHT1wdO9BJeEnVYWadet580A1QtIyBQoR9aiFtvfZGQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qpeaZfj1S52In9OqzugDwJq7LR5sf7DfsN2Ra4D4/7Mj7Sk8kVQ+Ze4SEJu9nxAWr
 zuOtjmoizVRjdYz+IQ1+0hk8/3F2IkCEiA2JrFs51NCRM2ZTqC5Oz6bzK7nbjxIe86
 Z4E0Ot1qLc47QDixlLSWr2EeR9DD9eoLOPKsiB/dE4KOQ+zO2rG8SnFmK9m//xIJyL
 IzO79wsh46l09Bdey5qYnr7xjz6Mp0DFimoh1qGoaQeyaHrOihwNammcKKBbKJDr2d
 Q0l6y+oOFPYo0z0mNu9C0TpATi4L3yAjIbTSVJ2i+uAHpW8cmyS4JrZDGyxB7uj4bb
 KYwCOXGXlc7XA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id bo18so8493779pjb.0
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 17:07:03 -0700 (PDT)
X-Gm-Message-State: AOAM532RmyhPMpO0Zb8y4y1d5eoRbwaMxCh3Ywbc3XKRU+wkuUBYX50l
 f0OhJOr6R6vxwKcSfmdEPYto5Xn6LOz3yGNoEgM=
X-Google-Smtp-Source: ABdhPJz5g2UH5l3Gvz6QSJjrySe0RZ6IE4VBgrreB7tp3UOmjppEP2ZS0P89yIPjgFj+aYeVphRC5LeTe/8xavReZBE=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr282732pgj.47.1628554022572;
 Mon, 09 Aug 2021 17:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210806172701.3993843-1-ndesaulniers@google.com>
 <YQ2TGPwjvn8w4rKs@archlinux-ax161>
In-Reply-To: <YQ2TGPwjvn8w4rKs@archlinux-ax161>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Aug 2021 09:06:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARitJhPF5sggQ_k2885TSS3VbKQ0APAE7G8ANsYxxmz1g@mail.gmail.com>
Message-ID: <CAK7LNARitJhPF5sggQ_k2885TSS3VbKQ0APAE7G8ANsYxxmz1g@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/Makefile.clang: default to LLVM_IAS=1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Khem Raj <raj.khem@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>,
 Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-s390 <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_170736_502738_1704F267 
X-CRM114-Status: GOOD (  27.25  )
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

On Sat, Aug 7, 2021 at 4:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Aug 06, 2021 at 10:27:01AM -0700, Nick Desaulniers wrote:
> > LLVM_IAS=1 controls enabling clang's integrated assembler via
> > -integrated-as. This was an explicit opt in until we could enable
> > assembler support in Clang for more architecures. Now we have support
> > and CI coverage of LLVM_IAS=1 for all architecures except a few more
> > bugs affecting s390 and powerpc.
>
> The powerpc and s390 folks have been testing with clang, I think they
> should have been on CC for this change (done now).
>
> > This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> > LLVM_IAS=0.  CI systems or developers that were previously doing builds
> > with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> > explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> > opted-in.
> >
> > This finally shortens the command line invocation when cross compiling
> > with LLVM to simply:
> >
> > $ make ARCH=arm64 LLVM=1
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I am still not really sure how I feel about this. I would prefer not to
> break people's builds but I suppose this is inevitabile eventually.
>
> A little support matrix that I drafted up where based on ARCH and clang
> version for LLVM_IAS=1 support:
>
>              | 10.x | 11.x | 12.x | 13.x | 14.x |
> ARCH=arm     |  NO  |  NO  |  NO  |  YES |  YES |
> ARCH=arm64   |  NO  |  YES |  YES |  YES |  YES |
> ARCH=i386    |  YES |  YES |  YES |  YES |  YES |
> ARCH=mips*   |  YES |  YES |  YES |  YES |  YES |
> ARCH=powerpc |  NO  |  NO  |  NO  |  NO  |  NO  |
> ARCH=s390    |  NO  |  NO  |  NO  |  NO  |  NO  |
> ARCH=x86_64  |  NO  |  YES |  YES |  YES |  YES |
>
> The main issue that I have with this change is that all of these
> architectures work fine with CC=clang and their build commands that used
> to work fine will not with this change, as they will have to specify
> LLVM_IAS=0. I think that making this change for LLVM=1 makes sense but
> changing the default for just CC=clang feels like a bit much at this
> point in time. I would love to hear from others on this though, I am not
> going to object much further than this.
>
> Regardless of that concern, this patch does what it says so:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>


Applied to linux-kbuild.
Thanks.


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
