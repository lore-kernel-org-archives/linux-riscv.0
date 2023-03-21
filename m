Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC8C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fKfpEeinYadp2bp1cdbVRKYZbXbaLLG0Mk7xXkRoO8=; b=j1aUJjCpZB2EUo
	GghGBN4WgPjAAAi5ocXZ7fMEkyLiw7udCiTV1uIDQyWShCxljchVrBjcTaq+6p3tsG4GpqLgVgUks
	9Nmvf75FfH0LeDzCQHmlW3U6L2pWA58g5PiQLTququ5sJmFBJkwz8X9fjHPCe6A5WtMNIsO6qB42B
	tRM9VBQsC2DfckNrz9/INPgRaWIuESAtmTWfBodX+NwWBGrnJv4Z7WL9aUsELkN4jYzN08FWRf0aV
	ADNSKmtSQWgnYyAPuMndBV5Bp3jyfU+8qnJLs+GetOMSLSns8CP+wboJqOIAfDZNU7K7B+6tpQFFC
	bVm3SJRzx5Pw4yK880lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefqZ-00DEXD-1x;
	Tue, 21 Mar 2023 17:32:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefqX-00DEWI-06;
	Tue, 21 Mar 2023 17:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xUZFSZQsr16SNSQJKusTXYyu832nutqEq5J/FsHnccU=; b=AVftADjchhmt+Jp4bRXmDpPWgb
	QPWGGGotXG4NW1Bxs8o7Mp2rYgt/rL0QpXwz7h7on7QEc0WLk1BogpwK3a4peFkSHmTxBkVUyXocp
	j16OfEx0Oa09g8pUR/qFB7nkgAKzV/AW/0T7oiuhW2LiRPbNE7GT6NZmc/fLBVcY22b/BpDYwIOMJ
	2N+0YvkAiRDtyivAXO6s+QL9tNvKIH+3z2wm6TRGR2P1oF6tdGWQwzSQ2WpgY5ufuJR9Gx3RyzHQF
	kR1xJKNsXr60PT+/7CeaDjk9yyvTwktOC8fZrAOTP1SzL9jUPDeglbIOlB9HuOkQdulRWp8kKMoJC
	oqAmnEXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51692)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pefq5-0001da-I2; Tue, 21 Mar 2023 17:32:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pefpp-0007vh-5A; Tue, 21 Mar 2023 17:31:45 +0000
Date: Tue, 21 Mar 2023 17:31:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, mark.rutland@arm.com,
	will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
	xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <ZBnqAYO7rdk4Qikq@shell.armlinux.org.uk>
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_103229_067505_9EE842F0 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, Mar 20, 2023 at 06:16:49AM -0700, Donglin Peng wrote:
> diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
> index 3e7bcaca5e07..ba1986e27af8 100644
> --- a/arch/arm/kernel/entry-ftrace.S
> +++ b/arch/arm/kernel/entry-ftrace.S
> @@ -258,7 +258,15 @@ ENDPROC(ftrace_graph_regs_caller)
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  ENTRY(return_to_handler)
>  	stmdb	sp!, {r0-r3}
> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> +	/*
> +	 * Pass both the function return values in the register r0 and r1
> +	 * to ftrace_return_to_handler
> +	 */
> +	add	r2, sp, #16		@ sp at exit of instrumented routine
> +#else
>  	add	r0, sp, #16		@ sp at exit of instrumented routine
> +#endif
>  	bl	ftrace_return_to_handler
...
> -unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
> +static unsigned long __ftrace_return_to_handler(unsigned long retval_1st,
> +			unsigned long retval_2nd, unsigned long frame_pointer)
...
> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> +unsigned long ftrace_return_to_handler(unsigned long retval_1st,
> +			unsigned long retval_2nd, unsigned long frame_pointer)
> +{
> +	return __ftrace_return_to_handler(retval_1st, retval_2nd, frame_pointer);
> +}
> +#else
> +unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
> +{
> +	return __ftrace_return_to_handler(0, 0, frame_pointer);
> +}
> +#endif
> +

Hi,

To echo Mark's criticism, I also don't like this. I feel it would be
better if ftrace_return_to_handler() always took the same arguments
irrespective of the setting of CONFIG_FUNCTION_GRAPH_RETVAL.

On 32-bit ARM, we have to stack r0-r3 anyway to prevent the call to
ftrace_return_to_handler() corrupting the return value, and these
are the registers we need. So we might as well pass a pointer to
these stacked registers. Whether that's acceptable on other
architectures, I couldn't say.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
