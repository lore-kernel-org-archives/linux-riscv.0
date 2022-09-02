Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F5EECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4ZAePGfTJm2Wv2JEfVVvGUGpIaaJ8oCSwUef27CmEI=; b=awtNFVloYV1yM2
	R8NMBlXhv2GLOJcM3+UzTpdPImmh/DG0y7iKwsAOqIj3GUUtdavNYnjleixHhKLP8F1R5s2MblDo8
	tnddzEAqc3k6bKEfkYiNar6JuAJt7I/aUeh9ZE6C/Tb6QmrZveb+JDtdL6KEZow7AFYv74cpyaGIn
	D+oowtijSd7UOdzRFxsJk1T0296x/Yhx4fz+ll9yKM7ASzfk9LyQfdM2XvcyhVzd9yeazDV3+HQm6
	H4dn8c4/tsAF/T8lukXva3rlfopPeXpotrSqb/YYoOnz42bxRic+zmJviCoUYPHhIF2OOBQoaIXl6
	nmq88XrhqJd4ybjvXUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3J5-002wrz-Ix; Fri, 02 Sep 2022 09:49:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3J2-002wj2-2r
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:49:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id c131-20020a1c3589000000b003a84b160addso2308481wma.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=iTtfs4ZEmz2CO0tqyShdZy5SmT8da7zI2nW4mYiBg+c=;
        b=X4IvpiG63ejRn1EIKWvGaz7DCDnZqy0WSyVucEnSYcPk2w1QrY+gyJyFJFC08kfsaD
         oDoVxupIZJhGur5lGQH2eM1a0R813H0MUmqu3G9RsT2CzXFdJDJwAMbcDyxkr4fxZkPu
         NFQedKIOwRmY6j3lcsiCpBRJCjjGf+xvutAw4uh/Wy+FbkZMULs2KXGStwmShxGNSKgm
         twUoq1+Q/uSxiLicDLNA8We0KLynTdEhxgXWSKQbHVWSUEe/Edv5eFvGC+PIXAC3C1Df
         JEJ/lHlzwCdJTpgKkWuKGZxQIKRPk+cuFLzLYN8NoGa8asJkIAe2mBiAASKH+TAUeL6C
         EcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=iTtfs4ZEmz2CO0tqyShdZy5SmT8da7zI2nW4mYiBg+c=;
        b=0kb4JkiJvHaPEi4p8uhOXLGa7N9KEJNybBpkMd8gorur3OkwuYulQWf8nUDFlMTBmy
         oSSTiXaalshC66vfZfQzTRUsii66GTa6lx2xyGgAXSVnrhRfFqIGiQYZtNYsCUfkJhkl
         ucsaa4wUCzTNO95Rmo4OW/ByqOGioTXeo7DhNmqE+2iPboSddJSEoDbaKMJR3EY0vIXF
         MFJqK0CDuZbKE84NpM11j0aqPVfoCPKZ8+GrKDmcGR8xrHQW3u8SHKdJ5fQD6GFnbwnj
         QRfjQSoNrYqdl9mVCU1n7Ke5RywPBSpI4BX8oIugbltOXmyWiERe+1S5qw3no5w2iG92
         4eQg==
X-Gm-Message-State: ACgBeo0kV1Bor200Dbt9BTCrRfuIMCLbtcRziVK2PFunh3vH/Ff8bU8e
	q41KuHH5tiSCHE2h3WHdrje/7Zj6aL24bA==
X-Google-Smtp-Source: AA6agR7g6UjnTtC54SC24/+GwV++cMHs/qNuPRNWMTUDeFLY9RsZbZndkhHBZal1E6VW66nimnslZQ==
X-Received: by 2002:a1c:202:0:b0:3a8:4197:eec0 with SMTP id 2-20020a1c0202000000b003a84197eec0mr2204962wmc.83.1662112180473;
        Fri, 02 Sep 2022 02:49:40 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id ay19-20020a05600c1e1300b003a50924f1c0sm1700998wmb.18.2022.09.02.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:49:40 -0700 (PDT)
Date: Fri, 2 Sep 2022 11:49:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, guoren@kernel.org,
	apatel@ventanamicro.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Message-ID: <20220902094939.wvzovl6ytujtjbtm@kamzik>
References: <20220901222744.2210215-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901222744.2210215-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_024944_151692_FDBD75E1 
X-CRM114-Status: GOOD (  22.21  )
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

Hi Heiko,

Please use a cover-letter for a patch series. They allow the series to be
threaded better and people can reply to the cover-letter with series-wide
comments. For example, I'd like to reply to a cover-letter now with

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

but now it looks like I need to go back and reply to each patch
separately.

Thanks,
drew

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
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
