Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52519C4829E
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 00:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bB8RiJ/44kTpErMgf5w0KV8Kc4HWQCJIaYlZOSYTOcc=; b=ynIl9x7L505yLQA0wzGJTAonPu
	GHg7lUW+om/DQMWg0Wf1SLhq9wDyXOZJucMTDhsok8FyoNIYtwFjHlGCCPmZ1NnjuDnVbHtBL4jwh
	bL8vIH6i9WdP6BrH4iFuNulvFXXIgDfQNyfRkxIN5e/K0790C3d2a9vi7QtY4ULR/B2ZwgOtzHfm1
	MHicYnlcnXRNCwRz8mzYW6iDiXjzEdLbOS7WJBr4Xx5IV8FBw4oLNpD3yYpRpo8qNvqYw2/Yl8BpJ
	KPrxPqUSObEiO+qhoskEkOFimaQPoNV65L3X1xpXFG4CgOar4rcuglrlXhxKU2cnP9xsRYc/d+l4l
	PB3VR29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ramWU-00000000fOG-0vZ0;
	Fri, 16 Feb 2024 00:56:14 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ramWQ-00000000fMs-28Po
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 00:56:12 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1306110a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 16:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708044969; x=1708649769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkaCBJuNpLTSIqbfdZvMoBZZaPADj5hawM9y3evJX3c=;
        b=LV69hfL94WgMn5THykPokF6UEhIuorcm4xRl3yF+VEos0rmHBcTewRYSuM4OvUNobP
         d7x1XtHNy82mSv6czD4u6zjBOyDiL+nCBTKJm9udghexAf/8RGH1/XBm0FZnh2ANlOuO
         j1fh1yfw13qkSEQwqqnuby4f2M4e/JVCXBsPagiUZHIQ0svTSFDLmSHNZN7s2oCA/9d8
         UYYa9Z6+CG80V0ZMgxJRW7HIRO1c2RyByzgRndSRvRd2bEn6yCg0+xZK6+Inrz0yPwKa
         oK+I4j43FZFa346EF4PfDm63NmRgyNENy/ZFozytASkkjpc/02ZY5vFCrPxWXJO1wV3a
         gUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708044969; x=1708649769;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkaCBJuNpLTSIqbfdZvMoBZZaPADj5hawM9y3evJX3c=;
        b=lJ7U8W+LX7ll6Z+21dwn5F9ieHCjIeX/v2zW+MhY1TJPW3wUzeg8JeISVLp9f2wCbe
         vVBaIFiz+Ok34KxyrNht2Ebcet4UlaLnK/0qPBJUCekhSodX9hMI3NNgR/GGJLw0f/Xt
         zV5OiDZ1an+LYy+09zofSoOXhmTM1zZNJpFEdG8R7BExlWzzf3GpgHy2VjyPKLR6n/+C
         tu6sYmY5JPuqtpAauHBODmgyb3SPokoAU46s3/Uwh4je2/JJhVsYYs1KTNOpwlHjfAY4
         Bvx4eAAy57zC59J45SRZTuyPvu7+2dtRqlanalIUuAMHbZrbOi5CrHETtO62fU1jL6PQ
         shGA==
X-Forwarded-Encrypted: i=1; AJvYcCU1VykdKFUVzR3eabaPts1KnJdnCDPI70SzTRarUAaj7/yzssqMTiEigSZb7G3qkPGoR0KFxkVvX9Y/E0y57MYZEfoYcypShnV+HiU5meKR
X-Gm-Message-State: AOJu0YyB19mtNtKKQr9laD4LQiORSYWJENpeTXmbR9rtNQapsUAFIaJX
	dFdJNqc1EJn3W49AksrvrG/2ekFasxXv652fyK2WDVghKK1yOsUjq9lFzgYZ8co=
