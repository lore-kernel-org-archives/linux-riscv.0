Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511A8C47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cijzShaQ/ycRIprKo9A49GDaV3i3AvW2AUROSE8fxQI=; b=HLii+Vmg7zUC8J
	uOyzgF1oYZDE6dGdr4H0gHX2Bnpv9SU8aptHcBo0TbUHE7oJeRJmVeNJXCL2zwG1TlBJq3m9U8/Cn
	V9ZMFgBYDQVeVLikWwvMpA+22mW/zaXKNPK2m9iqU5X80aKv3TgSUghg0/5LJrDmoKl16egyAaAeg
	BUgmJMrccfcXz/xL5vR4UObqz2Elok6X8f/dGwySewyZ+eLUTxWZUrPLcUxXCh3neYf4CIhlqxBD3
	uAX9nmDJqX79XSlrTAJUTNcYm2+liv0Zp4d2xfiTlgLJNPmvctA3KbXlEmSWoKGM6JP4YcsYMw8jK
	Dlzr74Rzz3GqTUxeLpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27rb-00HAOf-Qk; Mon, 05 Dec 2022 09:34:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27rW-00HAHU-Ha
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 09:34:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F397FB80CAC;
	Mon,  5 Dec 2022 09:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C23CC433C1;
	Mon,  5 Dec 2022 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670232847;
	bh=hhxfe9O1j9bXMKcb6DIOoGo0OtXBulLjFf1+gfBvZV4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HAksjyRuFV+pe91zXzJTvXxyW4uss2YMpKYluA8Z/zOgcS5ED8J1iAhoArTh3JA/o
	 bUCM+VdxaRtwByi8W1wPvgb9/3vwgWJuck+5RgnowSVlp2kiJb2iVua2NO/CILpc0H
	 ngMBanq0ExROqw4OCKdGvENwFRZapvlh8hJwjTo2GxQ1Myd/aP6oRktX/C3aOaS4ln
	 UMK5Ldmx2s7iCj0YxH74TaY55ZlH43G/xcUsGlT7ZBlGYC04BsYjmgnRXWt79/KPXE
	 G8SN3tTKCGTcQYItgjDyPyB4jI56XiloAP7mqZLuMt1TJkeT+gALz9eh5flVSM5wLk
	 dLT/gjNdb0XPg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Oleg
 Nesterov <oleg@redhat.com>
Subject: Re: [PATCH -next V8 04/14] riscv: ptrace: Remove duplicate operation
In-Reply-To: <20221103075047.1634923-5-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <20221103075047.1634923-5-guoren@kernel.org>
Date: Mon, 05 Dec 2022 10:34:05 +0100
Message-ID: <87bkoi9otu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_013410_734390_E7179F9B 
X-CRM114-Status: GOOD (  13.29  )
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

guoren@kernel.org writes:

> From: Guo Ren <guoren@linux.alibaba.com>
>
> The TIF_SYSCALL_TRACE is controlled by a common code, see
> kernel/ptrace.c and include/linux/thread.h.

                                    ^^^ thread_info.h
>
> clear_task_syscall_work(child, SYSCALL_TRACE);
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/riscv/kernel/ptrace.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 2ae8280ae475..44f4b1ca315d 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -212,7 +212,6 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
>  
>  void ptrace_disable(struct task_struct *child)
>  {
> -	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
>  }
>  
>  long arch_ptrace(struct task_struct *child, long request,

This patch is also not neccesary for the series, but should be a
separate cleanup.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
