Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854F2C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 05:34:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236D364E60
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 05:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236D364E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uztwmWMaiS6WmYCAfngYHAYbHNxiyETvY9Hsm8FoKIQ=; b=R0nS3pEqqF/ETVZROlKX75AFi
	0XX8F3bCNIfKSHZTIdFhfWAdCpIf+lMiG1ofsp2oc51GPa8FqhRtULNVIT/QAPVFACnFZy8UjGO+z
	TdPLt3H3+wSWQhwxcTMk6nyxqe4TxAS8mwYstSJeOnxPm2zaPqrY2LHxKyLc3X3CFbIFuSGMzY+uf
	c8scumXieAf8cfYsTxMPvtWqbHEmGRF6ZaEtDDbzrCZ2yVVdQSteuAyp7Y/zoQJBxzqL0OxOMbSmB
	3TZt3hvvo4HGqU1uTogIJwhEQpjmVKMsB7eLtZb1m01vyvloCeFFxi56VBpGm5QDbJ+josLExni0g
	+ZbkWLfLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFVm5-0000ZA-HL; Fri, 26 Feb 2021 05:34:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFVm3-0000Yd-7d
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 05:34:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id o22so6161881pjs.1
 for <linux-riscv@lists.infradead.org>; Thu, 25 Feb 2021 21:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=E/72ukQbxYFbVDYN4+VjF6J8sjswQu6JBy9Ss0as/qU=;
 b=vhgwHnFNT/68Ayu7hro0UxDnpQReFVDyOPHPkE0/XUKxwK8kZmaS8R7kq78Q0Us743
 SGyU1Ac82gfd9zr8RCIdEyGBwS8c3kH02NmTGHzjn5GDNSilpugoe7ewdOfrVZYp3f5o
 KCrdW3pjxtOhhuf0z8v9/TPAHxjTxrjwpNfLKxVt23zoDOYQmQYzPke+//rhUDzRBwRe
 IcG6lgAJBcZ+jlCmERdKj0dUfL/aSHZbET2IsyHTFFBYbWsztxywU5PIj9jPqxRmStMe
 wL/0YzryIUBLtuWKpuvp9HlAybL+dAc49h8aLMdSl8ki/dfYVqmmxrGmG6pCfCOJaCNv
 EXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=E/72ukQbxYFbVDYN4+VjF6J8sjswQu6JBy9Ss0as/qU=;
 b=gMYaZgH6NBex3RI/FMraTW2DzD4lgSR2tMyfjJuyv8EhTroTubvXUB6uS3J/6BJ5jm
 yVf2Ijpzp+FdZ1gMOCbYnuclqEeoq6nXw+ApJF3o4W7+TDz5lChLjN1tBq9s8Ckn+ccx
 jXaJVlPQ2t1BZAPv2L3UizqIacJzg48g8zGQjmYFiRkvsHXQOs8Ze5wE760T6D6bfej1
 2M2r9XVcjUbR7C4g5Gaj1jgoP35M9k8zNUVmbccmU2VmAY71rYIFOryEJppHez4H9wco
 GRRjQCbkL4i42oSOKDesuhUzMLXEqIaADsekfb2jUYzc1SAU8wHoO5bNy420zZdGMr7I
 Vsng==
X-Gm-Message-State: AOAM532D+T+vAxVFVySt6j801/ZLLk997a9ZAC4O7x8SU7FD55PN0xOK
 QE6sSIaTfAylaZmkdlM/GslkRw==
X-Google-Smtp-Source: ABdhPJzW1IJ4S3iG3hcraE3lyy9TjHQW8d0WKS43o1bxGTLqIkJbTOvVQByksy5Oj08iXyZRZy7qjg==
X-Received: by 2002:a17:903:2491:b029:e4:16d6:e0a4 with SMTP id
 p17-20020a1709032491b02900e416d6e0a4mr1704912plw.64.1614317684998; 
 Thu, 25 Feb 2021 21:34:44 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h3sm7631695pgm.67.2021.02.25.21.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 21:34:44 -0800 (PST)
