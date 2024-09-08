Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC04FCD4F4C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Sep 2024 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4VmNCMCQwqGRHhH0c0/SIt1kaFpYqdfjO1ZnjEse10=; b=BxFoblS+sixRDT
	yovh+pr+xfGkR1Mait5x7LGQoueA9YIyMgd1/m2PzUypl35uZEPzvqEWfv6/2OmKZW6WLvk9XpkI7
	MMHy0ogJgiFRqp/DzlNExWDG9YgYM7+hqTJShm5XWxUpmIu9cVAJ1DMW6tKBWsoBtnZ8pATYek+Sw
	ZKJHg4fHyJLQVYw2pRPTIrUqIe2TqimWG3JSuZoINCoymOIt94gXlzZnTyK9qTGqImtAQJ0ZXekbJ
	WxUnpd6FdIqjxHKwbgUGWVn5cxtTXt9Bm9YqMqZtLZO9Ai1ILZTUdCE2D7UXogg1AMQci00C5T6nB
	I9HAkDO7G+WQINRwWUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snHy5-0000000Gpnd-33xu;
	Sun, 08 Sep 2024 13:28:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snHy2-0000000GpnB-0txB
	for linux-riscv@lists.infradead.org;
	Sun, 08 Sep 2024 13:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F07DB5C4338;
	Sun,  8 Sep 2024 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146EDC4CEC3;
	Sun,  8 Sep 2024 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725802116;
	bh=Ri56JanrxzJT4UAsenigTt4NMozWGcCirDACmDKy/58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o7ebJUoTay3mWVdOCJ4YnYJZjSzmSnevlKrosJn8e6uCur1cUoVbw9AKKa6GDZXt1
	 qxExlBWFTKM5q7/LVzILs04dk1Pq0KKrLMfdXcFBLK8l5WMlySIzzvHOBnNy5W8lNJ
	 OPGhpYs0TrwJg+DYNRQHUBzF8/UvDPGLsiXswSS5Ko7wyXHPxVJSrcHt9v4OyO+BVE
	 nNLHP+i0KOG/K0u7PtjWKIwfZLaKZpWhUDJmBAeGhOGRrsRkh6Yc/IRSqYU7myASWp
	 aW/1VD16L2dLdm86/Vx+cuDhYrWRmEemikoIP+g4/KIs0YEJw+DmdL/j9CcjiEX9vL
	 zImcMKORyq8mQ==
Date: Sun, 8 Sep 2024 22:28:30 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sven Schnelle <svens@linux.ibm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 0/7] add function arguments to ftrace
Message-Id: <20240908222830.01a01b10d62d59ed73dcb676@kernel.org>
In-Reply-To: <20240906100738.2526cffd@gandalf.local.home>
References: <20240904065908.1009086-1-svens@linux.ibm.com>
	<20240905111620.5211d9f8@gandalf.local.home>
	<yt9dv7z9l2zp.fsf@linux.ibm.com>
	<20240906100738.2526cffd@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_062838_356715_EA66F6F2 
X-CRM114-Status: GOOD (  18.38  )
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

On Fri, 6 Sep 2024 10:07:38 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 06 Sep 2024 08:18:02 +0200
> Sven Schnelle <svens@linux.ibm.com> wrote:
> 
> 
> > One thing i learned after submitting the series is that struct
> > ftrace_regs depends on CONFIG_FUNCTION_TRACER, so it cannot be used
> > with the graph tracer.

Yeah, this is solved by my series [1].

[1] https://patchwork.kernel.org/project/linux-trace-kernel/patch/172398532480.293426.13232399076477198126.stgit@devnote2/

So I think this series is easier to apply after my series, which
passes fgraph_regs in return handler.

Thanks,

> > So either we make it available unconditionally,
> > or use some other data structure. Would like to hear your opinion on
> > that, but i'll wait for the review after your travel because there
> > are likely other issues that needs to be fixed as well.
> 
> Hmm, I thought the graph tracer depends on function tracer? Anyway, the
> configs should be cleaned up. I would like to make CONFIG_FTRACE just mean
> the function hook mechanism (mcount,fentry,etc) and not be used for the
> tracing system.
> 
> Anyway, we can just make ftrace_regs defined outside any config for now.
> 
> -- Steve


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
