Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B014C4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 02:09:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C7123DE3
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 02:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12C7123DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZqFeMUz1IxMQHP0FL1Le2ITALTTk8Mz7Ss/Iw7RdXGQ=; b=GISmtbxoiHxNznrTif7OGy0KV
	JMI8qgEs7hLd9Goi29ZC5OmG2W2dWO5xcaOWwaZDG3Nv6UFacDDTsd6Xo2JdIItGEBleJjELpIZSd
	HGCQ7gP9qnCozVWjoq6YO4O56EfPhBV/z5tfLyC4tzMavYuGQYtatvOuWCVY1AvwARI+20FwVT715
	KKk2EO1k9U23XqJf9qy8eRwJIoHA3NvpM/gF/P6HIGo2mNA4Dva8F+8pyUOGYXKvbG9d9juduCJQF
	Tu69bpJ4JNp3ScZLccUx7G5XaVrbwqOlSVEXeDiLIlF50HAU8F/r9lzRf583Kdq5vhyzD6ZLDLrKl
	tPGoiTYgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXsT-00068K-Gc; Fri, 11 Dec 2020 02:09:49 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXsQ-00066a-4s
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 02:09:47 +0000
Received: by mail-pj1-x1041.google.com with SMTP id iq13so1415968pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 18:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YBlvYT4u5OxK5j8EJbV+g1HuI5bT3QSP3buVFiGA1os=;
 b=ojGKW+CeYR5epryGbpALej+OHjrnYYY4F5AcYsJXq2QKzqeCscsKaThjnyeJ9Ylfqy
 stNFexzvzSlxzo11CsCIrvXoot940KDLwNq6U8iyf6o2VVoJmXu5ZEkKzf0kZRN/XH4K
 c5tUCpzDOXA7Qwj7udYJ0zJBRHGi1iHmlFcXB3SSu5MmB6K6QYJHE60hVdtnnFFfjJou
 QdAUsr+MsXZjyQLPZzfO9RP8uOPeNbL+1RQZOuuOS0KF6mtZktlFReA0HtIO119vFWyv
 IW4vS44VNOYcmqhfaGNCUzVPPSQDEa88yoo+n6tMPqyqdkQSNuqX75EHsGQJQxDMLzvr
 UKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YBlvYT4u5OxK5j8EJbV+g1HuI5bT3QSP3buVFiGA1os=;
 b=m/jRLNhXnWzefkUfFuvHOdFVV6aRSJQ1Oa49sadnyUgqneykbFgYISGNn+V9aJyEtG
 wyF7G2fN0AmGvXAFnwtgIo7DrfTfODu1iNH75+xwBTn7rE7WenOlI9s5okg5BDSDfLOx
 R2FPDRUx5Tjl3STtpDrGhWUjwOd+PCNh8gApX5A23hgcFoA84IgEEZnnsW8hcgtQyGzM
 GHvcfQFDjUheWq+l4jac26ADv+oGO9wlNUN7QJvWMMXL49nwMtaHzfui1tLpexrukUkT
 Y6Z4+gRaFF9BV/JvTBTpAmalnfqc0nYhOQvPmZKTuuo38UpF/vQmVDwAhofZommCEkJ/
 LBHg==
X-Gm-Message-State: AOAM533xrk1f2luHgfvj9cEroZP2PamCmQl8Ct4ivIYWxwZ6OR8KS5/H
 XVMroeihipZee+iu2LYjFn6mULYB1dXBhuha
X-Google-Smtp-Source: ABdhPJzeGFWjq3hV8gFbllyK08YaWDVJZPTgEzBarNAGC/GyiCHgx9fKOPPu5k/w9L1BBKd6CjJLhw==
X-Received: by 2002:a17:902:bf0b:b029:d8:f677:30f2 with SMTP id
 bi11-20020a170902bf0bb02900d8f67730f2mr8951276plb.25.1607652582712; 
 Thu, 10 Dec 2020 18:09:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f126sm8252120pfg.153.2020.12.10.18.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 18:09:42 -0800 (PST)
Date: Thu, 10 Dec 2020 18:09:42 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 18:05:22 PST (-0800)
Subject: Re: [PATCH v8 03/22] riscv: Enable interrupts during syscalls with
 M-Mode
In-Reply-To: <20201210140313.258739-4-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-c9e2b17f-75ec-47d0-bfad-47b2ad1195dd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_210946_244662_F5B27924 
X-CRM114-Status: GOOD (  18.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
 seanga2@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 06:02:54 PST (-0800), Damien Le Moal wrote:
> When running is M-Mode (no MMU config), MPIE does not get set. This
> results in all syscalls being executed with interrupts disabled as
> handle_exception never sets SR_IE as it always sees SR_PIE being
> cleared. Fix this by always force enabling interrupts in
> handle_syscall when CONFIG_RISCV_M_MODE is enabled.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/kernel/entry.S | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 524d918f3601..080eb8d78589 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -155,6 +155,15 @@ skip_context_tracking:
>  	tail do_trap_unknown
>
>  handle_syscall:
> +#ifdef CONFIG_RISCV_M_MODE
> +	/*
> +	 * When running is M-Mode (no MMU config), MPIE does not get set.
> +	 * As a result, we need to force enable interrupts here because
> +	 * handle_exception did not do set SR_IE as it always sees SR_PIE
> +	 * being cleared.
> +	 */
> +	csrs CSR_STATUS, SR_IE
> +#endif
>  #if defined(CONFIG_TRACE_IRQFLAGS) || defined(CONFIG_CONTEXT_TRACKING)
>  	/* Recover a0 - a7 for system calls */
>  	REG_L a0, PT_A0(sp)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
