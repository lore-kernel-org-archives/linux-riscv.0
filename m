Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33CEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 16:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C106961100
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 16:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C106961100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lm7eI2V3ZWvwNLqTL2IB5ZLydKOkHZyvgVi5g5gwPsc=; b=ZX7/bl5OtQHAPS
	KxAyp7vK8f0ENvYrdH7MkrIoDzVAkoWwvcwK8L69K/CADOwic2hk8bxxB6+34+FCnL9v11uuHHAPm
	8gHy6n2BsMgtFdvv2TH0NhjCiLjf07S6AqRIMy2Pux0clk9vUAYypvz+3KqsQLwlcjUo1dL+IrAEw
	MyrwZir4KmDfJHvgmsnBSRBydOfqfWSLBo4ScywO6J9F52FRcDuS+xpRb75pzTIbNbrmdLcEk8Bw+
	fLLGqx7gSXmKARMvexkMA3s3VxOKYDJ+9MeGySJVA8Kttq7rnNmsSTNAhI2Ao6An8YETI1qJfLAMO
	HFmeHoYKRYA2Y4mDlovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mONCL-00AOEp-Ls; Thu, 09 Sep 2021 16:46:49 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mONCI-00AODh-El
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 16:46:47 +0000
Received: by mail-lj1-x229.google.com with SMTP id s12so4029289ljg.0
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6u9UXBJqq0DvpwbwzhX2UgLgOMc73mPLE0iuNkQUyLg=;
 b=c3sO1BQBDxCW8APZUbAlW9nwWGjPxn+LQp0JgfliDLXRZzDRVo3j7/1R4pPWKE+xNx
 UbgmU4XAmaM891Bx14LElamvax9VI3JEUCFywjuYbWwv0nvT93I+fRhltOoT4VSe8vnz
 QPRBUEbBxEv21a9fqhAw650AWuxptlmMiPwqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6u9UXBJqq0DvpwbwzhX2UgLgOMc73mPLE0iuNkQUyLg=;
 b=ScgRy9t8Zw3f5Ruh2kDizcBIr0BKIJRHajxXrYx1FuOMMtLUtLbh+oUU8GRFjhLSQP
 uhoS3Ph31JDELalvcWHfQ9w52bqmzeWDTVKGRtkzPzCDe5GaEzCbrhC4pbQ2dABb1Xb3
 Qu2z9p+0INZgWJAzsqX2bsjY7MvSSzXu+UN9y/Ge8n/Myqk9f3wqAPU4YjgwmV0GNIk6
 aDhQRR7BshV4JjfKZafsn6aOHiB9uU5GIf55aTeIvHxSqCS+1yo6t+ZrKRaKI8Q7dfdI
 3emTKwh5Zk5bYjbwmipKvla57oqFgXghvzdjNVYomJjY1nOqFtPiyoOUslKrG64IWajI
 iAjA==
X-Gm-Message-State: AOAM530VPhuKLo1wA571yVTr79g5kWa3TsQlwxmKuvDBpEyMi1zFL+ge
 6IdtJs6HiP6DY1/IHdMzq6OQO6TM4/O2fkFvwL8=
X-Google-Smtp-Source: ABdhPJwnsILDLI9ET3nwuw/mIqAuIuw7+B6o3RA3+GGVGhURKO5qpgGSyJxSz/CZdMMu1lwS2YoTjQ==
X-Received: by 2002:a2e:9010:: with SMTP id h16mr670230ljg.484.1631206003909; 
 Thu, 09 Sep 2021 09:46:43 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id p7sm254786ljn.79.2021.09.09.09.46.41
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 09:46:41 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id h16so4909320lfk.10
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 09:46:41 -0700 (PDT)
X-Received: by 2002:a05:6512:1112:: with SMTP id
 l18mr609222lfg.402.1631206001151; 
 Thu, 09 Sep 2021 09:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
In-Reply-To: <YTmidYBdchAv/vpS@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Sep 2021 09:46:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whsicuPaicXWh5je6unQYRKwoazuNLzB-9PRXpSY3CZ-g@mail.gmail.com>
Message-ID: <CAHk-=whsicuPaicXWh5je6unQYRKwoazuNLzB-9PRXpSY3CZ-g@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Christoph Hellwig <hch@infradead.org>
Cc: Marco Elver <elver@google.com>, Guenter Roeck <linux@roeck-us.net>, 
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_094646_571992_7495D31E 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, Sep 8, 2021 at 10:59 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> While we're at it, with -Werror something like this is really futile:

Yeah, I'm thinking we could do

 -Wno-error=cpp

to at least allow the cpp warnings to come through without being fatal.

Because while they can be annoying too, they are most definitely under
our direct control, so..

I didn't actually test that, but I think it should work.

That said, maybe they should just be removed. They might be better off
just as Kconfig rules, rather than as a "hey, you screwed up your
Kconfig" warning after the fact.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
