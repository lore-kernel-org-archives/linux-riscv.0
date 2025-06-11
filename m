Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46030C61DB2
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMzzl7Z+Zqzy/+a7swe2dL2nsx9851lCaV2hBD+7fi8=; b=vezTgqRZZtR2tG
	Nb5/FHxAzSlPoiH5D+jhDUEeRP86O+pppcHRponnx6lv7c1v1DAm6e9EbsA3oX+h/QjVfCPmOdNrz
	x92W+NMzHFnZCU76Zj5M2P3l2Jo+LGZRWqgx37QfPI3O0xjKzc/9gGTA/SlXDvqZBQKEyepr0IAhx
	Ipztm0K43o0uOQiSW/l89wUBfuwb4Z1rlYb0EzFAHm6kCqPrOQ8eG918dME6f8STgrhd4/YmS6+4H
	HSrD5T6VS9oBXwwa00c3PoJo637KROib7LbFfxCsdGzTL+3FxeQl57mnpCL82Z6fZ+HDllbGho/Of
	KhA+Hye9khLjA/k9zNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAtv-00000008by0-3KnS;
	Wed, 11 Jun 2025 02:09:15 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAtt-00000008bxM-2TzD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 02:09:14 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6065251725bso4086048eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749607752; x=1750212552; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gxKo71rX6rlY0KRUmmuSGoEjab+AY2c0qjzSck5nf48=;
        b=KVKCzfHmDxkxJKCvZRQkcyxDkk6ZRZs1z8SS4BBDaqw3LFJ7SVki1nOFgevBozsg5P
         +5DXIE6vRX2duiK4cJIjoI5KsVHkvzx+t83ZV2tBrtVPjKpsFFs9dmaQRWyLtSPVAJtI
         CtXJiL82GWxnMGUuw2pIKtTYUM+BaQPyNfnOS8q6gYFwT4RhqcfH7OfNUn0k7f6K5KjX
         0VjLrWiyBEB1zEIX872sNxIHy6GyS9pcipoZqbGWrNUxB1fLA8BaUpUrxJChOAoqvqv4
         aZahAYkdi0e8eZyupMwqnk3WjssaywgYZ1kDJGHX51F3U+9DoV7WVjKigZJ0GsqrFl8T
         1J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749607752; x=1750212552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxKo71rX6rlY0KRUmmuSGoEjab+AY2c0qjzSck5nf48=;
        b=FjrCaz4i2NvYUAwgh6ZGutXt5JmXRqSenmXtr3YHSaNX88ci8y7uFS/ZUt0IRMoMll
         JvGK7HHsAKNFzbSwlpiZV86Oh1/GYDpoQMuOWpiuGyq7QHIUhRCf9atlSz+xrIWdHbqu
         Gfh6Dgsx028JnUWuec9mNp3g5mEoSEmfPH+nNvIW0Dj/37f4fmTrwhxu1nFoHtd4jBHe
         ebfTXZyged1LLB8nHiIocZ0kdwGWgfdvfaG+/RcrkV57PipQwVKyfrr2MoBJKypwhrSL
         RNn5zWj9Q1R2aMTRHqa+kFiYF8VSu3P9excX4leKjj/wljIAvUJDy/utilooNjRmfn0+
         efxw==
X-Forwarded-Encrypted: i=1; AJvYcCU+LUhhxBRr2Ynf99W/+pw4Kc6tTPbH9n/Lb+XPu4tS2bY7Kk/ojkkVM/iladkhQ2O8rEKSfqy8TueoKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7iH0bz7NKZvhazSzbNszNBCBGO4bC3K8MjPSpEkixG7CFoDt5
	ppkA9BhTmCdXvkWj1zGABCgBUQ7hGP2DG/yadvY7Xheu/dbTLZVNmxq/X1bPObUHKZwM21Jiqxe
	ogX6qOyodNu2u+gvDKGauyuaqairdLzU=
