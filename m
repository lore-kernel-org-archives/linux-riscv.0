Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2545CC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:19:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BE160232
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BE160232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wvc5M6YXsmCkGzMtAwH5hAukzhKeDZGiuQlJZf9MNkg=; b=YMegFWpZPyWt0bcxIOJGwIltM
	i6jnQVUBYTqtDAP4IJT9b5linvBuY8LsOQNbJ2HRBgl3nJb4MFNHZq34/gGlGaB1UT9l0ugVnFPQG
	orTdiYdwWiTLl3F4VaiAxkUCdI9EGh521VfOUzdUm0xiT3+6GNwffhfNsveHscONvhjXe8lrQI5qB
	fGrCi/3pgVGWByky5TV462cQx0Gkv8S88hj8eylxE0OrxMy8lclu+MClkWQZmTLnaP17kkElX1Kl6
	6h4V8cFQ9GCm6C1OjAAtK7GYrAjB/36kxqFoHD2K+jRCxNL5dNm5krQbsQhyj1f5og+NlELoEr+OK
	lNXE+wYWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYHs-003SwN-Bm; Thu, 06 May 2021 07:19:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYHo-003Svm-JP
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 07:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=ff6iClsWGOy2S69S3t4caAKrwDBzIMs9yWLn5gps7VU=; b=Jr5vmbdqZ+qUIKeT6K6EfTCWhO
 baVnlVeFYO5ZPYcpTDqFeZY7sTo9Iq/1AtVSowJ7xw+WbuGwtbEjFdwGhxDt3KwFw4TWHATStQSyV
 WtmycKxn6bTSnDBZIDF6lxi1kYg+tiDTkJZKIWcTMVUuXs4B2fPAzDsbnCTaUNrOX7bZHhqeDzkKx
 1ia8kHjFqQ8H3/wrTiKQJmgO4kLlWWUQePHFwJpnH/KqbEa8Oh3EUXE2I1t1Tc6noplEGdFm6qORa
 trgu47vBRBBy9aqRVF7C8QkfLa1EPZjtez+D5NZgFl9DGQtmtJ3O4jrQDQL481F/TCegfCtH6SwOF
 0EFWNgGQ==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYHl-005f3N-S2
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 07:19:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id s22so4099203pgk.6
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 00:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ff6iClsWGOy2S69S3t4caAKrwDBzIMs9yWLn5gps7VU=;
 b=1nj1YicF1Nrd74sETWXvmza4aB8KIMQv+jFBpSry5u0//OZEWNQ6KGo2cDQHusIm9Q
 aHGJ9VwgbqW6yVmZmvQYMmVH+FhQMj9WQ+EiM963Cd6pgMrOPo1JCJHZYWzuQ6gPo/bh
 2AbbhVKT3K4C/HGGDJSQjD29dOFHv4cQiBvivnfgZVIuRsHBQ4RQpaUVoY5ccjgI1Kwd
 5wG/DDsGK2qXQUBnj2Xpd14Ip4bCrQSKZhOX5qgzdmLyi0/GZ1P3xv/ypK+K1bRIdCa0
 tmFjujgL5q8cb56ZDCCwUACSst+znlhSjHjG80zoBij6QLf0np2xAZ1gp6xfz7EBaaL/
 9InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ff6iClsWGOy2S69S3t4caAKrwDBzIMs9yWLn5gps7VU=;
 b=Lx18zoq2VmPo4ZZkvUYw/sAMF5toZ4QsdsR/wn9UA+NIj7/iSYkhhR+6SFn20qRzyX
 HqZVn0JubvMv4zebCrlQYri9APiImQ6UXZHFNCM07I5iL+LegCXbide9hiYXvCgDTSCo
 3+2kGTQgAOMlUV9IRkeATRbvGr6FK7mTYbNeI3GXGP4hyTrBeJJQjZ9BRVm+ED/Jer4c
 9Oz3Z0T8G4Nxc1wYYHlphnfmBNnN/Y29kBZxDA8pmnIkESLaq/5S0I/LLjyPh1+c676y
 ZurItvZIbi+8I3FKOqQuhUqt/4doAxnD8SjNZagnvRLJuKj1/fX4BTTVuFH5ITo5lkf7
 u5ng==
X-Gm-Message-State: AOAM530pzjut+/YW0TGwDIOT576BW7+UsbXNQD8a1uGHTAKbyGGR55nN
 jgG/HAFuP2SDuf5EViwqwqLl8w==
X-Google-Smtp-Source: ABdhPJxpAJhWX5TTFyynpL+sjUHgdm5DptIpWf5u41d4l2+6z1Wg4UYRdxCjIrhVTIu4yb/ngKmP4g==
X-Received: by 2002:aa7:81d8:0:b029:28e:6e31:7c9a with SMTP id
 c24-20020aa781d80000b029028e6e317c9amr3116972pfn.56.1620285540533; 
 Thu, 06 May 2021 00:19:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k8sm1389832pfp.99.2021.05.06.00.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 00:19:00 -0700 (PDT)
Date: Thu, 06 May 2021 00:19:00 -0700 (PDT)
X-Google-Original-Date: Thu, 06 May 2021 00:18:58 PDT (-0700)
Subject: Re: [PATCH] riscv: remove unused handle_exception symbol
In-Reply-To: <20210501185359.64043-1-rouven@czerwinskis.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 kernel@pengutronix.de, rouven@czerwinskis.de, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rouven@czerwinskis.de
Message-ID: <mhng-84f8c8d7-96c4-4c9c-a254-5fa19a390bbf@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_001901_924687_EEEBCBE3 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 01 May 2021 11:53:58 PDT (-0700), rouven@czerwinskis.de wrote:
> Since commit 79b1feba5455 ("RISC-V: Setup exception vector early")
> exception vectors are setup early and the handle_exception symbol from
> the asm files is no longer referenced in traps.c. Remove it.
>
> Signed-off-by: Rouven Czerwinski <rouven@czerwinskis.de>
> ---
>  arch/riscv/kernel/traps.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 1357abf79570..6810fc9c775d 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -25,8 +25,6 @@
>
>  int show_unhandled_signals = 1;
>
> -extern asmlinkage void handle_exception(void);
> -
>  static DEFINE_SPINLOCK(die_lock);
>
>  void die(struct pt_regs *regs, const char *str)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
