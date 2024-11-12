Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABCCD42BAB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5535J+mpWCwf8p5lEXr4aOb7HQ5Vev9Y5oSFd8vVBJA=; b=NOEuZKVJumNimJ
	rVG69zsCrjMAVt9txSa5EpGA7L6plV6NNZ+ml5G4NAy2BkEZJ1uDUt6W1HyNln14+8DOiESXGULBu
	zwZgQyrMOFS1iKc3VjZEFBwr9LYjhuUSAyx1+wQCU3fUVE1ELZVjwI6wKC/hikCHOklDAeS1Eteh3
	1/GmJci7XXrZSIMvHH0neyjWcKEhH84Od1nFlHRS6Ks91h1qEdhQy3MyZ9FaSjk47TmufCDxSsKkI
	3e3GHjr9LFzpFW9ZzxEOAVKLrc/OjPqVuh3wMAXWX5ugeaVeXY98K7wcH6HbXeHSeAsjPkM+1Ec0L
	HQzvYFF/PUhS2455V9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu2i-00000004CfS-0BCj;
	Tue, 12 Nov 2024 16:47:04 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtuA-00000004AxA-1xoM
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 16:38:15 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-83ac05206c9so217701839f.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731429493; x=1732034293; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QahbWCS8hTGwqMrLrcuosaa/aqoxJrXN4Zy2WrZ7yI=;
        b=g2zaTlUWg1j3xv8ocUoV95fRISM2Uwqz/FwWyOOVlyEi+Y1ewYmO8YEwhtUzszuqow
         NCoohLDKksstnaLX/LY53LG8iQOgFK1+bsPFUPhX094VfoiH5MDKTTnacNoSc7p5/2jL
         nyZfMcnxyFOSyInvxUDYk6pgbrXjOtTBML1odzmRZ0EG3JhR5o86Xwcnlv1p8nKssSw/
         PiQ8FrxcOgVVgj52uQxnsOvQM7hnLp7ZSM6aCZfJiJ03hx95G1yqMaDVgfei8f5e111U
         QVZKBtBLGR60v2cUyhKTOszS4iF4b4KsG8sL1El/zDBr1fSDVmVYoCMBl2XtWvQyqg6m
         xCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731429493; x=1732034293;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QahbWCS8hTGwqMrLrcuosaa/aqoxJrXN4Zy2WrZ7yI=;
        b=kiOw+qNlyLmQHHrggNJJ2sgne/qf+NaoZVo/Emu9pTckTGg9lnJx5fGb2DBTN/oaJd
         7a5y7snsgPV2gI91uoX/MY+QwRhPNd42y0oAOJWkc0ZTun+fZTvvif9LUiBdt8Uw7rgW
         c+PbIvI6hrYzQvv1WzuBK26VmwRxLqF1lKrsuvm81W+gZELLk3WlRi+/r0ox76I5oQ3L
         j80+5qO1pMebqz3wOvchSdE/ugnOLsUEOOEjkMBu+Er00oo36HCqPpgOpTfFqPdp7bTr
         Ka46P05VAFqxC3t7f6mUIVjHGylvpf+QjA1R5QBgZM1ZtKWBBAlhGDC68QpAaEWUbt0z
         W+/w==
X-Gm-Message-State: AOJu0YzFgQFJN/rX87LiCWIjOeiYiu2AQvKXMBcqX3CkPIZti3NBvGKT
	46ik3QowT2YDuTuLF5jJddHuStaNcJ0ZwfnQzD9EV2gjBN0IaN5acI4q3gRosuw=
X-Google-Smtp-Source: AGHT+IEPZhlfK7Hi/4/C4KwHmgKsIykg4Irr6nbun1DGbSR/22naNCY+Y0aibSThLAOZQc43u005DQ==
X-Received: by 2002:a05:6e02:1f03:b0:3a5:e532:799d with SMTP id e9e14a558f8ab-3a6f19e86dcmr169417395ab.3.1731429493390;
        Tue, 12 Nov 2024 08:38:13 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de787414a1sm2152236173.45.2024.11.12.08.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 08:38:13 -0800 (PST)
Message-ID: <338c06d8-627e-4ca9-b5d0-6ce87b5cc83c@sifive.com>
Date: Tue, 12 Nov 2024 10:38:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip: THEAD_C901_ACLINT_SSWI should depend on
 ARCH_THEAD
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1097d054ed4c67f714679de1253e45a034e647a0.1731425416.git.geert+renesas@glider.be>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <1097d054ed4c67f714679de1253e45a034e647a0.1731425416.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_083814_574551_27354A9D 
X-CRM114-Status: GOOD (  14.79  )
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

Hi Geert,

On 2024-11-12 9:31 AM, Geert Uytterhoeven wrote:
> The T-HEAD ACLINT S-mode IPI Interrupt Controller is only present on
> T-HEAD SoCs.  Hence add a dependency on ARCH_THEAD, to prevent asking

This is not correct. This interrupt controller is part of the T-HEAD CPU IP, so
it is included in SoCs from other vendors (Allwinner, Sophgo, etc.) that use
T-HEAD CPUs as well.

Regards,
Samuel

> the user about this driver when configuring a kernel without T-HEAD SoC
> support.
> 
> Fixes: 25caea955cc95050 ("irqchip: Add T-HEAD C900 ACLINT SSWI driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/irqchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 28c19bde55206847..3f4cfcbecc5a4041 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -617,6 +617,7 @@ config THEAD_C900_ACLINT_SSWI
>  	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
>  	depends on RISCV
>  	depends on SMP
> +	depends on ARCH_THEAD || COMPILE_TEST
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_IPI_MUX
>  	help


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
