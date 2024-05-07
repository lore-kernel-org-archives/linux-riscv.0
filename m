Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BF4C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6U7S5cDVA3TXQaOc4VRi88k5XCLxp6z7rQSmqZtS1SM=; b=BXA9QyXW+eqjQc
	yHSzhBUeWvxDhfQJRjWFYSjYw51Lx8Lcpxkz5d8zHJg2IJkXbe4/5ZBTqjDx2fd/pMZrHGJUuypnK
	IFTS1b5Aq4YFb8nuIyo40Lz5l9/9lfZm2QFoxn/NYVLBorlnTFYpYSs5/NSgHGFsnTog+8RYxzfoY
	tRUMvPOQJu3V0rs7Zez9vlpxUPGB9C8nv2LjUGyEti0TY8kqJTyAM6Xv4Y8OgCR9JJjJkX8mC968H
	RJ1UTcuOx+YZdCY2K8tS/YJnyQcp+oIVyTP/+NES8IU0+jQUGBfmwdaR+1EjczrMt4H2gfwGtTzPv
	CtNh54Y9LUGbSxpKkFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4R3Z-0000000Cfje-35K2;
	Tue, 07 May 2024 20:04:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4R3X-0000000CfhN-03nW
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 20:04:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2b37bc39decso2406651a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 13:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715112293; x=1715717093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NN4Ftt8FMvIhQtGext6ujnG89NmvsBUOCpDEGGjh9Nc=;
        b=y9+5ystg8EkZrw3To8R8zl6EPuZQemaSzr20EN4hksUAbo86hAaEaF0JjJJmz9DfJM
         5jMFIp1RpfbtZ9cvsDzp1J8wvlAKLAS3t80tAEw9CgS4iOQD1APiyvQB2H51NXVa2NBL
         BPIgSmzbN2JNvpY33xBdHWCyq4LSMkbHeo8nK6V4IX+rm5Q0pONWPzydZ6k7B7PHvEHW
         a3C8nP71FkGCeM+zuPp6dMWGYjexVnRFFjnrNj5y5ze4r3PP+bUlYSoG/u2wLNLU5zJB
         URNtu2+5kjeKKJ6kmcp8KPCgCgN1ytZ8f73iTv9A7EAnQ/5y8Kz8JxbmxRwI5UNrTdKo
         e5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715112293; x=1715717093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NN4Ftt8FMvIhQtGext6ujnG89NmvsBUOCpDEGGjh9Nc=;
        b=aSA9Ipxa4d1nwaKW8vXYFtPXbJZSxNuzNPTV4TSqEB+CUTCrk4IlyLWqu5vKsRkplv
         gnOY2E5BWG2TGxMKGnNIkvjwHaV0Vhon3MZGu+syMlfC6ulPfXXAOrlwNU3TjiIOYMK6
         AO8rUF83MjEgAPpHgZSQb/nwul58yi7CMZaNCMH6Lx1PmSmvHuhNlpTxy+DDSvERNala
         LHfMUXtlIFevlEwmfJhXpZlyyxAwQ2KLafLoueVkpVT356zZp2+ue396yuLGM70ZgVEW
         nmtuzAPJmcs9nu2mrCZh/nU4pnugL9C3wDt/nlijZ/zAyKpniGQXIC7mnH/sIkuqWC66
         SZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXH1qgpTO7fsefPhuJlhE37Sw+pHm2djrjYlAl0GDXeijjDGkLiHwezlfbS+6tP4uaHDZJT6B8i6QPr5Jy3my+t9+NGrbbgddNnZycMid5D
X-Gm-Message-State: AOJu0Yxg0zHb2Zh68uNoONg8JrfiQfmAgGPAMfPYPnANwewLIZYXgdyu
	cTWqcyC0wDhK+z/P+PO1GFtxZwgSYBv5F51BwHIbFS3bgZ0y1zvIGQPNRf14JSg=
