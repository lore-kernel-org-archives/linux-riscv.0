Return-Path: <SRS0=NEFo=63=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBC7C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 21:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C79205ED
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 21:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bNfBhPV6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="iFgMMOoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43C79205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LQvZ3cnoxWWWtAQPX/y16TnIryLF7O8ppBXXbOpkfJE=; b=bNfBhPV6sG9zXI
	4eYW/NULvnN5ZFAWrBO02EEiZ7pvyoRYjzko3b4uiA9sOPy7TLuNqQu8AqW88v79j84ZS4MK+aMqi
	rJ4FbOFSrSrDGEd8ck8eVycM8XhOABhecubIWZta9HHyu0IEhywtN1ezJA4gsd/VQBDKKJqNv7AgU
	iYuGj1iETpF0z9G7v0QbQNeAM4t1Iuy0gsQ2iibDxzppOUrpF+XUl2gLRtdmR8q0e1YgsN0aH6uE0
	yXHQn5BG1u0D5MGkJZ80Mswnfio7Q5EHn4ZAJxR7lB8wZY9e4TCdrpTG6Qk3a2Q3UtZ9t6yiyxTR+
	hyHGAkNc2GsuL6V6FEUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYz1D-0004Pc-IZ; Wed, 13 May 2020 21:34:23 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYz13-0004Ex-NM
 for linux-riscv@lists.infradead.org; Wed, 13 May 2020 21:34:15 +0000
Received: by mail-pl1-x643.google.com with SMTP id t7so345270plr.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 May 2020 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LQvZ3cnoxWWWtAQPX/y16TnIryLF7O8ppBXXbOpkfJE=;
 b=iFgMMOoReZ85Q2Uo0jGImdbsoBegv49w87WiEqZhNYhvoog2bsz4o7CTmTLm4XieeO
 ftN9bDcc6DdF8g75K7+/B8AxEBdwcSwArR3cx8osqD/HZUKQIL30MKHIyvE4kfLfZv0e
 WHs5SKUsoKUegLPENvjP/IrrAoV/vZo88hU1ekN0L5yIyZDqBURGPxKqPWHQBxUH5AU8
 O/q8slAIWWgn4KCx7SlRdflaVne3T6kK9DAH6MJ+jYRcrlWjnvxApbpGt2v0ozBMIoy7
 kLowFy2v1voohCXt+Xyvm16PrqX4LdZu8yaSd82XbS4SewWsn9iTNMhbX/pZv0X57lK+
 jh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LQvZ3cnoxWWWtAQPX/y16TnIryLF7O8ppBXXbOpkfJE=;
 b=BCAihXL9VNff7a3N8F56fzyrqR+wWkHMMQp2QD/6ihHYanz9FFcdvJdWeXMWYrnCFc
 xKg5MYaWe75vZ2zfaNi26UqLUNXvpq2Z5snZGqULKAGlkJejFzPK0OG0znUUgg0N0Bv3
 vBIEwstCiKIhYPeFw0XLvsa387mGWBmO9EvpA+5qlQsh+EQ/6Hch1wALP1jefWyh6X/R
 o61iVPVQhOshFPGsYxhca5XrrRQculKz/TrAYevOuGo8qaKULQiEVV3H4YaODdd55bG9
 5QT9XYMJy6NZ692v51R4q0aLRhxOJs2RWZ3xPUrqNgY8H3qvjE3rSzsx6E6vk+3wBczy
 Rjew==
X-Gm-Message-State: AGi0PuZznrrjA4TH6y5Q67RtdHi7g7RZJLW4C3PJ+9mutFAjhSYTsI1Q
 2Qdp/NMsG+nXDgjxlcj0/RelRQ==
X-Google-Smtp-Source: APiQypJZ5JtNOolKe9h9jvBj34XsfS2ZZKsgyQ9Jm2zRk6dWIknX6wZjxyDaGNCHsu/j+99GbU5+gg==
X-Received: by 2002:a17:90a:4e5:: with SMTP id
 g92mr36920442pjg.148.1589405652819; 
 Wed, 13 May 2020 14:34:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r21sm16167599pjo.2.2020.05.13.14.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:34:12 -0700 (PDT)
Date: Wed, 13 May 2020 14:34:12 -0700 (PDT)
X-Google-Original-Date: Wed, 13 May 2020 14:33:02 PDT (-0700)
Subject: Re: [PATCH] irqchip/sifive-plic: Remove incorrect requirement about
 number of irq contexts
In-Reply-To: <20200512172636.96299-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>, Mark Zyngier <maz@kernel.org>,
 tglx@linutronix.de
Message-ID: <mhng-c1cfbecd-9399-4bcd-97d4-c5eb5692d1ed@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_143413_781483_8853EEE7 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: jason@lakedaemon.net, wesley@sifive.com, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 May 2020 10:26:36 PDT (-0700), Atish Patra wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> A PLIC may not be connected to all the cores. In that case, nr_contexts
> may be less than num_possible_cpus. This requirement is only valid a single
> PLIC is the only interrupt controller for the whole system.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> [Atish: Modified the commit text]
> Signed-off-by: "Wesley W. Terpstra" <wesley@sifive.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index d0a71febdadc..822e074c0600 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -301,8 +301,6 @@ static int __init plic_init(struct device_node *node,
>  	nr_contexts = of_irq_count(node);
>  	if (WARN_ON(!nr_contexts))
>  		goto out_iounmap;
> -	if (WARN_ON(nr_contexts < num_possible_cpus()))
> -		goto out_iounmap;
>
>  	error = -ENOMEM;
>  	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm assuming this is going through the irqchip tree.

Thanks!

