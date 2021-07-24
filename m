Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15142C432BE
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAB7C60ED7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAB7C60ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=u/HQR/t0AoQGi19yQZ9APeV6rO3F8CIDuPGOgnNFMRc=; b=W2epAPWPgUt2xRGzUurX31vF03
	wGrlBQJG4WlN7QIrU8ug2V2XY3mp7tS2CL0vWJn6KzX8jObrTxjZIbvz+XxXxx5fiCJh8kxDwQPJT
	5NtykWEGpoulN8AexSU1dRPvsLX/1UmFKnIYMv1/j8dCWkeiKPM3XFTvBBESdR9ySErIhEEPwzOcI
	gB8SZxla368GCwzrNjFtUIb4nXnkcjNYOx6bV6oqidCMpa4hFny7O6KINB6yH+XByEfmI/0K/Uqhm
	yuB0DHrs742gILBUdWKbFKx3XuVuw1iSNBD8WY/5N9cryIQTpY3+rCQn1dehnfQDbFUsFIIcYhQIO
	kgjruaDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m75zf-006UVm-SZ; Sat, 24 Jul 2021 00:58:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m75za-006UUB-QS
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 00:58:16 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 j17-20020a17090aeb11b029017613554465so5954393pjz.4
 for <linux-riscv@lists.infradead.org>; Fri, 23 Jul 2021 17:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OlwUZcWU+zFAtM9hiJyMkmJtbQEHkL3Q1I7IsXb7FPU=;
 b=zk/id2ENEx5PqxL1+6dzRIQTqgm2OzCjl3e1YqmEJmSkUNm7ef5pbGC5CdB5WRfLXZ
 g2z7NXgg7LiMMHyc2IburHwZAWvOYdrfdhRS2IbDkkV+Jif1i0e7avh717Zfe5rmiXYH
 Gr0fL2dOCvNri4/oM0pZ5R3wDdfcohsT01xPjVURvHGAm/P6uOkKitsIrqv2DKineAlk
 WRuIStOxDSwd0pRBgHCYgie8I6y9I5mRHbNNDAJE5W5ZycILrtDuZ0fox6G0izjoy+nQ
 gGvoOR5gDDfDWXEUYh/q0EPIYS8G7XQwtzIZX+6kP2U+4kQB6yi1eggJ0FVnLaDCBX3p
 PBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OlwUZcWU+zFAtM9hiJyMkmJtbQEHkL3Q1I7IsXb7FPU=;
 b=GL0waAs7t8Ds2l7PWhec23w+xP/w7MPIjiAVDGMTqiPkmF5o67BFUn12oBLnnBrBfA
 lSR22aLn2Y9D/zDYWnF0LgvvKdoFjFS72KrwMZ9IMOWEWDZfPvZSSpWchILd+C7Nx0sA
 xrPR9NAm2HIupXyTAk25oMrZllAph6Rdcr9Uxq19jyk/Vh1sA2JURs0IuFG4FEEnpkTc
 Y0ai/odsOBiEd1KhgB6yiTAonGnC8iHur0ndME2HL6TYQ5xPQ5FCIR/hSX9mlaM42fpK
 IHGAAQzAKRRYWPH6PgCpx1dozJvh8X6+poSoWsCtXHmGJQJuep4QEMjzFChL9M3iVEVL
 oe6w==
X-Gm-Message-State: AOAM532K0516+QYlciQnGucCKvGtBJLr/pwa5zkTmkfs9LmqcW70vcsc
 VdJZRvjVV9VYfrrJiOP128swKA==
X-Google-Smtp-Source: ABdhPJwwuS8XMIz5osqmii+ofeK+AxcFj6tz3jfzu4bBDrPYA1HFkK5Ffq2k+YOf3WwJ52D6argBYg==
X-Received: by 2002:a17:90b:2246:: with SMTP id
 hk6mr3739863pjb.112.1627088294369; 
 Fri, 23 Jul 2021 17:58:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 201sm14427514pgd.37.2021.07.23.17.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 17:58:13 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:58:13 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Jul 2021 17:52:41 PDT (-0700)
Subject: Re: [PATCH] riscv: Disable STACKPROTECTOR_PER_TASK if
 GCC_PLUGIN_RANDSTRUCT is enabled
In-Reply-To: <20210706162621.940924-1-linux@roeck-us.net>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-1b892781-2ee8-476b-90b8-44b5cca45cf9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_175814_900489_48B7F6B3 
X-CRM114-Status: GOOD (  18.66  )
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

On Tue, 06 Jul 2021 09:26:21 PDT (-0700), linux@roeck-us.net wrote:
> riscv uses the value of TSK_STACK_CANARY to set
> stack-protector-guard-offset. With GCC_PLUGIN_RANDSTRUCT enabled, that
> value is non-deterministic, and with riscv:allmodconfig often results
> in build errors such as
>
> cc1: error: '8120' is not a valid offset in '-mstack-protector-guard-offset='
>
> Enable STACKPROTECTOR_PER_TASK only if GCC_PLUGIN_RANDSTRUCT is disabled
> to fix the problem.
>
> Fixes: fea2fed201ee5 ("riscv: Enable per-task stack canaries")
> Cc: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 469a70bd8da6..3afb84fa2190 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -486,6 +486,7 @@ config CC_HAVE_STACKPROTECTOR_TLS
>
>  config STACKPROTECTOR_PER_TASK
>  	def_bool y
> +	depends on !GCC_PLUGIN_RANDSTRUCT
>  	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
>
>  config PHYS_RAM_BASE_FIXED

Thanks, this is on fixes.  I do an allmodconfig build and haven't seen 
these failures, is there something special I need to do to get this 
working?  I know nothing about GCC plugins...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
