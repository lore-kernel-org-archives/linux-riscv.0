Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB90FC3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thw05/4MXKRkr6Q/wPs/wYlfbGYWatjKYTVfUpKMx8k=; b=FsDDVkr6PWU6bT
	OxIXFemqCHufEXNwKFIi3t/pkXjuAzD4gFw5iPyLFB3OST2Z9ksX1DaAlSk4i9M62G66NfxhUD4ke
	TXVs4VvOjoBH/Uv3PXf6ZvjHJJ3CDtuOzms1I4LjkAJhyh80YIKvj73fE+Lw8EKhGZISgkxhwEUN/
	xMjaLAYTuIS0F9DqMbMU3u5UhIGqIubM0CD7InY9VI3+7o3iIW8Wp9zZI0WsazlGtbv43MNkjdq7U
	ddT839kZ+xJfsdiPvSZkoOM3DP1yIlYltx8zfp0abJSCFACWpqzEFZ3BBzwWAcsvPWTQgm8eXW4YY
	kvHdak2Az3ytHR0RXXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2Kw-0000000FfsL-0zwt;
	Thu, 11 Jul 2024 22:32:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2Kt-0000000Ffrl-2w6K
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 22:32:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2caaae31799so911060a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 15:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737143; x=1721341943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz6SMaKbxQM/TiE/u9HESjvtjN+gL/cg2Eq0PvwsdLA=;
        b=CTk653TU1NgxJHc7JZiqZhg0U6sgJaEhmEciWxcawRUM165S4/nSf2p2epXoKU1Y8J
         hDPxAdpinzxETL3Df1Mtl4tnkngc8ZzHEkJq7yz2/e860wNUGvBIbZi1Io0xp677skb7
         l2w/LVU0DocGghCRxCNQjWDW6dg3dJgesYSF+M6XasAXgUUglevKjXJrTTtA8wwyzB3l
         JtiZgKk6MzyFy+458Jxgf/1vp5kE94MMial6lJx58ZBi4ctjzPFvt2IDgIXL4cZcLrdG
         GVOCnGJ2vv8w5Bh5TWbpgAs5/dUoDgmUIyHI3kGZvCRbuOu6csurrz+z5+8st+CUuA0H
         LRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720737143; x=1721341943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz6SMaKbxQM/TiE/u9HESjvtjN+gL/cg2Eq0PvwsdLA=;
        b=RPnJBHs9jLHrnv6PuMls+FlHUVqqVArzAFM00118Yy9+kwhMuTp+63x4OE741/4qb5
         zzbiPqd/0VuaC5kua1yGOmhQtEzvN5KcLfLBM4FLQP4i8VfkCAT6mVVgLXKjrwkiqvbD
         OTN6rpVI/2UouDwMUe8qNUS5oC4H9JJ1YYaCu5bBCz1qlJlBeKxzLhP5943wAD1E2PvO
         QUBGuXfGwDT27JvEBwUSszD+6vM4mv4bhKo/BTXLiL2jP4KCsbbcrwCxTYtA4lmJzao7
         zj1bwV5/lQ8MTbBY4wOVD17onh4/BnNCLYIFMSDIwep4x5Pc048i2oZnsUaa75q5rbS4
         Y2CQ==
X-Gm-Message-State: AOJu0YzsM0JUvBK5vp8SL9dxysakMKBbIvFd0U/q3yVfuTPQIhV3uuEH
	qROGaGaIJ0mHLPE7Ykx7xyACWydD1oCB/1LqahtFYstLIx/ZazI+JWIZbT2gpUA=
X-Google-Smtp-Source: AGHT+IEb8eWHUw5IrIXidt2Niw54kyg/KUv5N5U3VVq6KgJ0Y3khzK6QMTtYunRfJ9U+b2MVWWdxsg==
X-Received: by 2002:a17:90b:1191:b0:2c7:c6c4:1693 with SMTP id 98e67ed59e1d1-2ca35c788a9mr8554667a91.21.1720737142825;
        Thu, 11 Jul 2024 15:32:22 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd7027b5sm98687a91.54.2024.07.11.15.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:32:22 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:32:19 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] RISC-V: Detect and report speed of unaligned
 vector accesses
Message-ID: <ZpBdc9bCrAPWmhEz@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_153223_763438_BA6F87E6 
X-CRM114-Status: GOOD (  21.17  )
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

On Thu, Jul 11, 2024 at 05:58:39PM -0400, Jesse Taube wrote:
> Adds support for detecting and reporting the speed of unaligned vector
> accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> emulated all CPUs. The vec_misaligned_speed key keeps the same format
> as the scalar unaligned access speed key.
> 
> This set does not emulate unaligned vector accesses on CPUs that do not
> support them. Only reports if userspace can run them and speed of
> unaligned vector accesses if supported.
> 
> If Zicclsm is present, the kernel will set both scalar and vector unaligned access speed to FAST.

Now that we have unfortunately realized that Zicclsm is not useful, this
patch no longer does this check, and doesn't use the Zicclsm bindings
in patch 1 and 2. This could be split out into a separate series, but
it's probably fine to leave the bindings in this series.

> 
> This patch requires the following patche to be applied first:
> RISC-V: fix vector insn load/store width mask
> https://lore.kernel.org/all/20240606182800.415831-1-jesse@rivosinc.com/
> 
> V1 -> V2:
>  - New patch: dt-bindings: riscv: Add Zicclsm ISA extension description.
>  - New patch: RISC-V: Check scalar unaligned access on all CPUs
>  - New patch: RISC-V: hwprobe: Document unaligned vector perf
> V2 -> V3:
>  - New patch: RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
>  - Split patch: RISC-V: Check scalar unaligned access on all CPUs
>  - New patch: RISC-V: Check Zicclsm to set unaligned access speed
> V3 -> V4:
>  - Drop patch: RISC-V: Check Zicclsm to set unaligned access speed
> 
> Jesse Taube (7):
>   RISC-V: Add Zicclsm to cpufeature and hwprobe
>   dt-bindings: riscv: Add Zicclsm ISA extension description.
>   RISC-V: Check scalar unaligned access on all CPUs
>   RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
>   RISC-V: Detect unaligned vector accesses supported
>   RISC-V: Report vector unaligned access speed hwprobe
>   RISC-V: hwprobe: Document unaligned vector perf key
> 
>  Documentation/arch/riscv/hwprobe.rst          |  21 +++
>  .../devicetree/bindings/riscv/extensions.yaml |   7 +
>  arch/riscv/Kconfig                            |  57 ++++++-
>  arch/riscv/include/asm/cpufeature.h           |   7 +-
>  arch/riscv/include/asm/entry-common.h         |  11 --
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/hwprobe.h              |   2 +-
>  arch/riscv/include/asm/vector.h               |   1 +
>  arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
>  arch/riscv/kernel/Makefile                    |   3 +-
>  arch/riscv/kernel/copy-unaligned.h            |   5 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/fpu.S                       |   4 +-
>  arch/riscv/kernel/sys_hwprobe.c               |  42 +++++
>  arch/riscv/kernel/traps_misaligned.c          | 134 ++++++++++++++--
>  arch/riscv/kernel/unaligned_access_speed.c    | 148 +++++++++++++++++-
>  arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
>  arch/riscv/kernel/vector.c                    |   2 +-
>  18 files changed, 472 insertions(+), 38 deletions(-)
>  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
> 
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
