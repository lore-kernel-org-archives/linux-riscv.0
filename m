Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1D1C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3B0D64E77
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3B0D64E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WaT8ISsuAew21H4Z7igKxcxmdJe/tY0r2dpPEXB0b8U=; b=Dl1gakUNBrUVV3oLLhDn3gF18
	dYs4nCHy4q/eTRyykGuZaVEq12+7QJaJz9svpLcu4boeIZGe2cYaF1Lwnb9PooZd/D9oheYCTxpL1
	1JnxoPLf+DCJlAJiuQgdg1eMvAVbB3LkedN/4jJjyKoAecWokeoInNnDG3diu5D4ed15JNR+NzYYH
	VUPCiyIc0+4IziO8rST0KpnaPCP+Z0vcMpRQw0h3HpS+9PNY/oMaHJpfqNRs9TtyCBN0v9kYbJfO6
	SwP3b9DfEowEnWEJj+Ux+jBgLHyRPzZtjxkAc52cnzeid63C5b2PS86ZVSR48+p6aBO8GCHJTOvB2
	qjZFHxNrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD00r-00038S-C8; Fri, 19 Feb 2021 07:15:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD00n-00036Y-3k
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 07:15:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id ba1so2883579plb.1
 for <linux-riscv@lists.infradead.org>; Thu, 18 Feb 2021 23:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KPZ5e+WI7QScUG4Pb9YaSk3mJ5BTJO553uiidTwwPnQ=;
 b=Km3K5boy26IbZJy6Uc0nROwK+ch9BJ2OS2wT3t1vxcrUO8w4Zw/S2U21vRVta1pw/I
 M5bB4kN0ulIs1ahQVNdykfDUUWDaL2bONzQ93NMKlT/QtFJmrlMPF07XZBq9QPDx6pxG
 V8NZfJPlSEUJNhKf7wnRz3gR5Uhoi0nvSzdKJO4ZSVl//E5I1ADEe0+Bh+0qJdUdGIhG
 kHsgep0V2bnrIUlIm98UHLjqvlXZVbguu0+V5SazmnxAj+T6H9ATroeIVn2dQ+o5Df+s
 i3pZ1SxBJt8vn1a196vWt0sMLI2nD4uP5dFBnFCm1dbizEj4h0+9iJ5Q2t+tpBbreg3Q
 m07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KPZ5e+WI7QScUG4Pb9YaSk3mJ5BTJO553uiidTwwPnQ=;
 b=RQ0kS5C7Vnw0EKsdmLDuG3Ul6bwFS9hUpqHWHMia4Vo2h9jH3MHqZ1niHuXzkGPtRe
 Vdr+UEQKYwtvbOQfJxh/i8JWG8D8yrplhLBK2vxA5KiQ5MHinZ71Qx7lZo8Uo4VvZ24d
 gTBrI+wGfs9Z1UVme5Jpu9pV7TwV+YJGTPkSdsXDwhtzVU0Mot2gky+tkNXy1FbCjPpY
 9syspLBabyP3drWXfDSKxgwRCc/gqwepITvep4el25RZk1WCGXotzni6+mHamgZutwRs
 /fmUyERwRlf6P7opyjjws+S3lCDyLw8Wqy/Hie6SsPiYQW35MW/1px9iC/sRFs4oMP+V
 NNcA==
X-Gm-Message-State: AOAM533WQd80OsfDa7yjORUNG7iEGRCzDbuE3pWdRFp/qKgCltns8uE0
 7WU5dH3AyNsL/v4pe12zzPishLaRzjJHrY5/
X-Google-Smtp-Source: ABdhPJzA6v2v4lWVJczpXckHFjkNGIxtz3xyvqXeT7rEN/x5uvJ5Du4BqmG7cJXpvDZ/dfRErioYTA==
X-Received: by 2002:a17:902:b009:b029:e3:6915:5475 with SMTP id
 o9-20020a170902b009b02900e369155475mr7925991plr.34.1613718933323; 
 Thu, 18 Feb 2021 23:15:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v1sm10131680pfi.99.2021.02.18.23.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:15:32 -0800 (PST)
Date: Thu, 18 Feb 2021 23:15:32 -0800 (PST)
X-Google-Original-Date: Thu, 18 Feb 2021 22:32:57 PST (-0800)
Subject: Re: [PATCH] RISC-V: Enable CPU Hotplug in defconfigs
In-Reply-To: <20210209054620.25005-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-ae92ee05-1177-4e83-9385-1e513e4883d1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_021537_243163_06743880 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 08 Feb 2021 21:46:20 PST (-0800), Anup Patel wrote:
> The CPU hotplug support has been tested on QEMU, Spike, and SiFive
> Unleashed so let's enable it by default in RV32 and RV64 defconfigs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 8c3d1e451703..6c0625aa96c7 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -17,6 +17,7 @@ CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
> +CONFIG_HOTPLUG_CPU=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 2c2cda6cc1c5..8dd02b842fef 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -18,6 +18,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
> +CONFIG_HOTPLUG_CPU=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
