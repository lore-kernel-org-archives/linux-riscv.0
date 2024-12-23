Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B358BE77188
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKK0B3qlX7esq8TmqAqnvOAin0pz946cL7ot7n2zqxk=; b=z1ygq07NbId5CT
	ye08t9aqUQcCdTlqgx/raMwwXgejIr9rqvdFM097h4oWqxKDzNWeQe1nQEZfzHdm7PkNxHhSYkNGs
	AEmQWbkKY4JShHJxzyVY/jqf/37LDQufO7hxEY88onYCBYG0Xt7++19IRJ1J1VKyjIR42E6VBxnjr
	H2VPUMQQREmmApPZXm3G5t2OYXVb+lEiikS3XSkEOTNWNpKcYAnXWGCbceLKttxlkTTAjt1OiMH1P
	w9Hkq4Xq5jDYq0FXAdAzcL0tzDT0N8CIUcMP6JixpCU6GsNSx1LH1jQITd4r0VF38vFIUrHfDb6OY
	L5XUL4tVy/Q9kr4p2n3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPX4R-000000094Cl-2JYm;
	Mon, 23 Dec 2024 01:17:19 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPX4O-000000094Bt-1D7a
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 01:17:17 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-29e842cb9b4so1063115fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 22 Dec 2024 17:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734916634; x=1735521434; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bHKditMwHF8yzMC7Amcucs9pLzOVlRtRe7sZOQG37xA=;
        b=Oj7Kr/vdiOyYzJ13yl4QrvzIVaFThewM4LnAXYdNgjMc69jP4VTD90+6IZxK0OLGn+
         WDrPlnlczJooZC2OrgOUfFwqiDEsG7k2DKeG/ZpAlbAM2uWu2gXoOeelO5hHiZq11XRL
         4Sg+SqwDvRQtWIRMq8mLTUPCfjt8DOcTDmjA2Rt663kV//0NMLwpgojKHzNRLu7aNphM
         KedjYQLLg6oJ9L0LHjjkazixT1sk2qs24KEtz6Zh0F5zavAFsaZETg0/NpJ1jI3WW7j9
         vkq+exgrHGi+cLCpCRE2ATnq62QF5oHD2crYdd3X1okQuP/LdP1jitqQ73HAMFoPqRXj
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734916634; x=1735521434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHKditMwHF8yzMC7Amcucs9pLzOVlRtRe7sZOQG37xA=;
        b=pA4vcq5eH7s1+RToSv1AZJSvaA4xfSB+/Ze2sOFM2msMsDHq3PNFak7H8yOMvL/aER
         cvbv/OMTo8/B59tDtkPw/tJkXUpWJfaPESp78Fp+MztT2unTDDweBO2P6PXlWO456yUe
         98Nh1xhI1zJ3IESvM6wneIL+cJBQjT/lHiLs2L61lH+vLOw0Q4bqleFMgUA2DiqVPday
         fb/FOTwNdFfrBejsDAWxUfjIGEPOxFUByj3hwCTaYCutssawmxzxTELnGPTMq0Ann1r1
         toiAGdeJZyj1ZzBbQhkjrl2X766aBXVw9ug3muNig4I4gtQY8HZSX+ABdH9uCq2fBUfk
         5ezQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxRwfUuU2ICNj22yl5dpv5M8KoDTa54dBstaqF/Uj4eCodswN/IBDW1MA//b71RYaZbl3uDSTVTcIs6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUYFmMCOFvooYAC8+k4LMnGmCAAaCRl9dYpRQMM+i7p0YLSdln
	GUPVlUBJvtJafgx/cAbsp/AWiprExCPY3e1n8WNaBYlAPpSifZu3yKTCf4TjNI4nK1Cegfvc5x0
	Rmqky/SQOki8Roa4xGtfs2BPLv3c=
X-Gm-Gg: ASbGnctfu7m5xmxwM/EE2ji7mhsDKF1RRXAeGcnQD/x3R2BczRNARAi428F3kt8r0XD
	lV9ve/XaHbTPHoWVqHCHaMXCHlNDjH2g7tg5IjXX8yMMwOKquRVGlKx7CQQXxoK91rulbYQ==
X-Google-Smtp-Source: AGHT+IF0PJfQz0iMDIKaer9mf/niYjoBzq6a2Y733Hyfh3OCW9CA/nDv0Wouag7c3c98R8eOz38ZVc+L+OYb0LzK4b8=
X-Received: by 2002:a05:6871:890a:b0:29e:362b:2162 with SMTP id
 586e51a60fabf-2a7fb162ad6mr6388650fac.20.1734916634443; Sun, 22 Dec 2024
 17:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20241220114023.667347-1-zhangchunyan@iscas.ac.cn> <20241220-chaste-mundane-5514462147b6@spud>
In-Reply-To: <20241220-chaste-mundane-5514462147b6@spud>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 23 Dec 2024 09:16:38 +0800
Message-ID: <CAAfSe-tT7f3to0CPyF-DK09E+NNwN+tRpmuNwtTqbe3=_y3sFg@mail.gmail.com>
Subject: Re: [RFC PATCH] raid6: Add RISC-V SIMD syndrome and recovery calculations
To: Conor Dooley <conor@kernel.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org, 
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_171716_448615_32201B7A 
X-CRM114-Status: GOOD (  19.65  )
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

