Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60ECC43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 03:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34DAE20897
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 03:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qknzDUo/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="L7yJuiC6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34DAE20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Oy/AtC2133NgRmLfZHF85G1kYyV+hfZw7QCQBzPF65Y=; b=qknzDUo/RVHpN4uw2xf342gn6
	CN/VcPzCaT3OOCgV0wd9/UYPxp4JTnt856vpQDyw0RlyI+2aAjTOCKJ1CI65WHGjEsXFwlz6A4MC+
	wW/auM6iZ8yREqBILDqx584vxS/BJ/i2Mee+60EluYjqEn6Nrt8e7Hm3MA+EBWiaNCFc6EX6SR5ay
	2JjvPvYS3Gu2clpaiTKtzKIbo1qDTrWTnf0Z6bpL7vmJgUetjWCcCkiJ3eVKXBM/74oECJm1h/gq9
	tJypHsJXAgPe3Ac/Gldl12+onWRhim8idGqI18/h+b7Ewv5sKWec7AOCceYvAJ/gnMxUzTro0fSde
	jns4GpEyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI1DA-0002uI-3V; Tue, 15 Sep 2020 03:00:52 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI1D7-0002td-Pq
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 03:00:50 +0000
Received: by mail-pl1-x642.google.com with SMTP id j7so581639plk.11
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 20:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SxUA5Xmd0MHgGeX/wFOs9rCwKgLIF4Zw1oIFAcS8Gb4=;
 b=L7yJuiC6WUHqefpiuzUou/yaS23sgaiFFYARAhMnH1KsL2HD6G9XcfygJlfX/8pe0M
 F0Pb3KuvhSduf1j99Km0o3imfN0IWnpLQ9Q4A7uBDBuX3X1oiCrXoYznKc23R7gqAQaI
 5ms4moktygJ0t3/CfUwXw0O93AEIl4mOsm6f6RKyd4GylidjqlqO34mJmYHz5sW6y8Mt
 sQWZ981Al+XNpFCi/VKcr1GiJFCx7XOEtPNPuBUnY6j1McVwHXuT/NJPydx7tvAmRSx8
 ynB+Yd/Iq1k5RG/K1TaShcnD50hJ6QC6fGhWomAsa0raw81DlqqK9/C7AcQS039SH81u
 Qdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SxUA5Xmd0MHgGeX/wFOs9rCwKgLIF4Zw1oIFAcS8Gb4=;
 b=LiVcF3fmW6kvGl7wBtevVbIIRMe33wJkFbOVRPSMesaW+IYhOqiIm3bGakYaR2RJKn
 M5tvzn9XWRcVLsVWohwViqqOfUO23Y7YR1y/i/uICvr2oQL7MJCIw/9SNr5DRGCghUN/
 eepJXWiKlxB+wMPmiRodmbZi3s9itDLmQsE4jqPzOH7m4z/V71wipvkc41qIt1v3Lv5l
 c5zK6/bdTP1xKZPVNN7aKttgCDb8T3No8gCrVAIWmEm3Usw2LGAOfVa1UfwBu6KXmVBl
 xrqLRAIVNsHtX5JWUTL7YpVUpAreEUt+c5YzQUUvjAQYGc0Tgx6G8yqL2Fa+uQdz23fa
 B1fA==
X-Gm-Message-State: AOAM532rgiv8C5SrnaDboOV+tr7z3Q5gO2SyiGKblin9ddk08FMinQ7o
 e1jw0jna2xb+Uz19/3ib9b0MPw==
X-Google-Smtp-Source: ABdhPJx/TZNjp99EU9yHxNPDvE1tgWHiSqFr1MoIKnm/vvgGcQlijD7L7OG233XWObpFUZirA/Yq+g==
X-Received: by 2002:a17:90a:d3cd:: with SMTP id
 d13mr2349641pjw.70.1600138847334; 
 Mon, 14 Sep 2020 20:00:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y29sm12542018pfq.207.2020.09.14.20.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:00:46 -0700 (PDT)
Date: Mon, 14 Sep 2020 20:00:46 -0700 (PDT)
X-Google-Original-Date: Mon, 14 Sep 2020 15:09:27 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix duplicate included thread_info.h
In-Reply-To: <1600044722-12642-1-git-send-email-tiantao6@hisilicon.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tiantao6@hisilicon.com
Message-ID: <mhng-18cbbb92-dd9a-43b0-8028-59a34f083905@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_230049_956184_F3C8C39C 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, aou@eecs.berkeley.edu,
 qiuwenbo@phytium.com.cn, Anup Patel <Anup.Patel@wdc.com>, linuxarm@huawei.com,
 Atish Patra <Atish.Patra@wdc.com>, ren_guo@c-sky.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 13 Sep 2020 17:52:02 PDT (-0700), tiantao6@hisilicon.com wrote:
> asm/thread_info.h is included more than once, Remove the one that isn't
> necessary.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  arch/riscv/kernel/head.S | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 3631147..11e2a4f 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -3,7 +3,6 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
>
> -#include <asm/thread_info.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/asm.h>
>  #include <linux/init.h>

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
