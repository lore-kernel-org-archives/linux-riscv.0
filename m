Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF4CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 04:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CJKqhG86iADYXZLjFX8Oj2NUsVFp/ru89VDTaCXIUA=; b=AUoHpVI+lXMcIl
	QZrgezDBJ6xiKAKi1DdlVqbf20hzKDXn7plPpyaqbCTJGAwHaMsrLoP/z57GVrbRglE/z2WhE5EjS
	u1NBd2cXyXG3X0e5lrEvxQIjnW+SPL3LkXYW465PQqeTa9fVG63Gjd7Uc7t9tFbMiaghgAQUjwR1m
	+6DhrfAQmVT2ygP4HgkbkhnKDoEt9whiimX6bpYCRdVxVG76FG5EM2YQjsKtf0v/jLK3jklO724Ji
	vUQFTLiDR+NEFFmpgF+ExEVAP8LHsCbzhhNIc+NyOLdtHHVLv3xDCj3iLLC33tv9jCqlKHY6FYUg3
	ZfIxnA+u5yQUP6EVXWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnv9I-00CNHz-Ij; Mon, 09 May 2022 04:37:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnv9F-00CNHU-B7
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 04:37:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 h206-20020a1c21d7000000b003946c466c17so132891wmh.4
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 21:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ov4p0XX7tQqCu3BT1O07xpESNC6AFz/oTsF1DSF1DeY=;
 b=CIUvEXQyV6Kw6zKcKwganTJ9uL4GSu7nCc1HaR22V3NpFhh+o/R4HnNzPn0jj3j5M6
 vn/IV/XESXhwVIdYHG4JU3+9T/wWZ9nank20/BzpGqc16kNP8f7o3vJnimo0wKpXD1V5
 2LMdi50z6dz6gCkumhOzrSy+FABWc4j2i8Xl9VlKA1OFVQHNzqyYnRHgoiz9jf6DsaWe
 Pm49CVfMF28G1PN038G0Lb+MHYfsv6rkxdNb3qDmD/vUZBbFUG6ba1r9a2iEszdq3SvZ
 xZK4XRvgiLu2uTHHyoYz+VorXX7rByxY4TI7PZm1eTJ18bIEa9qW1RN7E6Xqd+Vmcp9k
 FBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ov4p0XX7tQqCu3BT1O07xpESNC6AFz/oTsF1DSF1DeY=;
 b=OZLeNt1WMIcEIapVF5dK6ZwL9PKnJ9dRLFgICKidtVDqk/zchlo6UVGSggyCjEvMWz
 0Ndfacmbb2UXPOtHXZIKMtnyk+icCX89rJNm1VEGQq6/JAnJ++673k8XDgnsvr5409B7
 tVcq4zkCrmf0e5seVsPJQi9BH1IdZwsUmUqJQPX/Qbb0HU3rLo+0cTOX9SgrMIeTpQhd
 j2USKPqx1djyYHuiVlT8/P9dEnTntFNZivUDeKMIDC+4aw6jHe45qJ00YnnR8tjviHYg
 pI/y1j0SD1Bv67rqBq4nYVMUDNnE5njFsB4wgpIZ3XTXU8igiHzA2Jn8ZY9iWB2vp6TS
 jLOw==
X-Gm-Message-State: AOAM530V7IMjtAtwbL0Noxo0mCYxdB+5DNqUnFvJoZtTgCvV8DGoqJ9c
 LPRykJ59JZ9V2NmOa4UQSlrz2lrvCgTokKVA1fxz8Q==
X-Google-Smtp-Source: ABdhPJwKlNzuRE3DL81XLBWis1ERv1cq+V1muXCMdHLI5gzEuRvadbetbhnukQ9XzoVFdhzjI2CaXT+vNeqj1MdG5qo=
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr13927419wms.137.1652071047349; Sun, 08
 May 2022 21:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220508160749.984-1-jszhang@kernel.org>
In-Reply-To: <20220508160749.984-1-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 10:07:16 +0530
Message-ID: <CAAhSdy1qri5L9pVcZO8areB=TXMSJBg2+cTNMZGQ3g+3Qhxmfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] unified way to use static key and optimize
 pgtable_l4_enabled
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_213729_422826_33DE0B85 
X-CRM114-Status: GOOD (  20.48  )
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

On Sun, May 8, 2022 at 9:46 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, riscv has several features which may not be supported on all
> riscv platforms, for example, FPU, SV48, SV57 and so on. To support
> unified kernel Image style, we need to check whether the feature is
> suportted or not. If the check sits at hot code path, then performance
> will be impacted a lot. static key can be used to solve the issue. In
> the past, FPU support has been converted to use static key mechanism.
> I believe we will have similar cases in the future. For example, the
> SV48 support can take advantage of static key[1].
>
> patch1 is a simple W=1 warning fix.
> patch2 introduces an unified mechanism to use static key for riscv cpu
> features.
> patch3 converts has_cpu() to use the mechanism.
> patch4 uses the mechanism to optimize pgtable_l4|[l5]_enabled.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html

Overall, using a script to generate CPU capabilities seems a bit
over-engineered to me. We already have RISC-V ISA extension
parsing infrastructure which can be easily extended to support
static key arrays.

Regards,
Anup

>
> Since v1:
>  - Add a W=1 warning fix
>  - Fix W=1 error
>  - Based on v5.18-rcN, since SV57 support is added, so convert
>    pgtable_l5_enabled as well.
>
> Jisheng Zhang (4):
>   riscv: mm: init: make pt_ops_set_[early|late|fixmap] static
>   riscv: introduce unified static key mechanism for CPU features
>   riscv: replace has_fpu() with system_supports_fpu()
>   riscv: convert pgtable_l4|[l5]_enabled to static key
>
>  arch/riscv/Makefile                 |   3 +
>  arch/riscv/include/asm/cpufeature.h | 110 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/pgalloc.h    |  16 ++--
>  arch/riscv/include/asm/pgtable-64.h |  40 +++++-----
>  arch/riscv/include/asm/pgtable.h    |   5 +-
>  arch/riscv/include/asm/switch_to.h  |   9 +--
>  arch/riscv/kernel/cpu.c             |   4 +-
>  arch/riscv/kernel/cpufeature.c      |  29 ++++++--
>  arch/riscv/kernel/process.c         |   2 +-
>  arch/riscv/kernel/signal.c          |   4 +-
>  arch/riscv/mm/init.c                |  52 ++++++-------
>  arch/riscv/mm/kasan_init.c          |  16 ++--
>  arch/riscv/tools/Makefile           |  22 ++++++
>  arch/riscv/tools/cpucaps            |   7 ++
>  arch/riscv/tools/gen-cpucaps.awk    |  40 ++++++++++
>  15 files changed, 274 insertions(+), 85 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cpufeature.h
>  create mode 100644 arch/riscv/tools/Makefile
>  create mode 100644 arch/riscv/tools/cpucaps
>  create mode 100755 arch/riscv/tools/gen-cpucaps.awk
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
