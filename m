Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F104C4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E336610FA
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E336610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/5Mq/arM/gQ4j3e1imunXIF+D9x6GR5ufP6PjJGdtc8=; b=ZB+HSR6oLXUCpS5FIFCIjfdC0R
	G6yhfGLLcX3b4L29z9TlStsSTPOsW9bowtwYO5xUbwXBFdVzUTU8k0SsfUxFTI8DpKmyFTHiu3ey8
	OZtNzgb7cM6wQOmRvEETRN+NaWPslqNnhlcj/6kI2amTozMLP/tdRR0ScmsBoLvrr8iHZ6APLh+4B
	QnvOSZBuq4jtF5N1fiHwv34cSAP/xHVT0lb8bnQ0LC8vFidhjgoWuMfToOrAotNGTHLCZk6t8E994
	EdYpJFV4i9zXw5MxFNfuwKv8HL2+nmGY9snwJCVsGwrjKLDpwO3ucfH9GtQZN1rKeRPOBal8y6yac
	p7LHWJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln7hc-008W87-0G; Sat, 29 May 2021 22:45:08 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln7hX-008W6r-Fa
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 22:45:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id t21so3353735plo.2
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fi0vV/kF+CsBKSccmeD5rhECNTR0UPRdkNUxlQCOu6o=;
 b=i6A/A7Wom+6pM1tUHC83JTgbW35vAvfXx8K69AJbPi1Hu/Vb0nH15InB2zoG8ZDzdQ
 wyTBY3U0HJRoTiWmeiELkZo8IlIEQpbtxhPLlDwbwTu5KrE2OZK6I9i4TquPmiDzLKaZ
 lWaUa6IiJZ4IdVi4mMrObXbQxU+uFt/0xoo6VREZafKrAi8RhlSA2l/0g0f1E7BQprVc
 LUBKUKXZVmPO42ZwXG36UdQdpYQDxr//afSU5dtEAOqeLHHGSGBSksTq3rke61+tSSdV
 TJUFnuj/q+8xLHDGp7pIK7VmhyuBz6JN3dgmiB2eMZZ8ib50W6AoMcDGRzX/zruYiNmO
 qKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fi0vV/kF+CsBKSccmeD5rhECNTR0UPRdkNUxlQCOu6o=;
 b=RpqljIj78UUOxeqS8nyu7NOajfzjKTUM/74QsicRjzJtdb8V6Q0jVQBS0ZgplPtn1F
 eOlTyP5x4RTQo8n2IdnOWpm3nRtuYhch++wZNGBKtSf+x+qoprG83Fav36zT9Uqd+KqV
 Ls4a9hmLl2/VgY7DrEfCuT7Im4Ntvt/EmyMb0ASQBpLr082D1EFxP0DwUnPg9xVYts7v
 kLxaorQn/GePxPHILW2Ybzq2xpbV8xxHChWw4T8mdQkFrzVj9xzuOF5pMEX2yY6voch+
 vXpz9E1SvMOKzk+LgaVgt5Rfxle/Rz67N/Vf4XFRdEJwETuUFhJUTqHgJ0jAmaKPSErg
 kIpQ==
X-Gm-Message-State: AOAM530MeOZVn0O+9gVH7BlFc8ugttmCsa2WKvnNquEeqWoDLx8/4s2g
 UBcFf/me56Tgb0v8BFCHtSKU19Kh9glnkA==
X-Google-Smtp-Source: ABdhPJxEkcHSt/r0RUtDB7tfrUNpUFiVQ7CCqmPtNOJYrpOwquBntTt3/OkdihRXgW+frUet54s5gQ==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr11310055pjo.49.1622328303013; 
 Sat, 29 May 2021 15:45:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m24sm7313476pfa.125.2021.05.29.15.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 15:45:02 -0700 (PDT)
Date: Sat, 29 May 2021 15:45:02 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:37:56 PDT (-0700)
Subject: Re: [PATCH] docs: kernel-parameters: mark numa=off is supported by a
 bundle of architectures
In-Reply-To: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
CC: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 will@kernel.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, song.bao.hua@hisilicon.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: song.bao.hua@hisilicon.com
Message-ID: <mhng-145d2f8a-0697-4fff-a579-bce952033f25@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_154503_542839_00D4A8EE 
X-CRM114-Status: GOOD (  17.35  )
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

On Sun, 23 May 2021 22:17:15 PDT (-0700), song.bao.hua@hisilicon.com wrote:
> risc-v and arm64 support numa=off by common arch_numa_init()
> in drivers/base/arch_numa.c. x86, ppc, mips, sparc support it
> by arch-level early_param.
> numa=off is widely used in linux distributions. it is better
> to document it.
>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb89dbdedc46..a388fbdaa2ec 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3513,6 +3513,9 @@
>
>  	nr_uarts=	[SERIAL] maximum number of UARTs to be registered.
>
> +	numa=off 	[KNL, ARM64, PPC, RISCV, SPARC, X86] Disable NUMA, Only
> +			set up a single NUMA node spanning all memory.
> +
>  	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
>  			NUMA balancing.
>  			Allowed values are enable and disable

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
