Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CDFC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8ilCDgD65EP9FEToV4hVYDCxmwxiwDppR38EosTTPk=; b=dIZpHDK+e8JR1Q
	0drO2MzIZUObukujXF/VD+fk8TW+7GBZQuedAlJDze79LjLFljKp5aUxOx2HNdlO/L0GlGbwZalWc
	b4Ac/JLbOMv8PImtyud9RViThZNtq87fFnDOtSxzG0zU2byycAXRtU17aNnwF0Fk7Ab32Jf9RM5Vt
	oF4rixXbiJIGmL6cDv4i3fh80k+8TOQq5uiZaLAjvZNvLjADg9ekkkxJzQnuPKis2cKEsoCXuIwuj
	w8t24xNUcRSmb/OstXBmcCslJbnwplYaQxQTDXtkwqAMViFuxj+yrNF+RhZUcwwvHisriUE74t8Bg
	jeaHAHKLzmw8aBBLjCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPliA-00FwyT-1z; Wed, 08 Feb 2023 14:46:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPli6-00FwxL-C1
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 14:46:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B5F11042;
	Wed,  8 Feb 2023 06:46:49 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.30.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B9E13F8C6;
	Wed,  8 Feb 2023 06:46:04 -0800 (PST)
Date: Wed, 8 Feb 2023 14:46:01 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: Evgenii Shatokhin <e.shatokhin@yadro.com>, suagrfillet@gmail.com,
	andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, linux@yadro.com
Subject: Re: [PATCH -next V7 0/7] riscv: Optimize function trace
Message-ID: <Y+O1qY453BnhqgQZ@FVFF77S0Q05N.cambridge.arm.com>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
 <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N>
 <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_064610_522387_633B7455 
X-CRM114-Status: GOOD (  24.77  )
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

On Wed, Feb 08, 2023 at 10:30:56AM +0800, Guo Ren wrote:
> Hi Mark,
> 
> Thx for the thoughtful reply.
> 
> On Tue, Feb 7, 2023 at 5:17 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > Note that I'm assuming you will *always* go through a common ftrace_caller
> > trampoline (even for direct calls), with the trampoline responsible for
> > recovering the direct trampoline (or ops->func) from the ops pointer.
> >
> > That would only require 64-bit alignment on 64-bit (or 32-bit alignment on
> > 32-bit) to keep the literal naturally-aligned; the rest of the instructions
> > wouldn't require additional alignment.
> >
> > For example, I would expect that (for 64-bit) you'd use:
> >
> >   # place 2 NOPs *immediately before* the function, and 3 NOPs at the start
> >   -fpatchable-function-entry=5,2
> >
> >   # Align the function to 8-bytes
> >   -falign=functions=8
> >
> > ... and your trampoline in each function could be initialized to:
> >
> >   # Note: aligned to 8 bytes
> >   addr-08               // Literal (first 32-bits)      // set to ftrace_nop_ops
> >   addr-04               // Literal (last 32-bits)       // set to ftrace_nop_ops
> >   addr+00       func:   mv      t0, ra
> >   addr+04               auipc   t1, ftrace_caller
> >   addr+08               nop
> >
> > ... and when enabled can be set to:
> >
> >   # Note: aligned to 8 bytes
> >   addr-08               // Literal (first 32-bits)      // patched to ops ptr
> >   addr-04               // Literal (last 32-bits)       // patched to ops ptr
> >   addr+00       func:   mv      t0, ra
> We needn't "mv t0, ra" here because our "jalr" could work with t0 and
> won't affect ra. Let's do it in the trampoline code, and then we can
> save another word here.

Ah; I thought JALR always clobbered ra? Or can that specify the register to
save the link address to?

I'm not that familiar with riscv asm, so I've probably just got that wrong.

> >   addr+04               auipc   t1, ftrace_caller
> >   addr+08               jalr    ftrace_caller(t1)
> 
> Here is the call-site:
>    # Note: aligned to 8 bytes
>    addr-08               // Literal (first 32-bits)      // patched to ops ptr
>    addr-04               // Literal (last 32-bits)       // patched to ops ptr
>    addr+00               auipc   t0, ftrace_caller
>    addr+04               jalr    ftrace_caller(t0)

I'm a bit confused there; I thought that the `symbol(reg)` addressing mode was
generating additional bits that the AUPIC didn't -- have I got that wrong?

What specifies which register the JALR will write the link address to?

> > Note: this *only* requires patching the literal and NOP<->JALR; the MV and
> > AUIPC aren't harmful and can always be there. This way, you won't need to use
> > stop_machine().
> Yes, simplest nop is better than c.j. I confused.
> 
> >
> > With that, the ftrace_caller trampoline can recover the `ops` pointer at a
> > negative offset from `ra`, and can recover the instrumented function's return
> > address in `t0`. Using the `ops` pointer, it can figure out whether to branch
> > to a direct trampoline or whether to save/restore the regs around invoking
> > ops->func.
> >
> > For 32-bit it would be exactly the same, except you'd only need a single nop
> > before the function, and the offset would be -0x10.
> Yes, we reduced another 4 bytes & a smaller alignment for better code
> size when 32-bit.
>    # Note: aligned to 4 bytes
>    addr-04               // Literal (last 32-bits)       // patched to ops ptr
>    addr+00               auipc   t0, ftrace_caller
>    addr+04               jalr    ftrace_caller(t0)
> >

> > That's what arm64 does; the only difference is that riscv would *always* need
> > to go via the trampoline in order to make direct calls.
> We need one more trampoline here beside ftrace_caller &
> ftrace_regs_caller: It's "direct_caller".
> 
> addr+04         nop -> direct_caller/ftrace_caller/ftrace_regs_caller

I'd strongly recommend that you instead implement FTRACE_WITH_ARGS and
deprecate FTRACE_WITH_REGS, like arm64 has done, then you only need a single
ftrace_caller, as I mentioned above. That way there's no risk that you need to
patch the AUIPC after initialization.

The arm64 FTRACE_WITH_ARGS conversion is in mainline, and arm64's
FTRACE_WITH_CALL_OPS is based upon that. Florent's DIRECT_CALLS patches add the
direct call logic to the same ftrace_caller trampoline.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
