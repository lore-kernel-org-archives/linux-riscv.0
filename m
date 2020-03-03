Return-Path: <SRS0=DZC9=4U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D060C3F2D1
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2020 21:13:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7B120848
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2020 21:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6ozQFx3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jOAECUUu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7B120848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5FXbiSS6phrCyBSlDdRJ6x/G1vIq9Bm0/o5FHfb1vIw=; b=t6ozQFx3fjqI1tqqe1UjLGXpT
	0g4NNMIWqPv9qZgyL49RKIL9pxKQRtwhaWzpYSAS5OkGFxhddMhXE5k+8s5Lc/852xBGry8/QcQfB
	xTThB+FRX0RW/RkW/RYZOwIl+WweS2Qly2AwShg80fQSx/fSERGRND796xPvyh1Yv+Qx8Fz6s5PEy
	MDJ+1z6QvbcAhUWbF9mngAePHW0zW7KAYnKULWUMILSAOec1nH0KK6dvLV3/yHrZ2tTVJlI6450kq
	saOTLYsrNQpIP1siaBbTiuNGEo8MaDto1oUCAjuWUwzRgKfvHSGQP68zuOPI//3FchND9Af4jzEfy
	RyfalrU+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Eqa-0000S4-Dy; Tue, 03 Mar 2020 21:13:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9EqX-0000Rk-Ps
 for linux-riscv@lists.infradead.org; Tue, 03 Mar 2020 21:12:59 +0000
Received: by mail-pf1-x444.google.com with SMTP id f5so2107743pfk.9
 for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2020 13:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5FXbiSS6phrCyBSlDdRJ6x/G1vIq9Bm0/o5FHfb1vIw=;
 b=jOAECUUuemFMG+jcbroZneMtc7qWtKzzWb6YZ9KudcoaFS9YHVa2rAlh8vcMqr9TJF
 /CXBV46A2COS8wJsUSXE7j8rLvZ5nCTjMeQVm9aZQAI51KRHRN/I6OyveCMeqjE6dvX/
 ER6p7yw2ITr+oI7Kmz3rEm8pIGLlYzTHjEVaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5FXbiSS6phrCyBSlDdRJ6x/G1vIq9Bm0/o5FHfb1vIw=;
 b=Zl5JXv+XsO9t98igbkW8GwN+LAoUEvAxvxYvIOjgNCqug82mQuAX/XXVK6z3GFMUND
 guorkOXPa8iy6/RHuAJECUgGoy8F8w4Sw4V6ERHFKqGPloVE7W6czk0AQeYXFQSewegA
 TFyG0Bh2NF1rSAuTiJInl8rZgDbHA5bnkMqt9/C4UZamN9tiZxUj0TWlBdSsKXytCkzI
 hzF9ydscdhZCM7Ux05wmxOTYy83hw4saLNC+jGL77+kcohYHTTYyAbrFgcROyuUxTrh6
 0gJrfEYxEl1w+QTyfSt1TmHb5wdq/o/QF6RbxItXSrUDTVXoa0Nesl418crQHOC8frkv
 dzkA==
X-Gm-Message-State: ANhLgQ323iG7X+IbvvtuPC0zT5NA1Egv039MHx+fKEKzOpMap+bJ5nAI
 /tFhx35j9Pi4/00QNgpJbLVyiQ==
X-Google-Smtp-Source: ADFU+vucXyIb8FnssOZOLkbGPk1bO96Ow3P+bV2pc/F3360lz3zUkWYHVF36hCwUG1VnUGGhwoTMmg==
X-Received: by 2002:a63:ab04:: with SMTP id p4mr5861705pgf.37.1583269976999;
 Tue, 03 Mar 2020 13:12:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i5sm123701pju.42.2020.03.03.13.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 13:12:55 -0800 (PST)
Date: Tue, 3 Mar 2020 13:12:54 -0800
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: fix seccomp reject syscall code path
Message-ID: <202003031312.3EB46603@keescook>
References: <202003022042.2A99B9B0@keescook>
 <mhng-f926452f-8491-4deb-9721-a52487de676d@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-f926452f-8491-4deb-9721-a52487de676d@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_131257_864202_3F4FB1E4 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: tycho@tycho.ws, aou@eecs.berkeley.edu, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, oleg@redhat.com, luto@amacapital.net,
 keith.packard@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 03, 2020 at 09:55:10AM -0800, Palmer Dabbelt wrote:
> On Mon, 02 Mar 2020 20:46:46 PST (-0800), keescook@chromium.org wrote:
> > On Sun, Feb 23, 2020 at 10:17:57AM -0700, Tycho Andersen wrote:
> > > On Sat, Feb 08, 2020 at 08:18:17AM -0700, Tycho Andersen wrote:
> > > > ...
> > > 
> > > Ping, any risc-v people have thoughts on this?
> > > 
> > > Tycho
> > 
> > Re-ping. :) Can someone please pick this up? Original patch here:
> > https://lore.kernel.org/lkml/20200208151817.12383-1-tycho@tycho.ws/
> 
> Sorry, the other messages didn't end up in my inbox.  I'll take a look, as this
> seems like a good candidate for rc5.

Awesome; thanks!

-Kees

-- 
Kees Cook

