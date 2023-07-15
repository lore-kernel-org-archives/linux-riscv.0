Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9083EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niv7t/ztvuG3fnjOguBG1XorGFWKGjvy9ndAdaVsQS8=; b=AGtbXPZN8J8au2
	uaTxvuT1Yb8KIfRpr3IDJ4AQTciVQmRHXPXNE0Ym5U+CvZPem///NhTymIAhP5IV2ar43YtYmC5RM
	UOc/U8QQsG+Ne2mDcYMh4W3mHOmzSl5d12UvO5ZjqzO0imknoZfRzMJieUaxetLKR1Gj/UZtxhH0u
	e/mgBOUghCW2h+7UnMKmyUe4bEigzv2lgdXBpzguzAJLgPUyt2JCab6oIP5SANLH/FiwcQ5dvQU6I
	kxHdMI7J0MyoZvAQjMELO/HFoPggWwoeliKuED4npOlNxYT6PebNXTK77rMp21z/j+z/3ZfmwiLwL
	EJu8AVjzLRSPxD2sUOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKg7Z-008wJd-35;
	Sat, 15 Jul 2023 14:19:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKg7W-008wIf-39
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 14:19:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7652D60915;
	Sat, 15 Jul 2023 14:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5476CC433C8;
	Sat, 15 Jul 2023 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689430777;
	bh=+Zc6MkX4Je1o4oRfyxtSq9WhWkGFgbpOiD6Q71QeBYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zy3rfFDF9/RcEDqv/V++Mi0WYdWrN0WzDeIRaOAJtqNziHBGyxmQCrOpfIJF193ZZ
	 SKIEF2VT9uOU3GbnWIiyD2NLSdjwASvzp6befCgGeHVVK+/oBns/kK6RspFIzyOxZ5
	 BK1HNxTZ1+H1pH/VVp3C7+hLEHvSf9B2R5sKe7uM=
Date: Sat, 15 Jul 2023 16:19:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, falcon@tinylab.org,
	bjorn@kernel.org, conor.dooley@microchip.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 2/2] riscv: stack: Fixup independent softirq stack for
 CONFIG_FRAME_POINTER=n
Message-ID: <2023071528-traverse-parting-14b2@gregkh>
References: <20230715134552.3437933-1-guoren@kernel.org>
 <20230715134552.3437933-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230715134552.3437933-3-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_071939_062214_E7B7B9F4 
X-CRM114-Status: GOOD (  17.80  )
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

On Sat, Jul 15, 2023 at 09:45:52AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The independent softirq stack uses s0 to save & restore sp, but s0 would
> be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber list
> to fix the problem.
> 
> Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
> Reported-by: Zhangjin Wu <falcon@tinylab.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index d0577cc6a081..0b58720109db 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -83,7 +83,7 @@ void do_softirq_own_stack(void)
>  		:
>  		: [sp] "r" (sp)
>  		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
> -		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
> +		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "s0",
>  		  "memory");
>  	} else
>  #endif
> -- 
> 2.36.1
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
