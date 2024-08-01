Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADEEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 01:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29WDA2+6WsK/GMks1haz19/CEHi804Z/b8hk8wO7rLk=; b=xtYtfrVU1UmTbq
	Po5tKNAAgk94DKet5YCb1jSkVMF070fvvJ2jppt7pKDWyLF/YcAsuP799NEZVS8NKibQo6IslVlyt
	4Z4voqHv199u2HbqX/mJ4606OO2QfaC9gPy3yKt1qsbqGPGpHwMDl1b2i6XVPepSPmgv9bk07akQs
	v2mqdrkUKFgRv5lMRhZ8n7X4t2EsdgILLcXFmkKQ/jsXknQpMTiaHQJ13P9JFg+qTwW+sV2lmTCLL
	qr4sTWmesqZwUPeKaLlTvFdZKgMrYSBid2pj5AOXoQSnWtgrALoX4451Nm79eh908DFWqKv+hZFHh
	Jyn72AVexBtYb8K++S8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZKLQ-00000003B5N-0jiv;
	Thu, 01 Aug 2024 01:11:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZKLM-00000003B3I-1z7Q
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 01:11:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70b703eda27so4081702b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 18:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722474659; x=1723079459; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SF8gnKEAE9EljJtXDymf4/VYu2nTWcOfe4LLsbP9AN0=;
        b=tWc6A58C+H/4e6UsGy93ROSA3/CALD48H3be1+Tmt/PoDaWA9nFu4HzTyNVXXApg9P
         WaVkjVdu84hlXdjgk+/rlzhOpnhyIWQCVPLrWwKTP56XvLvx62zjPbN13tqM9lPKMYiz
         dpc1mkHYFlo6+4Hz+RoFg5e7pg/PtGOPgSVmKunSgY/f/WyhyGd0q1mKr/tdH+3S7Nzx
         T3qx67cNDOG2h+vKrsM3dxdy6ndNcJOSPZHi3t7IqxO6f6Wu6tjQ0wvcBKubwDz/dUP6
         +Z32Brv2UkhXiD03i0kS5fDI1WYjlvKuxWkxHRAXl+zscQBm+LYxJl6QDamlu/d1+j7Z
         1gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722474659; x=1723079459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SF8gnKEAE9EljJtXDymf4/VYu2nTWcOfe4LLsbP9AN0=;
        b=f5g/fNK62Pe2Ilfayto+pSJqEDtYPqB6o0f6f8QGTrnkzyDHZzMc1IFCMw1H3vnOWo
         EUmXpbxoZE+CQVnoFd5M8nuQ6rXskwteLSv4qF1ei7V0VERGyphSUmPFDWGkwTW7oXzQ
         7Klm/JPdlSGDpgY2GKcu8/r5RRZStOVkKePtmUcE9YkHjDEc7eYBzhMB+Ptgdqcp9R9W
         hbWptGJ5DL5xOvdfGsFzyowrjXrORM06Eg5XhroWd4NzfXqxwdPRv/eqig0UGQNp7sIg
         vdIO4zdXbY4EnIr8t6fFmJ7+GZ+n/SItje0h3pJ6UoYDTdHZxAq7DS/r3ZizGOgdnQLu
         ErlA==
X-Forwarded-Encrypted: i=1; AJvYcCWjA+HN4WxT1un3H122vota6k5EBy8AMT59PSXKEK5JJg5ZkTnL+P+SOCy2GheVKNksHMh+Nw3UA+FW8USdXFX2mwWqCx6ee/j7YeL4uMMQ
X-Gm-Message-State: AOJu0YyLexrjcla1h8OT+Dq9k184JAgvefh5S5BDW9cqbI1lwRnzj2fI
	mGXgNO8xt8M9Y9uLj5buaI+wu7Chr+zoKZSI5HInde6ZlAH/1lwIV99h/NZ7M/ZtYtZoSJ6Q9E+
	V
X-Google-Smtp-Source: AGHT+IE+vBz7tRhC45aToQfMe1oJ8ucMo/aEKZneCwxPpUJhH86CJPQIsx+yfuNixrLgHrwhOoplIA==
X-Received: by 2002:a05:6a00:acd:b0:70e:98e3:1aef with SMTP id d2e1a72fcca58-7105d7e6eb5mr1179532b3a.29.1722474658867;
        Wed, 31 Jul 2024 18:10:58 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a3aa8sm10522229b3a.210.2024.07.31.18.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 18:10:58 -0700 (PDT)