Date: Thu, 25 Feb 2021 21:34:44 -0800 (PST)
X-Google-Original-Date: Thu, 25 Feb 2021 21:34:10 PST (-0800)
Subject: Re: [PATCH 2/2] Documentation: features: refresh feature list
In-Reply-To: <20210225142841.3385428-2-arnd@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-dba4c3e2-9d1f-4e1d-8b9a-f19eb9bf519a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_003447_295355_FD2B1EC2 
X-CRM114-Status: GOOD (  17.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, aou@eecs.berkeley.edu, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net, david.daney@cavium.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 penberg@kernel.org, tsbogend@alpha.franken.de, guoren@kernel.org,
 mhiramat@kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, suxingxing@loongson.cn,
 yangtiezhu@loongson.cn, ayan@wavecomp.com, tangyouling@loongson.cn,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Feb 2021 06:27:18 PST (-0800), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Run the update script to document the recent feature additions
> on riscv, mips and csky.
>
> Fixes: c109f42450ec ("csky: Add kmemleak support")
> Fixes: 8b3165e54566 ("MIPS: Enable GCOV")
> Fixes: 1ddc96bd42da ("MIPS: kernel: Support extracting off-line stack traces from user-space with perf")
> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> Fixes: 829adda597fe ("riscv: Add KPROBES_ON_FTRACE supported")
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Fixes: dcdc7a53a890 ("RISC-V: Implement ptrace regs and stack API")

For the RISC-V stuff

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/features/debug/gcov-profile-all/arch-support.txt  | 2 +-
>  Documentation/features/debug/kmemleak/arch-support.txt          | 2 +-
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  Documentation/features/debug/kprobes/arch-support.txt           | 2 +-
>  Documentation/features/debug/kretprobes/arch-support.txt        | 2 +-
>  Documentation/features/debug/uprobes/arch-support.txt           | 2 +-
>  Documentation/features/perf/kprobes-event/arch-support.txt      | 2 +-
>  Documentation/features/perf/perf-regs/arch-support.txt          | 2 +-
>  Documentation/features/perf/perf-stackdump/arch-support.txt     | 2 +-
>  Documentation/features/sched/numa-balancing/arch-support.txt    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> index 416c70345946..b39c1a5de3f3 100644
> --- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
> +++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> @@ -16,7 +16,7 @@
>      |        ia64: | TODO |
>      |        m68k: | TODO |
>      |  microblaze: |  ok  |
> -    |        mips: | TODO |
> +    |        mips: |  ok  |
>      |       nds32: | TODO |
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
> diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
> index 915185634611..e9ac415f8aec 100644
> --- a/Documentation/features/debug/kmemleak/arch-support.txt
> +++ b/Documentation/features/debug/kmemleak/arch-support.txt
> @@ -10,7 +10,7 @@
>      |         arc: |  ok  |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> -    |        csky: | TODO |
> +    |        csky: |  ok  |
>      |       h8300: | TODO |
>      |     hexagon: | TODO |
>      |        ia64: | TODO |
> diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index aade7816cb87..96156e8802a7 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/Documentation/features/debug/kprobes/arch-support.txt b/Documentation/features/debug/kprobes/arch-support.txt
> index 4b663c124d1c..ee95ed61909a 100644
> --- a/Documentation/features/debug/kprobes/arch-support.txt
> +++ b/Documentation/features/debug/kprobes/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/debug/kretprobes/arch-support.txt b/Documentation/features/debug/kretprobes/arch-support.txt
> index 5449bb808442..612cb97d47b8 100644
> --- a/Documentation/features/debug/kretprobes/arch-support.txt
> +++ b/Documentation/features/debug/kretprobes/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/debug/uprobes/arch-support.txt b/Documentation/features/debug/uprobes/arch-support.txt
> index 2820177787e1..8bd5548a4485 100644
> --- a/Documentation/features/debug/uprobes/arch-support.txt
> +++ b/Documentation/features/debug/uprobes/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
> index 75739a0007e0..78f3fe080f0e 100644
> --- a/Documentation/features/perf/kprobes-event/arch-support.txt
> +++ b/Documentation/features/perf/kprobes-event/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Documentation/features/perf/perf-regs/arch-support.txt
> index ea8b6d96633a..5bf3b1854a1f 100644
> --- a/Documentation/features/perf/perf-regs/arch-support.txt
> +++ b/Documentation/features/perf/perf-regs/arch-support.txt
> @@ -16,7 +16,7 @@
>      |        ia64: | TODO |
>      |        m68k: | TODO |
>      |  microblaze: | TODO |
> -    |        mips: | TODO |
> +    |        mips: |  ok  |
>      |       nds32: | TODO |
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
> diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt b/Documentation/features/perf/perf-stackdump/arch-support.txt
> index 87165861037e..d88659bb4fc1 100644
> --- a/Documentation/features/perf/perf-stackdump/arch-support.txt
> +++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
> @@ -16,7 +16,7 @@
>      |        ia64: | TODO |
>      |        m68k: | TODO |
>      |  microblaze: | TODO |
> -    |        mips: | TODO |
> +    |        mips: |  ok  |
>      |       nds32: | TODO |
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
> diff --git a/Documentation/features/sched/numa-balancing/arch-support.txt b/Documentation/features/sched/numa-balancing/arch-support.txt
> index bfcfaff67a1b..9affb7c2c500 100644
> --- a/Documentation/features/sched/numa-balancing/arch-support.txt
> +++ b/Documentation/features/sched/numa-balancing/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: |  ..  |
>      |      parisc: |  ..  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ..  |
>      |       sparc: | TODO |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
