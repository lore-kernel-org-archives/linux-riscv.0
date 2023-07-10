Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565E5EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZkGm+gxgv97PfNUpQEyE/f6NirvSn4NGOedOhabNI6M=; b=oIbxjMnmKvGenp67Ho2bR2SzqG
	ZacUlcwXdxgr6Ct6B8EwMC5FzYynY2dkLqn1/NYrvbN5lTOE5pDlJnVvhGaDXryTQx2q1BWoNhzDB
	PPGeZZlkIezFP7ilR3NAC9hbXbJU9JnCIPsAxbLMzri7tVueljIMlY9dySE9rKghPhA5YdBPTOhAg
	Y5/MXRvRRxiIz5i4x5SXRB8DD+aMtHwamdA3oEjis8qSHMDGQrB7orLXBfpu2G6jXFgVZA1Dbl2jl
	9VWmgsx7wZzrv3Kf48iS0p3+hheOgBPNduo5Q8QlTtzsEmGv7j2xXM6fll3EVt10jExgh2fSMShAv
	l8EUyM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwFF-00CWl1-0A;
	Mon, 10 Jul 2023 19:08:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwF9-00CWjr-0M
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 19:08:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b89b75dc1cso38458305ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689016090; x=1691608090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voVX6LNoZ/J8bMuhFyaOWgRv6Zq5UVw3bcxlCreIau0=;
        b=1tKrKVjLsZlhy8odFljy5A7wgwOCceiEXO0WXFWKcEbHGeOAOez2StDWYQKKXYaf0u
         KxvJRa87HdcA5pB0okif7Z0b35z8cc2tLASh5d+miBIE6Bs9KUTlrUUm/kzyEOS8+Tw2
         NETrfXnOhywt/LmYyBC7fKj+hbGw6hbAZA0MR/Lqbpdhr1EE77xQjHZdwp5lpyZmyN0f
         5KtlxzprTcf99MCiVS+GKMHENseXkS5L+25K1U3M8luzAxoJFRGfhUGNiWxu9e94kPSL
         MmJ14tdvNpj9MMRH58e0MXWxAcen7uRtBbWunqMeVRUHOUsBD5opsT7ROZtyvI8tD/e1
         pFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016090; x=1691608090;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voVX6LNoZ/J8bMuhFyaOWgRv6Zq5UVw3bcxlCreIau0=;
        b=CmPzBxmhYY4av8ImHuh8V8sfw2VJhjZxyReTBBqhqkL/a0ZiNxje+cFZR71GsXZI+1
         5pJ2aMhFLZCGYnlvPRknSqwQ5JmD8w+HkieAOB7rBM9wdWWHqAQuS9mnB12iKZPWkqKc
         p+uv5JA7JtGlXs7Mxp65R3qVRsT4s85TYn58gn9cM1DmJWB1UF01M7UDunGWXtDbZWnt
         1gOGvOQdzmSTdDqRQNKvp4u/HDjNR4jOOILptxk6LQJAJ0smp8cRNj41yJauG2pbfSMo
         zZ9HjsE4KXq7i6Ycb7sgTqGazIIus/TWWQe3c+uKyfdUgHILFNq1XOBGQga9iezccP3M
         hNKw==
X-Gm-Message-State: ABy/qLZ+uHeU0q76cLMhRvzzYf8QDbCdeMLfJw/eq8sSrSU3tVfNAaxY
	qIxPt5FJ9hgVJ460MguJr4r+2w==
X-Google-Smtp-Source: APBJJlE1fEH2sHOVo9utDEMzkiIiKOHtiey9zE83fpGfTKSsuED5sR/xEAs2EL4vldSYbhB1R9O4yw==
X-Received: by 2002:a17:902:db10:b0:1b8:a936:1915 with SMTP id m16-20020a170902db1000b001b8a9361915mr20863454plx.22.1689016090010;
        Mon, 10 Jul 2023 12:08:10 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902da8d00b001ac95be5081sm219080plx.307.2023.07.10.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:08:09 -0700 (PDT)
