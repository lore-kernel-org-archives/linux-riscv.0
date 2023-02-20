Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1A2C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtCveCSDEXeQiFUH5qLWMCPrToGrUvj1u9qEta7uYU8=; b=0LpxFnasd2Ze9f
	RKUyZBq7FEFj4n+ggkuKhOdSLTjVSOEWcZsvhKf+7BfeDkBuOs4BR+d4dr8qCQXbgndx40F78RSTo
	cNsTUJCY/R2AbNE5BAD4wtGovhPFTgq0R7/wXRtdo57b93KGS1fOxp6iWSxpvP8w1giXTFrwwAvAA
	c8c68c1YL2wQa2N45/nDmB2Hl71MUe5EhoVlBMBiErrBtygHbue2CiEPeZKzTGMPVIKNx1LL/zPmZ
	5MMvGQiKVWv29nGqw97HNErFsADZEW3NjyJb6wQnZ11I3ePFmFDF7NUzZflwHoAsyRQsZqMleh8di
	HA8DTre1qlNrI8n76k8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8fO-004ph1-N9; Mon, 20 Feb 2023 16:05:26 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8fL-004pg2-U1
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 16:05:25 +0000
Received: by mail-ed1-x530.google.com with SMTP id f13so6032177edz.6
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3e35zhiWCC5w36GuRCT0zBRvbQNNUkxPm7/dUxmkrLI=;
        b=k7HRtuKcDehyhGBbLV87fFpnM1YMndgK+VNmMIKK2AJ4/2tgg/ilVbCSK/s+IGJNEm
         anX8HFSYmBFDlwoBg6c84xuIZXahPlt8ZWxZmriPnoHpPONEgIxG5hZx9Ana2uMeKRsE
         LDVheLsVCxDAhYmYVMD6gHuczy/J7XqKFoNcm2LyRLApCfvuADT7TsXiFC4YHaoOd6Dt
         2yfuZWQQrzjq/6UMwNVAUQzCXgJgSXEeJIqI+D+cxv0OlK5ROl8Hs6cvA8zwrJvMaYlj
         fi2y6qltbL021Jvf15z6yqXxTD1XNZmtRyrxST7TAFmPG1z2T8/x7rNGUmzvyEDDtQMi
         +xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e35zhiWCC5w36GuRCT0zBRvbQNNUkxPm7/dUxmkrLI=;
        b=Lbg/SI/oFL6UkBX3hdODQvQSTF682Vzx/3Jo1xxkP2bY7EojvrYlbdtViLXJGdrKwl
         nd2qxgxhmMSLf6Osn0hsKRk8Qivd/tMVHYiLojzvr2L5tSI5wHj5Uk18dh0NUarpGOX4
         6K4PP4kUklu/vX6gMvc9cwgfbaDeOK51anTZOpad14fyoOK3PDLXcp8tdKCbnDFDLdSD
         jrNg1jM5pTUTzLNsjVH1CLVC0t+A02DenK5SYjW88sch5J0TP9H0e4ES1M0XTAbr9fjP
         7IyTTTUxRhdd3otEsVS8jZs8SMS/E3GfKxzkwF26slRjumllFNvplTqrubrIWKTgTd5U
         4QuQ==
X-Gm-Message-State: AO0yUKUiAmtkuBH0DCSx08oVQfhPwypaEHDmURyfPQiJ8KNjSc3LtNb6
	3JHVHo9A9mmIgRKBCRF0fvlW7g==
X-Google-Smtp-Source: AK7set9A8ucqs4LRx+gjcSjfcR5wmgHbbICEDKqyeAUfiKVjouaHw7lsXBe8uVEGz+al2PpLuV1AkQ==
X-Received: by 2002:a05:6402:1151:b0:4ac:beba:dc87 with SMTP id g17-20020a056402115100b004acbebadc87mr864286edw.0.1676909119809;
        Mon, 20 Feb 2023 08:05:19 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 3-20020a508e43000000b004ad7abf007asm23535edx.74.2023.02.20.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:05:19 -0800 (PST)
Date: Mon, 20 Feb 2023 17:05:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 05/21] ACPI: Kconfig: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <20230220160518.zuppmgvvhvipawxe@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-6-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_080523_991737_0038F4D5 
X-CRM114-Status: GOOD (  18.64  )
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

On Thu, Feb 16, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> Enable the ACPI processor driver for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/acpi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index ccbeab9500ec..b44ac8e55b54 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
>  
>  config ACPI_PROCESSOR
>  	tristate "Processor"
> -	depends on X86 || IA64 || ARM64 || LOONGARCH
> +	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
>  	select ACPI_PROCESSOR_IDLE
>  	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
>  	select THERMAL
> -- 
> 2.34.1
>

The commit message doesn't tell me if this is a premature config
enablement or if it's already necessary for this series. I think
if it's already necessary, then it should point out what requires
it in the commit message or be squashed into whatever patch
requires it (and also point out in that commit message why it's
required).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
