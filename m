Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381F8C46464
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 00:33:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F852086A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 00:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W5+T2yTx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PifX1xRO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F852086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=/O0tWDx/+PXVUebLDZ3DJLW4tO/F8NlnxfoCVL0k67k=; b=W5+T2yTxQzyIVhxNU4PmLl+xP
	p7PrBXYfRFDaC9oUYQywSzGjLcjSbM8dFAKq8RxLETo9c8+gBxZL4GRVJkvZcD7un096+qgfm05aC
	Zied6UarH6cX1kGaxxQzzwsKS2162fS0I+QAN0N/5jc/h4R4x9WGj3eV1hmoXv+Ien+s6+Ad7l8iL
	7iJHGkaXizTdvG9MYhuB3zWDHhfdHWbNWC9cJC6NykIWCfeAh0rbMW/3oqff8YZwA53ILlbexpDkt
	9TBLmvbqAEC7igB14loVamZW3qNIJcUfhTyN0UYRV7WPu6zrt0YqhnceY0tC5CGRqZEcihESUa8IL
	xgV0PKbXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKBml-0008Kj-PV; Wed, 07 Nov 2018 00:33:31 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKBmY-00082o-T8
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 00:33:20 +0000
Received: by mail-pl1-x641.google.com with SMTP id o19-v6so6999884pll.12
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 16:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SelDEmOfMAVrtkn80IJq8uB2tJSaeYXNm6xN79i+y60=;
 b=PifX1xROUl0seQNVGelT/WY5SbPGdg14Y1c5TSvAJdB2mV2sLkhTF2xGcLJn9heeWO
 4FrI8LNP5pHaLo4xKTZbMpAROx+KqOY4WA/g4nV1jhsrOKn8lb9uOM/dHqs+Z9pp7aEy
 nAvEoBnOi/VfsYKVgk2Cwq1UAkbZdwsDC7dmMuS1L3x4Rcykjce4GvVkQjETBas9F5QZ
 T7cnIDdChd5WyK+4tqcyaRVw0QP2YkFytTKCUKElRMy0MqBEPc11sSiG0YxlPOMZp0iY
 9musVoeP7EZt+5osD1ZagP37WtneOEDOEfBmbCNmeT3FPlVoV44kgjAf6DrynpUdQSC2
 RfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SelDEmOfMAVrtkn80IJq8uB2tJSaeYXNm6xN79i+y60=;
 b=VRvnLVacRiAr7nb+jAzhqaJEKZCxb109ZKxJ1+YV85u/z/Z2bfSINHkwTCHLgglUDT
 MeD5S7Cjll9EOcOech9lHUt425FeXNpLh0S5WkAe9nwjWhBu/HdoO6UioG6rkKjRYo6a
 NxCPW76CbsrgodaJhLkYUMGLo8FM1i9GtSAps3iuvPnj+mzay4LuQ1PfsHIOhdZY6siQ
 grWxJ/ry6LO+CNQW1qCHTVq7DYNLfhJb58/h776jJVe3l2fFwSqh2gN44PexOLs8tlzZ
 MBqsd3BRSu/w+8xrwrqevx3rSnXlMqbbkNHsfT/GzzL5tIvaWgaDnxkgm5b/234xqGby
 XTgA==
X-Gm-Message-State: AGRZ1gLUpps7kGjI6YXgOJmRy0j8HtMna9ooEHMjJRATTTGkwrpoZtDO
 ei0kjmwxyQr8m50j8JgGXA3xvvITlMI=
X-Google-Smtp-Source: AJdET5ecbazupfq2BghswK9/UuUj5zsG+mrni86YAJ0DWTlo2hzkv/dDttoIyykvTVqYTKx5ZPk2UA==
X-Received: by 2002:a17:902:25ab:: with SMTP id
 y40-v6mr28282598pla.258.1541550787211; 
 Tue, 06 Nov 2018 16:33:07 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e127-v6sm47584911pfe.142.2018.11.06.16.33.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Nov 2018 16:33:06 -0800 (PST)
Date: Tue, 06 Nov 2018 16:33:06 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 16:32:27 PST (-0800)
Subject: Re: [PATCH] riscv: fix spacing in struct pt_regs
In-Reply-To: <20181105144004.28267-1-david.abdurachmanov@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-0fc17080-b4cc-4aa4-b269-b3140af7421d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_163318_935872_18769076 
X-CRM114-Status: GOOD (  13.71  )
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
Message-ID: <20181107003306.37attIvKVQ0Pn4WDjiIYdI3iO-Ff-j5TjuNuiWXZdbg@z>

On Mon, 05 Nov 2018 06:40:04 PST (-0800), david.abdurachmanov@gmail.com wrote:
> Replace 8 spaces with tab to match styling.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/include/asm/ptrace.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index 2c5df945d43c..bbe1862e8f80 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -56,8 +56,8 @@ struct pt_regs {
>  	unsigned long sstatus;
>  	unsigned long sbadaddr;
>  	unsigned long scause;
> -        /* a0 value before the syscall */
> -        unsigned long orig_a0;
> +	/* a0 value before the syscall */
> +	unsigned long orig_a0;
>  };
>
>  #ifdef CONFIG_64BIT

Thanks.  I'll also include this for next week's PR.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
