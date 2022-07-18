Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCCDC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5ualWMjxBtlueLa0Akzz+PptKyXcc13n1cj+I7YMRA=; b=ApxfDFcDbF5Beu
	ewZfaJBIzFGVSixb7fpg2CsUP/YApxnySAOIBx4aoOD5kdaFcEuzQKqjl7d8+1OKsaygwwllPOvhm
	kJQulKKfauJet6RRh/RMRvM4cccEmNeyJ5t9wbbiL9SOdOghXhxvOrmgs0AX29rez8FTE8I6EWDXa
	IiZRKLmBk9DcRuvAZgG+LrUc82oH9CfXKPN9x83gZxnLlG0mzxX+2hOl6TsAP1K3Wxx60sQAbxKdl
	rvfw74w1FSoo3Xr58d+rkzdqTzYBBHiatF3pTAyIXLjCvj+OEQEB0ButV6BCRx8jgj1vCEEwLiLGF
	+KxlwE9wx6Sd9ylZNW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUXF-00HAET-B9; Mon, 18 Jul 2022 17:27:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUXC-00HACO-5d
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:27:55 +0000
Received: by mail-ej1-x62b.google.com with SMTP id os14so22582302ejb.4
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kGv4Dzn3NGROuY+ZnagFOTMoVDNdaJpTmvteY9zyqDw=;
        b=k7OtEKw8ePt0J1gLOCtaDbhJFTnNEB9nIdz7gNXp+iOw2AbBV0Wss1w4VdVBKCfwaV
         sksMG9FHNQ8hNf8txKjO48pwrlEcbcGT1TQYDofR6d0i9AExPeHT6wROP3UiQnTjKaNr
         RRG9b7k+cRbjIH/kk4RzVRophBDuJiIBIAmYiHo+tVbqtn1yfapzRlKTTvL5La9+zKVK
         bVdbVZOgzSGligYwiFAgUtdcG/sy6R/jR8/qDcreQ90gvQkPkXDPMyAb7y6aj24OErz+
         yvvk3pWoEfO1cbAv4EuHrxFtXo7d3P/FubxWcez8WiA3ZvV5QBgnuBKq8phcEImce+IN
         SQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kGv4Dzn3NGROuY+ZnagFOTMoVDNdaJpTmvteY9zyqDw=;
        b=Ugdzg7OBRNgSY4J7T4kk2FS+YQZELBWUiURVCDoc7T2096ffO4yVeped7euuyscIQz
         W569AckumVWxt28TXq4xoiSacH1rj1w5oXKEU9H/0uvI2cv/bqf7tXBRPAe10GVH4TYL
         Qk3e+kN3w4i0EjryoXFGNQTBl2Wp7Yqe+kqY9PIennJRcn7Gt38YH9YPazABmLAUgmw6
         OaDERrgQt9QE4hbyJ4iz2+WzhnQ1Dpqdv+/p6H+9mJy12k9orvolV0JQhaGh88gwzPnO
         sZGql7CZEudXjfiUO2dz9hQfsrmygyzYW70rjQz8HHAlm41qq5ZQP4Jax9fz1z3msyzK
         d5UQ==
X-Gm-Message-State: AJIora9JMNPy7BbpihrXyX8qTUDxdbhi1s/YdAGk3D9+0GAaa8SLhpBw
	0IkTBr1r2giYduPInsw1eYQLiEudVtG8UQ==
X-Google-Smtp-Source: AGRyM1vp3STBBc6tMp8I3dy4hT2FX66C1r3IVgqXJ3Y6W67ZB1jyxwhCyt9fhwf+SetmiC6fhIAPUA==
X-Received: by 2002:a17:906:ef8c:b0:72e:dd32:4163 with SMTP id ze12-20020a170906ef8c00b0072edd324163mr21073322ejb.430.1658165271505;
        Mon, 18 Jul 2022 10:27:51 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b0072b592ee073sm5803535ejb.147.2022.07.18.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:27:51 -0700 (PDT)
Date: Mon, 18 Jul 2022 19:27:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz()
 macro usage
Message-ID: <20220718172750.fgncyl3egnrykt5a@kamzik>
References: <20220718084553.2056169-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718084553.2056169-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_102754_241962_063C7BF9 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Jul 18, 2022 at 02:15:53PM +0530, Anup Patel wrote:
> Currently, we are using CPU_PM_CPU_IDLE_ENTER_PARAM() for all SBI HSM
> suspend types so retentive suspend types are also treated non-retentive
> and kernel will do redundant additional work for these states.
> 
> The BIT[31] of SBI HSM suspend types allows us to differentiate between
> retentive and non-retentive suspend types so we should use this BIT
> to call appropriate CPU_PM_CPU_IDLE_ENTER_xyz() macro.
> 
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 1151e5e2ba82..33c92fec4365 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -97,8 +97,13 @@ static int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
>  				   struct cpuidle_driver *drv, int idx)
>  {
>  	u32 *states = __this_cpu_read(sbi_cpuidle_data.states);
> +	u32 state = states[idx];
>  
> -	return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, states[idx]);
> +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +		return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, state);
> +	else
> +		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
> +							     idx, state);
>  }
>  
>  static int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
