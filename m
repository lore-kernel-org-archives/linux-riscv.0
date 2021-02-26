Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2967C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 06:22:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C1564ECE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 06:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C1564ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HUcAKArUIZVQfMwCdc2xYH/91yC62rMf1L1feVBDZtg=; b=ctpBC6HtII+JUNdESTLmjWlVL
	zGunccCHspA51KYZWQ+m2O8iS22mJhWCwsrKP6eG7nI1uQUsCqt+rpLWzuIprdHkPY0dem4oUrGnb
	tDeHCwc/rI9FpBK1DNsmJskn4NiTs7ZavcpugoYAGReAiipwl/j0TgEQvpJZC+x7EnuINIZtnpw08
	A4WO0UobXJVzjlWS79ItHYlGnILtq82kjFI8IV8+nvf3xCE2xTZFkgoZSj1xnG/xlUUV2bq9d6nwP
	PmNwmCEOxXC3ItJ16HIXBu144SlS3Nxoyk1bUpikB74SZIGSoA3bSLyydXnRA49RX5tTnvKgvejfJ
	TxXDfuukA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFWVX-0001qd-6c; Fri, 26 Feb 2021 06:21:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFWVU-0001qH-Rs
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 06:21:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D208764EF0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 06:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614320503;
 bh=BX4ANU+deMF/gCnboQiDGoO4O8tphEU0zGUoRnCR8+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qfHHydEIR/PrCEjFmvW05eOKcqgxnIKVRlNys0hmd4Jt6eF4++8eqlDkNDxD8fMb7
 z9uFv19hoTaovxU4em4pKiE/pnRtfkxl+Od1tBuqagziI9T7rTErCnaDEtPlyaiPLU
 SlXlvcZCqdeHj+zE5MfwcqLUwvG4NiEBiM3xrXnoQ59mPLoY3iFTRm+r4i0KULpw2V
 T4jamGddsxz0q0TNA60vkOYo/tJWe4AWQgCWoj/68JBPzCtlP0esZmvOZVuhaN51WO
 PRZyjsEEfQqRJAM1cTQmxTlGjW+L2V3MeCXFP4gYjw5wQ4h7NtLN7GBDdGF06i3+ie
 VZuhpgLH/pU2Q==
Received: by mail-lj1-f170.google.com with SMTP id h4so9164247ljl.0
 for <linux-riscv@lists.infradead.org>; Thu, 25 Feb 2021 22:21:42 -0800 (PST)
X-Gm-Message-State: AOAM530gyucmUZ+BpDz6xok3N5W8xePzrgtTWJd+TNiuokd8x3W+1Yjm
 f0PRd7US5PmNf+WkyQC7QfiChwieKxVg6ccDQJs=
X-Google-Smtp-Source: ABdhPJz6GQ02m5yKncjhLrHyBdN+zIU3XRAYgog6pHcVmxWLyha3SvidqvgQS/WKsUsg1QE4UoT+9SSgSw5aoCdPnI4=
X-Received: by 2002:a2e:919a:: with SMTP id f26mr793595ljg.508.1614320500903; 
 Thu, 25 Feb 2021 22:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20210225142841.3385428-1-arnd@kernel.org>
 <20210225142841.3385428-2-arnd@kernel.org>
In-Reply-To: <20210225142841.3385428-2-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 26 Feb 2021 14:21:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQriSy2rLHkvJ+YwHtyBE3BwneZQ-FqwSUzLjSRc9gRcA@mail.gmail.com>
Message-ID: <CAJF2gTQriSy2rLHkvJ+YwHtyBE3BwneZQ-FqwSUzLjSRc9gRcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: features: refresh feature list
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_012145_081799_76FB199A 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 David Daney <david.daney@cavium.com>, linux-doc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Pekka Enberg <penberg@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Xingxing Su <suxingxing@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Archer Yan <ayan@wavecomp.com>, Youling Tang <tangyouling@loongson.cn>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Arnd,

I'm very glad to see C-SKY & RISC-V features updated.

Signed-off-by: Guo Ren <guoren@kernel.org>

On Thu, Feb 25, 2021 at 10:29 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
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
> --
> 2.29.2
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
