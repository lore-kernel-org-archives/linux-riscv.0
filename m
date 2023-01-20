Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB2C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzofgglTlU3wbHHLxKB4E6WFo9BSr+CuXJYqOtNvL98=; b=G2wEOTgxH9G75L
	15gCYJfp3pfwpCR2e9asP8oUGAeS1qpYaIxdrt3wZRAkV7D+DJ4GaxJEGeVLhbOlIgG7ETUmDNPmw
	qqDQ1BxB3vR61+OGcS/p8oC5u2DkDY/uA/2raMz4j2cmnh0AKM3K38IXUdwRCJ2GG4RmSnOU/NuOZ
	dcMWdTy6OMSsOS+S83AaqoFX8HwkTSS1/Zh1RQ3XuJ/TGVpm4m8VL9f8ApRYPpymCIIj5iIYyq9t4
	KkmGpPotCvchm2I4Oej/87OE8gVPG8kl8/kDXvmky4+Oec6Sm+89nW1sH0vpzZ4ifH718AIZfsw/T
	IzjvlXRFpO2+X9hP5dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIrsn-00AXyw-Bx; Fri, 20 Jan 2023 13:56:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIrsk-00AXxi-4K
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 13:56:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id bk15so14111855ejb.9
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7eK0S32R7OzdAHjN8ANIsN9zhM51LWwumKsQBQQh8I=;
        b=C/UkHRCo3dJQXtq4TBwbY4SPLPXRYn2WOJG9lENA7XPB5yLT/zlXBogNk1MOZ6l55p
         5fZq+rGqYualx4+bpTovJMsfmDCsCUiGXcKUPTu5p9XB+OtbFWUScvNjeDDh5hex/JJG
         7jiytQBn/EBJWWPjwVKX3aGDhkoyfWgdWvr7wtMarwTpKBeJfG2Pal2Rsy7JWF4jJxzJ
         oglsLixFOL5wWywmmwJigjkv2eWfgidHwq4JRyQLkdXDXhXbcUkd2ml2YuwBDRFu61BQ
         fO2wS2UZQSpA1YUeHvkJM2V+gCuVbFL6bzDwsgzvfPL0U5dqQ9yjsUehYo7NpWAA1Jz1
         LmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7eK0S32R7OzdAHjN8ANIsN9zhM51LWwumKsQBQQh8I=;
        b=ZekCoATjwaGm+EQnDZXCHoa0AbWXCwOnO/CJ/YlsBIT0785+HqscYMUCC3VSTMkt8T
         S5GSKHyhlYwHJu69f4oUu0Pj/3y8D6YF6q4A/lzIRxKm0PM0qEu3ScJ5tMDTTpqikmGm
         cx06lIjKIUbbJ98epRlVsL2BpREouR15P2DEmmpNTaMkFvHQao4x3yboJH61e/mkGxJP
         gnRF5BWxBOLI53X4+Fk8AKzy1cnCgj+escI/C/BcRo+65tloT6apgykJu/gwI2KUu+TG
         clK6W16pYhhjg/zukcdr4qtpkpJ27TZ+lnbIhEdM3cVj7AS2q56AsCq1UVxa9zMXvago
         rhzA==
X-Gm-Message-State: AFqh2kqJqZ5JFL+Gkf1QOvn8zklzk8oBSK4Yue/D0bZTPT47Es+606Qv
	7+OBIa2T6fHMMVNVFSmeHN6hvw==
X-Google-Smtp-Source: AMrXdXsDjnqn1FOnw74lL1yVvsD6lGj78Ptra6ukhIH804E5wD8+CJKg4PdIcqvALwMEwneYz7HrQQ==
X-Received: by 2002:a17:906:4096:b0:79e:4880:dd85 with SMTP id u22-20020a170906409600b0079e4880dd85mr14823861ejj.47.1674222994156;
        Fri, 20 Jan 2023 05:56:34 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906218900b0084cb4d37b8csm18043546eju.141.2023.01.20.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:56:33 -0800 (PST)
Date: Fri, 20 Jan 2023 14:56:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	aou@eecs.berkeley.edu, conor@kernel.org, corbet@lwn.net,
	guoren@kernel.org, heiko@sntech.de, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 2/3] RISC-V: resort all extensions in consistent orders
Message-ID: <20230120135632.vb7ncvoapnaixluu@orel>
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
 <20221205144525.2148448-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205144525.2148448-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_055638_213328_8DB790CD 
X-CRM114-Status: GOOD (  20.10  )
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

On Mon, Dec 05, 2022 at 02:45:25PM +0000, Conor Dooley wrote:
> Ordering between each and every list of extensions is wildly
> inconsistent. Per discussion on the lists pick the following policy:
> 
> - The array defining order in /proc/cpuinfo follows a narrow
>   interpretation of the ISA specifications, described in a comment
>   immediately presiding it.
> 
> - All other lists of extensions are sorted alphabetically.
> 
> This will hopefully allow for easier review & future additions, and
> reduce conflicts between patchsets as the number of extensions grows.
> 
> Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 12 +++++++-----
>  arch/riscv/kernel/cpu.c        |  4 ++--
>  arch/riscv/kernel/cpufeature.c |  6 ++++--
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..ce522aad641a 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
>   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>   * extensions while all the multi-letter extensions should define the next
>   * available logical extension id.
> + * Entries are sorted alphabetically.
>   */
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +	RISCV_ISA_EXT_SSTC,
> +	RISCV_ISA_EXT_SVINVAL,
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,
> -	RISCV_ISA_EXT_SVINVAL,
>  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,

Hi Conor,

I'm digging this back up because I'm basing Zicboz on it.

If we take "riscv: improve boot time isa extensions handling", then this
becomes a bunch of manually enumerated defines

 #define RISCV_ISA_EXT_SSCOFPMF         26
 #define RISCV_ISA_EXT_SVPBMT           27
 #define RISCV_ISA_EXT_ZICBOM           28
 #define RISCV_ISA_EXT_ZIHINTPAUSE      29
 #define RISCV_ISA_EXT_SSTC             30
 #define RISCV_ISA_EXT_SVINVAL          31

Keeping those in alphabetical order would either require manually
reenumerating them or to allow the numbers to be out of order as
we add more extensions. I think I'd prefer we just add new
extensions at the bottom and keep the numbers in order.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
