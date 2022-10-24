Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D45C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGIUct5Ucr3gd58Wh7MnEtvkHkMGIQsRoNz8gLcmfdo=; b=FPZvrcbA7pveNF
	nkg9tYZaowbxmFZjrsDx0533u2Mjiv6p+qs40/pp5MoalQl0dqyXPgexhYg0PuSAjI5/AcZhqbZ6Y
	Rj3+xNYhf6O1ZS0sFxb+mN4BmGnZ9DEzZXc4rhinO0zUipptRATT+TaXwLbK0ChCE9sUjk7Tvmnyq
	bBCJlZIXSEkY5P0aQrbqDn/rpMwuDo6wJjE6h7i+C6kDn6LBbeR1dC/sEvsha8XW2EOIW3N9iXdbl
	Gpgd+kS0+vlCF1P1Bypg2V//EPrxdv8bq0kD5uh37jVRFsKEdGBCOXkTRp3e8MdlJ6Vcfgays4ewo
	tFX+3f6vSxlLih0/SkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwM6-001Jd3-LI; Mon, 24 Oct 2022 12:14:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwM3-001JbZ-46
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 12:14:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A827D6E;
	Mon, 24 Oct 2022 05:14:56 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.7.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70D1E3F7B4;
	Mon, 24 Oct 2022 05:14:45 -0700 (PDT)
Date: Mon, 24 Oct 2022 13:14:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <Y1aBshGIWMEm+yTv@FVFF77S0Q05N>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-5-guoren@kernel.org>
 <YzrJ0wQxWfjWCxhQ@FVFF77S0Q05N>
 <CAJF2gTRBEGx3qncpk_C8rCsFN+kqxjgeAcPvZU5m7kDnpwytoA@mail.gmail.com>
 <Y1ERsP0YYVNulWnw@FVFF77S0Q05N>
 <CAJF2gTTurEaFjbKvj1tUptq_TLpXeBAE1UstNYxriC-7r5MHpQ@mail.gmail.com>
 <Y1Z9U7XN4nlGg8yb@FVFF77S0Q05N>
 <Y1Z/rLaaUp7e9xoy@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1Z/rLaaUp7e9xoy@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_051455_239372_BD5E1527 
X-CRM114-Status: GOOD (  16.61  )
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

On Mon, Oct 24, 2022 at 02:06:04PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 24, 2022 at 12:56:03PM +0100, Mark Rutland wrote:
> 
> > How about we split this like:
> > 
> > | /*
> > |  * Prevent the compiler from instrumenting this code in any way
> > |  * This does not prevent instrumentation via KPROBES, which must be
> > |  * prevented through other means if necessary.
> 
> Perhaps point to NOINSTR_TEXT in vmlinux.lds.h

Makes sense, will do.

> 
> > |  */
> > | #define __no_compiler_instrument				\
> > | 	noinline notrace noinline notrace __no_kcsan		\
> > | 	__no_sanitize_address __no_sanitize_coverage
> > | 
> > | /* 
> > |  * Section for code which can't be instrumented at all.
> > |  * Any code in this section cannot be instrumented with KPROBES.
> > |  */
> > | #define noinstr __no_compiler_instrument section(".noinstr.text")
> > 
> > ... then we don't need __noinstr_section(), and IMO the split is
> > clearer.
> 
> Yeah, perhaps, no strong feelings. Note I have this in the sched-idle
> series as well (which I still need to rebase and repost :/).

Ah; I'll sit on this for now then, and once that's all in I can send a
cleanup/rework patch. Sorry for the noise!

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
