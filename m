Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEC8C28CC2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 04:09:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10403250ED
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 04:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VTMjGGQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10403250ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=S/YpQ3B+MDc+8I9xdTL+9VuZB1yo6FI8B/2Whs3DGmM=; b=VTMjGGQ7tAwQuPcBUDeLinOuc
	wChvrwA4545mUJQ7Waty+h8+omkSWlqmTtwM6okMJvsDgC+SevnTidyfNeMaxQt+kgB0gxsapAA/m
	bOwikWwIWBZ9BCsBWNtzxNYTUJ1aPUzhnFJWcH7csVZ4K/C8lVWt9U014BYEz7A9Rc3kmwax+vGh+
	8k8D44MIE5wsUWWNdxaNUJs1PYTa44/rHnzHDuNXX3ZtL8fiw0NCvQtNDSnflxY5EGPvFHKacTHcP
	sVj915BlJgUy5sBVe8Y2nlmtmuwyKv5OIZ7ur2E1L1QjMMlpWuQsikDOQgXisccTfXPv9hyq87iJZ
	rMilhqjbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWCNa-0007Fj-8j; Thu, 30 May 2019 04:09:26 +0000
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWCNW-0007Dp-Lm
 for linux-riscv@lists.infradead.org; Thu, 30 May 2019 04:09:24 +0000
Received: by mail-pl1-f193.google.com with SMTP id g9so1971887plm.6
 for <linux-riscv@lists.infradead.org>; Wed, 29 May 2019 21:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pgMA0Wfc76ibrLZDaqEAp0iESFpifKaHVOBOP4rz25s=;
 b=spt4PaX/XVg4f4IKoHmLwPqEe/w8MXrR5H6bjOyWVTub0/9e+nw0RRfZQSknbh1H6c
 7FzcphrA8ptJp4X1eRe9C5AmhyPmtGYZJjCNlZKh0wMd1CvrrWZF1f4SrmZKeLFfJbRP
 X9Zym0PqX3qhQEByqSOELR08/lNyRWlGyDuBBdIt13iJA5rqkI66srehurt2jLJnjWa4
 E/f7r8ZAKG8AebF0+SEOdtt+fsrgdrkwGi98qj2trOQh1ZXDOmvlleWnWEXssX96OhHj
 8/uppb/+9fOOLq3yT21QnjqmLSu1U2OYZ9oA8VQlHkGUj1g3+579KoU25ZpKtY4gEMDj
 4A8A==
X-Gm-Message-State: APjAAAUid18wrV2q9FuOYCfMmrHAMIhJKzrD/plnQm1OKEJEOtAYjrk/
 /k+hH1fgq5JWRy9lsMRSs94jVg==
X-Google-Smtp-Source: APXvYqynAVNJiWMosj39mGO5m4j4CaYHyiDZKp97BOYFMAtBAQuLZMgN27bxN/yqwZ4YwNPWI+pRWQ==
X-Received: by 2002:a17:902:a405:: with SMTP id
 p5mr1741551plq.51.1559189359758; 
 Wed, 29 May 2019 21:09:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s80sm1464910pfs.117.2019.05.29.21.09.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 21:09:19 -0700 (PDT)
Date: Wed, 29 May 2019 21:09:19 -0700 (PDT)
X-Google-Original-Date: Wed, 29 May 2019 20:53:09 PDT (-0700)
Subject: Re: [PATCH RESEND 5/7] RISC-V: entry: Remove unneeded need_resched()
 loop
In-Reply-To: <20190528104848.13160-6-valentin.schneider@arm.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: valentin.schneider@arm.com
Message-ID: <mhng-066fe6a6-4d0a-4286-bc01-faaf21ff2698@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_210922_714871_404B2158 
X-CRM114-Status: GOOD (  14.64  )
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
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 May 2019 03:48:46 PDT (-0700), valentin.schneider@arm.com wrote:
> Since the enabling and disabling of IRQs within preempt_schedule_irq()
> is contained in a need_resched() loop, we don't need the outer arch
> code loop.
>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/entry.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 1c1ecc238cfa..d0b1b9660283 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -258,12 +258,11 @@ restore_all:
>  resume_kernel:
>  	REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
>  	bnez s0, restore_all
> -need_resched:
>  	REG_L s0, TASK_TI_FLAGS(tp)
>  	andi s0, s0, _TIF_NEED_RESCHED
>  	beqz s0, restore_all
>  	call preempt_schedule_irq
> -	j need_resched
> +	j restore_all
>  #endif
>
>  work_pending:

Sorry I missed this the first time around.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Do you want this through the RISC-V tree, or are you going to take it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
