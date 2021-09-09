Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8FBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 11:01:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B6B61131
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 11:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B6B61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WS3xDFps5GfpsWQk48zF4GUtU3sZ5qcmD5GcqVUEcj4=; b=EghkfO0VO3RDQ0
	LMPk8UbKpmjXPlYFMwZeXc+KAUYhUq2NHU7CDwXWVnrrpjULdbHAS6+lgZDl9fgyNwWcq3Zc+c2eW
	dvM3V53rekTVyiaUGQr3+zhlCEFRXIFyWkJ80yEFeMrgcNznrIdHZQA2cL53zYFBKf9XDoAoFM66L
	EQ71DTyROfOkIZ7Q16eqWeVVJWm9SljQfunnlvJS5JhfrSc8zgdfmj/KunZqVffahrIdOD3ERyYpd
	hH76YVcEK2zPFRRrsW6hHcYyZAHzg7g2du5zUepFoCCobNhL7eT5iDBGdYogyxAr6vEUpAkDWPMN/
	Gz65KOMSgatjMLkUtLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOHnT-008yji-JM; Thu, 09 Sep 2021 11:00:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOHnR-008yjC-2j
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 11:00:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FE336115A
 for <linux-riscv@lists.infradead.org>; Thu,  9 Sep 2021 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631185243;
 bh=q0jaemKaNpxivtuHJVN3sxGi68MjVqL99mYlZXXeAZI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hHJKoNgkH8/igA8mIRS3lIuUeTLXcTZC+1DSY6sOpt50Cc3WpwUTvTnh/1FPRRi8r
 0Vs7f5vHfPoSG+fzyOuQDSrOnhcMNDF8ii4p0MHgdNIXgvwypuYO5MY8dXdOhWgNJO
 l41W2CHOYhIN7rTDJmhNdndV8iDc0k+71EnPXb4Hkxztk3ElYZlZZxS90P/9j7eX1A
 MTYrG7IPALgtwsZEPstcM/v9XSp1C68Dl2rC+4P4ZfEIaVaRPKNHRQHlovAPeodguH
 xTNQKbeXBfcqmwbLhkZj73EII8d3PTV+SM+lRFKaQxWFUDb4OD+t6maZjm1zDAHEBj
 FX9aW8KR4x/wA==
Received: by mail-wm1-f52.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1063695wms.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 04:00:43 -0700 (PDT)
X-Gm-Message-State: AOAM533Y9lqcwM8DHAz3w0QWfQXdNPSjlrnFWLuIvtkuU1McVzo5JRvy
 f6FfjX3HVgFRMXCtc3ik2QvU/y2y/aCoXgZXhNY=
X-Google-Smtp-Source: ABdhPJzXwyBVTWsO83az+CnqYKTmuJ+96XVP1jSzK/fPZCcrRA2zux6YoBG2oM4L6KntsYaUUUA2GKpxx8IgphoRzAg=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr2344349wmf.82.1631185241984; 
 Thu, 09 Sep 2021 04:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
 <CANpmjNNCVu8uyn=8=5_8rLeKM5t3h7-KzVg1aCJASxF8u_6tEQ@mail.gmail.com>
In-Reply-To: <CANpmjNNCVu8uyn=8=5_8rLeKM5t3h7-KzVg1aCJASxF8u_6tEQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 9 Sep 2021 13:00:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1W-13f-qCykaaAiXAr+P_F+VhjsU-9Uu=kTPUeB4b26Q@mail.gmail.com>
Message-ID: <CAK8P3a1W-13f-qCykaaAiXAr+P_F+VhjsU-9Uu=kTPUeB4b26Q@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Marco Elver <elver@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, Guenter Roeck <linux@roeck-us.net>, 
 Nathan Chancellor <nathan@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
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
X-CRM114-CacheID: sfid-20210909_040045_167079_0FCEFFE4 
X-CRM114-Status: GOOD (  21.07  )
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

On Thu, Sep 9, 2021 at 12:54 PM Marco Elver <elver@google.com> wrote:
> On Thu, 9 Sept 2021 at 07:59, Christoph Hellwig <hch@infradead.org> wrote:
> > On Wed, Sep 08, 2021 at 11:58:56PM +0200, Marco Elver wrote:
> > > It'd be good to avoid. It has helped uncover build issues with KASAN in
> > > the past. Or at least make it dependent on the problematic architecture.
> > > For example if arm is a problem, something like this:
> >
> > I'm also seeing quite a few stack size warnings with KASAN on x86_64
> > without COMPILT_TEST using gcc 10.2.1 from Debian.  In fact there are a
> > few warnings without KASAN, but with KASAN there are a lot more.
> > I'll try to find some time to dig into them.
>
> Right, this reminded me that we actually at least double the real
> stack size for KASAN builds, because it inherently requires more stack
> space. I think we need Wframe-larger-than to match that, otherwise
> we'll just keep having this problem:
>
> https://lkml.kernel.org/r/20210909104925.809674-1-elver@google.com

The problem with this is that it completely defeats the point of the
stack size warnings in allmodconfig kernels when they have KASAN
enabled and end up missing obvious code bugs in drivers that put
large structures on the stack. Let's not go there.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
