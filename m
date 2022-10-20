Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEDFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 01:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNFQMdd+UT24Zyetnja2XL90orXiEcaH5mx7kHxHfXw=; b=Cg7OHbj4bf2aso
	z7fEPW0a10rsfAwGGTKbSsYCgplSxOw7vArJ9UI2SoBNOsjpuzDFzdcC6HK6zpENghHp1fYsMu7B6
	UYxDWo/vUM4H63UmAb72tmPDC5URP0i700oug+dVC+lAy0OxQ06i1XYThvgk+DLU6k+chKAqGvHSl
	iInaOzZpTE+7aI11UhtljHHagxTisK2XBpo6WsxVUSWWxJ9Xg7x5d5TS6xVvXSZ8vR4t7JksZjLoT
	SvfJRXcPUfNauxGiB53674/xxQPmuodScrmkAM8SN/1slKGKOj8OtRZ9B6Hw0CK0Z4A4S+YQzOC1n
	h9Z1mc8bmy5KOhNXmjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olJwz-008mMi-76; Thu, 20 Oct 2022 01:02:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olJww-008mMD-8D
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 01:02:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBEE061846
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 01:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C01C433D7
	for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 01:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666227737;
	bh=Up2VerrOxVYswXUVHRewL92xXQNU8nYbGKMF4T9eQMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sKtpNK0SrEihd0IJ7UVVVGR1y3RMLwkwybN/iWBNJ8jtCtlX/uFTOyvNE45WoRYmx
	 4nj7KqCK7tcCfr4w7oHry8n6GuOcP4+x01VKLGY1KZgssZPi4w8y9SSkaMtUwrTXju
	 yy9xvB2GiSgZ9X5mr2C7DCA8ainxNZm0ETdXtEDEHPnDnA9PWLm+Dudw1HvSdge8BZ
	 epsqJetOitViaPQAOslBcdAg15lgThLXtuEs2h4ktDqGSbStdaa2v5tHkKYkht5BcD
	 xlKz0QNKjuQg24hYm8aryE2YVd0xsp9bWSl5lbqnnkaxmwLGfBKg4yCo8hhRL8P8B6
	 2H5DRARDQ2NXg==
Received: by mail-ot1-f52.google.com with SMTP id t4-20020a9d7f84000000b00661c3d864f9so10526249otp.10
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 18:02:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf1tPBN8EKkHx6Hxv7aPrF6MmDBXc6LkTUxSHZyMgojjSFbkTne8
	3qnuu1w36WUTvG19M7f0z5TetkJnWh2HPIhFEME=
X-Google-Smtp-Source: AMsMyM6oqhkTNPGdTnaC2Jyt8++7m2Mtw8h0QRwjWlECeuEtwBLsjBNwsv8ogiZxsJfHi1YUkITSH5CvuGBqbzO2Qzw=
X-Received: by 2002:a9d:3634:0:b0:661:a991:7c57 with SMTP id
 w49-20020a9d3634000000b00661a9917c57mr5310013otb.308.1666227736409; Wed, 19
 Oct 2022 18:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221019154727.2395-1-jszhang@kernel.org>
In-Reply-To: <20221019154727.2395-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Oct 2022 09:02:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ=q5C87S0Tbei2Q4k7C=PupMcXScXruyeB_BTW01ALPw@mail.gmail.com>
Message-ID: <CAJF2gTQ=q5C87S0Tbei2Q4k7C=PupMcXScXruyeB_BTW01ALPw@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_180218_388067_A2877FE2 
X-CRM114-Status: GOOD (  16.74  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Oct 19, 2022 at 11:57 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
>
> To solve this race, we introduce spin_shadow_stack atomic var, which
> will make the shadow stack usage serialized.
>
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 4 ++++
>  arch/riscv/kernel/traps.c | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..7b924b16792b 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>
>  #ifdef CONFIG_VMAP_STACK
>  handle_kernel_stack_overflow:
> +1:     la sp, spin_shadow_stack
> +       amoswap.w sp, sp, (sp)
> +       bnez sp, 1b
> +
>         la sp, shadow_stack
>         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f3e96d60a2ff..88a54947dffb 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
>                 OVERFLOW_STACK_SIZE;
>  }
>
> +atomic_t spin_shadow_stack;
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>         unsigned long tsk_stk = (unsigned long)current->stack;
>         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>
> +       atomic_set_release(&spin_shadow_stack, 0);
> +
>         console_verbose();
>
>         pr_emerg("Insufficient stack space to handle exception!\n");
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
