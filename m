Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9548C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3R9sDj11aT/e6V+TCUHaSt4pBD4vjq+kYpTlSK+UFiM=; b=SxqqYV+pajjaFzvekmjzKSqvPA
	GcQC526CXte1d1GvDFtMAioU8jRwg0/uJwr47UPx0CjrSXRKNBAcRJE2sIIi3qP3eoXprcGkiOiEP
	zEB1VIZmDA8YWQyxBsT7oldqPdP/2bWot3zBIu1dGnN0/STfXSDepQdwdpG70IjkKpHiqvH5a4vfI
	fVB8+7w/kpybX5/FwlzlejpiKFvU7yzoVA7jp7JsgOEHRD+o5wu8dPwKwipe9vYkUBiCPw3/IQP+9
	xvhYqcGlN+27Cm7qQStERFU7E/z7lrS7fQ96vhHwJIagP1Ml48foI9HCPEqkkjoDZpPYvVwl5AkRA
	FFppATIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na3Jx-003qd7-58; Thu, 31 Mar 2022 22:31:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na3Jq-003qbz-LR
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 22:31:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 c15-20020a17090a8d0f00b001c9c81d9648so792140pjo.2
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6rCIWfpdFAllh+9z/8pwwHeBN74C9Zcoha/nyACYmoU=;
 b=2dwO5l/WblSbRyA/G4tpPYKzqLPlGlQZk1glLxEPxzRRKLyqRqT2NX4K9/fO3Sr2vm
 AFx3rSxw9XC3u6d5dlb1dJDGLvkWuTgON5KIId1jPXp1aVxWmq3ZZhBghb87Lc0X/qHm
 mHclNe2SQjb9svdijG888dkZDmjxCkaii1zL8imrwL0Zp5zOnPxc2IE+CyCoDOBc0qYk
 0njDHKKkh3t+WIm+ZxWGoKMGPzXtp1KOl5NgL3sBjZIK8+N/+IoAd/P89NExVDVD9EMY
 2/5a6Pdjvxnf4KFMHwAZmousU7JZwsMYfQDYf/aFmrVrX9Ve2TTuFFeD1eFhdXtVGSo2
 cFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6rCIWfpdFAllh+9z/8pwwHeBN74C9Zcoha/nyACYmoU=;
 b=5N4DrgNsV2EAI60T2PZ0vg4dWmIsyXeLKCeNb+L39JdtfGsHI8DVoH1/YZihNhtisu
 zDwjAmPGl1N+2VbwP52Qf+PszTTLJJlasE+VvWk7FS1Kew+aW9fH5w4BTyyEt/gw/FR0
 ktgLhKMX+6hYAAZ2PFTj+LGHv8hozJ1hXvM4uoPYVRYGdBxnR4YweNJMqhIEIGr8RF2K
 6dAvmphQJwHfRWDKkq0kpLv4fWzMqXvGaDe9alD06rs+eu90ode1V3OLgbZc7WY6zzE1
 TzedGrfKRq1wn21dTgcTXN2FI9hyxhGoV8P3CGEwxPqHuIepWXUVhWFdXbN2Rp0fvmVe
 uqTw==
X-Gm-Message-State: AOAM532FC+HPWWkFE1m0ptOLKqmcqui/dy0SsDTNotDIbJX3nr63uv7F
 PyaW5WosAAMwwl1w7p461ptulQ==
X-Google-Smtp-Source: ABdhPJyhj2zGOHhxHI/lpYy2Ix6Q0TfDIi54rB5i74CsZ92GfKnbBcxwzHOjaQxm2UnYfYO7i1f2bA==
X-Received: by 2002:a17:90a:8595:b0:1bb:fbfd:bfbf with SMTP id
 m21-20020a17090a859500b001bbfbfdbfbfmr8384073pjn.125.1648765865165; 
 Thu, 31 Mar 2022 15:31:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 22-20020a17090a019600b001c6457e1760sm339213pjc.21.2022.03.31.15.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:31:03 -0700 (PDT)
Date: Thu, 31 Mar 2022 15:31:03 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 13:54:35 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Enable profiling by default
In-Reply-To: <20220324053020.606637-1-apatel@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org,
 Alistair Francis <Alistair.Francis@wdc.com>, anup@brainfault.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-82bfc066-f5f9-42ab-9cbf-f41d91011748@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_153106_912627_84658AE8 
X-CRM114-Status: GOOD (  15.01  )
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

On Wed, 23 Mar 2022 22:30:20 PDT (-0700), apatel@ventanamicro.com wrote:
> Let us enable profiling by default in RV32 and RV64 defconfigs so
> that we can use RISC-V PMU drivers on various RISC-V platforms.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> Changes since v1:
>  - Enable CONFIG_PROFILING instead of CONFIG_PREF_EVENTS in defconfigs
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..bfebee46784c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..2b68b1bd2559 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PROFILING=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
