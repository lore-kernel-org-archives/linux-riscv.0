Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD61C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:30:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE23221ED
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3qtp87k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XijJsNpS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DE23221ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PnoIauWbBixHULmn+QXHFyBUQz3baisyhJXJBys7zxc=; b=a3qtp87kYaJn0OCw05QCisKRF
	a8ZhSaU3t1g9DWdd0Po3CwzkfjSuOKNZ8RTXj+Ihb0KWnmrLICf60zHAaJ88mLVZmYkNoD0VyINg0
	eJAXAZ/Q6KDwQflTYXMUGC10RE9oze8gESjDUH+TNjHKIh03MoOLYD+371PNmAunmNrnx+T+4UxGJ
	k710dOt/lijeSCT4jEWH2zRVvi1FFk8NcVHOdyeIZYBHLvS1ADVphzG1GufXduIvhuovlsnLWICaY
	8SADWyzrao24AbDGWrPcqoqOzL99/2GcVdEC5bzIvVtHI13eDmHsw3YsUVrPzTMA+g6ibKCn87PoY
	vUEbvxW4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvMsg-0002nO-6m; Tue, 14 Jul 2020 15:30:06 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvMsd-0002mR-FJ
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 15:30:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id q7so23342737ljm.1
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VvONWUUx+ge2aRqADFFqhcoKfa3RbBALz1DV1ooGJ/Y=;
 b=XijJsNpSPPnejytiYcdHjB1XQVu8uaH3j6/gEPYZl+pAI0TcIHWcBLqvOFrhR7jXBP
 9cveXgeLbceG8D7dAL+Zepto6GIlhPMkZ8CJdbQEnOtls2STHYWDEB8MFah9uo0hpegd
 YSVwiX5OVwFQLLXykgySPxhz+QTAG24MkW3WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VvONWUUx+ge2aRqADFFqhcoKfa3RbBALz1DV1ooGJ/Y=;
 b=li654SLznszZ9LvbfCiIhqQU7oMN+Hf2VZ5FZlERLvBNXtRIeX1T5JnoMm0ygJokyA
 NOe4+f+k+EVxDe4+Pf27tardCP3/Bxlo8vdwmq75SmsZI3vylGOjetZ1dX9wlptCzKnS
 OTTPJLkPrJJDh+6KjWR+6s3G/wDLdNtgIJIYlhp2yisWTz8TyaKbDcFBtZapWCfb1RjY
 U5NKmDlDk9sv+PxVhwpJEhEU/NcLCf/4fkLjHAd2uzFTucpz79DfVcYbnTYLdpFPHzJe
 9ByfJNuDOXNvMK0a2m2Oe3fHzPhGoXBVbEQtjQq7ZATjWyI/Do34uh8f9t+PPUjNFjU3
 0+BQ==
X-Gm-Message-State: AOAM53314F2jc2i7caDlWEiwE/7WFqx+gYtbKeFt8iEhEr6ID9KtSvo1
 7ImAMKRAgoY5EqodShg32nt7+ezW4hw=
X-Google-Smtp-Source: ABdhPJzuX/7LSjiEu6fWvztgBroQocFFqoZDZ109vMveAkcWnCdqWtx+eK4AJBfPMyls8/jfeip8jg==
X-Received: by 2002:a2e:99da:: with SMTP id l26mr2475841ljj.222.1594740601462; 
 Tue, 14 Jul 2020 08:30:01 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id r25sm6372389ljg.9.2020.07.14.08.29.59
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 08:30:00 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id q7so23342529ljm.1
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:29:59 -0700 (PDT)
X-Received: by 2002:a2e:760b:: with SMTP id r11mr2752959ljc.285.1594740599299; 
 Tue, 14 Jul 2020 08:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-6-hch@lst.de>
In-Reply-To: <20200714105505.935079-6-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jul 2020 08:29:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvwd9AWMCoUidO8pT3iw6e6NXCKThqbpDQOoz1=WTP7g@mail.gmail.com>
Message-ID: <CAHk-=whvwd9AWMCoUidO8pT3iw6e6NXCKThqbpDQOoz1=WTP7g@mail.gmail.com>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_113003_550531_1B37A72A 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Nick Hu <nickhu@andestech.com>,
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

On Tue, Jul 14, 2020 at 4:08 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add helpers to wrap the get_fs/set_fs magic for undoing any damange done
> by set_fs(KERNEL_DS).  There is no real functional benefit, but this
> documents the intent of these calls better, and will allow stubbing the
> functions out easily for kernels builds that do not allow address space
> overrides in the future.

It would perhaps have been nicer to rename the save variabel too
(neither "seg" nor "oldfs" make much sense once you get rid of the old
x86-inspired name).

But from a greppability standpoint and a doc standpoint, I guess just
renaming the function is sufficient (and certainly easier).

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