X-Gm-Gg: ASbGnctEPYcPSBFfY+mljT4r8o0ymdo4Ic+Vwj9eYqGgrBRiEy87FNc53GkHEgyHR4y
	jVOJbGP8d10lY1oOdNv0A+MN7A5DUh7+XFi0z6PajnQmDhHh5NkPLehbo8dKIKnV42XINHcJ+Xb
	hHugFcpCMId6zgorqScaOqAzPDHQbji8ouvw81acwJSjTzNYzK9GFk3V4DZb0xr5zWs4S9Z3r2Z
	JfRyevT2d+4pA==
X-Google-Smtp-Source: AGHT+IHyJRyj40Bz/LBpIhLYcMRdpMcH4YYawUfvEOhIJ/n8plnPEVv4INd3H7MIibUkZgrNmCuE9Lq5Kd/IU/Un3DY=
X-Received: by 2002:a05:6870:164c:b0:2d5:b914:fe40 with SMTP id
 586e51a60fabf-2ea96d59f39mr884660fac.20.1749607752076; Tue, 10 Jun 2025
 19:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn> <d052f010-410a-4405-9ae6-f679649851ea@ghiti.fr>
In-Reply-To: <d052f010-410a-4405-9ae6-f679649851ea@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 11 Jun 2025 10:08:36 +0800
X-Gm-Features: AX0GCFvQK2GyRzBZQ9wryH17mKXhHeim9DS4RegYUkUd3QrryodeeBQJklb1Enk
Message-ID: <CAAfSe-svuyG01qyCVERn2iU9HTJEiHD5Wwc3FtJX_gsL59qP8g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix a segmentation fault also add raid6test for
 RISC-V support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_190913_627912_23916A48 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Alex,

On Wed, 11 Jun 2025 at 03:23, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 6/10/25 12:12, Chunyan Zhang wrote:
> > The first two patches are fixes.
> > The last two are for userspace raid6test support on RISC-V.
> >
> > The issue fixed in patch 2/4 was probably the same which was spotted by
> > Charlie [1], I couldn't reproduce it at that time.
> >
> > When running raid6test in userspace on RISC-V, I saw a segmentation fault,
> > I used gdb command to print pointer p, it was an unaccessible address.
>
>
> Can you give me your config, kernel and toolchain versions? I can't
> reproduce the segfault on my machine.

I can use the below combination to reproduce:

- riscv/configs/defconfig
- Kernel v6.16-rc1
- Cross-compile toolchain [1] for building kernel which brings up QEMU
(running Ubuntu 22.04)
- Two choices for compiling raid6test program after applying patches 3-4:
1) Use toolchain [1] to cross-compile it as statically linked.
2) Compile it locally on QEMU (running Ubuntu 22.04) with local riscv gcc:

root@riscv-ubuntu2204:~# gcc --version
gcc (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0

Thanks,
Chunyan

[1] https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.05.30/riscv64-glibc-ubuntu-22.04-gcc-nightly-2025.05.30-nightly.tar.xz



>
> Thanks for the fixes and the test, I'll take a look this week.
>
> Alex
>
>
> >
> > With patch 2/4, the issue didn't appear anymore.
> >
> > [1] https://lore.kernel.org/lkml/Z5gJ35pXI2W41QDk@ghost/
> >
> > Chunyan Zhang (4):
> >    raid6: riscv: clean up unused header file inclusion
> >    raid6: riscv: Fix NULL pointer dereference issue
> >    raid6: riscv: Allow code to be compiled in userspace
> >    raid6: test: add support for RISC-V
> >
> >   lib/raid6/recov_rvv.c   |  9 +-----
> >   lib/raid6/rvv.c         | 62 +++++++++++++++++++++--------------------
> >   lib/raid6/rvv.h         | 15 ++++++++++
> >   lib/raid6/test/Makefile |  8 ++++++
> >   4 files changed, 56 insertions(+), 38 deletions(-)
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
