Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF846C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvzrrH5Q8cSSLniNGAEhNj7GyF1qOHABpUbDiS95jWc=; b=fXx/+CABZjQqIu
	+GVsjy85sR76bWW+GSU3yIhhWifRgMPr3O3UBx9sW51oLXBklsQAvsDjAfmgQvZrtWyB3s7G1x7Nf
	ArzlstrGc5X88c/Bh1cgf8SgAb/13sC2ngt5C8yoDXuJPueI8gUkqy0qu2fx6+GO56Y5N7XfoIWsI
	uc8lyda4lnf4sDk+u9ck2B5L9N/csEsiLTyMPuVdmbs1m8fUg68LfPHxxocFOovYY0sBO7nX4JRg/
	NxhkLezvy9TFXVEkMykVsPxpkgVhThodwkdVCCZp9Ti4GHqgzVdT24Bgx+vDxiiBoMtk8bCRZ9Efv
	ciDQwLDQ3yHy36FUkEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWC2s-000S4m-RY; Thu, 08 Sep 2022 07:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWC2o-000S4A-Ta
	for linux-riscv@bombadil.infradead.org; Thu, 08 Sep 2022 07:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qOOipAMFA6jU/iAD0NNT6fAlhjOnSrPaO5m9WLa7Ha0=; b=XWBTcDwPn7I4lM/UNGkV9JDC7V
	LCGE6JzoqcxPZHavPhQOjtc8pc1L45zx/Z2uFkIMZMs3VYT4POhxsWq5PHApBJxUSSbMmk/Hr/aiv
	CEifLxaRKaSOiaR4y0jtY8R3Hr/YaFoxr48v8KhsNv6unvME1pwvn3iZrUgFDitZ9Xl+74K4NKKm2
	NYV3WlSA02f8JTjdBIlt8QFSF2HGaTRkd6y2wSAl9os41Vtu4WbyQSZyDe6WjCofFt/kp+bWuL/9a
	bCdlkmqc6G0o2XCGIf4rM1CpC6pvFHO9CnZpGUmTN5oFCDVqj9AKAj24niruMjW18qgGtG/mKfiXU
	S1p/LumQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWC2d-00Ae5F-8k; Thu, 08 Sep 2022 07:33:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0B03D30004F;
	Thu,  8 Sep 2022 09:33:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A0DA92B99E10D; Thu,  8 Sep 2022 09:33:35 +0200 (CEST)
Date: Thu, 8 Sep 2022 09:33:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, bigeasy@linutronix.de,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 4/8] riscv: traps: Add noinstr to prevent
 instrumentation inserted
Message-ID: <Yxmaz7wJPEBQ7Vki@hirez.programming.kicks-ass.net>
References: <20220908022506.1275799-1-guoren@kernel.org>
 <20220908022506.1275799-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908022506.1275799-5-guoren@kernel.org>
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

On Wed, Sep 07, 2022 at 10:25:02PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Without noinstr the compiler is free to insert instrumentation (think
> all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
> yet ready to run this early in the entry path, for instance it could
> rely on RCU which isn't on yet, or expect lockdep state. (by peterz)
> 
> Link: https://lore.kernel.org/linux-riscv/YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net/raw
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/traps.c | 8 ++++----
>  arch/riscv/mm/fault.c     | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 635e6ec26938..3ed3dbec250d 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -97,7 +97,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
>  #define __trap_section
>  #endif
>  #define DO_ERROR_INFO(name, signo, code, str)				\
> -asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
> +asmlinkage __visible __trap_section void noinstr name(struct pt_regs *regs)	\

But now you have __trap_section and noinstr both adding a section
attribute.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
