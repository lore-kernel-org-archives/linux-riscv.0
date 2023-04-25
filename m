Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5819EC7618E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 00:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAe1C4NbSqd8ciVQGG4mMUWlJU5CGaH8tOg3rYSQgjo=; b=QbO8DYOcs86uW/
	ReyzoFMEJFwN6t7LLF82ZgsNKGWylSCfVUs61FQlCBqerMbQzT4f3zkPL5fJF6TQOwrdGuyo0zLu3
	kn88QSCx4dczWoUcqtbEzIY+852oFzBJlo4yrsQ5Ws+mT5Jd3jylpDFn/n+N+X1/9bzlssl8tTdnU
	rrDdaYgN6Ou8dWAPHQQnW0giVZ6y0slv+Dr1gaikF7nnlA0ypsajSzNqRkYUxOl01aSsrd4ZlGrVz
	m/lEwNnyjC4Lg/ZAWSh1ojy/2ShB/ZhX9w8mDO+Whh4ZULMk3GkYX0xSd7qMa827nPW+NlghxLydK
	3/kKVSVDrOvrpKMoHUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr6Uh-00HVJ4-0I;
	Tue, 25 Apr 2023 00:25:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr6Ud-00HVI4-20;
	Tue, 25 Apr 2023 00:25:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D89F62A76;
	Tue, 25 Apr 2023 00:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DF1C433D2;
	Tue, 25 Apr 2023 00:25:11 +0000 (UTC)
Date: Mon, 24 Apr 2023 20:25:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, rmk+kernel@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 bp@alien8.de, hpa@zytor.com, chenhuacai@kernel.org, zhangqing@loongson.cn,
 kernel@xen0n.name, mingo@redhat.com, peterz@infradead.org,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/8] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230424202509.716c6136@rorschach.local.home>
In-Reply-To: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_172515_719909_894324C1 
X-CRM114-Status: GOOD (  20.51  )
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

On Sat,  8 Apr 2023 05:42:14 -0700
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> When using the function_graph tracer to analyze system call failures,
> it can be time-consuming to analyze the trace logs and locate the kernel
> function that first returns an error. This change aims to simplify the
> process by recording the function return value to the 'retval' member of
> 'ftrace_graph_ent' and printing it when outputing the trace log.
> 
> Note that even if a function's return type is void, a return value will
> still be printed, so it should be ignored. If you care about this, the
> BTF file can be used to obtain the details of function return type. We
> can implement a tool to process the trace log and display the return
> value based on its actual type.
> 
> Here is an example:
> 
> 

I like this series, but since the merge window for 6.4 just opened, I'm
going to hold off and pull this in for the 6.5 series (after a bit more
review and testing).

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
