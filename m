Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D9FC54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRUnom+T2cguZEbbUw4WDlSzrIAWdSAZfgPIojVzkxA=; b=ShS8OOorlaxohj
	snPnBEXP5Ds8a5eVws2KgidzM1gq6HyA7BtPqNlRWOfbyoncNTeqlQhX4cwUV04Sy55aONcM+zzIs
	O6A3PrG+ORCUzWp4bL6K9BC6bYrOFYkdu5CEAfrVHvcYhf08RQ5k1J5RaDf0m8tjajy7+OK9qo06c
	NfkxQ0BsJ3jzwx03WQh/rpPTTU/KWvIrFe+JMHqvsAGopbuN51OBhWQk5ZHOpbgl7jWNOrKd8VSfr
	PQiFyEe1o3CSGtWrxb6yzPWO45T+nX8nIq138wp71QPQnxz0DU6ttetYSdUMuvRSLNPg6egRoFvIS
	Mx7c4O+76i21O/fhYUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFx9I-00F4ex-H2; Thu, 12 Jan 2023 12:57:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFx9E-00F4bZ-Ab
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 12:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C3D012FC;
	Thu, 12 Jan 2023 04:58:15 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.43.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891213F67D;
	Thu, 12 Jan 2023 04:57:30 -0800 (PST)
Date: Thu, 12 Jan 2023 12:57:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	e.shatokhin@yadro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next V7 1/7] riscv: ftrace: Fixup panic by disabling
 preemption
Message-ID: <Y8ADt98oowRZJdjw@FVFF77S0Q05N>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <20230112090603.1295340-2-guoren@kernel.org>
 <Y7/6AtX5X0+5qF6Y@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7/6AtX5X0+5qF6Y@FVFF77S0Q05N>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_045736_436444_7D056CD2 
X-CRM114-Status: GOOD (  24.51  )
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

On Thu, Jan 12, 2023 at 12:16:02PM +0000, Mark Rutland wrote:
> Hi Guo,
> 
> On Thu, Jan 12, 2023 at 04:05:57AM -0500, guoren@kernel.org wrote:
> > From: Andy Chiu <andy.chiu@sifive.com>
> > 
> > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > forming a jump that jumps to an address over 4K. This may cause errors
> > if we want to enable kernel preemption and remove dependency from
> > patching code with stop_machine(). For example, if a task was switched
> > out on auipc. And, if we changed the ftrace function before it was
> > switched back, then it would jump to an address that has updated 11:0
> > bits mixing with previous XLEN:12 part.
> > 
> > p: patched area performed by dynamic ftrace
> > ftrace_prologue:
> > p|      REG_S   ra, -SZREG(sp)
> > p|      auipc   ra, 0x? ------------> preempted
> > 					...
> > 				change ftrace function
> > 					...
> > p|      jalr    -?(ra) <------------- switched back
> > p|      REG_L   ra, -SZREG(sp)
> > func:
> > 	xxx
> > 	ret
> 
> As mentioned on the last posting, I don't think this is sufficient to fix the
> issue. I've replied with more detail there:
> 
>   https://lore.kernel.org/lkml/Y7%2F3hoFjS49yy52W@FVFF77S0Q05N/
> 
> Even in a non-preemptible SMP kernel, if one CPU can be in the middle of
> executing the ftrace_prologue while another CPU is patching the
> ftrace_prologue, you have the exact same issue.
> 
> For example, if CPU X is in the prologue fetches the old AUIPC and the new
> JALR (because it races with CPU Y modifying those), CPU X will branch to the
> wrong address. The race window is much smaller in the absence of preemption,
> but it's still there (and will be exacerbated in virtual machines since the
> hypervisor can preempt a vCPU at any time).

With that in mind, I think your current implementation of ftrace_make_call()
and ftrace_make_nop() have a simlar bug. A caller might execute:

	NOP	// not yet patched to AUIPC

				< AUIPC and JALR instructions both patched >

	JALR

... and go to the wrong place.

Assuming individual instruction fetches are atomic, and that you only ever
branch to the same trampoline, you could fix that by always leaving the AUIPC
in place, so that you only patch the JALR to enable/disable the callsite.

Depending on your calling convention, if you have two free GPRs, you might be
able to avoid the stacking of RA by always saving it to a GPR in the callsite,
using a different GPR for the address generation, and having the ftrace
trampoline restore the original RA value, e.g.

	MV	GPR1, ra
	AUIPC	GPR2, high_bits_of(ftrace_caller)
	JALR	ra, high_bits(GPR2)			// only patch this

... which'd save an instruction per callsite.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
