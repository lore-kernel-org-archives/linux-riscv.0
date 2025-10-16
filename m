Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B5BCCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HSLnE5V2RgnqcX2z4fUDgn9iOVLZ6V2hL9eUzgrH2hw=; b=C58
	VaSG58tRu+SfiLueKDPwO1mZZ1IBmG3LoTeqnQZXffVG1IH39+RGtqo0CIKGpsbUlrrrCTlRV8FNp
	nUP1Jg3JkXC97JUm3juQsXV7dySYafNCPJT0XL0vcNMx3glJ0Y8pU//Ogc7602gZw53U6yFCGKnGk
	PI0FY1/tRQD9jbfq9Ou+7C1OmXhgAWqkPxcmoWiPeHTiydoOuGHBxUUEY1NIeNBsysLu30uZmYZoN
	MyNUB8z+pLVDMRiBo6foT7XXvbSOb3nI+QtPWPH2GfB8Yv6JX8kV/1gHqtlgV1aIC28qccWaXiJKV
	sIj35SVCAMZ1kjqWA/rRnLnWx0wl1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9K2e-000000048zU-3Nob;
	Thu, 16 Oct 2025 09:13:00 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9K2c-000000048yF-0DJK
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:12:59 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-38627e78203so312052fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760605976; x=1761210776; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dy4LI72X5M+MuvyXzIBRU1PdeSk9XBJhqjZ4dH7N3+A=;
        b=XNa7iX7Id3mltjW+v23AVhWitoe+N/Fu6Krad3yQZuVea0n/QOrrr1aXIv5/kgEr30
         Ssnkn/ATjDBSt3VwT4cQDVT6qwYH+bvVkQkWdE6jHE9x1BcjY5IFJabTC7MTOWM+gw1t
         732y6QV0Pu3Tz/7sB4hXjY/PU2Km6uBSLnmMyJzPR3R07V3WHnRnwgbtwCTjv2N0uuoH
         1AmC4Tlkj5Eho78EywahnSVGltwRpL23U1/uXdYox7XzEwqj+Eg4cTO0oXKVpMLavOuJ
         YvK07da+C5pfnJNs53qiEUvz2M0Ql2m0U7kbD78qDvLb6h01Owz/gL1+H84ekVjW4Yar
         6H2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605976; x=1761210776;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dy4LI72X5M+MuvyXzIBRU1PdeSk9XBJhqjZ4dH7N3+A=;
        b=Ad+wp39l71oGloH5Prr1Te1MTyPkSaNq8gSeVaWdCdZ0fi92NkM2Hcd0QLljKrGX42
         hCulBtMLPMzwr6jI7Jh4pMzJNwkfBks+/UJOgJNjRYWS+yAoj6k2dSOkhvH7mzRkhm2q
         kJOh3LYFfEReM7OyQNux/Zos7rvIJHESQdoW+xbNCVAzmAEeSB6MOBlPrUDx3/HjFOWI
         hf/VTZy82jexwwFVMF7VFgyklZXjDGC4QVeoghAlzzgj07coQRgnsJcy/BUxw99qQNNT
         /KWSuCyaTBWxoagsJ9d0mB5atbkBqKua4ZYwIkWOpY1FM6u2sXUSsd2qn23sB+oq1pOL
         oSGg==
X-Gm-Message-State: AOJu0YxnTmnxD6tetz3JmRpC74K9AD0ruh7uZC5b1kbuSoI9JMnRyxJW
	V0ZXWYLZOFmusxc+P4Hglf+5VmO8b5tVQKsExdqDriWOtFpuGlNckOleFh6Yf4AHN2NcwJTQKrN
	qaDF/zt8zAxKpaV9C3q8N4vjEtu+NNmlgmJpN
X-Gm-Gg: ASbGnct6C1lW5vXdGpdW36BY4W5PscyBTRlwmV36iinPoWohPGFEccuvRiovEooK89W
	H6JwdCWXbFDWewgQioPnk68RNRqFiNzuBEpJ7cIyjzfC2zls/CZ+s4KJxG3wx9qaIJ46ioB4xwY
	ggOsT1NuLNkUIz3LxAfVUh35B+EPDm2nPz7H0Aa3Rh9Z1WqjpugJWvsfrRxLb3w8/euRuvlPJLO
	rqjWX+r2Blf+rMunflL0Q644o25gJWSOY7c9+3rFTsDU23hIQi3emSFRANdyu1BAOOyHVfBaCnI
	B5+/jVa4YgEf+65TUdcvpYTC7g==
