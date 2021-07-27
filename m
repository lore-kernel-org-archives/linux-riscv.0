Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7BEC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 22:17:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D11860F9B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 22:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D11860F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3pgRbpDAc8qWiB8SSELWl1vYyr2GgNqtd6GiXOXtM4=; b=Z9NspcM7VCpGSu
	Nd4ELCmSqfcTcSSk90D8evclQ6ZJCp7UJtPMUU0KJfYqTnco8hrJWcC3pidv9TAjQTqZoaK+9DSG7
	wTghAL7p+iUMJoERaNUHaS3RYreD20bYbV14mGx+NJwSQCkthwuioRBmgxu5EmcD2MBRO8SzV6ezu
	DOo5FNLbLw5G9YGBYsax0jjT/2Kxkfx1VeCFvAsD04VctDhlLzVlzNK5p/JvohbEtA/HjTl5j5LH5
	AXdDXz1NsYnk7CntDSTpSbJG+4XvloP1LpqRxhdlCAl8CDm8eVsEUHSzW1xbFJvGeJn1ofm+xZ0gJ
	kaEtHFaaKnApbJrsCphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8VNo-00GVcH-OO; Tue, 27 Jul 2021 22:17:04 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8VNm-00GVbN-DB
 for linux-riscv@lists.infradead.org; Tue, 27 Jul 2021 22:17:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id b6so2077772pji.4
 for <linux-riscv@lists.infradead.org>; Tue, 27 Jul 2021 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P1d9rZ1oYibIdHcSFP8OH769BC+V4C1W5//f6yOaEyc=;
 b=LS83kkwUb+IGU887vVihaCeocobOMswJ2zbDSo6QbCumBxka3rMnfNk+UDoOV8j0Fz
 rDizPV7rSAr8ulto+OqWlJAfPYqDS9RojyXNAl+SLClg1PnZPRf4naI7UTLphMmoH8XL
 0hNNzCgG8/144+auWDESC0+3ZidmvcWYpVIRnOUa8uw9lsZ4U1VFY8zWURolgT7gLQfG
 Dfby7F6+/rtTQxjFn6LsqsX7pohOvUEmLY6R5snTwFdZsrVCTiPoN6GL0v1G0E2KVw+s
 zbFZZmo8CQwCKf0eIQgmmpV58+A+TIKMUlLJb7BiqjY8WGJypNUfgG4TK3H3lmTEaU6p
 Q/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P1d9rZ1oYibIdHcSFP8OH769BC+V4C1W5//f6yOaEyc=;
 b=uUq0aFoRLUe6UFiCj4B+BAyLZlnrIbmsgD9BM/KnVnq2EKOFHdj92Yek6TrNSNMYzy
 shGFj08eNo8FxmDdv2PQtR3MIdH04ixrj5MaIWgIbgIh/CVP9u7KfgA/xJCqN0atK9Lz
 A5q0ijsK2YtAXrkya8t3ahvHTRAeCaSFn1mV0bmryB14FCbezK8UqQuIwjQQnK5MF1n/
 8HjPkN5cOVfBc8QzNkmo+G5BYZodO4tQO0UK2Z5BZGZXZDjbf5NSq9sNAxrIuDLZ+xE4
 oudNq7ppTV7cRmhKe6h+JLVq1g4GtF0EoSzS0xR4gaEcIAU2Pjqp1yxOaVwmq7PbAgxZ
 XjOQ==
X-Gm-Message-State: AOAM530veirTLWVxN5KiGqNNLd8Q+heWkFVeCJwseU59eBsezuWifVA/
 ehimtZgukmrCcD8xJ8mGTzs=
X-Google-Smtp-Source: ABdhPJxWFhl0R6uivd9of6xzOQF30aYFleE1PTX+ZKeuyZQxGt0wy/4WWKx3OrVQGfKlyRcpzUwOJw==
X-Received: by 2002:a65:4286:: with SMTP id j6mr26146974pgp.10.1627424220879; 
 Tue, 27 Jul 2021 15:17:00 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id y139sm4752532pfb.107.2021.07.27.15.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 15:17:00 -0700 (PDT)
Date: Wed, 28 Jul 2021 06:16:56 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: stacktrace: fix dump_backtrace/walk_stackframe
 with NULL task
Message-ID: <20210727221656.wq3ponbzhvftfxc5@mail.google.com>
References: <20210627092659.46193-1-changbin.du@gmail.com>
 <20210628134404.4c470112@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628134404.4c470112@xhacker.debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_151702_514320_66412A6F 
X-CRM114-Status: GOOD (  12.87  )
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

On Mon, Jun 28, 2021 at 01:44:04PM +0800, Jisheng Zhang wrote:
> On Sun, 27 Jun 2021 17:26:59 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> 
> > 
> > 
> > Some places try to show backtrace with NULL task, and expect the task is
> > 'current'. For example, dump_stack()->show_stack(NULL,...). So the
> > stacktrace code should take care of this case.
> 
> I fixed this issue one week ago:
> 
> http://lists.infradead.org/pipermail/linux-riscv/2021-June/007258.html

I still see this issue on mainline. Is your fix merged? Thanks!


-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
