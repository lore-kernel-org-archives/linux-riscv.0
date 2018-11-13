Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A79C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 01:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9212022419
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 01:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8e55ya1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UTH0u/Ao"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9212022419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2YYuMtRU5rz2EGgMOB6O0l+++i38ptNvPF4pDBNDKNc=; b=Q8e55ya10Pa6ls8CIkxYi6R0p
	vlp6MOvyn8carvwz/YpIf7emUBj2TEIdtUEXzJHlheAWf1q1J4MCE8Z4T/jCkFsU+skvOkR9Llscm
	q8WFuek6o7GG88si6vaRWmY8yrkQalg9fSasc2ZamLdLouFnMor0TV7WdHqgHpG3UeUOA036CZlZd
	8XFqpNWx4PU07xYKnfvVsOEROLiD/Azn/c8eCpa0F6I0HpXAXCt+korG5iFXHeCvH3acH0xVJUt1w
	wn7vu9OwRe+NMdLRCO0lY7nb9MKn2atjQRpmkxYFS+oB0g5YAndS2HZwOycVYrbI5cNJtJSXKSEP6
	PYYEUqs9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMNsb-0001Jb-Qy; Tue, 13 Nov 2018 01:52:37 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMNsY-0001FF-Lp
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 01:52:36 +0000
Received: by mail-pl1-x642.google.com with SMTP id f12-v6so5198466plo.1
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 17:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lPIYX214JFzy507QtU7I3//hmmsVsRBy3z9ehCqlawc=;
 b=UTH0u/AoyFVkKhK3tExRMZBbrM48ERyEBlo2wy/wbcrWINZUC0GyxQ8nyutpfrVeVG
 Sqi997WbAJ2M4AXVu3hjh1OFMwd3Q5liFCOUAqTpYzghCEL8GvG9/xHTQzx/P5V8rNaX
 6cRMMRcrlDTdFNGNGQEnY3jcQ1/m4rcEGvRhQRLUYKCy9iBKTTw4/JKKPbj3P1NzrtKY
 BRoA5/LxlmDX3IWCDXqf6AGApaUYRO5vJXnzzlIoZztNc2PkAR2s/K5t2XfDnwMYaa4F
 7Bbbws1gx+kGhZwVx6vKHE45V+YoUrt0k7LarY4SLt54c6oMKnvbr0SNFPw8ZkTNRhBQ
 ETlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lPIYX214JFzy507QtU7I3//hmmsVsRBy3z9ehCqlawc=;
 b=RuS+AMUF66fHeqCFc0Otb4Vr0HFv2m2bBfOgKyVo9HHsVTlmddhz9nDRFJGG4E+wNa
 qiglRznw0q/LwROrLmdDpptTuGtejoirY1QDQLVBa3pda7CQE+Tvz/x6Hdu4tB5BIJfv
 kFnaRNvvaBQdOrq053++dApSTHPJlpSKvCTQgNrsqWUXLdqF/fmnsWEMmMZaF5G71Vbw
 eCyYIHpefTq9c+st/Jg/94qyiXtuOaIRTN1nkr3pO319dl8cAbfd37Z0T7zERD3sBAjy
 G8TBz4zkhVF909/X7xl6fvoI2g43ntF+CBibjxoPjTEnVVo13uB44d3zjclG/Kn4m8eF
 RY3Q==
X-Gm-Message-State: AGRZ1gLfCxpmd1GkpBXW5wL3AuhcOI8fN2MDS1SOqvksu8lawdEM9RT7
 18MfA7KclEFb8l7U1X12CnnRNQ==
X-Google-Smtp-Source: AJdET5dGex4LXZTkM3jPIdtyNmxs7V3cB0CnV99A70bX4jV5NKuUYJ6pIBppNW/tQq7DVcanuhYd9Q==
X-Received: by 2002:a17:902:e00a:: with SMTP id
 ca10-v6mr3100060plb.166.1542073943795; 
 Mon, 12 Nov 2018 17:52:23 -0800 (PST)
Received: from localhost ([216.9.110.5])
 by smtp.gmail.com with ESMTPSA id v74-v6sm27958211pfk.12.2018.11.12.17.52.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 17:52:23 -0800 (PST)
Date: Mon, 12 Nov 2018 17:52:23 -0800 (PST)
X-Google-Original-Date: Mon, 12 Nov 2018 17:38:59 PST (-0800)
Subject: Re: [PATCH] riscv: fix trace_sys_exit hook
In-Reply-To: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-8eb10330-a87b-4bd6-8f91-e9e177d2992b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_175234_716589_DBF7E258 
X-CRM114-Status: GOOD (  14.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113015223.4b7ilpa5sy1EtN618mF7N1m7ua5vHnyszSNHY_w4DbY@z>

On Mon, 29 Oct 2018 05:15:16 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> Depends on:
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html
>
> Why we don't have HAVE_SYSCALL_TRACEPOINTS in arch/riscv/Kconfig?
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/kernel/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9f82a7e34c64..9db7d0076375 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -120,6 +120,6 @@ void do_syscall_trace_exit(struct pt_regs *regs)
>
>  #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
>  	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> -		trace_sys_exit(regs, regs->regs[0]);
> +		trace_sys_exit(regs, regs_return_value(regs));
>  #endif
>  }

I'm dropping this onto next-audit on top of the other two.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