X-Google-Smtp-Source: AGHT+IHEdkJhS9SoXoCEe/hJTYKY/SrGzTuFOcU7WZTPXR1Lel/kxVf3cz4WYWwmZlHimuBM52+XzQ==
X-Received: by 2002:a05:6a20:c78d:b0:19e:8af3:8894 with SMTP id hk13-20020a056a20c78d00b0019e8af38894mr4287094pzb.0.1708044968806;
        Thu, 15 Feb 2024 16:56:08 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id bn15-20020a056a00324f00b006dddd5cc47csm1932099pfb.157.2024.02.15.16.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:56:08 -0800 (PST)
Date: Thu, 15 Feb 2024 16:56:08 -0800 (PST)
X-Google-Original-Date: Thu, 15 Feb 2024 16:56:06 PST (-0800)
Subject: Re: [PATCH v4 0/4] membarrier: riscv: Core serializing command
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  mathieu.desnoyers@efficios.com, paulmck@kernel.org, corbet@lwn.net, mmaas@google.com, hboehm@google.com,
  striker@us.ibm.com, Charlie Jenkins <charlie@rivosinc.com>, rehn@rivosinc.com,
  rdunlap@infradead.org, sorear@fastmail.com, linux-riscv@lists.infradead.org,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, parri.andrea@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: parri.andrea@gmail.com
Message-ID: <mhng-43090865-0201-48df-a5b0-8b160b3fbb1b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_165610_733945_3CC29BDD 
X-CRM114-Status: GOOD (  14.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jan 2024 06:49:32 PST (-0800), parri.andrea@gmail.com wrote:
> Changes since v3 ([1]):
>   - amend documentation
>
> Changes since v2 ([2]):
>   - amend inline comments
>   - drop ARCH_HAS_MEMBARRIER, create membarrrier.rst
>
> Changes since v1 ([3]):
>   - add smp_mb() in switch_mm()
>   - introduce ARCH_HAS_MEMBARRIER, amend documentation
>
> Changes since RFC ([4]):
>   - introduce prepare_sync_core_cmd()
>   - fix nosmp builds
>
> [1] https://lore.kernel.org/lkml/20240110145533.60234-1-parri.andrea@gmail.com/
> [2] https://lore.kernel.org/lkml/20231211094414.8078-1-parri.andrea@gmail.com/
> [3] https://lore.kernel.org/lkml/20231127103235.28442-1-parri.andrea@gmail.com/
> [4] https://lore.kernel.org/lkml/20230803040111.5101-1-parri.andrea@gmail.com/
>
> Andrea Parri (4):
>   membarrier: riscv: Add full memory barrier in switch_mm()
>   membarrier: Create Documentation/scheduler/membarrier.rst
>   locking: Introduce prepare_sync_core_cmd()
>   membarrier: riscv: Provide core serializing command
>
>  .../membarrier-sync-core/arch-support.txt     | 18 ++++++-
>  Documentation/scheduler/index.rst             |  1 +
>  Documentation/scheduler/membarrier.rst        | 39 +++++++++++++++
>  MAINTAINERS                                   |  4 +-
>  arch/riscv/Kconfig                            |  4 ++
>  arch/riscv/include/asm/membarrier.h           | 50 +++++++++++++++++++
>  arch/riscv/include/asm/sync_core.h            | 29 +++++++++++
>  arch/riscv/mm/context.c                       |  2 +
>  include/linux/sync_core.h                     | 16 +++++-
>  init/Kconfig                                  |  3 ++
>  kernel/sched/core.c                           | 16 ++++--
>  kernel/sched/membarrier.c                     | 13 +++--
>  12 files changed, 185 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/scheduler/membarrier.rst
>  create mode 100644 arch/riscv/include/asm/membarrier.h
>  create mode 100644 arch/riscv/include/asm/sync_core.h

I picked these up into my staging tree for the tester this morning, 
there's a few hiccups from my latest master merge but they don't seem 
super exciting.  So it might take a bit for these to show up in my 
for-next, but they're headed in that direction.

LMK if you guys were aiming for some other tree, or want to do some sort 
of shared tag for them.  Otherwise they'll show up in linux-next soon.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
