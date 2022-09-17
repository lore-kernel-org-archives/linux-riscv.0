Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDEECAAD8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 01:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O6YTn4YjHHq/RPOu2/VeeBl/z7ebxhNMgiYbs0KT9c=; b=s4irZpseOIoeKY
	gq3OKcRLEbVoYN/UYoBHRn2hrCvVA07yIjlSEr+N76kWWW9/DF4lf9ibBQddghKVxW1Ax/J9t9LsL
	sZ64JCt8x/693Z3QEs76zKzQTRn8Et7wK4BsWZzw+coJhNLX7LweUPKImW7cpOV33iS0RduDc+XHd
	TaCH/b70I99X32iEu8uOTRUBxFu8czjaA86qsVcV2TahiOhAOAt2ikauw44qlaWgnspyIA8ipL/Sy
	51MhDU31Np3Y9HsDs2NkQXlAoESqdmYBwJNs2mYHxi2OiZwqODSpi6am02RXvcnHeatqGiBTnsSkY
	nRyz8HaCoaV/mlWiy70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZMRD-001I6S-AW; Sat, 17 Sep 2022 01:16:07 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZMR8-001I3T-79
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 01:16:05 +0000
Received: by mail-oi1-x22a.google.com with SMTP id w125so8119319oig.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wYzAJ7rIu/g48TunCZ7ufoMnGrFpybJVeZPydgRaVcE=;
        b=cMA06hYloRMoo+33SCKgwFXE+e+wuxl/AboopY61Kdu78u2oB8Zjjt6mwmfNvyORP8
         AHWBVnmrqM4C3KFMGbcSjGW2FbWd4HNW5tZX6o9ZOxDBkemKMcocpwv6Soh3hEsmOpuk
         THvkJVEQI9NW2KgcII2AhKL7P2vkTtoju/dLD/QgmlW49gBmZqjPIGRorAU9euAfVXaL
         Csl2YGR02kz8dfzFQiroVWlxQ0zqoFPhGDtE9Rv48IgIjCPJ3rjJnusQYNt/HJTNyE7d
         AxjyOcZp3pBkJFfkrF2Nlppd1q3xCbF/28NORS0d5BxAQXrk81A0im2fZo8fh3LlyXof
         lblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wYzAJ7rIu/g48TunCZ7ufoMnGrFpybJVeZPydgRaVcE=;
        b=qzVgQ1M92e4jFv18rARp7F1qxHEzTu3YFdgCXAY0Zu7YeKB+onGhlL2PjWKgqKF4cQ
         QXss0pe4l6uKMuAeDyBXaMkp3WWUWK5JIjCec4C1ah8jkNvOcgpnYF4RECwfOAeZ0hRY
         4RBXkoCO3QNPR6wwNXu0DsQelm6NTK+ons8UrppqGSgukAmCzWonCZyuXWqDr4VbRULL
         19sze1DEZa8TSOngESUPESL1jEf2aJAjj5z2RxK4Nh7/hiOqxb8pqIgnOHSQZpgrey3L
         19JQvAmP0MwHikzNrTLgs9Ytu+fHHvLOBl01B2loEkIyGnphHYRhjcwMU3nm/lVZCAew
         ZNYw==
X-Gm-Message-State: ACrzQf3uBzVfEeKB7wCF3swczTay3wF/OD6iWn00CvpshrI38xVwAeel
	7tb+LYk3BQ8U/8htnYp+wRjKGFQ8FXHUMYhBq05JfQ==
X-Google-Smtp-Source: AMsMyM78DYFMYuL7bDm1bKZYvjzpBYpK+BX6gfNpZqZEhAEQ6MeJGsWJ0v4fwnntfXvTh3W4LbT3ggRidm8DZ5tEsDQ=
X-Received: by 2002:a05:6808:49:b0:350:77ce:3368 with SMTP id
 v9-20020a056808004900b0035077ce3368mr940053oic.195.1663377360884; Fri, 16 Sep
 2022 18:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-2-andy.chiu@sifive.com> <CAJF2gTT8+TWFoP6pUPOHOLWFXg-5N0U3jDYvqAp_sO+qgqS5Ow@mail.gmail.com>
In-Reply-To: <CAJF2gTT8+TWFoP6pUPOHOLWFXg-5N0U3jDYvqAp_sO+qgqS5Ow@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 17 Sep 2022 02:15:48 +0100
Message-ID: <CABgGipWD0_cxf6=gTpnc-1YvVMAF-ghyr1EZYULioo0GYZLtRQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 1/5] riscv: align ftrace to 4 Byte
 boundary and increase ftrace prologue size
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org, Kito Cheng <kito.cheng@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_181602_361505_CC332A39 
X-CRM114-Status: GOOD (  21.48  )
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

On Thu, Sep 15, 2022 at 2:54 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > However, we found the -falign-functions alone was not strong enoungh to
> > make all functions align as required. In fact, cold functions are not
> > aligned after turning on optimizations. We consider this is a bug in GCC
> > and turn off guess-branch-probility as a workaround to align all
> > functions.
> Disable pgo static optimization would reduce the code performance. I
> think we need to fix that problem in GCC, and pgo is a default-enabled
> optimization.
I would like to see this fix in GCC as well. Or the other way is to
reserve extra bytes (like, 2 bytes) and pick an aligned address in
software.
> >
> > GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345
> >
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> >  arch/riscv/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 3fa8ef336822..fd8069f59a59 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
> >  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
> >         LDFLAGS_vmlinux := --no-relax
> >         KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> > -       CC_FLAGS_FTRACE := -fpatchable-function-entry=8
> > +       CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4 -fno-guess-branch-probability
> Another fixup should be covered, eg:
>
> +ifeq ($(CONFIG_RISCV_ISA_C),y)
> +       CC_FLAGS_FTRACE := -fpatchable-function-entry=12
> +else
> +       CC_FLAGS_FTRACE := -fpatchable-function-entry=6
> +endif
>
Thanks for reminding. Yes, we have to do that.

Regards,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