X-Google-Smtp-Source: AGHT+IEG3jn43PIu89+58dxf/d1E5pC14XMqKQCvSTc8ITHJ3vHUgTB4qVRdG1SnmOAmjamgEo2kZA==
X-Received: by 2002:a17:90a:f612:b0:2b3:a79a:7e4b with SMTP id 98e67ed59e1d1-2b6166bf6a4mr626414a91.22.1715112293010;
        Tue, 07 May 2024 13:04:53 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:9de1:32f1:3d81:10c7])
        by smtp.gmail.com with ESMTPSA id rr3-20020a17090b2b4300b002b113ad5f10sm12158656pjb.12.2024.05.07.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:04:52 -0700 (PDT)
Date: Tue, 7 May 2024 13:04:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: Support compiling the kernel with extensions
Message-ID: <ZjqJYiNYvTvtL0O4@ghost>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
 <12808AB2-0308-4013-9624-E3DEFCC584EA@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12808AB2-0308-4013-9624-E3DEFCC584EA@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_130455_185912_16DD2712 
X-CRM114-Status: GOOD (  23.38  )
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

On Tue, May 07, 2024 at 08:25:09AM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> On 7 May 2024 02:40:41 IST, Charlie Jenkins <charlie@rivosinc.com> wrote:
> >The kernel currently has the restriction that it can only be compiled
> >with the extensions that are hardcoded in arch/risc/Makefile.
> >
> >Any extension that is not listed in the Makefile can still be used by
> >explicitly writing the assembly and using alternative patching.
> >
> >This series introduces Kconfig options that allow the kernel to be
> >compiled with additional extensions.
> 
> One thing I don't see in the commit messages or the cover letter is what your actual motivation is
> for making these changes.
> Are you effectively looking to evaluate the alternatives at build time, or are you looking to
> let the compiler use the extension where it sees
> fit? Or perhaps both?

Both. I forgot to mention that this uses the updated wording from your
patch "RISC-V: clarify what some RISCV_ISA* config options do".

The hope is that at some point the kernel can be compiled with something
like the RVI profiles, in the interim this allows people to compile
kernels with these extensions for some "free" performance improvements.
I haven't tested performance on real hardware, but compiling the kernel
with the Zb* extensions has a 4.9% dynamic instruction count reduction
when running a boot + simple userspace program test (tested using
Spike). 

I meant to remove "v" from the march since we have to call the kernel
begin/end functions when using vector, I'll need to update that in the
next version.

- Charlie

> 
> Thanks,
> Conor.
> 
> >
> >Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >---
> >Charlie Jenkins (8):
> >      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_C Kconfig option
> >      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V Kconfig option
> >      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT Kconfig option
> >      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT Kconfig option
> >      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBB Kconfig option
> >      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBA Kconfig option
> >      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBC Kconfig option
> >      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBS Kconfig option
> >
> > arch/riscv/Kconfig                    | 135 +-----------
> > arch/riscv/Kconfig.isa                | 393 ++++++++++++++++++++++++++++++++++
> > arch/riscv/Makefile                   |  15 +-
> > arch/riscv/crypto/Kconfig             |  14 +-
> > arch/riscv/include/asm/arch_hweight.h |  33 +--
> > arch/riscv/include/asm/checksum.h     |  18 +-
> > arch/riscv/include/asm/pgtable.h      |   3 +-
> > arch/riscv/include/asm/simd.h         |   3 +
> > arch/riscv/include/asm/vector.h       |   3 +-
> > arch/riscv/kernel/cpufeature.c        |   3 +-
> > arch/riscv/kernel/head.S              |   8 +-
> > arch/riscv/kernel/probes/uprobes.c    |   2 +-
> > arch/riscv/kernel/process.c           |  14 +-
> > arch/riscv/kernel/ptrace.c            |   6 +
> > arch/riscv/lib/csum.c                 |  48 ++---
> > arch/riscv/lib/riscv_v_helpers.c      |   1 -
> > arch/riscv/lib/strcmp.S               |   4 +-
> > arch/riscv/lib/strlen.S               |   4 +-
> > arch/riscv/lib/strncmp.S              |   4 +-
> > arch/riscv/lib/uaccess_vector.S       |   2 +
> > arch/riscv/lib/xor.S                  |   2 +
> > arch/riscv/net/bpf_jit.h              |   8 +-
> > 22 files changed, 511 insertions(+), 212 deletions(-)
> >---
> >base-commit: 2f47357557b7aa98d9d9002688aae480864ca3f6
> >change-id: 20240429-compile_kernel_with_extensions-92dd2403d325

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
