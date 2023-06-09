Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52989C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APjttbLhOUjD2+5RjcyTk1Yy2zekUXDZE5nL/yMQ05c=; b=BtY75EGxbCv9ix
	MacYNVMawkZmTlV42crMa63BAA0xagzPAnxIWv7o5zCCpGMiRSVwC9YHzaTqilmFvzsvpI+u42Qzu
	g6+5Th1EoX9z6sGXNYj5iPGDT2DWS9aysuj5YKLJIJ//7FxVxcg/UfAMfzKR+LaI1dcLjBVY6ndVZ
	qM019Jg7WdS7J1WVgtWYt/06AlRPr+9i9H0KdvHCX0LhBOudoM9sXuM10q2YPJ0/9qWJLN18FmLqb
	afZhXzMQff1fYMXrJdlXGsTrszbhJkL3IrtQewJ0ijj177F4fRYRQkQxP5A8ZK5F55/UVvu28Qr2I
	aovx/audL2m3skV8xINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7YT0-00CQPu-20;
	Fri, 09 Jun 2023 09:31:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7YSu-00CQNp-1C;
	Fri, 09 Jun 2023 09:31:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83FA5655F1;
	Fri,  9 Jun 2023 09:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F6BC433EF;
	Fri,  9 Jun 2023 09:31:22 +0000 (UTC)
Date: Fri, 9 Jun 2023 10:31:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	mark.rutland@arm.com, will@kernel.org, rmk+kernel@armlinux.org.uk,
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
	bp@alien8.de, hpa@zytor.com, chenhuacai@kernel.org,
	zhangqing@loongson.cn, kernel@xen0n.name, mingo@redhat.com,
	peterz@infradead.org, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/8] arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <ZILxZ6wrYUnnxT/E@arm.com>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
 <c78366416ce93f704ae7000c4ee60eb4258c38f7.1680954589.git.pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c78366416ce93f704ae7000c4ee60eb4258c38f7.1680954589.git.pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_023128_448846_B6CEC93B 
X-CRM114-Status: GOOD (  13.02  )
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

On Sat, Apr 08, 2023 at 05:42:18AM -0700, Donglin Peng wrote:
> The previous patch ("function_graph: Support recording and printing
> the return value of function") has laid the groundwork for the for
> the funcgraph-retval, and this modification makes it available on
> the ARM64 platform.
> 
> We introduce a new structure called fgraph_ret_regs for the ARM64
> platform to hold return registers and the frame pointer. We then
> fill its content in the return_to_handler and pass its address to
> the function ftrace_return_to_handler to record the return value.
> 
> Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>

We fully trust Mark's reviews ;) but just in case you need an official
maintainer ack:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
