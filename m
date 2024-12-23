Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4FEE77188
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 02:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sj4jTRToG8hOei65H/SkQJWVBVyw2Gm7GjKqrWrQoRU=; b=4NWlDQhKCoQD7t
	oDyWsbUcff1B65yxMFxau/zvbSkbBbVszockhVPuPPNr9nUbuU4Jtq1heyEvQ19dsik1fEEFC9S1i
	x28jmXQsap4e2pNflFSZxDcr0E1LituxN6MQWsQltmRVNUa8856Gr9vgT3a+dSQMsfOxUx2QlSoJd
	Enh50wl98045OVcbgzphqOBxct8KzQ788xfOJgwQLA35mUiVq84CtkgA1y09lHE+gC7y9h3iKNnX5
	wmJZ70kek+/y/tM1pEzVXH9wvjl9jTKz4/QrlH3neICr8XSG5TQCOChV9C57Gq9VfCQ+uZ3WGqeDp
	eoWIvpa5Igqy3pG14aMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY1a-000000098oT-2wy2;
	Mon, 23 Dec 2024 02:18:26 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY0Z-000000098d4-2c5B
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 02:17:24 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5f2da12248fso2356466eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Dec 2024 18:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734920242; x=1735525042; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W8Z8lmmwR8uvxSP9AWR+3lYFC2EvS9zFcprUPj/Bjjc=;
        b=Vbt/AXiFb5/++4oafwE6L1SH624aWd8bYj6XL3Bl79rcqUm/9VuWtfrzbznIV95UPK
         vtsNYWYDcQ36feRk6L1l3v2iztcOmKuRTnZYT5X2hDbdxPJ2Q+Na88OFiBLufupDyI1R
         EhINtnYeloJlk/3LkuV6Koy80jCaVInIAkJ0p0QdWYJw54wYC7F7rK7n1txGp9BR/pDo
         rlNKCUbWAX/jLbD/k3lJiRl1TU/pvm00qxzECwvaVcqMtgxsbYWtyNllVfB9z/xlHtq9
         Lduh4QX7x4Gfn4qjeKK+28mAbVIY42Hfjsf+bPf/JDKTgWQ7lrovDZnX/Rure1T4ACBA
         Biww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734920242; x=1735525042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8Z8lmmwR8uvxSP9AWR+3lYFC2EvS9zFcprUPj/Bjjc=;
        b=GvOXW/al+dk69SmhYZqhdPTGNqybrR4kLzuHpfmYqq2UZJV4c03Oua/sap+wRA0NP/
         GPdYXhz3AQQmWDJutNmxJvK9f1G8WNW8o63lCo+NVrKRBu0q/pOY70w3GX/Xwjd6nDzi
         81g0nBtyo77nkhaWyDgfXaeh/Ayqjnqt5wteM4rr0CeXrWv+jv907WeHPlg4mQl1U5v/
         iB+axiz6wBLCNW3x9a9B4WASwNGW9Ihr7hGhyt1EvDV3lATwxkPnRgNTzlkrZmLtvyK5
         HWxHZJGzsUDlegPAEYoKBLbpFGbqIO6lKBV2mZZTgK0FSsjcBvbJxLFEBElsv1HDD5v5
         0/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVcqNi2e2AdruAI6DjmKOZAZxzSvpL8T8ycJ2BCpo2oktDpzPZNfXkuGsVAZH/m/QLIu5qgXyWQ6naIEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw146trBO8UNiIJE+feoLsV3O8Mw2VvvZp5KejYEUlxbOQgD5w4
	4KKRl/3D3qAXZ8uWDe5nc5hgkrevYmc2F0soN/dC2bQzQm8voKvVA7eIgnprjvt6b30Lvm+hgxB
	p5eUWvjzv4+H66SsynnUfHaDuKyI=
X-Gm-Gg: ASbGncvI7M6QzDgnBqic/Jy7sut0l1+XMEH2xKf+ARXz7Cz+YvqeP+ZuYB3G6botrwD
	UPMfKpVzpfHbXDwL2YLy53XxaqGo+LywpGJ/KN+Lunk8+u+xPhz5oLaUkusx+HhFWZSJYvQ==
