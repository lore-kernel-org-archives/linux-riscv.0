Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF5CF58E5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuuTS7sOvIMbAEi1bsD6UaXWNMngRY1wcw3F67+ghXo=; b=LKE7IaW0cGXXB/
	dIwo+o3Hy3NQVYQKf/wdvfOX6hWsPH71CKQjpTaFgrUTdo6L3/KhocF2acaDCPHm21OD0RPNzrvFN
	/0NvwALCyhHgcar8j/FotgGl1fefDzuLVVB5a4VsPvxyuqUzRPIIgZYqG7ZIfMLxn22L+BAWduufU
	wzAV8J2i57tqRB90lvmWCOW8soMhRQLKm+796NWTUY6gDk4SCDKNY1MdPc1pvdTXoOZLMScUWUH2T
	rA7tL9PBPaV63n/stxnhlGfMDWyjE5hCPqmm9VancEerGMwW0G4+S4IWbt88Gn6Z3b70RBR3CA/vX
	LT7nbUI8h+LNFVIseJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYzd-0000000BlbT-01m6;
	Fri, 20 Sep 2024 08:27:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYq6-0000000BizD-3I6Z
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 08:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CA305C5D1C;
	Fri, 20 Sep 2024 08:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DC5C4CED1;
	Fri, 20 Sep 2024 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820285;
	bh=seGYfVYfyPjidQeia0MSEPXhvPjaDb+jdaPoJ9YM/L8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UKVW8JD9v7gxZ3lO5eOVhRM7Dae/E7cQ/gy5OZ/2TDHkPK6L3ccoY11FyDHU8I9oK
	 DBNgEyHPIPFAo+rYuN4gGStSeD+eT3YZNV3LKIH7pssRNPXkAVHfegsg022ejDjuvN
	 dVyz7L45+/PdN+j9Y+T/0AFCKD3pabW0L3HSfVimyaJk90mr01cBQSRBWXEZvPClhR
	 PVx2tTnro6fTEsHVeDo19mZTMhMrb60xS30VeOVtyDAHbi+ZcqrMPMf8IAWM0WmSor
	 CZ8nWn8uzP+gWaa0W3sNnsbl9/EHuWTZQ6Vv80MMR+jmXliaTg4OckmsjJIBc+YAZh
	 b++MGYJd8X2ig==
Date: Fri, 20 Sep 2024 10:17:58 +0200
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [PATCH 0/7] add function arguments to ftrace
Message-Id: <20240920101758.60419ec040c6f0643b475720@kernel.org>
In-Reply-To: <yt9djzfgccoo.fsf@linux.ibm.com>
References: <20240904065908.1009086-1-svens@linux.ibm.com>
	<20240905111620.5211d9f8@gandalf.local.home>
	<yt9dv7z9l2zp.fsf@linux.ibm.com>
	<20240906100738.2526cffd@gandalf.local.home>
	<20240908222830.01a01b10d62d59ed73dcb676@kernel.org>
	<yt9dh6ape022.fsf@linux.ibm.com>
	<yt9djzfgccoo.fsf@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011806_918873_0B885690 
X-CRM114-Status: GOOD (  18.62  )
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

On Fri, 13 Sep 2024 08:03:51 +0200
Sven Schnelle <svens@linux.ibm.com> wrote:

> Sven Schnelle <svens@linux.ibm.com> writes:
> 
> > Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
> >
> >> On Fri, 6 Sep 2024 10:07:38 -0400
> >> Steven Rostedt <rostedt@goodmis.org> wrote:
> >>
> >>> On Fri, 06 Sep 2024 08:18:02 +0200
> >>> Sven Schnelle <svens@linux.ibm.com> wrote:
> >>> 
> >>> 
> >>> > One thing i learned after submitting the series is that struct
> >>> > ftrace_regs depends on CONFIG_FUNCTION_TRACER, so it cannot be used
> >>> > with the graph tracer.
> >>
> >> Yeah, this is solved by my series [1].
> >>
> >> [1] https://patchwork.kernel.org/project/linux-trace-kernel/patch/172398532480.293426.13232399076477198126.stgit@devnote2/
> >>
> >> So I think this series is easier to apply after my series, which
> >> passes fgraph_regs in return handler.
> >
> > Thanks, i'll rebase my changes on top of your patches then.
> 
> While doing so i noticed that i completely forgot about arguments
> located on the stack. The current patchset tries to read from the
> current kernel stack, which is obviously wrong. So either the tracer
> needs to save the stack frame in the ringbuffer (which would be quite
> a lot of data), or ftrace only prints arguments located in registers.
> Also not nice. Opinions?

We can limit it to first 6 arguments in the ftrace_regs by default,
no need to save all of them. We can add an option to specify how
many stack entries (but it is set 0 by default).

Thank you,


> 
> Thanks
> Sven


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
