Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340C9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA9g5mtYQ3lVv7ge53g/oGUpDxFfBWLSJGbHiYzvU1k=; b=nhoJk+xY+9D55u
	NKUvGyb3weMG1ebVfkBQI/QTzxLImkneItVZHqTFOTnnyl84Om7tfT6HKu7Aon6j3RtHxZ+R/WgM1
	sGGa/3v8Hlw2M1gzyAn9l8siEmO26hqS0JHeytkUi/j75wqbGPaalmW/C24uqTxQGeSWBkROYt9uM
	jwu+vfMrp7QvpGBjt/P9FgGaKdohMUIGARIa2IlknyY9lbR5Bs7ZzIgRShrBniA4YzmTYUMajE1oP
	XDUsK+0QUojIFOveJ/We0xj945r9w8W0GD+FeXPwGxbv3YN60ThEATdUz3WofWQPVKwB6n4k/Nd6g
	/nTUJHz84bcK1qTiDjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAXbx-00Bk7P-8E; Thu, 20 Jan 2022 13:36:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAXbl-00Bk4C-3i; Thu, 20 Jan 2022 13:36:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61DAB61766;
 Thu, 20 Jan 2022 13:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1ECDC36AE3;
 Thu, 20 Jan 2022 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642685767;
 bh=6jJqCWRTzzUUFc2Awke9IkkPGC7X5zNsQTSVKll9PUQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f6do9cXfKBIhavH9kot/9wsjq2yObe2lT7dMc1dGUr3hFaIHULRpc6Im9hBAIcisC
 eDekM99GYajIpqxj6pk3pf8POql1UVa55NAT7X5tjRFB9UsnxZslxCWB5WZWqBDVJr
 8gDeXdyIroIlE//1234wZAOr1J5PAF//PpO/tp0C8PN9cs8JcSeKYxBJeAO+fJX5f8
 Zzw9mWQdJHl7vQGGXNGqTETTdXAZvSS2AkRWCFWvBQVfO4iJLfOUyeTYEfGr+VvXtZ
 KkebSvrN6+FTyVOToFkMm3YZrKZfFcQi9tF8PdPBl3l8R5P30PQMDQ75SGyfnZ8nsJ
 hG4QcSP3+PQvg==
Received: by mail-ua1-f53.google.com with SMTP id r15so10870910uao.3;
 Thu, 20 Jan 2022 05:36:07 -0800 (PST)
X-Gm-Message-State: AOAM530gRgpMB2P7In2KxsPARSojKBcuNeITwtTGjlYQxikISpq9qgt8
 gccXn8BE1CVbr/FQpYJ0tMdoWOPyR9IAiFo/DI8=
X-Google-Smtp-Source: ABdhPJwONmW1aazI1eCt0g+A2J9M0/Dq8pC6p8K0QjKcU/9jXkiBA8g9Bq8N9trIX7DU0e3r8/DVXgSoIzqqFr0N4e8=
X-Received: by 2002:a05:6102:34ec:: with SMTP id
 bi12mr12309550vsb.51.1642685766798; 
 Thu, 20 Jan 2022 05:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-11-guoren@kernel.org>
 <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
In-Reply-To: <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:35:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQnrCS1X6KQt0pbNFc01sYgBDgfb9RGT1G=rTEGK1mbRQ@mail.gmail.com>
Message-ID: <CAJF2gTQnrCS1X6KQt0pbNFc01sYgBDgfb9RGT1G=rTEGK1mbRQ@mail.gmail.com>
Subject: Re: [PATCH V3 10/17] riscv: compat: Add elf.h implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_053609_254122_00B617C6 
X-CRM114-Status: GOOD (  17.24  )
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

On Thu, Jan 20, 2022 at 9:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement necessary type and macro for compat elf. See the code
> > comment for detail.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> > +
> > +/*
> > + * FIXME: not sure SET_PERSONALITY for compat process is right!
> > + */
> > +#define SET_PERSONALITY(ex)                                    \
> > +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)              \
> > +               set_thread_flag(TIF_32BIT);                     \
> > +       else                                                    \
> > +               clear_thread_flag(TIF_32BIT);                   \
> > +       if (personality(current->personality) != PER_LINUX32)   \
> > +               set_personality(PER_LINUX |                     \
> > +                       (current->personality & (~PER_MASK)));  \
> > +} while (0)
> > +
>
> The implementation looks good to me now,  you can remove that comment above it.
Thx for pointing it out. I forgot.

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