X-Google-Smtp-Source: AGHT+IHrAiva6+861CNkYIYsWDV0r177Tfu+s274YXCQb4sRs+JgfStLdAgVU1KibB4pbKVN+AhiTYfQNt+u7nv5bMk=
X-Received: by 2002:a05:6870:5686:b0:29d:ccd5:16f0 with SMTP id
 586e51a60fabf-2a7fcd5bc8cmr6625539fac.20.1734920242345; Sun, 22 Dec 2024
 18:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20241220114023.667347-1-zhangchunyan@iscas.ac.cn>
 <20241220-chaste-mundane-5514462147b6@spud> <CAAfSe-tT7f3to0CPyF-DK09E+NNwN+tRpmuNwtTqbe3=_y3sFg@mail.gmail.com>
 <20241223-bunch-deceased-33c10c5b3dc4@spud>
In-Reply-To: <20241223-bunch-deceased-33c10c5b3dc4@spud>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 23 Dec 2024 10:16:46 +0800
Message-ID: <CAAfSe-sPBHY_AUCksMj2qxHi2PchWpkV4JH0DzXF56Kvpwm0bg@mail.gmail.com>
Subject: Re: [RFC PATCH] raid6: Add RISC-V SIMD syndrome and recovery calculations
To: Conor Dooley <conor@kernel.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org, 
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_181723_693897_E89E1D9A 
X-CRM114-Status: GOOD (  28.41  )
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

