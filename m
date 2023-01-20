Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA304C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlkINqASiDKqvE47XXzfvOttManh2rfMNvvtD6AQtRU=; b=GCzPWMpxOjc2gh
	Tsz36w9ZuJ1mLPH6HUKzk0L124c2X/i1KoU3rJrmgUeSZUzYa5JGrZmPn8Ey5t1Fchn+m584hOnH9
	YA8IeDQjglG1kgxWV6SFZw2CSzf5cEh869V0EwK4riOuJf2IXFjQrgUw2fM7N0LdpCENP7BIpHziH
	tOgTdHvF8WOyBwEyLaIL6G4cchffDDFwQKybazrBeS070/uGH6eDSm8wupK7GUoMTrFTnbVesy44F
	L66AIO+pQmvRo5DIkCmOqCFyUb1lqPL6UW+IS8VXnt9LG5gZFs+GmahCtcZhdySA94ooXszrmpqSq
	s6cxLkuAW5zjsQgaOzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIqOy-00AEFd-VK; Fri, 20 Jan 2023 12:21:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIqOw-00AEE1-Ha; Fri, 20 Jan 2023 12:21:47 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pIqNP-0003oi-Vu; Fri, 20 Jan 2023 13:20:12 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 06/17] riscv: Reset vector register
Date: Fri, 20 Jan 2023 13:20:09 +0100
Message-ID: <2331455.NG923GbCHz@diego>
In-Reply-To: <20220921214439.1491510-6-stillson@rivosinc.com>
References:  <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-6-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_042146_607436_917A23F7 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@linux.alibaba.com>, kvm@vger.kernel.org, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, Nicolas Saenz Julienne <nsaenzju@redhat.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Davidlohr Bueso <dave@stgolabs.net>, Yury Norov <yury.norov@gmail.com>, Changbin Du <changbin.du@intel.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Myrtle Shah <gatecat@ds0.me>, Eugene Syromiatnikov <esyr@redhat.com>, linux-riscv@lists.infradead.org, Tsukasa OI <research_trasio@irq.a4lg.com>, Ruinland Tsai <ruinland.tsai@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Li Zhengyu <lizhengyu3@huawei.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Barret Rhoden <brho@google.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Dao Lu <daolu@rivosinc.com>, Alexander Graf <graf@amazon.com>, Atish Patra <atishp@atishpatra.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Peter Collingbourne <pcc@google.com>, Janosch Frank <frankja@linux.ibm.com>, Chris Stillson <stillson@rivosinc.com>, Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Colin Cross <ccross@google.com>, Alexey Dobriyan <adobriyan@gmail.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 21. September 2022, 23:43:48 CET schrieb Chris Stillson:
> @@ -431,6 +431,29 @@ ENTRY(reset_regs)
>  	csrw	fcsr, 0
>  	/* note that the caller must clear SR_FS */
>  #endif /* CONFIG_FPU */
> +
> +#ifdef CONFIG_VECTOR
> +	csrr	t0, CSR_MISA
> +	li	t1, COMPAT_HWCAP_ISA_V
> +	and	t0, t0, t1
> +	beqz	t0, .Lreset_regs_done
> +
> +	/*
> +	 * Clear vector registers and reset vcsr
> +	 * VLMAX has a defined value, VLEN is a constant,
> +	 * and this form of vsetvli is defined to set vl to VLMAX.
> +	 */
> +	li	t1, SR_VS
> +	csrs	CSR_STATUS, t1
> +	csrs	CSR_VCSR, x0
> +	vsetvli t1, x0, e8, m8, ta, ma
> +	vmv.v.i v0, 0
> +	vmv.v.i v8, 0
> +	vmv.v.i v16, 0
> +	vmv.v.i v24, 0
> +	/* note that the caller must clear SR_VS */
> +#endif /* CONFIG_VECTOR */
> +
>  .Lreset_regs_done:

Not sure how much they go together, but the #ifdef CONFIG_FPU block above
your new VECTOR block also jumps to the same .Lreset_regs_done, so with
the patch as is the vector-reset block is never reached in the !FPU case.

So maybe making them independent of each other might prevent issues
down the roead.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
