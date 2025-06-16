Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A4C71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 22:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAB2t9nOBEzEnGEvEazTHo+BaJBV2XLtf1Fyq1Jk5qA=; b=P7jJCBuZFfA6eX
	+6Bi/YiqQASe5AEJk9vO87yEpNEEmXMVEIwWGS+F8DlUX+FbaylSSLQnAzeopJ7X+XlYVCGpp7Jcc
	hapcZ6QMOndL8RsEiU4moHlbVZX/AMK+quStU82+QHiLpovQPgeQg2obD7SupCpZtsjmb/7MU+7Bf
	mFjQ30GC8ae+OiIzR+pxn2pS7YvfW71NWVdBTREkkjxyEBqFMgeYPotuyX+3rYqKhMs6etIqnse8h
	tT49OrSPRT7xEBxY0rbbDwqLAqGEm9aYCD9rozRARDdvD7OH27UndBPszQ3GXiihZp5kpPKk2pste
	FMwysz35UjuXi4ncTZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIXa-00000005ipA-14Ie;
	Mon, 16 Jun 2025 22:42:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRILr-00000005hNq-29y0
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 22:30:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3139027b825so3520334a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750113050; x=1750717850; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ynxx7SRI1tJRuVHOe1lNj5ruh3ky1TGlIsdje0GUbIg=;
        b=lGzEOk6D0QMcndlJMvphXnIMhIYwLPCGF/6iNb1YnCtO1sCOQTWkByKf3lOBW9C+N9
         zPOsoBvaMiEILiD3myT3rpJsc5kKV5Xoie4EI2PKWMkW9Ofkm88r/2Ktj5q3GMXveb8Y
         E6vZpRuLOtPaEJYac3ifYpXYTF8ZoAH7wOustT4aiIuexQA8XO5t5KQvTF75lrMlfH/w
         cFeEbZZsQ9qCcDRBrywK05pJs2ZVcOeT6x/sABgH1+IoL8s56+fI4OMz4iwWcgf1Ri/B
         TsQGqlz1QAyN8//Ve55oSarHiEK15IGuORGdYBZ3ActqTkKAPcqx3fLWDK8CKOah3g2G
         e6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113050; x=1750717850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynxx7SRI1tJRuVHOe1lNj5ruh3ky1TGlIsdje0GUbIg=;
        b=agoDrupQloYapH508hFr9/BWwubkf5X788wXNQIY1Ci+4iLxPOKCFuLA+IBbCCX746
         SrCMXUnGkTRUT5IDPZDJSRBRkxLcjYn0k0B9S31ExAX5zGcZ2qPjc768CFVEsptDjmXa
         zqjiF409TWMDQjc3R/toLkUGRK244yT2gGc74K80W6CeYALhLRZlFwJRacCZR8WLs+2G
         D3vCexjlPq2p8t6n4feaeN5wqv83z0JeYupGF7bFbNkT8DPi3rk83qIZQC3OEkQbmOcQ
         /K9fGz1j8XDhVGdqU922zupnpExhB67Ob3JpKM8BRTS3gXn6NKVGkdFsR6U/UiiLjnba
         8NyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FyK36xAtE6S9yRD3Fp8aZaRAVwRsy6OayZCfKaTTLPKHH/d/8FrZ0Bi0EbHrLuJjY5TINigqimIkvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNGTVDywgcHt9oUpYlikNDwZmQJoVQl0cHSaLl6GwZVgL0rMlf
	Q2CVSmuHbXHuPI77vA22kiwsd637/J+L5J6To4az3VmBxliOL/pQOqBv
X-Gm-Gg: ASbGncvxBfWvgcwOF53zC5x3XU9F5eeY4DAs5OhPDh9zy1305VnX9ZKSSMxJYuwOky0
	g3TLPIyyFzylAQsIgx+pkL+raXzYEqHGFY6YXA27KRMj9gtsJ4xtkw6oaEAJmpd54mGYs+j8qOZ
	NAivFYLzzE/L/KbD21ijNeC9mp/PrBIqDishvQRgOfUrB6+UnllHdZ0wzq++wmieVdZh4ahInK6
	G/+RKQw4QPrQNd/hvkvrhmmTLK2rtaA4goc0GhbM2s6XJwpcOIPOs8XrkMI6H3sTCdr4o34RO7d
	Omqd7oF7cmjQlwiOZWCZJ+sTEA7k569hKehVPD9FITkuJRyhPL7hqmHiAufiY6T5l8vQT7GNSHp
	z/g==