On Mon, 23 Dec 2024 at 09:35, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Dec 23, 2024 at 09:16:38AM +0800, Chunyan Zhang wrote:
> > Hi Conor,
> >
> > On Sat, 21 Dec 2024 at 06:52, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Fri, Dec 20, 2024 at 07:40:23PM +0800, Chunyan Zhang wrote:
> > > > The assembly is originally based on the ARM NEON and int.uc, but uses
> > > > RISC-V vector instructions to implement the RAID6 syndrome and
> > > > recovery calculations.
> > > >
> > > > The functions are tested on QEMU.
> > > >
> > > > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > > > ---
> > > >  include/linux/raid/pq.h |   4 +
> > > >  lib/raid6/Makefile      |   3 +
> > > >  lib/raid6/algos.c       |   8 +
> > > >  lib/raid6/recov_rvv.c   | 229 +++++++++++++
> > > >  lib/raid6/rvv.c         | 715 ++++++++++++++++++++++++++++++++++++++++
> > > >  5 files changed, 959 insertions(+)
> > > >  create mode 100644 lib/raid6/recov_rvv.c
> > > >  create mode 100644 lib/raid6/rvv.c
> > > >
> > > > diff --git a/include/linux/raid/pq.h b/include/linux/raid/pq.h
> > > > index 98030accf641..4c21f06c662a 100644
> > > > --- a/include/linux/raid/pq.h
> > > > +++ b/include/linux/raid/pq.h
> > > > @@ -108,6 +108,9 @@ extern const struct raid6_calls raid6_vpermxor4;
> > > >  extern const struct raid6_calls raid6_vpermxor8;
> > > >  extern const struct raid6_calls raid6_lsx;
> > > >  extern const struct raid6_calls raid6_lasx;
> > > > +extern const struct raid6_calls raid6_rvvx1;
> > > > +extern const struct raid6_calls raid6_rvvx2;
> > > > +extern const struct raid6_calls raid6_rvvx4;
> > > >
> > > >  struct raid6_recov_calls {
> > > >       void (*data2)(int, size_t, int, int, void **);
> > > > @@ -125,6 +128,7 @@ extern const struct raid6_recov_calls raid6_recov_s390xc;
> > > >  extern const struct raid6_recov_calls raid6_recov_neon;
> > > >  extern const struct raid6_recov_calls raid6_recov_lsx;
> > > >  extern const struct raid6_recov_calls raid6_recov_lasx;
> > > > +extern const struct raid6_recov_calls raid6_recov_rvv;
> > > >
> > > >  extern const struct raid6_calls raid6_neonx1;
> > > >  extern const struct raid6_calls raid6_neonx2;
> > > > diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> > > > index 29127dd05d63..e62fb7cd773e 100644
> > > > --- a/lib/raid6/Makefile
> > > > +++ b/lib/raid6/Makefile
> > > > @@ -10,6 +10,9 @@ raid6_pq-$(CONFIG_ALTIVEC) += altivec1.o altivec2.o altivec4.o altivec8.o \
> > > >  raid6_pq-$(CONFIG_KERNEL_MODE_NEON) += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
> > > >  raid6_pq-$(CONFIG_S390) += s390vx8.o recov_s390xc.o
> > > >  raid6_pq-$(CONFIG_LOONGARCH) += loongarch_simd.o recov_loongarch_simd.o
> > > > +raid6_pq-$(CONFIG_RISCV_ISA_V) += rvv.o recov_rvv.o
> > > > +CFLAGS_rvv.o += -march=rv64gcv
> > > > +CFLAGS_recov_rvv.o += -march=rv64gcv
> > >
> > > I'm curious - why do you need this when you're using .option arch,+v
> > > below?
> >
> > Compiler would complain the errors like below without this flag:
> >
> > Error: unrecognized opcode `vle8.v v0,(a3)', extension `v' or `zve64x'
> > or `zve32x' required
>
> Right, but the reason for using .option arch,+v elsewhere in the kernel
> is because we don't want the compiler to generate vector code at all,
> and the directive lets the assembler handle the vector instructions. If
> I recall correctly, the error you pasted above is from the assembler,

Yes, it is from the assembler.

> not the compiler. You should be able to just set AFLAGS, given that all

It complains the same errors after simply replacing CFLAGS with AFLAGS
here. What am I missing?

Thanks,
Chunyan

> of the vector code you're adding is hand written as far as I can see.
>
> > > >  hostprogs    += mktables
> > > >
> > > > diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
> > > > index cd2e88ee1f14..0a388a605131 100644
> > > > --- a/lib/raid6/algos.c
> > > > +++ b/lib/raid6/algos.c
> > > > @@ -80,6 +80,11 @@ const struct raid6_calls * const raid6_algos[] = {
> > > >  #ifdef CONFIG_CPU_HAS_LSX
> > > >       &raid6_lsx,
> > > >  #endif
> > > > +#endif
> > > > +#ifdef CONFIG_RISCV_ISA_V
> > > > +     &raid6_rvvx1,
> > > > +     &raid6_rvvx2,
> > > > +     &raid6_rvvx4,
> > > >  #endif
> > > >       &raid6_intx8,
> > > >       &raid6_intx4,
> > > > @@ -115,6 +120,9 @@ const struct raid6_recov_calls *const raid6_recov_algos[] = {
> > > >  #ifdef CONFIG_CPU_HAS_LSX
> > > >       &raid6_recov_lsx,
> > > >  #endif
> > > > +#endif
> > > > +#ifdef CONFIG_RISCV_ISA_V
> > > > +     &raid6_recov_rvv,
> > > >  #endif
> > > >       &raid6_recov_intx1,
> > > >       NULL
> > > > diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
> > > > new file mode 100644
> > > > index 000000000000..8ae74803ea7f
> > > > --- /dev/null
> > > > +++ b/lib/raid6/recov_rvv.c
> > > > @@ -0,0 +1,229 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright 2024 Institute of Software, CAS.
> > > > + * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > > > + */
> > > > +
> > > > +#include <asm/simd.h>
> > > > +#include <asm/vector.h>
> > > > +#include <crypto/internal/simd.h>
> > > > +#include <linux/raid/pq.h>
> > > > +
> > > > +static void __raid6_2data_recov_rvv(int bytes, u8 *p, u8 *q, u8 *dp,
> > > > +                           u8 *dq, const u8 *pbmul,
> > > > +                           const u8 *qmul)
> > > > +{
> > > > +     asm volatile (
> > > > +             ".option        push\n"
> > > > +             ".option        arch,+v\n"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
