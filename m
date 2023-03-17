Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B17C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 17:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdVJqyRFxCTJ1nfuCR8rsDEV+qpIYMstNXzrPJE8ipI=; b=O9JaWYiYG82eav
	0rkKkHu5TWEKHmq0QnjEsZ6mmNUqtjHwhjnEnAx4DgHUKIGpUnSDh9KJFvAfUy0zCjcV+mmnYwTlf
	k12v5xKMy+OlQi1ACgoFGl1EIzIw6XcLHcsWwqQOkfLyPWSyCtWE0JMwx5S+eOaD27TQErh6iYP1U
	N0xLqWEI1tDmdbrIxRUlUk8KgTYRusIiqCPQ8o3O84QdF+o+kvJitZCADPAkoydSa9k0E5KQdtpXo
	cU6j+zhj7FIh/mq4hAGoisnEt5F4YE78KpNsiaPinWKBXk9OHBz/2KrBJRc1SfJQ9yZRFY5E33ivE
	kbvemq9JYC+z23xdSbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdDwk-002tfe-1T;
	Fri, 17 Mar 2023 17:32:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdDwh-002ter-1N
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 17:32:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso3854449wms.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679074367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3tLmVivm4ZX1LIiPKD0uKPzcTAw23ECMQvgHEddrLA=;
        b=HczjKSanvzSGEJsRiyfEAnLFOgGMlNyi6bxVhgaS91CcJoH+NecD/kq67N7XoQC3hH
         IG4aI8O7NNtcojKcl4nGE+S5MoM8DjfdT0GCPefqQMQlhdK+4dHblMTY7VFYLBYtPAif
         STeYsgv3zqFve1VlwOpNvcTEh+JBLuBhUVqUhtRfCFdvQ+n/uF46C0FmItpYn85g6MXR
         qvEuYryLSaYKoVBRC6TrvPVBn+LiEpaOcaMD5F/DnLZ4setI/sDWsm12FRiDrmAhbWdx
         ELkx4gGStmhP+JZv6lpYSLyABatAd79QvTUUnn07x2+n+w4zXKvHold9zIJhQ145aO4O
         jukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679074367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3tLmVivm4ZX1LIiPKD0uKPzcTAw23ECMQvgHEddrLA=;
        b=SjgWzfFsS0WKP3RSj2YBVLkoao3IFEzIagCPrNz1A6B/4OwXIBmXxocpwXWJ8lstxC
         USY+VUSCe6Rbn6MdmiVn2dKPVRlZJ7QT5o5dygcs7Cd5WMbYCeF8VdispNNetbfh7pCZ
         P3NTwveNxI2KyhJovEYOCRdLGfAJePt8/5R55htq79hgZ3j/5WP0mXr8F/CTOPN+VhbN
         4ilghWYURAKbYUBgK/tlYW51AhHAwwCHpqy8JOwG5kG3hh5es4qTSd0V+uil2FviYVaS
         dPTSooA4RcqlJNPyMNzKunYhUGZArODkGOy6N6G5NB3vayRw/OjLWZZRaxW91JYVMKQB
         2Ysg==
X-Gm-Message-State: AO0yUKXyBAa49qCrZ7fFBDDy23uLSwSO5SWm6NvsLrfMB+R+Wm0oxlzo
	OAXTlpIUWzxystaHDebpkR+gKg==
X-Google-Smtp-Source: AK7set+K8xWqbk1qLdXbeOwQtqqQQNjeP0qMGSLHykL5j6xdESb6W3h799Xh7f8uXN9l8YXz85doDw==
X-Received: by 2002:a05:600c:1546:b0:3ed:22f2:554c with SMTP id f6-20020a05600c154600b003ed22f2554cmr18644512wmg.29.1679074367159;
        Fri, 17 Mar 2023 10:32:47 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f12-20020a1cc90c000000b003e20cf0408esm2535298wmb.40.2023.03.17.10.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 10:32:46 -0700 (PDT)
Date: Fri, 17 Mar 2023 18:32:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	conor.dooley@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH] riscv: say disabling zicbom if no or bad
 riscv,cbom-block-size found
Message-ID: <20230317173245.27rhtnxlev4iaj2u@orel>
References: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_103251_469910_06162B4D 
X-CRM114-Status: GOOD (  17.27  )
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

On Fri, Mar 17, 2023 at 01:45:12PM +0000, Ben Dooks wrote:
> If Zicbom is present but there was no riscv,cbom-blocks-size property found
> during the cpu feeatures probe, or the cbom-block-size is not valid, then
> the extension will be disabled. Make the print explicitly say this is
> disabled to ensure that there is no confusion about what is being done.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59d58ee0f68d..c8b883827840 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -72,10 +72,10 @@ static bool riscv_isa_extension_check(int id)
>  	switch (id) {
>  	case RISCV_ISA_EXT_ZICBOM:
>  		if (!riscv_cbom_block_size) {
> -			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> +			pr_err("Zicbom detected in ISA string, disabling as no cbom-block-size found\n");
>  			return false;
>  		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> -			pr_err("cbom-block-size present, but is not a power-of-2\n");
> +			pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
>  			return false;
>  		}
>  		return true;
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