X-Google-Smtp-Source: AGHT+IEoCXoTlwsLBu+IfThTMw4X5ElwwWUFjSyOv4cilN9dOr00T9Tvy3cJqKYqb5E+R4+ctwr7NQ==
X-Received: by 2002:a17:90b:3148:b0:313:31ca:a69 with SMTP id 98e67ed59e1d1-313f1daa79emr20229725a91.18.1750113050245;
        Mon, 16 Jun 2025 15:30:50 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bd8c72sm9172171a91.11.2025.06.16.15.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:30:49 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:30:47 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: bjorn@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Message-ID: <aFCbF/g+wxOwI3af@x1>
References: <87v8fjjmyn.fsf@all.your.base.are.belong.to.us>
 <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_153051_570005_47FA6CE0 
X-CRM114-Status: GOOD (  30.44  )
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

On Mon, Jun 19, 2023 at 12:05:43PM -0700, Palmer Dabbelt wrote:
> On Mon, 19 Jun 2023 12:01:20 PDT (-0700), bjorn@kernel.org wrote:
> > Palmer Dabbelt <palmer@rivosinc.com> writes:
> > 
> > [...]
> > 
> > > > > +		riscv_v_vstate_off(regs);
> > > > > +
> > > > 
> > > > Not off, right? Isn't it __riscv_v_vstate_clean() that you'd like to
> > > > call? Something like:
> > > > 
> > > > static void vstate_discard(struct pt_regs *regs)
> > > > {
> > > >        if ((regs->status & SR_VS) == SR_VS_DIRTY)
> > > >                __riscv_v_vstate_clean(regs);
> > > > }
> > > > 
> > > > Complemented by a !V config variant.
> > > 
> > > I think it's just a question of what we're trying to do here: clean
> > > avoids the kernel V state save, but unless the kernel decides to use
> > > V during the syscall the register contents will still be usable by
> > > userspace.  Maybe that's fine and we can just rely on the ISA spec,
> > > though?  I sent another patch to just document it in Linux, even if
> > > it's in the ISA spec it seems worth having in the kernel as well.
> > > 
> > > That said, I think the right thing to do here might be to zero the V
> > > register state and set it to initial: that way we can prevent
> > > userspace from accidentally relying on the state save, but we can
> > > also avoid the trap that would come from turning it off.  That lets
> > > us give the hardware a nice clean indication when the V state isn't
> > > in use, which will hopefully help us avoid the save/restore
> > > performance issues that other ports have hit.
> > 
> > FWIW, I think that's a much better idea than turning V off. I also like
> > that it'll preventing userland to rely on pre-ecall state.
> 
> OK, anyone else opposed?
> 
> We're kind of in the weeds on performance, I think we'd need HW to know for
> sure if either is an issue.  Seems best to just play it safe WRT the uABI
> for now, we can always deal with any performance issues if the exist.

I've tested the impact of riscv_v_vstate_discard() on the SiFive X280
cores [1] in the Tenstorrent Blackhole SoC [2]. The results from the
Blackhole P100 [3] card show that discarding the vector registers
increases null syscall latency by 28%.

The null syscall program [4] executes the vsetvli vector instruction and
then calls getppid() in a loop for 1 million iterations. The average
duration of the syscall is 201 ns with a branch based on v6.16-rc1 [5].
This is with the current upstream behavior where do_trap_ecall_u() calls
riscv_v_vstate_discard().

I then created a new branch [6] which disables riscv_v_vstate_discard().
The average duration of the syscall drops to 143 ns.

Would some sort of tunable be acceptable to allow the user to opt out
of the v state discard? Maybe a kernel cmdline argument?

Thanks,
Drew

[1] https://www.sifive.com/document-file/x280-datasheet
[2] https://tenstorrent.com/en/hardware/blackhole
[3] https://github.com/tenstorrent/tt-bh-linux
[4] https://gist.github.com/tt-fustini/fa793a35c34f07059d8a7427e1cd8e84
[5] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1
[6] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1_no_vstate_discard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
