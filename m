Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5285DECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pStW2LU9NaSgkA9kkYUREJDnDuBQNQ4Lgt1uC9yzto0=; b=1Yyr0eXOclwS5X
	tAEXeZeXT7fUJLjBr107CSsrzHy2fJXwZiiRIHJj5FM860BQJ1n2XzPNMYcf5ew/5lGC9PE2pbrN+
	6zUNJT0TdUnpuyH0tSLKw8yhJ5cSqIOcc02BsePpGKLzpe0HMvs2M7tC3DQe9Nz0OC+iI4DHidMUz
	bwQzfcFE05EMztGDtM5XtCa+PVjtS7uZRZiK07MN72B5w3xyaz5GKedMxQakO+dFI7K+BpCkL6QJN
	em8qioeSxgsS+BPfxwu1UyDNIwz0vp07GoAuCDW3HMfb2k2fCFWbCyT5DfLQBRXLAEpj1A79uZIJT
	lVphYMH6emPTi7CzhyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwDp-001HML-WE; Mon, 24 Oct 2022 12:06:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwDo-001HLY-JK
	for linux-riscv@bombadil.infradead.org; Mon, 24 Oct 2022 12:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PQNqs6IdtT9gCZUPfrGepUfUTCnXjYqE6ZtxOOCZbuY=; b=bZUxoZ3o+SOLm2CQBy+VttoP2B
	OUQg3xIogy0yBtLBjNHhw1AD98RCzB0kPet/YEkeMNmVR/Jmhxl2GbO9TFg6nk3qeBdntj9dcE/v/
	nQts5mvftu6i0IDZtQ3YnguK28E+WnrwyIOrUDc2x63UPAzQ2pixygVcHRlZTrLavNxyFHLVHL2uS
	k14/UwfFI3DWikDyw/rSul/fVBClCA0zMSCYm8I+/lV1m1y334PA5s+FYIfGEhpNvPf/n04//nkZ8
	1QoLyLZHGM65OVUTIkaIUyY+clnTYDxYiZgdNLCVFW2kkrWV6IfNI1VNDdOMV6HcwySTaqQIE5mqt
	xqXw/k8w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwDX-0063bj-GO; Mon, 24 Oct 2022 12:06:08 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7AEE33000DD;
	Mon, 24 Oct 2022 14:06:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5BAEE2018F17F; Mon, 24 Oct 2022 14:06:04 +0200 (CEST)
Date: Mon, 24 Oct 2022 14:06:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Guo Ren <guoren@kernel.org>, Lai Jiangshan <laijs@linux.alibaba.com>,
	arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
	jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
	chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, chenzhongjin@huawei.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Borislav Petkov <bp@alien8.de>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for
 noinstr
Message-ID: <Y1Z/rLaaUp7e9xoy@hirez.programming.kicks-ass.net>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
 <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
 <Y1ERsP0YYVNulWnw@FVFF77S0Q05N>
 <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
 <Y1Z9U7XN4nlGg8yb@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1Z9U7XN4nlGg8yb@FVFF77S0Q05N>
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

On Mon, Oct 24, 2022 at 12:56:03PM +0100, Mark Rutland wrote:

> How about we split this like:
> 
> | /*
> |  * Prevent the compiler from instrumenting this code in any way
> |  * This does not prevent instrumentation via KPROBES, which must be
> |  * prevented through other means if necessary.

Perhaps point to NOINSTR_TEXT in vmlinux.lds.h

> |  */
> | #define __no_compiler_instrument				\
> | 	noinline notrace noinline notrace __no_kcsan		\
> | 	__no_sanitize_address __no_sanitize_coverage
> | 
> | /* 
> |  * Section for code which can't be instrumented at all.
> |  * Any code in this section cannot be instrumented with KPROBES.
> |  */
> | #define noinstr __no_compiler_instrument section(".noinstr.text")
> 
> ... then we don't need __noinstr_section(), and IMO the split is
> clearer.

Yeah, perhaps, no strong feelings. Note I have this in the sched-idle
series as well (which I still need to rebase and repost :/).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