Hi Conor,

On Sat, 21 Dec 2024 at 06:52, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Dec 20, 2024 at 07:40:23PM +0800, Chunyan Zhang wrote:
> > The assembly is originally based on the ARM NEON and int.uc, but uses
> > RISC-V vector instructions to implement the RAID6 syndrome and
> > recovery calculations.
> >
> > The functions are tested on QEMU.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >  include/linux/raid/pq.h |   4 +
> >  lib/raid6/Makefile      |   3 +
> >  lib/raid6/algos.c       |   8 +
> >  lib/raid6/recov_rvv.c   | 229 +++++++++++++
> >  lib/raid6/rvv.c         | 715 ++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 959 insertions(+)
> >  create mode 100644 lib/raid6/recov_rvv.c
> >  create mode 100644 lib/raid6/rvv.c
> >
> > diff --git a/include/linux/raid/pq.h b/include/linux/raid/pq.h
> > index 98030accf641..4c21f06c662a 100644
> > --- a/include/linux/raid/pq.h
> > +++ b/include/linux/raid/pq.h
> > @@ -108,6 +108,9 @@ extern const struct raid6_calls raid6_vpermxor4;
> >  extern const struct raid6_calls raid6_vpermxor8;
> >  extern const struct raid6_calls raid6_lsx;
> >  extern const struct raid6_calls raid6_lasx;
> > +extern const struct raid6_calls raid6_rvvx1;
> > +extern const struct raid6_calls raid6_rvvx2;
> > +extern const struct raid6_calls raid6_rvvx4;
> >
> >  struct raid6_recov_calls {
> >       void (*data2)(int, size_t, int, int, void **);
> > @@ -125,6 +128,7 @@ extern const struct raid6_recov_calls raid6_recov_s390xc;
> >  extern const struct raid6_recov_calls raid6_recov_neon;
> >  extern const struct raid6_recov_calls raid6_recov_lsx;
> >  extern const struct raid6_recov_calls raid6_recov_lasx;
> > +extern const struct raid6_recov_calls raid6_recov_rvv;
> >
> >  extern const struct raid6_calls raid6_neonx1;
> >  extern const struct raid6_calls raid6_neonx2;
> > diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> > index 29127dd05d63..e62fb7cd773e 100644
> > --- a/lib/raid6/Makefile
> > +++ b/lib/raid6/Makefile
> > @@ -10,6 +10,9 @@ raid6_pq-$(CONFIG_ALTIVEC) += altivec1.o altivec2.o altivec4.o altivec8.o \
> >  raid6_pq-$(CONFIG_KERNEL_MODE_NEON) += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
> >  raid6_pq-$(CONFIG_S390) += s390vx8.o recov_s390xc.o
> >  raid6_pq-$(CONFIG_LOONGARCH) += loongarch_simd.o recov_loongarch_simd.o
> > +raid6_pq-$(CONFIG_RISCV_ISA_V) += rvv.o recov_rvv.o
> > +CFLAGS_rvv.o += -march=rv64gcv
> > +CFLAGS_recov_rvv.o += -march=rv64gcv
>
> I'm curious - why do you need this when you're using .option arch,+v
> below?

Compiler would complain the errors like below without this flag:

Error: unrecognized opcode `vle8.v v0,(a3)', extension `v' or `zve64x'
or `zve32x' required

>
> >  hostprogs    += mktables
> >
> > diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
> > index cd2e88ee1f14..0a388a605131 100644
> > --- a/lib/raid6/algos.c
> > +++ b/lib/raid6/algos.c
> > @@ -80,6 +80,11 @@ const struct raid6_calls * const raid6_algos[] = {
> >  #ifdef CONFIG_CPU_HAS_LSX
> >       &raid6_lsx,
> >  #endif
> > +#endif
> > +#ifdef CONFIG_RISCV_ISA_V
> > +     &raid6_rvvx1,
> > +     &raid6_rvvx2,
> > +     &raid6_rvvx4,
> >  #endif
> >       &raid6_intx8,
> >       &raid6_intx4,
> > @@ -115,6 +120,9 @@ const struct raid6_recov_calls *const raid6_recov_algos[] = {
> >  #ifdef CONFIG_CPU_HAS_LSX
> >       &raid6_recov_lsx,
> >  #endif
> > +#endif
> > +#ifdef CONFIG_RISCV_ISA_V
> > +     &raid6_recov_rvv,
> >  #endif
> >       &raid6_recov_intx1,
> >       NULL
> > diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
> > new file mode 100644
> > index 000000000000..8ae74803ea7f
> > --- /dev/null
> > +++ b/lib/raid6/recov_rvv.c
> > @@ -0,0 +1,229 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2024 Institute of Software, CAS.
> > + * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > + */
> > +
> > +#include <asm/simd.h>
> > +#include <asm/vector.h>
> > +#include <crypto/internal/simd.h>
> > +#include <linux/raid/pq.h>
> > +
> > +static void __raid6_2data_recov_rvv(int bytes, u8 *p, u8 *q, u8 *dp,
> > +                           u8 *dq, const u8 *pbmul,
> > +                           const u8 *qmul)
> > +{
> > +     asm volatile (
> > +             ".option        push\n"
> > +             ".option        arch,+v\n"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
