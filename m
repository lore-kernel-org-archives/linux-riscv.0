Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FECC001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5nEIEyt+I83yRSXQU29rc8SXn0AJ9OhAU8equ7xjGE=; b=yrkgMGyfA0oWRg
	JGKV+fXfkbPjKG2clPgnVs4xj5MkZG2G8dqTWU1LzjajFIE3iVttYi/ww2igich9xUYK055KLapjj
	11EiPuXy29v61Viyh6UtlMuwClJVdlhNSa4jpEqRPAE1ZiCWqJRnRuU7XeXhdx6qQz7ZSwDLkwvqQ
	AaA7BPqJt5iwwnB/JvZo5xQ1uSYm1UvPydJYJk5rRXtMpNyT7d0q5nozHwUiAAL0EwN139D+hM2MS
	Kn6xcEH64rvJJk0nCVrsb9n1NC4Ly4Ttv2ruSN3StprapZvbqUI+lGCHPzRpDXg0ZHC11CfYf2fSX
	7ltIr+NxZUAwY/bCg3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyXe-00CtVA-0p;
	Fri, 04 Aug 2023 17:24:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyXY-00CtSf-1a
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 17:24:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bbc7b2133fso16769145ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691169876; x=1691774676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dCgovGjA3i88/DRKbmpMbX8JfFD5s33+3P385ru820=;
        b=lxd4JId2NSaFGzdUAtrXrGl9h3sikKfNJPKpQMkKrgJ3ByruhE8NRNd3S3sTDxOuEQ
         FVioVLFZHOeNQtuvWJUm5VHidGl2pwfRVLFcLvas5Ma6nIZoW+s5dhCPhtQkifiOZv3/
         mxHS/DAEasR1wGYpSc4l8xCRe/iM81qcbswIfQpr/obcQZexr7djCONcRnztYzKzr4nG
         IhDLPXkbR2sSr978ajy4RCNoATz0yt6oS05TDk9Ir9wDSR7+RlUmtsPXrCwZU4gYbz6e
         kbhfGMw3XVoT1iQv06aGZk9Wdb0o/M2kIVruOwtefAYMgNm2GDkwPmLSbZupTaqcl/0Q
         eacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691169876; x=1691774676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dCgovGjA3i88/DRKbmpMbX8JfFD5s33+3P385ru820=;
        b=dJYtzfSPjn8VawhTacDH49NgNzQIXhj+auaJS/Txc2bTQi7UeF/+/ppdRxatcKDSLa
         OzH/J+7o+AfoEk7zoxGiRVsdQ7wf7ERBYKKJRu73Enf+ayZu5aUQ7IJFTk8XNdzwRE3n
         +OdN7YdvZBh85QbABzgoMOr4yHVpWU67Oi/fw0cZoN2458H61uTNCctTokUGZ73jFNvM
         tsvzHtsgQgl67uS61TvAoxofWwPIpxn5dChWieCy+IMG8hHcvXJtDcKyOdsdQ+ebBMUt
         T2Niti8uv2RCLVMXjAOmE6c1LTcZ4BbfgvOborufje+4tLJslXEY1Xt/STmhe4dG2tSa
         /dSA==
X-Gm-Message-State: AOJu0YxXg1VoLEaZ7yX6mwuwxNIdtSZt0kE90ZGug/nDyoP0YkusGBBo
	BJ/os/6i4mh2mygYYTJ91jtThg==
X-Google-Smtp-Source: AGHT+IHEHW+Qgppuc3dxGAxj+yZ3geOnx7bPe8p1hSmHW7alqhLh0JyVgZwg7UOjVpy+x29pn7xmSw==
X-Received: by 2002:a17:902:e80c:b0:1b8:59f0:c748 with SMTP id u12-20020a170902e80c00b001b859f0c748mr2466696plg.2.1691169875886;
        Fri, 04 Aug 2023 10:24:35 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jd9-20020a170903260900b001bb54abfc07sm2004306plb.252.2023.08.04.10.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:24:35 -0700 (PDT)
Date: Fri, 4 Aug 2023 10:24:33 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	bpf@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Nam Cao <namcaov@gmail.com>
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
Message-ID: <ZM00UYDzEAz/JT3n@ghost>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230804-2c57bddd6e87fdebc20ff9d5@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804-2c57bddd6e87fdebc20ff9d5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_102440_538025_C0765DD2 
X-CRM114-Status: GOOD (  34.80  )
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

