Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD2BC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 20:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJxoEt2jt5Tld5kBUKexe3WpY+CxNm736ctKRfS6Ze8=; b=UUxNLumhPT7h0O
	cE5rtNgGIseujHU9pjxuPtxXmySfKB4r+WwPADiXreTJW0UAfV+fv4eEs2VQ0VEbsx+80K+oAitLE
	F+yCgLj5hcsp2CUNlJrSFOmq/4hvkhaKNQAaW6Uf/IzJ4fCeB2prkjWOTaFFZykThUoyV5FVLhgg3
	cEVLHTw+uaTubktbbdXfm9OkPnxxMReNNEVchFPp9ZYDYAgRqtPEI/6BRqATYvQVp6H2jrGYEdpKY
	ZmLmlCXjYUUgUg942zOGoj21mFs9UyisEr83K8t6DKao4G+blrkthnIB6iJkhVTIMCT5kZi4FOSvH
	eDhpI0eRcTU7AA48rwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOaR-00000004SvX-0ncX;
	Thu, 21 Mar 2024 20:00:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnOaN-00000004Sv2-3pOc
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 20:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3EB6CE140E;
	Thu, 21 Mar 2024 20:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1219CC433C7;
	Thu, 21 Mar 2024 20:00:18 +0000 (UTC)
Date: Thu, 21 Mar 2024 16:02:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "Bj\"orn T\"opel" <bjorn@kernel.org>, Puranjay Mohan
 <puranjay12@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami
 Hiramatsu <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, "Bj\"orn T\"opel" <bjorn@rivosinc.com>,
 Song Shuai <suagrfillet@gmail.com>, Cl'ement L'eger <cleger@rivosinc.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <20240321160246.2e28cf9d@gandalf.local.home>
In-Reply-To: <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
References: <20240306165904.108141-1-puranjay12@gmail.com>
	<87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
	<ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_130024_586813_35A4A790 
X-CRM114-Status: GOOD (  17.50  )
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

On Tue, 12 Mar 2024 13:42:28 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> There are ways around that, but they're complicated and/or expensive, e.g.
> 
> * Use a sequence of multiple patches, starting with replacing the JALR with an
>   exception-generating instruction with a fixup handler, which is sort-of what
>   x86 does with UD2. This may require multiple passes with
>   synchronize_rcu_tasks() to make sure all threads have seen the latest
>   instructions, and that cannot be done under stop_machine(), so if you need
>   stop_machine() for CMODx reasons, you may need to use that several times with
>   intervening calls to synchronize_rcu_tasks().

Just for clarification. x86 doesn't use UD2 for updating the call sites. It
uses the breakpoint (0xcc) operation. This is because x86 instructions are
not a fixed size and can cross cache boundaries, making updates to text
sections dangerous as another CPU may get half the old instruction and half
the new one!

Thus, when we have:

	0f 1f 44 00 00		nop

and want to convert it to:

	e8 e7 57 07 00		call ftrace_caller

We have to first add a breakpoint:

	cc 17 44 00 00

Send an IPI to all CPUs so that they see the breakpoint (IPI is equivalent
to a memory barrier).

We have a ftrace breakpoint handler that will look at the function that the
breakpoint happened on. If it was a nop, it will just skip over the rest of
the instruction, and return from the break point handler just after the
"cc 17 44 00 00". If it's supposed to be a function, it will push the
return to after the instruction onto the stack, and return from the break
point handler to ftrace_caller. (Although things changed a little since
this update is now handled by text_poke_bp_batch()).

Then it changes the rest of the instruction:

	cc e7 57 07 00

Sends out another IPI to all CPUs and removes the break point with the new
instruction op.

	e8 e7 57 07 00

and now all the callers of this function will call the ftrace_caller.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