Date: Mon, 10 Jul 2023 12:08:09 -0700 (PDT)
X-Google-Original-Date: Mon, 10 Jul 2023 12:07:23 PDT (-0700)
Subject: Re: [PATCH v2 0/6] riscv: KCFI support
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  keescook@chromium.org, nathan@kernel.org, ndesaulniers@google.com,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
  linux-kernel@vger.kernel.org, samitolvanen@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samitolvanen@google.com
Message-ID: <mhng-2fe7822f-f869-4513-b8a6-7da21ce5ccd8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_120819_340293_7AE4F658 
X-CRM114-Status: GOOD (  26.46  )
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

On Mon, 10 Jul 2023 11:35:45 PDT (-0700), samitolvanen@google.com wrote:
> This series adds KCFI support for RISC-V. KCFI is a fine-grained
> forward-edge control-flow integrity scheme supported in Clang >=16,
> which ensures indirect calls in instrumented code can only branch to
> functions whose type matches the function pointer type, thus making
> code reuse attacks more difficult.
>
> Patch 1 implements a pt_regs based syscall wrapper to address
> function pointer type mismatches in syscall handling. Patches 2 and 3
> annotate indirectly called assembly functions with CFI types. Patch 4
> implements error handling for indirect call checks. Patch 5 disables
> CFI for arch/riscv/purgatory. Patch 6 finally allows CONFIG_CFI_CLANG
> to be enabled for RISC-V.
>
> Note that Clang 16 has a generic architecture-agnostic KCFI
> implementation, which does work with the kernel, but doesn't produce
> a stable code sequence for indirect call checks, which means
> potential failures just trap and won't result in informative error
> messages. Clang 17 includes a RISC-V specific back-end implementation
> for KCFI, which emits a predictable code sequence for the checks and a
> .kcfi_traps section with locations of the traps, which patch 5 uses to
> produce more useful errors.
>
> The type mismatch fixes and annotations in the first three patches
> also become necessary in future if the kernel decides to support
> fine-grained CFI implemented using the hardware landing pad
> feature proposed in the in-progress Zicfisslp extension. Once the
> specification is ratified and hardware support emerges, implementing
> runtime patching support that replaces KCFI instrumentation with
> Zicfisslp landing pads might also be feasible (similarly to KCFI to
> FineIBT patching on x86_64), allowing distributions to ship a unified
> kernel binary for all devices.
>
> ---
>
> Changes in v2:
>   - Rebased on 6.5-rc1.
>   - Sorted Kconfig entries alphabetically.
>
>
> Sami Tolvanen (6):
>   riscv: Implement syscall wrappers
>   riscv: Add types to indirectly called assembly functions
>   riscv: Add ftrace_stub_graph
>   riscv: Add CFI error handling
>   riscv/purgatory: Disable CFI
>   riscv: Allow CONFIG_CFI_CLANG to be selected
>
>  arch/riscv/Kconfig                       |  3 +
>  arch/riscv/include/asm/cfi.h             | 22 ++++++
>  arch/riscv/include/asm/insn.h            | 10 +++
>  arch/riscv/include/asm/syscall.h         |  5 +-
>  arch/riscv/include/asm/syscall_wrapper.h | 87 ++++++++++++++++++++++++
>  arch/riscv/kernel/Makefile               |  2 +
>  arch/riscv/kernel/cfi.c                  | 77 +++++++++++++++++++++
>  arch/riscv/kernel/compat_syscall_table.c |  8 ++-
>  arch/riscv/kernel/mcount.S               |  9 ++-
>  arch/riscv/kernel/suspend_entry.S        |  5 +-
>  arch/riscv/kernel/sys_riscv.c            |  6 ++
>  arch/riscv/kernel/syscall_table.c        |  8 ++-
>  arch/riscv/kernel/traps.c                |  4 +-
>  arch/riscv/purgatory/Makefile            |  4 ++
>  14 files changed, 238 insertions(+), 12 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cfi.h
>  create mode 100644 arch/riscv/include/asm/syscall_wrapper.h
>  create mode 100644 arch/riscv/kernel/cfi.c
>
>
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5

Thanks, this generally LGTM it was just a bit late for the last merge 
window.  I'm still poking around to make sure there's no fallout in rc1, 
this is in the queue (but there's some other stuff too).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
