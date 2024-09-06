Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A77CE7B19
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TezeqpWv21RlwHkvjZNxD4550DUdwo8WPUXk8uc2AMY=; b=pFCO3/OwOikMKy
	2OlAG1wmRUhUAHsLvUPRoLXJQgNXU78pI5sCI0LjjLytiLgoXvbpyrZio4KDP/vwSkMey89fjlPWm
	T7Bu20LimpVjoJ9iTz//2gaEr2txVjhiiTi8FPAWXdN76VPcu2HqL41JvhwzjIj2SYla0tWroEnNP
	lOSCitOyVcUEHk6r/zL/RoTCYYMQRg2JAZm3e/CSOZO80CECmjLo7NiB9dq2FvYkoQmrtee425qXA
	qHhlzODwPxQW6q5BxShXosL/w7Rjhx0WzU25mppepOetPyHPVO4FFWxefUWbJ52Jdm4/EoxwR133o
	zKiGtBEheSTM/1qG5xQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZdT-0000000CTA8-1p4Y;
	Fri, 06 Sep 2024 14:08:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZbh-0000000CSpa-1rys
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 14:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DECEAA44FCB;
	Fri,  6 Sep 2024 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954F1C4CEC4;
	Fri,  6 Sep 2024 14:06:34 +0000 (UTC)
Date: Fri, 6 Sep 2024 10:07:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [PATCH 0/7] add function arguments to ftrace
Message-ID: <20240906100738.2526cffd@gandalf.local.home>
In-Reply-To: <yt9dv7z9l2zp.fsf@linux.ibm.com>
References: <20240904065908.1009086-1-svens@linux.ibm.com>
	<20240905111620.5211d9f8@gandalf.local.home>
	<yt9dv7z9l2zp.fsf@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_070637_619321_4D8D27DB 
X-CRM114-Status: GOOD (  13.75  )
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

On Fri, 06 Sep 2024 08:18:02 +0200
Sven Schnelle <svens@linux.ibm.com> wrote:


> One thing i learned after submitting the series is that struct
> ftrace_regs depends on CONFIG_FUNCTION_TRACER, so it cannot be used
> with the graph tracer. So either we make it available unconditionally,
> or use some other data structure. Would like to hear your opinion on
> that, but i'll wait for the review after your travel because there
> are likely other issues that needs to be fixed as well.

Hmm, I thought the graph tracer depends on function tracer? Anyway, the
configs should be cleaned up. I would like to make CONFIG_FTRACE just mean
the function hook mechanism (mcount,fentry,etc) and not be used for the
tracing system.

Anyway, we can just make ftrace_regs defined outside any config for now.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
