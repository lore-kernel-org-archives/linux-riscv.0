Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD633D6007E
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ut6uUzp16oAZIsMVORFMRGdC6PmJAUvxTmngT/ZBHXg=; b=eZQKEK/DJyZjVN
	+mYQbelFpx4NrFHGaJ7wK1S94fVsMr75Q2jgjybaGG5EQ3WKTKHqVVX+sz9MWh3+ZvhoLU/8ojAzu
	DAijtNNyH3YixwcFlnDugHxTOx+lLfJ4bBWVXzO4ZB0MIjO0koaFiA7MeZP+6R3Ge0+Rvm9Eewsc7
	c5B5t3V0SHmLR98gzVJM45O9xaRSMvIvV3VQo9rtGcWht/BnQUJ0fD3NwBcK24ORJRXLAfLeonqaf
	D5NjfbnivQb5TshQeG4C3uNnbbXfJK9FTpl+ZYYpENuetKu/kq3Wf67Ip0IOA1bCNPusHUFefeWba
	bz1MZqavi6m8aj0iUapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJgb-0000000Bliq-2MJN;
	Tue, 19 Nov 2024 08:34:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJgY-0000000Bli2-2hib
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 08:34:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so35670505e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732005249; x=1732610049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WUKCfmUuN+EAwvifVE4+S5ixV+7dGLlwu1X93E3/9sk=;
        b=H6UwB+8fNR/hY9esAj1znDf/XAzI3259ACjnrGPYEO4qt53IdQikcVZnVzrEFFgBCf
         yz0Po7AvSEKcJRWfMEANKBCGQU4igUxpYa4KfcqCGWK2fITkdVZ4H5/a6Ncsfyu+LJxd
         H3T4aTdNWV594z3KrdWDjzjV7jS4YzJ2RKQm0ovRZ0o0tjUWzrzZBxq1byA5RYYA5CdP
         uXKCUtC4cG/vUeEyxydTXNmuXKD9eb/gFmg0/AzS6ljGdx5zBl3ir9m9IpVVEYKfo7QN
         /4OC8AlnftJxZubOatyuPMvN3F3RMY0LfAYYYZimyOEpzfEapHz2YqnYzm+wz4AqhNk0
         CrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732005249; x=1732610049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUKCfmUuN+EAwvifVE4+S5ixV+7dGLlwu1X93E3/9sk=;
        b=Hww9vDlcB9tTo9uGZcxI74uxkr+SyZsMeG4RtH+4d2N3OthZ9ZURyKaO3+hSPfI2fF
         W9PgMdXxDS+/khVnAIsdwzoC8YpCMMD4TWA89xTf+CTCWVtXMFlQvhcg18o6w0V+Slqk
         LhtknNpcjA+cbuWsK8QRGP0WEGqo3lNdydWCA4DfY5kWSr4X9A9zSji9NcMpap34gB8F
         lLPyjyRFZAF+M8ctG1O7KM5K9S42hzdrmxLTrBXr8iqOk0TciChVwEi3agXTqP+XjLFq
         9vfENj/Ue0yFD0ynEU115y3ovTCekIwMzyt722IEWqnV6c5/ldc+JJeUvC3co4mSiY/L
         FcvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhb0pYoPx55qT8lGK6qloAZSfqa/tOBuByo3PPIw/NabxawAGxFM+SA4gbTPpeUbJVYRwLnzw44p1mpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyermF02vhUEPu8aABI8ZiWcZ+2pZmELELKej6aixAvon647FIW
	AJqKp1eZxzn9Tpo+mABpc38xT5OcW6bu050nocheUY3wgoBbbmP/pAksPlHixxE=
X-Google-Smtp-Source: AGHT+IEAnwtSIUCCmIKtfAGTWZVAyBrISGeUmzRcmTVWpwEqzShG1TbLIR2fD2YtzQG7+ymt31CdSA==
X-Received: by 2002:a05:600c:3b0a:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-432df78b065mr119059215e9.20.1732005248941;
        Tue, 19 Nov 2024 00:34:08 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da24459bsm192837965e9.6.2024.11.19.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:34:08 -0800 (PST)
Date: Tue, 19 Nov 2024 09:34:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Colton Lewis <coltonlewis@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v2] riscv: perf: Drop defining
 `perf_instruction_pointer()` and `perf_misc_flags()`
Message-ID: <20241119-8542ffd5c08526b665895722@orel>
References: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZzxDvLKGz1ouWzgX@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzxDvLKGz1ouWzgX@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_003410_681616_4CD2174E 
X-CRM114-Status: GOOD (  25.82  )
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

On Tue, Nov 19, 2024 at 08:52:28AM +0100, Ingo Molnar wrote:
> 
> * Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> 
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
> > VMs"), the perf core now handles the functionality previously requiring
> > arch-specific definitions of `perf_instruction_pointer()` and
> > `perf_misc_flags()`. As these definitions are no longer necessary for
> > RISC-V, this patch removes their implementation and declarations.
> > 
> > This change also fixes the following build issue on RISC-V:
> > 
> >     ./include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
> >     ./include/linux/perf_event.h:1679:22: error: 'perf_misc_flags' redeclared as different kind of symbol
> >     ./include/linux/perf_event.h:1680:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'
> > 
> > The above errors arise from conflicts between the core definitions in
> > `linux/perf_event.h` and the RISC-V-specific definitions in
> > `arch/riscv/include/asm/perf_event.h`. Removing the RISC-V-specific
> > definitions resolves these issues and aligns the architecture with the
> > updated perf core.
> > 
> > Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")
> 
> Yeah, so the Fixes tag is wrong - this is not a build bug
> with that commit, and your patch does not even apply to
> the perf events tree.
> 
> This is a semantic merge conflict that arises in linux-next - the
> riscv version of perf_instruction_pointer() function doesn't even
> exist in the perf tree...
> 
> AFAICS the problem is that the riscv tree applied this commit:
> 
>   5bb5ccb3e8d8 ("riscv: perf: add guest vs host distinction")
> 
> While the perf tree solved this in a more generic fashion:
> 
>   2c47e7a74f44 perf/core: Correct perf sampling with guest VMs
>   baff01f3d75f perf/x86: Refactor misc flag assignments
>   3e807cf07d96 perf/powerpc: Use perf_arch_instruction_pointer()
>   04782e63917d perf/core: Hoist perf_instruction_pointer() and perf_misc_flags()
>   e33ed362cf9e perf/arm: Drop unused functions
> 
> So I believe, assuming the perf version works fine on riscv
> (I haven't tested it), that the solution is to revert
> 5bb5ccb3e8d8 either in the riscv tree, or upon merging it.

Hi Ingo,

This patch isn't a complete revert of 5bb5ccb3e8d8. The early returns in
perf_callchain_user() and perf_callchain_kernel() should remain and the
CONFIG_PERF_EVENTS #ifdef in arch/riscv/include/asm/perf_event.h should
remain as well.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
