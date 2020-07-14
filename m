Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F33C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:27:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD7BB22209
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aN8mfCQJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JrWgTBRd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD7BB22209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TtUhp6m+Fxx3w1DNOYZYFoZu0ZCb1ukKW+1d3LL2Y8o=; b=aN8mfCQJRe9CqPQEI8F59SJZD
	ZXyWBUy9QKvIJ4r4ZwnH7WXSUnn7NeX9SQRHAzl7OblVkJIpB67x+Bmz11xykB1loeWkF1GZGggQg
	nEx/yktIaE+9QwC8dsNMMqscPOMsrUJJiM7UJOdk2xQYXPCyM+bQQkI3k8a5oJaGiiStss3BG6bNJ
	8kHF5/1eTXe+wkJ1fkmr1yKqklqSm7EdmUACxpJMm1yfoORVIDEGoaIEIJuR4XMvLs2bH3HDkNZtb
	boNllG9fK27x704lT962Cn13y2UY8wcE035C/aAMj93gjYk2oDoVGoIw5tGEtETZOe8P9BYseWO4P
	jZWHfKd0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvMqG-0002Kx-MA; Tue, 14 Jul 2020 15:27:36 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvMqE-0002K9-KD
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 15:27:35 +0000
Received: by mail-lj1-x241.google.com with SMTP id z24so23279776ljn.8
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCyLOhQV57mz1Tz9y5V98kqwmWTue4420M9y+zk47sY=;
 b=JrWgTBRdBX1cUe5aCb73+TsaK4ECM13FS6SYZxjTTs/VcET75Za3d/5OpAFolMLiG2
 rmM293nxQKfX4PiAjnofjoAJ6qAZh+dcMJ5TZE8IAzVTRLCvzUlr0FPZQ4Ha2hKtav0P
 Hy7ruQElpq2zZYq8uOxErUU6Ocv4g8NOdw6hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCyLOhQV57mz1Tz9y5V98kqwmWTue4420M9y+zk47sY=;
 b=ODMEfbRfU8nxjykxDLXAyzgNlWyVQVF0uEVR+cx+D1CgiEIgESTvcApzDCWgLwH9Zw
 EvytpWpsWdPp6tTBn/z7vNi2Op8PPecAMM1N/a1UZ5FHwZL/7I2bIe5yAxcQ4YURocyG
 +/VV2+2jAjXULZXdmasw/LyFiXu9QiU72hxKDEgFnyuHSCkYhdLylWmeIXOQu9LRAOD4
 M/CicWeb0zdxux+6mCDTW2rwYQZuJMii0Cx1xSzkOa4NNAQz9osGADunnAvH5JUlyUZI
 pZjbugJVkVQuOGhGNziruHE3IHWpHrrF7J5Kjjj6MKqN5m28cEV7h4hgjrDeU9Usxf80
 3TYA==
X-Gm-Message-State: AOAM531X2wthwmFIzCbqHh1vtAx102UPpiSEkg5aW/3NQMye7PF0RbsL
 qisM+PeHn0IkLfoCXFVtRDYaH2/4uzQ=
X-Google-Smtp-Source: ABdhPJwdW1VHZpyOO7flS+6Lw0RLKK0NdyZFeZL3Jt6dzMlLPAjqUF0dRfiA++0ucYicGzs5oRtcIw==
X-Received: by 2002:a2e:9b92:: with SMTP id z18mr2799299lji.364.1594740452457; 
 Tue, 14 Jul 2020 08:27:32 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id y2sm5371682lfh.1.2020.07.14.08.27.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 08:27:31 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id r19so23257893ljn.12
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:27:30 -0700 (PDT)
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr2701790ljj.312.1594740450439; 
 Tue, 14 Jul 2020 08:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-5-hch@lst.de>
In-Reply-To: <20200714105505.935079-5-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jul 2020 08:27:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpYFEPMfYmNR-9SuPaeC432sC7nmZrismRHQEiR2GM4g@mail.gmail.com>
Message-ID: <CAHk-=wgpYFEPMfYmNR-9SuPaeC432sC7nmZrismRHQEiR2GM4g@mail.gmail.com>
Subject: Re: [PATCH 4/6] uaccess: remove segment_eq
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_112734_764551_369D9EC2 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ack, just with a note:

On Tue, Jul 14, 2020 at 4:06 AM Christoph Hellwig <hch@lst.de> wrote:
>
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -33,7 +33,7 @@ static inline void set_fs(mm_segment_t fs)
>         set_thread_flag(TIF_FSCHECK);
>  }
>
> -#define segment_eq(a, b)       ((a).seg == (b).seg)
> +#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
>  #define user_addr_max() (current->thread.addr_limit.seg)

This "uaccess_kernel()" interface is a better model anyway, because at
least on x86 (and from a quick glance at others), we might avoid the
exact equality comparison, and instead do simpler/better things.

On x86-64, for example, checking whether the limit has the high bit
set is not only more flexible and correct, it's much cheaper too.

Of course, trying to get rid of all this means that it doesn't matter
so much, but it would probably have been good to do this part years
ago regardless.

                  Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
