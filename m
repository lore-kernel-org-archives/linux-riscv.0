Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBFC67871
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7etzUpLl/L7p38oCBAdr1NYjjjPJUtWpbRAaIZEgQ8=; b=UU9/p1mazNZ1lT
	zUDf0QMeUE8tICnabBI0F4USkXIgLBVeAbCQQfH4O9LO54O/jRc83smLywWKflJ9mHJIg+Y5hpKpz
	R4dZvtOuShwBIw3f8XOoOAJ4YtGCrkIDQqZJI1l7J/J/yRL5KKmyy8Vx04DieV41K3CH1pdUdBW+F
	kqGY8uJO+OeLuirs7SEMVLTSg8F7m/LHZDtEfdFOL/CbxSbcu0dofaWeqQ0bkncjOrAZZOzmDyBsh
	i0f2NU0u6KEvKlp1ENad1KW9J5JxASIi6ga9E6rrYian93mJEkM1kXMg42rXcPcWbPN4p+niVKzks
	uL3S5BFZGrWXMEsBwCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onA2B-003jOH-QQ; Tue, 25 Oct 2022 02:51:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onA29-003jNf-AX
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 02:51:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96B686171D
	for <linux-riscv@lists.infradead.org>; Tue, 25 Oct 2022 02:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71889C43145
	for <linux-riscv@lists.infradead.org>; Tue, 25 Oct 2022 02:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666666275;
	bh=kLyDAivtXjl7b9FNwIOi8R/xoqspaY0DzbslbZXJA38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p9sGE0hTLj2N8smJAMWAwVEgvmwR5nu8X+LWJVHEDJ87MYMKGN6BZKuSePCCnZ2de
	 n8I3A3FOKw+iie0FiUolq4G1YFAyvMOj2pw55oFXx5McVpzNHFRDDkbSn3XWkXgoyc
	 7eYpEM3BnwobLACC+xAAm0Rf+9tCWjJU4WpqHU05yA9ApdXtZXebZwGfLSyyw3qujF
	 BH48uTSs15eFxhVsSROFM4SIpJARdCBhwxqtD70C7CY3zqxzYVNvRptd1phXgnyVDe
	 +Xb8QHk8FrYi1W34G4hFSMarnBIfKQ9/WyGLQgUXx0FdYFaqcgo4ulUznDjZ3y8zWl
	 V9+ZjZaOmvvQw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so5500650fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 19:51:15 -0700 (PDT)
X-Gm-Message-State: ACrzQf3pcz6w3K+vnLzKLfwqMCpSgKD2H7g6Onofh5cDXoQRoOwBtjIT
	JSAY4FM2/cvdtLuN5k3aHXQbxqZGYZcHUdzQLhQ=
X-Google-Smtp-Source: AMsMyM5EPDsIKsDhKpa2tacV+samW4UcYdf1FV41waP3RSXg7QVWFrQ47hBEkSt3VMDgDA6b2T4bsOr1hUPCpPWYyO4=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr37449251oap.19.1666666274587; Mon, 24
 Oct 2022 19:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221002012451.2351127-1-guoren@kernel.org> <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N> <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
 <Y1ERsP0YYVNulWnw@FVFF77S0Q05N> <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
 <Y1Z9U7XN4nlGg8yb@FVFF77S0Q05N> <Y1Z/rLaaUp7e9xoy@hirez.programming.kicks-ass.net>
 <Y1aBshGIWMEm+yTv@FVFF77S0Q05N>
In-Reply-To: <Y1aBshGIWMEm+yTv@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Oct 2022 10:51:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvmSuOP_QQ8RGfq2soLrv9XD3g=8v9pE+U0y+pzqMY4A@mail.gmail.com>
Message-ID: <CAJF2gTQvmSuOP_QQ8RGfq2soLrv9XD3g=8v9pE+U0y+pzqMY4A@mail.gmail.com>
Subject: Re: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for noinstr
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lai Jiangshan <laijs@linux.alibaba.com>, arnd@arndb.de, 
	palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, zouyipeng@huawei.com, bigeasy@linutronix.de, 
	David.Laight@aculab.com, chenzhongjin@huawei.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Borislav Petkov <bp@alien8.de>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_195117_446472_0A95474F 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, Oct 24, 2022 at 8:14 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Mon, Oct 24, 2022 at 02:06:04PM +0200, Peter Zijlstra wrote:
> > On Mon, Oct 24, 2022 at 12:56:03PM +0100, Mark Rutland wrote:
> >
> > > How about we split this like:
> > >
> > > | /*
> > > |  * Prevent the compiler from instrumenting this code in any way
> > > |  * This does not prevent instrumentation via KPROBES, which must be
> > > |  * prevented through other means if necessary.
> >
> > Perhaps point to NOINSTR_TEXT in vmlinux.lds.h
>
> Makes sense, will do.
Do I need to update the comment with NOINSTR_TEXT? eg:

 * Prevent the compiler from instrumenting this code in any way
 * This does not prevent instrumentation via KPROBES, which must be
 * prevented through other means if necessary. See NOINSTR_TEXT
 * in vmlinux.lds.h.

>
> >
> > > |  */
> > > | #define __no_compiler_instrument                          \
> > > |   noinline notrace noinline notrace __no_kcsan            \
> > > |   __no_sanitize_address __no_sanitize_coverage
> > > |
> > > | /*
> > > |  * Section for code which can't be instrumented at all.
> > > |  * Any code in this section cannot be instrumented with KPROBES.
> > > |  */
> > > | #define noinstr __no_compiler_instrument section(".noinstr.text")
> > >
> > > ... then we don't need __noinstr_section(), and IMO the split is
> > > clearer.
> >
> > Yeah, perhaps, no strong feelings. Note I have this in the sched-idle
> > series as well (which I still need to rebase and repost :/).
>
> Ah; I'll sit on this for now then, and once that's all in I can send a
> cleanup/rework patch. Sorry for the noise!
We still keep __noinstr_section(), right?

>
> Thanks,
> Mark.
--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
