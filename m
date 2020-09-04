Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D94FC43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 19:16:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DC02073B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 19:16:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3b3+p6sp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="pD8Jf4Cf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DC02073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jRQVl7cKdu6ss49W5E0mREXDVcI/E7KnieHlu2rprB4=; b=3b3+p6spKUZC7qlBJHcNFUfVv
	v40pgr3ARz5mXMfqz4U+fk4nkZitv9WNzZaPKuGt1LTEalSlHBDYNcKt+oMNE7aia2WXsCPNCvhNJ
	9e7xHqjalRdIAHeWl3q6+uMZ7ndwGOCEvk2PawXRIEN1ROL4jS3wsnH1gAHX0nl8e/7MgBSVwx51i
	SF1gMBxa+Yzxc3kIIfL43JfG8NUvtl5fnOO9NMSSOZQdVpjoLC7R+IwLcsXgOYnwIHrf81rTnElP5
	GtArfxf3KJeIuRAOa/jVd4JQ3WQkIIckVY9uadZMtpDS4ss7/xLT/BB+RGur7eAQgr8uLIWe16KfW
	YWDnS9lYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEFek-0007Ho-Pi; Fri, 04 Sep 2020 17:37:46 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEFeh-0007GY-Ga
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 17:37:45 +0000
Received: by mail-pl1-x644.google.com with SMTP id c15so1492846plq.4
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NsMzYAxoKemBi2bae5UCG27XBlrUsH2OSqvDrjAy5vA=;
 b=pD8Jf4CfSuR1/MfF/o0+DCTSGuParUYJWyd3jXvFRO8OqIHSGpPNScXhKygkdOaeZk
 FWNTZ1INzdMOHVkCWk3pzVFcH8Mucx8KoYwCfWT73v1YBI5ID9SsefbnMfo8XzHEaG9O
 eBgB3Cgrsbhi8mKsx0CoDFQhPAbp7EDZo6uifZ8UILW+NEe+Ir90bEGgFqgEcwSD5mvt
 +HbDS42D38BWAWVXjr6lu1+GLAgcB4K4errNKejuiDWEA18usc7pZe/VBj7P4IEuodYK
 +cJNq1waQrM04Ez8dKCph9Tcl3aiL1LZyAAVz/IqHBTP98o5XJ75ecXn4J2RHAmcFtB6
 p59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NsMzYAxoKemBi2bae5UCG27XBlrUsH2OSqvDrjAy5vA=;
 b=pO5b94oqwXUlNoVMHYtSJ8gUKsnK0PATZqMrkkifGGnXQxWgFUuyykJKidsaLoC8DC
 Vlcill+PWSxWRjrtggUaSqkrOnjdk/GWRx30thyMhxtAgEnTiHo6wHFHedzIhgkoZ84S
 tM9Z5ERGRzpeAoJ0O1ItqQjol4IwD877F6fuccbb+lO/e/Iv81CnU4BuQLq6aSqibG35
 HnOVS77vy+To0K3//PsiU91frcnLlJdP5QVL2Db6YHZeygJXtww4C2DQrKxOEPTdNLzw
 +0WIgaw9BZcPddq6b3QQps3nj2D+KX9LZ6WjyZ15mJ3FbBsViAl47DyoFDly7HObl45e
 Dx2A==
X-Gm-Message-State: AOAM533VBt8tjrUhQD0H3VPLK5jGS5X+dZ3e3LNI2uREA3WnWben5Sdi
 8kXjLor9G6WpPno0zGYXGkccxNos430ATQ==
X-Google-Smtp-Source: ABdhPJwirtTFjfmVzR0hAKwK5Pl+Tv/wmJwPfNNEUPLdr5vVMQybhQnhBVJcy0NsROQQY5CxPHfYzQ==
X-Received: by 2002:a17:902:be08:b029:d0:5c75:38da with SMTP id
 r8-20020a170902be08b02900d05c7538damr9564971pls.1.1599241059449; 
 Fri, 04 Sep 2020 10:37:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h14sm6824402pfe.67.2020.09.04.10.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:37:38 -0700 (PDT)
Date: Fri, 04 Sep 2020 10:37:38 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Sep 2020 10:37:16 PDT (-0700)
Subject: Re: [PATCH 0/8] riscv/mm/fault: Page fault handler cleanups
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@gmail.com
Message-ID: <mhng-d115e7f9-a776-42d8-a73a-b244edf5763c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_133743_663471_3867AC49 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: penberg@kernel.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 11:38:59 PDT (-0700), penberg@gmail.com wrote:
> From: Pekka Enberg <penberg@kernel.org>
>
> This patch series cleans up the do_page_fault() function by replacing
> gotos with function calls, similar to what the x86 architecture does.
> The motivation for this series is to make thepage fault handling code
> easier to read and reason about.
>
> The use of gotos has no advantage in kernel code size either. In fact,
> the bloatometer script shows a tiny decrease in kernel text size:
>
>   add/remove: 1/0 grow/shrink: 0/2 up/down: 96/-99 (-3)
>   Function                                     old     new   delta
>   no_context.part                                -      96     +96
>   __func__                                      14      13      -1
>   do_page_fault                                778     680     -98
>   Total: Before=792, After=789, chg -0.38%
>
> Please note tht x86 also moves these functions out-of-line with the
> "noinline" annotation, which supposedly decreases stack usage in
> do_page_fault() at the expense of slighly larger kernel code size.
>
> However, in my testing, I was able to reduce stack usage at maximum by
> 16 bytes, at the expense of much larger kernel code size, so I am
> keeping the functions inline, and letting the compiler do its job.

This all seems fine to me, they're on for-next.

> The patch series has been tested on QEMU.
>
> You can pull the series from:
>
>   git@github.com:penberg/linux.git penberg/riscv/mm-fault-cleanups
>
> Pekka Enberg (8):
>   riscv/mm/fault: Move no context handling to no_context()
>   riscv/mm/fault: Move bad area handling to bad_area()
>   riscv/mm/fault: Move vmalloc fault handling to vmalloc_fault()
>   riscv/mm/fault: Simplify fault error handling
>   riscv/mm/fault: Move fault error handling to mm_fault_error()
>   riscv/mm/fault: Simplify mm_fault_error()
>   riscv/mm/fault: Move FAULT_FLAG_WRITE handling in do_page_fault()
>   riscv/mm/fault: Move access error check to function
>
>  arch/riscv/mm/fault.c | 337 +++++++++++++++++++++++-------------------
>  1 file changed, 189 insertions(+), 148 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