X-Google-Smtp-Source: AGHT+IHfYpaDwbZicHiKXMwiEdTDiYPjCUL8oMAPlA3iukvSjByLOjP1KViIlQWUfEfwTsqBbfQbhxijoyuuRP6KxVI=
X-Received: by 2002:a05:6870:4688:b0:395:b63a:520a with SMTP id
 586e51a60fabf-3c0f6d3d4e5mr15094463fac.22.1760605976500; Thu, 16 Oct 2025
 02:12:56 -0700 (PDT)
MIME-Version: 1.0
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 16 Oct 2025 17:12:20 +0800
X-Gm-Features: AS18NWDBnnTJr-RaCzpBeJW6Pe-tjeTQo9kyzhNbqEpulebVD7iGbdjXceFntUE
Message-ID: <CAAfSe-uGLQ5fC31BggZ73P1vp5YckvntOy5CH_MGD3S+cp_TtQ@mail.gmail.com>
Subject: Impact of RISC-V C Extension on Linux Kernel Size
To: linux-riscv@lists.infradead.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_021258_094914_1E5FD7F8 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

Hi,

I was recently asked how much the RISC-V C extensions can shrink the
Linux kernel size. I looked it up online and could only roughly
predict a 25% reduction in theory. But I couldn't find more specific
data on the Linux kernel program. So I compiled a few kernel images
with or without RISC-V C extension and would like to share the data
and analysis. Maybe someone will also be interested.

The kernel version is v6.18-rc1, toolchain is
riscv64-glibc-ubuntu-22.04-gcc-nightly-2025.09.28-nightly.

Compile with C extension is the default, so to disable C extension on
riscv64, I hacked two Makefiles like below:

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ecf2fcce2d92..e51810608695 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -61,7 +61,6 @@ endif
 riscv-march-$(CONFIG_ARCH_RV32I)       := rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)       := rv64ima
 riscv-march-$(CONFIG_FPU)              := $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)      := $(riscv-march-y)v

 ifneq ($(CONFIG_RISCV_ISA_C),y)
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f60fce69b725..0c93c397fed0 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -46,6 +46,7 @@ endif
 always-$(KBUILD_BUILTIN) += vmlinux.lds

 obj-y  += head.o
+AFLAGS_head.o  += -march=rv64gc
 obj-y  += soc.o
 obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
 obj-y  += cpu.o


First with C extension (default):

    $ make defconfig
    $ time make vmlinux -j32
       real 4m27.219s
       user 57m28.761s
       sys 5m19.494s
    $ size vmlinux
        text     data     bss       dec      hex  filename
    13294359  6288266  423589  20006214  1314546  vmlinux

Without C extension:

    $ make clean
    $ time make vmlinux -j32
       real 4m34.450s
       user 58m52.848s
       sys 5m25.042s
    $ size vmlinux
        text     data     bss       dec      hex  filename
    17728589  6288586  423589  24440764  174efbc  vmlinux

Build time for both is close, and we can get 25% and 18% for text
section and vmlinux size reduction respectively with C extension
support.

I also get performance test results with perf on Pioneer Board, which
is running kernel 6.6.111,

With C extension,

Performance counter stats for 'netperf' (3 runs):

          9,966.81 msec task-clock                       #    0.995
CPUs utilized               ( +-  0.04% )
               780      context-switches                 #   78.260
/sec                        ( +-  1.74% )
                35      cpu-migrations                   #    3.512
/sec                        ( +-  3.30% )
               121      page-faults                      #   12.140
/sec                        ( +-  5.86% )
    19,924,390,238      cycles                           #    1.999
GHz                         ( +-  0.04% )
     7,681,821,013      instructions                     #    0.39
insn per cycle              ( +-  0.88% )
                 0      branches                         #    0.000
/sec
                 0      branch-misses

          10.01376 +- 0.00290 seconds time elapsed  ( +-  0.03% )

Without C extension,

Performance counter stats for 'netperf' (3 runs):

          9,967.98 msec task-clock                       #    0.995
CPUs utilized               ( +-  0.02% )
               772      context-switches                 #   77.448
/sec                        ( +-  1.78% )
                33      cpu-migrations                   #    3.311
/sec                        ( +-  4.63% )
               126      page-faults                      #   12.640
/sec                        ( +-  2.12% )
    19,925,181,546      cycles                           #    1.999
GHz                         ( +-  0.02% )
     6,639,648,698      instructions                     #    0.33
insn per cycle              ( +-  0.96% )
                 0      branches                         #    0.000
/sec
                 0      branch-misses

          10.01589 +- 0.00309 seconds time elapsed  ( +-  0.03% )

IPC from 0.33 (without C) to 0.39 (with C), IPC is improved by 18%.

Thanks,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
