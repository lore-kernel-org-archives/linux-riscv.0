Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5BFC001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZXy7pVlNgBtRj8bfhAlS4lsUl0kge8UWJMTF/47pd8=; b=als08dPuk1C61p
	+B0DifAFScwuymAbYG5oRM3bAu3msxpzNOywIFvUWRuww3s0VlNY+TlqO7SYt/IWoy0aiEKUU4pxs
	Nlqu5J1SKRR+59ufFLbCb1sgrR5jzWy8SLxbVIgQ2do4fF/ccY2pEbxBv4HeZ9a3iQF0ehBBImKtZ
	0xMW/X3VPBc6qhdZbON3ThD/N2A6Bnj8+d4sTQnTRjRoZE3rcgosYL0PwtoslqQaNBo+ZS/3tAxrI
	hU8GVb7tJY+/SI1vsrM12KLhFlJwYzE1PK017ETHscDR2db7+XEqFFJZ2yfHklEulz3X9pnfGptkc
	vYbfRjSh4YFsS60rdQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyZV-00Cthn-0W;
	Fri, 04 Aug 2023 17:26:41 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyZS-00Ctfk-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 17:26:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686f8614ce5so2212763b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691169995; x=1691774795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JphLCmILQLQtm6C+8rHqJoDL6onaPDHw9v6WesurCsg=;
        b=r6q7qAGWzvZUiLJlqMhJLhohj7njHjtcTcRVZt2D2xU9JP3MQJ0/83tKG8aLTI0ohy
         DbA7Xk80sbDy4V0owZEd4OmS516M139UsF6WaWF8yPHFJWZjYKEO5tU/L/Ls+v5cP+8r
         zvOoYIwyRhoTMRj8kiRgd72Jh9aGordDV6F0FGpAnOpn+fbtROvFB9Z2LeFqr0WLExyS
         FKiQCat2x6Kb+JIwFHOM2FneSrIoS4YUyV+Zm5ggxPkme3KBaktv1s1hYG+pbaWG1cTp
         IuilMWnUL0u3gqEKHw452Mhh2G4Gktwl+EbrJs2NBI1w+ftaSkEbCSjYWJJHNt/IwFjl
         J+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691169995; x=1691774795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JphLCmILQLQtm6C+8rHqJoDL6onaPDHw9v6WesurCsg=;
        b=McIpy+qQSbxzIj61aMiZTlqej4l5Ly+wk4dPAfyJPgT2BJJp8rISkPt8yp017/HSig
         BEXIuJWplR0Kv2I8+tn7II0g5dPYyqOnZFWWN3dtLPGBDYVWSkXjCM20O7AKwExrGzT8
         369nymJfRFRqbu4LcxxSkdSqt8t6BQQFDC2b44qoRa5wfsYugQptmPoUmxmvTAcr81Ts
         pM0Ck32lBORSVFlEWtPqAAU+CS96fTb2tgOkgTE6u1VjqJe9KIfYznqHlEo81mJWtlUC
         LWTE3jY1k+0g1c16xb8kgaPDfZU8yJkfIFUsqnEKhRUgeKn6QcZS92bkOFQjRYzDH5OU
         h7tw==
X-Gm-Message-State: AOJu0Yw9qbfN9C/b/4OHA/1ZsCqHoXakNCfUUh0r94TWQyCzXQoB+aKL
	59YknGmLxeUIK3wMybvTiZqkwg==
X-Google-Smtp-Source: AGHT+IFY3DK0mTMlQh9d2j8+8rCxpiY2bx9LhdMBgQrVPQ7hwkeFF3l5xqJrFOHDkYksAUT9xQx9aw==
X-Received: by 2002:a05:6a00:180c:b0:680:98c:c593 with SMTP id y12-20020a056a00180c00b00680098cc593mr3293062pfa.7.1691169995381;
        Fri, 04 Aug 2023 10:26:35 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v19-20020a62a513000000b006870721fcc5sm1878051pfm.175.2023.08.04.10.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:26:34 -0700 (PDT)
Date: Fri, 4 Aug 2023 10:26:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
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
Subject: Re: [PATCH 01/10] RISC-V: Expand instruction definitions
Message-ID: <ZM00yFKcDczO50lJ@ghost>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230803-master-refactor-instructions-v4-v1-1-2128e61fa4ff@rivosinc.com>
 <20230804-barterer-heritage-ed191081bc47@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804-barterer-heritage-ed191081bc47@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_102638_172240_0BB38C00 
X-CRM114-Status: GOOD (  25.21  )
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

On Fri, Aug 04, 2023 at 08:59:24AM +0100, Conor Dooley wrote:
> On Thu, Aug 03, 2023 at 07:10:26PM -0700, Charlie Jenkins wrote:
> > There are many systems across the kernel that rely on directly creating
> > and modifying instructions. In order to unify them, create shared
> > definitions for instructions and registers.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/insn.h            | 2742 +++++++++++++++++++++++++++---
> 
> "I did a lot of copy-pasting from the RISC-V spec"
> 
> How is anyone supposed to cross check this when there's 1000s of lines
> of a diff here? We've had some subtle bugs in some of the definitions in
> the past, so I would like to be able to check at this opportune moment
> that things are correct.
> 
> >  arch/riscv/include/asm/reg.h             |   88 +
> >  arch/riscv/kernel/kgdb.c                 |    4 +-
> >  arch/riscv/kernel/probes/simulate-insn.c |   39 +-
> >  arch/riscv/kernel/vector.c               |    2 +-
> 
> You need to at least split this up. I doubt a 2742 change diff for
> insn.h was required to make the changes in these 4 files.
Yeah it is kind of a nightmare to look at, I will split it up.
> 
> Then after that, it would be so much easier to reason about these
> changes if the additions to insn.h happened at the same time as the
> removals from the affected locations.
> 
> I would probably split this so that things are done in more stages,
> with the larger patches split between changes that require no new
> definitions and changes that require moving things to insn.h
> 
> >  5 files changed, 2629 insertions(+), 246 deletions(-)
> 
> What you would want to see if this arrived in your inbox as a reviewer?
> 
> Don't get me wrong, I do like what you are doing here, the BPF JIT
> especially is filled with "uhh okay, I guess those offsets are right",
> so I don't mean to be discouraging.
> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
