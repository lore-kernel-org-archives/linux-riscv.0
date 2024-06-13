Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B32CC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMQrMVT3m3Nm4oV90AN21eGiNRF9zQfgEFWLwVwY5IQ=; b=vVovvVKCMTnb0e
	sBGlzYGuwYUWhH08xqUuzuaYwBL9s0XIkatKeIOjllIaCzwjZ+4rmwmIE2K4iV98t2/nJhwJnYYqv
	/f6kjyCTuyDChG9stXB+i4VaklvatdvbUS1Qvmjj6KxhUSjAQe9zpHeypnbDr79CSFSZ0X+U633V3
	4YBhN9wOzaELS1UfswuaUHXX7eC/DypBULeA8q9ZiAVWgfuZaE2eH/E4jaFdzbq7yzbnE+Hf+29A8
	w2tCOyXHB5ciy5qBL3Ilq3Kuum+k7RLW11tFptddkgsI8Cv8GN9QzQYj5J2UBvIvlRe9vNnvx91OH
	ui+WrPHVb0za1JZEOcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkZN-0000000GkE3-3EI8;
	Thu, 13 Jun 2024 13:32:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkZG-0000000GkC1-0ljo
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 13:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1655CE25FF;
	Thu, 13 Jun 2024 13:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF3BC2BBFC;
	Thu, 13 Jun 2024 13:32:35 +0000 (UTC)
Date: Thu, 13 Jun 2024 09:32:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/8] tracing: do not trace kernel_text_address()
Message-ID: <20240613093233.0b349ed0@rorschach.local.home>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-2-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
	<20240613-dev-andyc-dyn-ftrace-v4-v1-2-1a538e12c01e@sifive.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_063246_313451_E33A648F 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, 13 Jun 2024 15:11:07 +0800
Andy Chiu <andy.chiu@sifive.com> wrote:

> kernel_text_address() and __kernel_text_address() are called in
> arch_stack_walk() of riscv. This results in excess amount of un-related
> traces when the kernel is compiled with CONFIG_TRACE_IRQFLAGS. The
> situation worsens when function_graph is active, as it calls
> local_irq_save/restore in each function's entry/exit. This patch adds
> both functions to notrace, so they won't show up on the trace records.

I rather not add notrace just because something is noisy.

You can always just add:

 echo '*kernel_text_address' > /sys/kernel/tracing/set_ftrace_notrace

and achieve the same result.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
