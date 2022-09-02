Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF42C6FA83
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSonWp4miXcqn28UYaXJREKhKYe50VuyWBPM4Q02z5Q=; b=kY9ZGCH+uKUZIo
	KG3sFSzDg8/5peE+IYioH3C45cACO0y643bp4K3IreNShjzR6CpEqCDDH1dsr47aqdBlEajWFhASu
	9i9LsDMd0ebD7AWRKYXFj5B2rgxuJX/ZgF10jaPmVoAVBiaSqKRSj9b8nxmDGdcC/Q2kW/+fzdcZP
	mAQ3IOqttDKDoNhsoZhNgWLpla32GnMFAcvf3rk8nCRp72rc1KqpWjnfssdHq550Ji89HClDVpzq5
	UDnuv0IpEgl+RLFgbgWTjZd5ujagjZyzbvvGIdTiMUQPVYUT+PPM4rlGqEkh5gL1Vf1uRscvSstS2
	znM2f/pDVxd3n83Wf95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3Jw-002xtB-E6; Fri, 02 Sep 2022 09:50:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3Jt-002xmS-Hq
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:50:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u17so1609683wrp.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=6m9i/YdC17oU5bWU5Nzi6bcvOSQonOoItkoL6SM80y0=;
        b=I60SNYse1k+1KUciSMADRTx4OhCmqmIaHVnumZp4iIatz/OM7uw/eExyQSE0QB0QSf
         Triqqa28BSdrnFA4nMxHRssXWwQDyJIhQLDlfM+fmMvN6YrmQp/tPG32JLsThN4vCz7N
         /mhjez1zuBOXht8GazgaPHwAoTkB1qGaJ4MD1hRf81DDHb/MjMwG6ze9NGc/B7FthDiN
         SKISFIeYjVjlZXrw43I9e099GWWryvR3HIndYVWFXy8HJ+AvNwG4RAXwxExNRVjyAMdB
         Nm4QL3dQmajabtO1Q9bky2yihw2pdGYY/DWbdALBupezlgRHPyIagAw8VFHFjKPck702
         0T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6m9i/YdC17oU5bWU5Nzi6bcvOSQonOoItkoL6SM80y0=;
        b=rpRxD1cUg/DFgNpdru8YQCVvtomBHV3oCYWbhsas0FB8kiHbcTlu2KkItxOIAwSqGo
         U4bj1CVdf0iruVh49YLTLNeFHIy3R3fGovSLkg8+KFiNFm7CHj+MgCnHd3mGGSsrWgds
         BMUxMU9VKjC26hdx5R4sQsxI5JGa6ardqyWfOEE0/LlH3M/T//KufDuCJADRLzkrkkQK
         LZckgx09XxS8wl3X4LPnUHEuWIcwLgOBkWxZr6hZJoeRbqw/LFU7+m+D3C/j7FwKVih2
         cB3my1diXUQEYO6X8997/tx2zJgUTbp4ij4fqaDeax0TB3A3N2h3aWnHLRcqTJjXwpPz
         4lLg==
X-Gm-Message-State: ACgBeo1YASHI2R2mt/ldDtEpOOoZHfczMHbK2LqLq6GIcPvd8RUWfjLj
	jxrHXEGB4+5DElCWAGyBPP+Cvw==
X-Google-Smtp-Source: AA6agR4rmLi+seS1O0PEpKug73BsNm2A2qb7kETj9vlCiD5QnmtKOSPBQ2qyNhnBjen3DR7zu0b5iA==
X-Received: by 2002:adf:eb4c:0:b0:220:6aaf:ef5e with SMTP id u12-20020adfeb4c000000b002206aafef5emr16244619wrn.488.1662112234024;
        Fri, 02 Sep 2022 02:50:34 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003a31fd05e0fsm17483957wms.2.2022.09.02.02.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:50:33 -0700 (PDT)
Date: Fri, 2 Sep 2022 11:50:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, guoren@kernel.org,
	apatel@ventanamicro.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Message-ID: <20220902095032.h3yrady6lxmqqwvy@kamzik>
References: <20220901222744.2210215-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901222744.2210215-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_025037_617866_91898624 
X-CRM114-Status: GOOD (  17.23  )
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

On Fri, Sep 02, 2022 at 12:27:41AM +0200, Heiko Stuebner wrote:
> This can also do without the ifdef and use IS_ENABLED instead and
> for better readability, getting rid of that switch also seems
> waranted.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..764ea220161f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -253,16 +253,13 @@ void __init riscv_fill_hwcap(void)
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>  {
> -#ifdef CONFIG_RISCV_ISA_SVPBMT
> -	switch (stage) {
> -	case RISCV_ALTERNATIVES_EARLY_BOOT:
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
>  		return false;
> -	default:
> -		return riscv_isa_extension_available(NULL, SVPBMT);
> -	}
> -#endif
>  
> -	return false;
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return false;
> +
> +	return riscv_isa_extension_available(NULL, SVPBMT);
>  }
>  
>  static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> -- 
> 2.35.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
