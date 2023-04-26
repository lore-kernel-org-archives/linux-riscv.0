Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5C7C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XPzCmqxrYMpy3pkEsHrjDQcHeg0ORtZaPpgLtviwvpE=; b=y7u+NTf4/2Dt2aRkUcbBjJZBB7
	0irGHWYxkMQ4RcTHxlYOXcYvldQ77jZ+RtTlnUFT243tuHUFzUY3XEOkC7NY80kBRriqP6+ytx4yG
	9+Or4LYqXNhpcbgoAyWoDcYtjye1QTVt8Qi70d3z4lQWzgV3tdDT7LLVX2yK3j4dv3i3LE1jh55eB
	YEguCfqXdLWMezt9YkS2L8Z16O8na2QOvAP6b090AXJlnX4T2eWcnfJCCAqQgzowHm+prvUMBtwSO
	hO7q3NybM3Ec85SytVcCo2mzR6gOOU+e/KHhrzxIxB6ozWY91roaFsr+wk5WzVyTaWUeGiKf3mx2M
	J/OdYPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prk8b-004e1U-2I;
	Wed, 26 Apr 2023 18:45:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prk8Y-004e0J-1W
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 18:45:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a6f0d8cdfeso59619005ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 11:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682534704; x=1685126704;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXwqrHaYzKo2yrBADgB5WqZEnPYQ+1SHT4/YEIm6rfk=;
        b=yxmeIMM7AqMrYpjTPhdJvmtkQFPvan9NpmCeQGiyWsJ8rAwTZOYkEjw1ULTCzu/UY/
         p+JxxPb6kjDGYGiZE6rGIf6FxsOeVd1XHZhjjQ2Jt4srKtvhvz1BgV7n0RYa9HqX5Tcx
         pGupfUA0qbgmg2dhyuu0IoXpUgUMTMKispsGRNr4cTt3RXtSfFdnWYxRuJLLfAaqJWoC
         gcJZez6b6z+kNe50a27vXIEmYxCHZZVP7PtZAOjCK4mZPRQPvsgg+f+Nw5U9T8Kk4QnF
         iZ//DRkyY1yc2h8A7CQpRKuOXCl1fQrYYoUeWxtQK3nHGckqos7RLKXsKDV8iBrIiaXZ
         XfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682534704; x=1685126704;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXwqrHaYzKo2yrBADgB5WqZEnPYQ+1SHT4/YEIm6rfk=;
        b=dRXley6KNJNjoOWsdY58qOCGbu2mZJavcJkEzfCUhJPM6OGkn+bckuJ4YfuAti9x06
         KaQ8TFXsMcEjtGSCvjjo+B56n6WPSms3YoKvtG8eQbTfYSZwHD1zQH8kXT0gx158BNx6
         Vs2rJ8SlZhia5f7f71HFwkgAYeWjcUFGXvGzVUP546dmxuNm0bs9xEiLDkLxNsnVlOIl
         VRjylrMud1yRoVkAtF9P3hK39mRpPRCBvryRBi27Pm1sbujv8gEEkYLpfIDX0brxXCOE
         2lYNmWAedQaljZNN0K1vT7S1ZhE4UWFrLJmHIzWR5jpIgQFlbtg18yXZC1Q9ZqiKmy4k
         1W7Q==
X-Gm-Message-State: AC+VfDyUHr4jgBm+fToVgvtqpSsLdJV+J3Hg+BupWaLxa1iOMOelZnX8
	eFXqdFEW49vOBwoOHwv4l4tnCA==
X-Google-Smtp-Source: ACHHUZ6XGF1YFTCK+4TjiFTAQPFcameE2epgjBDRDaOfU6uZsFJI6CGSCG2MRBu5cCtfg/boc69nAQ==
X-Received: by 2002:a17:902:f682:b0:1a9:9929:face with SMTP id l2-20020a170902f68200b001a99929facemr5189336plg.34.1682534704484;
        Wed, 26 Apr 2023 11:45:04 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902ee5500b001a0763fa8d6sm10257455plo.98.2023.04.26.11.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:45:03 -0700 (PDT)
Date: Wed, 26 Apr 2023 11:45:03 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 11:44:26 PDT (-0700)
Subject: Re: [PATCH V4 10/23] RISC-V: smpboot: Create wrapper smp_setup()
In-Reply-To: <20230404182037.863533-11-sunilvl@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com
Message-ID: <mhng-d7d9cb6c-3d07-4286-aa68-e99df654a92b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_114506_504918_E33B155A 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: rafael.j.wysocki@intel.com, linux-doc@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, platform-driver-x86@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, qianweili@huawei.com, herbert@gondor.apana.org.au, corbet@lwn.net, Marc Zyngier <maz@kernel.org>, daniel.lezcano@linaro.org, linux-acpi@vger.kernel.org, lenb@kernel.org, aou@eecs.berkeley.edu, markgross@kernel.org, hdegoede@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com, linux-crypto@vger.kernel.org, rafael@kernel.org, ajones@ventanamicro.com, luzmaximilian@gmail.com, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Apr 2023 11:20:24 PDT (-0700), sunilvl@ventanamicro.com wrote:
> smp_setup() currently assumes DT-based platforms. To enable ACPI,
> first make this a wrapper function and move existing code to
> a separate DT-specific function.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/smpboot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 00b53913d4c6..26214ddefaa4 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
>
> -void __init setup_smp(void)
> +static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
>  	unsigned long hart;
> @@ -116,6 +116,11 @@ void __init setup_smp(void)
>  	}
>  }
>
> +void __init setup_smp(void)
> +{
> +	of_parse_and_init_cpus();
> +}
> +
>  static int start_secondary_cpu(int cpu, struct task_struct *tidle)
>  {
>  	if (cpu_ops[cpu]->cpu_start)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
