Return-Path: <SRS0=1JfK=DV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40F9C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2020 05:25:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C809214D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2020 05:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7yozeqS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Yf93tejX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C809214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EUUYE+LkpZfxu2cIS/aXzmi0qSpnCy1kAdOV5NL8maw=; b=U7yozeqSYAenUrOxzLeEI2Sjo
	/JCUaj5poIi2UWT4wAPnVhmlIXJ4626w9ZkqrP3TiWo3Lz3lEjZIHFHkTlcWFBd2WsxtD6vm12nAx
	6fkRB+B+A34gqXTeuWh0wwgJ/O7i3GVurrvGnJSd6EuxKq6XuuWjxktaaC1UPaOCO1RFuhe+nLA85
	Yvqs/yrQZ0q4Qw6qi5/gik21Z9rAKMwxQYWz8W4s/nxKJ/L86fPIiQ7WJb1eQWLpRm/XKi2hsNSyK
	9e4x7/PNDSM28DCVOd86OCeqfrQwX9xgGBplJELVabCbr1GWjS80Iju1OEW2UXzwBnCwr1Ea/fh3n
	6HTGl2EjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSZHe-0007x6-VI; Wed, 14 Oct 2020 05:25:06 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSZHc-0007w3-Hc
 for linux-riscv@lists.infradead.org; Wed, 14 Oct 2020 05:25:05 +0000
Received: by mail-il1-x141.google.com with SMTP id p16so3779464ilq.5
 for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2020 22:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HalJUEgFIroij+eVjjsAaxpPGCzHis17qTK2euMmLBY=;
 b=Yf93tejX2acPPVAbX3fnj9NQ+N4grno48CwAjUD2YEfuAK8dXqW7uVhkBgvOXsaRng
 2oWEHB+FYe0fJogNf8rlXPfWs4AjufA9G4rrbELfmtk0hPm0XX7c3DWLOXiNiBZYLlpT
 lv4ka4i0CCQSHRxSKjbcQeKWaxNbAdvUceJBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HalJUEgFIroij+eVjjsAaxpPGCzHis17qTK2euMmLBY=;
 b=Rmbaev/6kxQcfAQtNGral53tKVslXk0GNxMtgbGcaVhgfUG6j5yvMNnjXist1d8SXj
 W4ABhhCft6buMbSG4xBSz6gFdi7Ubw+TOx4gm/sb6waISy2dJ96nsGo4MOyQ6Si12L8t
 tZA6ymImR0LqTXOA4lo9ROkDxVNHte2o/romEkzTJHsuLuzUZfNHtCvTsKB4leMGlxwL
 ZU7ts9BMWrznvrg2V4X3X76pfcIfZQqkuiwLLaO4Sgz97gF3dD5HfbnF3jJPdomXIzKz
 B6SSXfw48HLnw9G5XX+RPo9QIzqjXeSM3KEF4rTDszLZh/BqrfiPor3N526nfUJdd0ip
 RztQ==
X-Gm-Message-State: AOAM5304yQUG4gP+0Cb3ON4KyCZcuWgPRLgnHEi+rakgZPD/Gjkp46xu
 q2j4XRbchteX+3BKKfDo6ZOSd35IMfNdNu2RNeBq
X-Google-Smtp-Source: ABdhPJwf5ma2+TlQJuxWd0JmN6mHEFluk9xAS3AZTnyBzNZQxJhicG5AlpYDoDF2Efr0i5KblnAPSIvNbm5CBVdBb7E=
X-Received: by 2002:a92:91db:: with SMTP id e88mr2506931ill.126.1602653100856; 
 Tue, 13 Oct 2020 22:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201009211344.2358688-1-atish.patra@wdc.com>
 <20201009211344.2358688-5-atish.patra@wdc.com>
 <CAHCEehJvMv=CYD1+QXb0uB36Hv4pvO36BAKSLOcxTXvmADZFbA@mail.gmail.com>
 <CAOnJCUKPjkm_=5eHn6=GjVGr67okZkVzqP7-ciphn986BQoc9w@mail.gmail.com>
 <CAOnJCULZMRu+sHmnjoBwtvaB3BjmCiZLzYxNOeWZmoYLKG+wTw@mail.gmail.com>
 <CAHCEehJJmLQ6W5AdH+hEZSJxpDC8HG0UN=EGt9M0Tp5NTfQnaw@mail.gmail.com>
 <CAOnJCUJN-XMZ+N5w+RbVhJag9D_dey7DAopb0Q35GDfXptyMjA@mail.gmail.com>
 <CAFyWVaYORWYZTXyXOWiY6xK-SFTvsUxDNDqKQnhVUwzc5N045Q@mail.gmail.com>
In-Reply-To: <CAFyWVaYORWYZTXyXOWiY6xK-SFTvsUxDNDqKQnhVUwzc5N045Q@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 13 Oct 2020 22:24:49 -0700
Message-ID: <CAOnJCU+3xFyFW4ATCdYAv5zVyBSLE0mTevrJLCXW7HDgy4D4EQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: Protect .init.text & .init.data
To: Jim Wilson <jimw@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_012504_717192_90C54EB1 
X-CRM114-Status: GOOD (  20.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>,
 Kito Cheng <kito.cheng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 6:21 PM Jim Wilson <jimw@sifive.com> wrote:
>
> On Tue, Oct 13, 2020 at 3:25 PM Atish Patra <atishp@atishpatra.org> wrote:
> > This happens only when copy_from_user is called from function that is
> > annotated with __init.
> > Adding Kito & Jim for their input
> >
> > @kito, @Jim: Please let me know if I should create a issue in
> > riscv-gnu-toolchain repo or somewhere else.
>
> I can't do anything useful without a testcase that I can use to
> reproduce the problem.  The interactions here are complex, so pointing
> at lines of code or kernel config options doesn't give me any useful
> info.
>
> Relaxation can convert calls to a jal.  I don't know of any open bugs
> in this area that can generate relocation errors.  if it is a
> relaxation error then turning off relaxation should work around the
> problem as you suggested.
>
> A kernel build problem is serious.  I think this is worth a bug
> report.  FSF binutils or riscv-gnu-toolchain is fine.
>

I have created an issue with detailed descriptions and reproduction steps.
Please let me know if you need anything else.

> Jim



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
