Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057F5E7B61B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1fb2PMr5FGNaWfuUao34q8UqM8nOR/9bU7z1879FmW0=; b=geBqC2fUCYMWbKD321DhKFNwHK
	yeDz5dMeyMNI2e85HZ0SlHoSAZKFiaZUvUaF/3fqCZQtzU0MwEbML04w6pT0/R5hfheriQfClidHN
	beNIJ8BGcWJKSHzyVUdlvuge5pwf4l0Hq5+CYeJxEGnHj3hyhSHlVr/1dMHdnjW+H5DZxKfF+eoUq
	ClFzmBN/6GKwK0pp8qu1Z4tRT+JaICQFzW/IzGnqH/GsRGPidh2X9fBKGmD7+Qa7EyLuVwvhlOmCd
	CRHumFL4wuWtFVCPJF7pKHWuFEyZVuMDUDM8K53aQqWTlnSEBL5J3W8+sYHWyyVtpTZyCIEpXCY+2
	4G/bgrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2X1-000BXR-2u;
	Wed, 04 Oct 2023 14:07:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2Wy-000BWd-35
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:07:18 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-693375d2028so1685972b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1696428434; x=1697033234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z/r1d+J5gtLqP5W7ywKcBZnz9e1tR93kK5cuzURK+U=;
        b=PxorylJP9Y9rikEjSPFUOC9B5CCw1ehFf/MEl7olua3092i6H6FvaZjv9wnCZ6mNme
         zO5kJ2G5YTsMC9G7NrNFskTc+afcPHQXji+43rFVEmftDM4dqikrrvBCL+hY0yl2zwHa
         s8yppREEphUkX5MHkiKUTAaYO2DVFz4D+qlgXAePj5Vz+swhdlX67471SGmXwQi/G1qt
         kMoL1iAyqK4DcM1bF94yPQoxOdBVz6Q9pA2R4LRVEkSwX2ZXD0sV+2QfJxQFumvUVzoC
         MLMfNv5RrexkItkCWzw1EmVmkKqCFOq7gbzuw6y1lw2sm8Dexkwl5LFuFbSJzb3gKhtu
         MOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696428434; x=1697033234;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z/r1d+J5gtLqP5W7ywKcBZnz9e1tR93kK5cuzURK+U=;
        b=rIKHrcZ5nScaj/7JBMzIVdoyj8BXXxmkpX/XmGAk2UB7V7VdquRguBJuI+m1F3dsfY
         huj5vAEFMK39kpY4/5clLrLOAy1sNDgugwbpuX8+tfBMXo/Rc6SEoWdv77KjnJqP1eOJ
         +s6iu0o6a8NqB13vBzlMPtxk0eHE8ThA04I6p1Ga1gOvtEVQYkCdoz3//XvKLShC68h7
         5oX6ZvRhwAkYc3AavVwGcd/HnxpiCUhL4Z4qUQ6zCMqHnFqTkEdUdzGzlsHLGsAz4GeR
         ZNXrmbdhMgAVGxDhitE7i3NYP6MWnFtLNI0v9UGAbgcFvVGpW/9Bxqkuv5Dwk4ACanaW
         TbdQ==
X-Gm-Message-State: AOJu0YzMGHhh6scJfA9oCtu/Qj+Rbv9JwHTC7DmpALx0NYSpC4RZhIU5
	Jh+RD5CMQRCtZL9kyOeU+j8HFw==
X-Google-Smtp-Source: AGHT+IF0Ml8pf6AjMo5zAtun1w9ROsE0vABhFnVNgCEYK5oMomt4HYMJTvQ3YEhZmBv+2hEuxsmApA==
X-Received: by 2002:a05:6a00:b8b:b0:68f:d1a7:1a3a with SMTP id g11-20020a056a000b8b00b0068fd1a71a3amr2957250pfj.8.1696428432808;
        Wed, 04 Oct 2023 07:07:12 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id bm2-20020a056a00320200b0068a13b0b300sm3384998pfb.11.2023.10.04.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:07:11 -0700 (PDT)
Date: Wed, 04 Oct 2023 07:07:11 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Oct 2023 07:07:09 PDT (-0700)
Subject: Re: [PATCH v3 2/6] RISC-V: Detect Zicond from ISA string
In-Reply-To: <20231003035226.1945725-3-apatel@ventanamicro.com>
CC: pbonzini@redhat.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, shuah@kernel.org, ajones@ventanamicro.com, mchitale@ventanamicro.com,
  devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
  apatel@ventanamicro.com, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-4ec1093a-4542-429e-a9f0-8a976cff9ac4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_070717_201459_09000987 
X-CRM114-Status: GOOD (  16.68  )
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

On Mon, 02 Oct 2023 20:52:22 PDT (-0700), apatel@ventanamicro.com wrote:
> The RISC-V integer conditional (Zicond) operation extension defines
> standard conditional arithmetic and conditional-select/move operations
> which are inspired from the XVentanaCondOps extension. In fact, QEMU
> RISC-V also has support for emulating Zicond extension.
>
> Let us detect Zicond extension from ISA string available through
> DT or ACPI.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 0f520f7d058a..6fc51c1b34cf 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
> +#define RISCV_ISA_EXT_ZICOND		44
>
>  #define RISCV_ISA_EXT_MAX		64
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3755a8c2a9de..e3803822ab5a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -167,6 +167,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> +	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>  	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Can we do a shared tag, though?  These will conflict.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