Date: Wed, 31 Jul 2024 18:10:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] tools: Add riscv barrier implementation
Message-ID: <Zqrgn04zEmEpv5+m@ghost>
References: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
 <20240729-optimize_ring_buffer_read_riscv-v1-1-6bbc0f2434ee@rivosinc.com>
 <28d780da-4f43-4db5-8e1b-c66bb9973cd1@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28d780da-4f43-4db5-8e1b-c66bb9973cd1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_181100_787133_5D1DE5BA 
X-CRM114-Status: GOOD (  22.63  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2024 at 10:59:52AM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 29/07/2024 22:50, Charlie Jenkins wrote:
> > Many of the other architectures use their custom barrier implmentations.
> =

> Hi Charlie,
> =

> Typo: implmentations -> implementations

Thank you! I will fix that.

- Charlie

> =

> > Use the barrier code from the kernel sources to optimize barriers in
> > tools.
> > =

> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/arch/riscv/include/asm/barrier.h | 39 ++++++++++++++++++++++++++=
++++++++
> >  tools/arch/riscv/include/asm/fence.h   | 13 ++++++++++++
> >  tools/include/asm/barrier.h            |  2 ++
> >  3 files changed, 54 insertions(+)
> > =

> > diff --git a/tools/arch/riscv/include/asm/barrier.h b/tools/arch/riscv/=
include/asm/barrier.h
> > new file mode 100644
> > index 000000000000..6997f197086d
> > --- /dev/null
> > +++ b/tools/arch/riscv/include/asm/barrier.h
> > @@ -0,0 +1,39 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copied from the kernel sources to tools/arch/riscv:
> > + *
> > + * Copyright (C) 2012 ARM Ltd.
> > + * Copyright (C) 2013 Regents of the University of California
> > + * Copyright (C) 2017 SiFive
> > + */
> > +
> > +#ifndef _TOOLS_LINUX_ASM_RISCV_BARRIER_H
> > +#define _TOOLS_LINUX_ASM_RISCV_BARRIER_H
> > +
> > +#include <asm/fence.h>
> > +#include <linux/compiler.h>
> > +
> > +/* These barriers need to enforce ordering on both devices and memory.=
 */
> > +#define mb()		RISCV_FENCE(iorw, iorw)
> > +#define rmb()		RISCV_FENCE(ir, ir)
> > +#define wmb()		RISCV_FENCE(ow, ow)
> > +
> > +/* These barriers do not need to enforce ordering on devices, just mem=
ory. */
> > +#define smp_mb()	RISCV_FENCE(rw, rw)
> > +#define smp_rmb()	RISCV_FENCE(r, r)
> > +#define smp_wmb()	RISCV_FENCE(w, w)
> > +
> > +#define smp_store_release(p, v)						\
> > +do {									\
> > +	RISCV_FENCE(rw, w);						\
> > +	WRITE_ONCE(*p, v);						\
> > +} while (0)
> > +
> > +#define smp_load_acquire(p)						\
> > +({									\
> > +	typeof(*p) ___p1 =3D READ_ONCE(*p);				\
> > +	RISCV_FENCE(r, rw);						\
> > +	___p1;								\
> > +})
> > +
> > +#endif /* _TOOLS_LINUX_ASM_RISCV_BARRIER_H */
> > diff --git a/tools/arch/riscv/include/asm/fence.h b/tools/arch/riscv/in=
clude/asm/fence.h
> > new file mode 100644
> > index 000000000000..37860e86771d
> > --- /dev/null
> > +++ b/tools/arch/riscv/include/asm/fence.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copied from the kernel sources to tools/arch/riscv:
> > + */
> > +
> > +#ifndef _ASM_RISCV_FENCE_H
> > +#define _ASM_RISCV_FENCE_H
> > +
> > +#define RISCV_FENCE_ASM(p, s)		"\tfence " #p "," #s "\n"
> > +#define RISCV_FENCE(p, s) \
> > +	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
> > +
> > +#endif	/* _ASM_RISCV_FENCE_H */
> > diff --git a/tools/include/asm/barrier.h b/tools/include/asm/barrier.h
> > index 8d378c57cb01..0c21678ac5e6 100644
> > --- a/tools/include/asm/barrier.h
> > +++ b/tools/include/asm/barrier.h
> > @@ -8,6 +8,8 @@
> >  #include "../../arch/arm64/include/asm/barrier.h"
> >  #elif defined(__powerpc__)
> >  #include "../../arch/powerpc/include/asm/barrier.h"
> > +#elif defined(__riscv)
> > +#include "../../arch/riscv/include/asm/barrier.h"
> >  #elif defined(__s390__)
> >  #include "../../arch/s390/include/asm/barrier.h"
> >  #elif defined(__sh__)
> > =

> =

> Can not really tell for that part except it seems ok to me as well.
> Andrea might be a better candidate to add its Rb.
> =

> Thanks,
> =

> Cl=E9ment

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