On Fri, Aug 04, 2023 at 12:28:28PM +0300, Andrew Jones wrote:
> On Thu, Aug 03, 2023 at 07:10:25PM -0700, Charlie Jenkins wrote:
> > There are numerous systems in the kernel that rely on directly
> > modifying, creating, and reading instructions. Many of these systems
> > have rewritten code to do this. This patch will delegate all instruction
> > handling into insn.h and reg.h. All of the compressed instructions, RVI,
> > Zicsr, M, A instructions are included, as well as a subset of the F,D,Q
> > extensions.
> > 
> > ---
> > This is modifying code that https://lore.kernel.org/lkml/20230731183925.152145-1-namcaov@gmail.com/
> > is also touching.
> > 
> > ---
> > Testing:
> > 
> > There are a lot of subsystems touched and I have not tested every
> > individual instruction. I did a lot of copy-pasting from the RISC-V spec
> > so opcodes and such should be correct
> 
> How about we create macros which generate each of the functions an
> instruction needs, e.g. riscv_insn_is_*(), etc. based on the output of
> [1]. I know basically nothing about that project, but it looks like it
> creates most the defines this series is creating from what we [hope] to
> be an authoritative source. I also assume that if we don't like the
> current output format, then we could probably post patches to the project
> to get the format we want. For example, we could maybe propose an "lc"
> format for "Linux C".
That's a great idea, I didn't realize that existed!
> 
> I'd also recommend only importing the generated defines and generating
> the functions that will actually have immediate consumers or are part of
> a set of defines that have immediate consumers. Each consumer of new
> instructions will be responsible for generating and importing the defines
> and adding the respective macro invocations to generate the functions.
> This series can also take that approach, i.e. convert one set of
> instructions at a time, each in a separate patch.
Since I was hand-writing everything and copying it wasn't too much
effort to just copy all of the instructions from a group. However, from
a testing standpoint it makes sense to exclude instructions not yet in
use.
> 
> [1] https://github.com/riscv/riscv-opcodes
> 
> Thanks,
> drew
> 
> 
> > , but the construction of every
> > instruction is not fully tested.
> > 
> > vector: Compiled and booted
> > 
> > jump_label: Ensured static keys function as expected.
> > 
> > kgdb: Attempted to run the provided tests but they failed even without
> > my changes
> > 
> > module: Loaded and unloaded modules
> > 
> > patch.c: Ensured kernel booted
> > 
> > kprobes: Used a kprobing module to probe jalr, auipc, and branch
> > instructions
> > 
> > nommu misaligned addresses: Kernel boots
> > 
> > kvm: Ran KVM selftests
> > 
> > bpf: Kernel boots. Most of the instructions are exclusively used by BPF
> > but I am unsure of the best way of testing BPF.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > 
> > ---
> > Charlie Jenkins (10):
> >       RISC-V: Expand instruction definitions
> >       RISC-V: vector: Refactor instructions
> >       RISC-V: Refactor jump label instructions
> >       RISC-V: KGDB: Refactor instructions
> >       RISC-V: module: Refactor instructions
> >       RISC-V: Refactor patch instructions
> >       RISC-V: nommu: Refactor instructions
> >       RISC-V: kvm: Refactor instructions
> >       RISC-V: bpf: Refactor instructions
> >       RISC-V: Refactor bug and traps instructions
> > 
> >  arch/riscv/include/asm/bug.h             |   18 +-
> >  arch/riscv/include/asm/insn.h            | 2744 +++++++++++++++++++++++++++---
> >  arch/riscv/include/asm/reg.h             |   88 +
> >  arch/riscv/kernel/jump_label.c           |   13 +-
> >  arch/riscv/kernel/kgdb.c                 |   13 +-
> >  arch/riscv/kernel/module.c               |   80 +-
> >  arch/riscv/kernel/patch.c                |    3 +-
> >  arch/riscv/kernel/probes/kprobes.c       |   13 +-
> >  arch/riscv/kernel/probes/simulate-insn.c |  100 +-
> >  arch/riscv/kernel/probes/uprobes.c       |    5 +-
> >  arch/riscv/kernel/traps.c                |    9 +-
> >  arch/riscv/kernel/traps_misaligned.c     |  218 +--
> >  arch/riscv/kernel/vector.c               |    5 +-
> >  arch/riscv/kvm/vcpu_insn.c               |  281 +--
> >  arch/riscv/net/bpf_jit.h                 |  707 +-------
> >  15 files changed, 2825 insertions(+), 1472 deletions(-)
> > ---
> > base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> > change-id: 20230801-master-refactor-instructions-v4-433aa040da03
> > -- 
> > - Charlie
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
