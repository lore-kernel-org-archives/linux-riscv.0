Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287CAC761AF
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLNPLg9CH4zSCUlcYAtzfiARgdcvUZIvrybnF9aSy/I=; b=pWwlWUiIut3WMl
	e+ggvVEYlRdK4Z/g6pcljZO85dvZI4CohYtyN+98asxMDFMINgLNcoE/TZXQGC9VBgDswNG/Y4U9+
	rVeOSD38XNE4qLV1kaUUci5laHdGxyW7Ah/1V3D31aKIklPU0JaziAymblPFouloBkTH7giLHAHcd
	xWexukgBVd8ei8LP8JEmnIB3+TOCYiOVRXh2N+Z3GaUnD7hr5zn66cYUNO7MHkROgYKLpZ9QXu7mj
	84rJRs1u+EEmggfsSk2vzt2Xcy9D2X8vQLAF751jY1B3CM338V1uVlhh588H5JCztqwA3iw8Fb+5F
	1FXcnWjjLYZi4cNUCfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg9y-001M83-07;
	Tue, 04 Apr 2023 12:53:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg9t-001M6K-2a;
	Tue, 04 Apr 2023 12:53:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A431D75;
	Tue,  4 Apr 2023 05:53:51 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.35.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A4653F762;
	Tue,  4 Apr 2023 05:53:03 -0700 (PDT)
Date: Tue, 4 Apr 2023 13:52:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	will@kernel.org, catalin.marinas@arm.com,
	rmk+kernel@armlinux.org.uk, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, bp@alien8.de,
	hpa@zytor.com, chenhuacai@kernel.org, zhangqing@loongson.cn,
	kernel@xen0n.name, mingo@redhat.com, peterz@infradead.org,
	xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] tracing: Add documentation for funcgraph-retval
 and funcgraph-retval-hex
Message-ID: <ZCwdqTAUx+BwthQx@FVFF77S0Q05N.cambridge.arm.com>
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
 <a3dcdd61b3ac07eefabc1b11fc18e9fae23d8cbe.1680265828.git.pengdonglin@sangfor.com.cn>
 <ZCqOl1TCHGhbf0hf@FVFF77S0Q05N>
 <d8b58492-e702-05b7-399e-054892ba6ded@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8b58492-e702-05b7-399e-054892ba6ded@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_055309_934954_22C8C55D 
X-CRM114-Status: GOOD (  31.97  )
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

On Tue, Apr 04, 2023 at 08:02:44PM +0800, Donglin Peng wrote:
> On 2023/4/3 16:30, Mark Rutland wrote:
> > On Fri, Mar 31, 2023 at 05:47:38AM -0700, Donglin Peng wrote:

> > > +At present, there are some limitations when using the funcgraph-retval
> > > +option, and these limitations will be eliminated in the future:
> > > +
> > > +- Even if the function return type is void, a return value will still
> > > +  be printed, and you can just ignore it.
> > > +
> > > +- Even if return values are stored in multiple registers, only the
> > > +  value contained in the first register will be recorded and printed.
> > > +  To illustrate, in the x86 architecture, eax and edx are used to store
> > > +  a 64-bit return value, with the lower 32 bits saved in eax and the
> > > +  upper 32 bits saved in edx. However, only the value stored in eax
> > > +  will be recorded and printed.
> > 
> > With some procedure call standards (e.g. arm64's AAPCS64), when a type is
> > smaller than a GPR it's up to the consumer to perform the narrowing, and the
> > upport bits may contain UNKNOWN values. For example, with a u8 in a 64-bit GPR,
> > bits [3:8] may contain arbitrary values.
> 
> Thank you. Just to clarify, Should it be that bits [63:8] may contain
> arbitrary values in such cases?

Yes; I meant to say bits [63:8].

> > It's probably worth noting that this means *some* manual processing will always
> > be necessary for such cases.
> > 
> > That's mostly visible around where largelr types get truncated (whether
> > explciitly or implicitly), e.g.
> > 
> > 	u8 narrow_to_u8(u64 val)
> > 	{
> > 		// implicitly truncated
> > 		return val;
> > 	}
> > 
> > ... could be compiled to:
> > 
> > 	narrow_to_u8:
> > 		< ... ftrace instrumentation ... >
> > 		RET
> > 
> > ... and so:
> > 	
> > 	narrow_to_u8(0x123456789abcdef);
> > 
> > ... might be recorded as returning 0x123456789abcdef rather than 0xef.
> > 
> > 
> > That can happen in surprising ways, e.g.
> > 
> > 	int error_if_not_4g_aligned(u64 val)
> > 	{
> > 		if (val & GENMASK(63, 32))
> 
> Should it be GENMASK(31, 0)?

Yes; whoops!

> > 			return -EINVAL;
> > 
> > 		return 0;
> > 	}
> > 
> > ... could be compiled to:
> > 
> > 	error_if_not_4g_aligned:
> > 		CBNZ	w0, .Lnot_aligned
> > 		RET				// bits [31:0] are zero, bits
> > 						// [63:32] are UNKNOWN
> > 	.Lnot_aligned:
> > 		MOV	x0, #-EINVAL
> > 		RET
> > 
> > .... and so:
> > 
> > 	error_if_not_4g_aligned(SZ_8G)
> > 
> > ... could return with bits [63:32] non-zero
> > 
> > Thanks,
> > Mark.
> 
> Thank you for sharing this note. I will append the following limitation.

That looks great; thanks!

> In certain procedure call standards, such as arm64's AAPCS64, when a
> type is smaller than a GPR, it is the responsibility of the consumer to
> perform the narrowing, and the upper bits may contain UNKNOWN values.
> Therefore, it is advisable to check the code for such cases. For
> instance,when using a u8 in a 64-bit GPR, bits [63:8] may contain
          ^
Minor nit: missing space here.

> arbitrary values, especially when larger types are truncated, whether
> explicitly or implicitly. Here are some specific cases to illustrate
> this point:
> 
>  - Case One:
> 
>   The function narrow_to_u8 is defined as follows:
> 
>  	u8 narrow_to_u8(u64 val)
> 	{
> 		// implicitly truncated
> 		return val;
> 	}
> 
>   It may be compiled to:
> 
> 	narrow_to_u8:
> 		< ... ftrace instrumentation ... >
> 		RET
> 
>   If you pass 0x123456789abcdef to this function and want to narrow it,
>   it may be recorded as 0x123456789abcdef instead of 0xef.
> 
>   - Case Two:
> 
>   The function error_if_not_4g_aligned is defined as follows:
> 
> 	int error_if_not_4g_aligned(u64 val)
> 	{
> 		if (val & GENMASK(31, 0))
> 			return -EINVAL;
> 
> 		return 0;
> 	}
> 
>   It could be compile to:
                ^^^^^^^

Minor nit: s/compile/compiled here.

Thanks,
Mark.

> 
> 	error_if_not_4g_aligned:
> 		CBNZ	w0, .Lnot_aligned
> 		RET				// bits [31:0] are zero, bits
> 						// [63:32] are UNKNOWN
> 	.Lnot_aligned:
> 		MOV	x0, #-EINVAL
> 		RET
> 
>   When passing 0x2_0000_0000 to it, the return value may be recorded as
>   0x2_0000_0000 instead of 0.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
