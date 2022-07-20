Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 04:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tgBVUUNquZVt5PLTdQwA5vOiq9ds/JYlVap0Rr8n3fc=; b=fkWRhFS6LCmMu3k3lkoz6M+O1q
	lTiZyxuHTfdrMYEjfaFSEAyQn54qOl6XMwb9OntRD+3Gyfty43Kn/V3wJM44jrCqAIlIIM4PCfpxn
	5Y4q2ggxfg9VkExkbBDv44xLIhSRpV3liUA6Jblq5vqNeM53CT11x1o3+SGWw3CorqTr4+ur7BH/I
	HVqQ3UNO18sszJ5gT58wl/cxkDq4AobqmhOyZMkprBjfMsk2S3+j9MgIUa66jBXtMyPQbcHZtTFSk
	uNHpxyya+6FErGRIOjXmrtbovNGTNABLkh6RHUHFPO7jZjv2B64sG1jEV0A1Tkg3h0pib+63xMEGT
	Bd/4Wrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE1c1-000Hwt-CV; Wed, 20 Jul 2022 04:47:05 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE1bx-000HuZ-J7
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 04:47:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id b133so11728230pfb.6
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 21:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=VtF9+07gASHhrIu6wD3FN1xOsSjHByW20JZ9pcO8ds0=;
        b=fjQHDQLqh1A1CvsX2jafefzTGE36QKfdh3Qilgur+BwmX5uXp/iLBU4QybnFkKJVmG
         pNABvDJrsAlwuXpzvTuIT5usg1eR++fZZZDamrFa8h3thcwUlBZnsOBf1ZmrICn3YSTj
         T0Kcbxh3rIDHWJhYw3iXXLT9ja0KNaFgSGnuvEtGxH4R/1Yh/BHxeozZpnxsnFbA1soR
         CDjSmGCruHE6nPmvn3/nPRAo6knbDZsoTXhw1FiwBGAm7jrQynzd6Eef+IE5+7qEdZPq
         F9/35voq1+L1YkK0ibuaWgdnaDue1kGCBYqcebE+hQUo1D55mIvHYG0osACVHYXl0rGL
         uCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=VtF9+07gASHhrIu6wD3FN1xOsSjHByW20JZ9pcO8ds0=;
        b=VEGTH/vCZawcUi8iEsfvf4lbqt/QzcilQSGzE4UsjJepNcS5zLgQxSBJwdGiZ1FuFw
         s0XDTWL3N/6KSDY+y0QG/9hDSxhLYznx8oRwhrTtsQGcsz9LcZ3EGAo7vcHYEkt76z6o
         m+MW4MWjADb+mSHjAEvwoZVv533OFJWb3OluEBBEB7nBUsw4Z8od5dRTaEeaDN25BSIv
         KUimSRkGdI6hEzCUl9FzaqEIANjza9+fxPwu4cYAQ5PJ+JXg3oSx5tO4UiaBRz9I6uDT
         Pk05Gaoo6hsJRgPC0J2TVkHCvLr79Tiv+iIN7HouVFFFFOymCh3Y9vXs3ucEAshk2EDu
         vrlA==
X-Gm-Message-State: AJIora9xPGReBKfvoojumlALlMsPv08o38TjJBAnTwo8iGySsWNNL9Pb
	rBEXtnPQdtjOYsqaj2owVAj3wA==
X-Google-Smtp-Source: AGRyM1vlzCdD69HQD5gb1Q92kSqgBlWCPv0ppUY5psQ46BDf24I6J7L22UUFB0Qj3qfpd4QsIhj9Eg==
X-Received: by 2002:a05:6a00:134e:b0:52a:d5b4:19bb with SMTP id k14-20020a056a00134e00b0052ad5b419bbmr37009701pfu.45.1658292417692;
        Tue, 19 Jul 2022 21:46:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i5-20020a17090a4b8500b001f0097c2fb2sm481628pjh.28.2022.07.19.21.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 21:46:56 -0700 (PDT)
Date: Tue, 19 Jul 2022 21:46:56 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Jul 2022 21:16:19 PDT (-0700)
Subject: Re: [PATCH V3 0/5] Support for 64bit hartid on RV64 platforms
In-Reply-To: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  daniel.lezcano@linaro.org, tglx@linutronix.de, ardb@kernel.org, Marc Zyngier <maz@kernel.org>,
  Atish Patra <atishp@rivosinc.com>, heinrich.schuchardt@canonical.com, apatel@ventanamicro.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, sunil.vl@gmail.com,
  sunilvl@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com
Message-ID: <mhng-4c49edf1-6367-4dd0-bec7-c6719745ecb5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_214701_852826_0A5CE8C6 
X-CRM114-Status: GOOD (  15.19  )
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

On Thu, 26 May 2022 22:17:38 PDT (-0700), sunilvl@ventanamicro.com wrote:
> The hartid can be a 64bit value on RV64 platforms. This series updates
> the code so that 64bit hartid can be supported on RV64 platforms.
>
> The series has been tested on both RV32 and RV64 qemu platforms.
>
> Changes since V2:
> 	1) Modified commit messages to mention RV64 and add RB tags.
>
> Changes since V1:
> 	1) Updated RB tag for PATCH 1 and PATCH3
> 	2) Type Casting NR_CPUS before comparing with hartid in PATCH 2
> 	3) Changed commit message of PATCH 2 to provide details about
> 	   the bug it is fixing.
> 	4) Updated PATCH 5 for unaligned 64bit read
>
>
> Sunil V L (5):
>   riscv: cpu_ops_sbi: Add 64bit hartid support on RV64
>   riscv: spinwait: Fix hartid variable type
>   riscv: smp: Add 64bit hartid support on RV64
>   riscv: cpu: Add 64bit hartid support on RV64
>   riscv/efi_stub: Add 64bit boot-hartid support on RV64
>
>  arch/riscv/include/asm/processor.h        |  4 ++--
>  arch/riscv/include/asm/smp.h              |  4 ++--
>  arch/riscv/kernel/cpu.c                   | 26 +++++++++++++----------
>  arch/riscv/kernel/cpu_ops_sbi.c           |  4 ++--
>  arch/riscv/kernel/cpu_ops_spinwait.c      |  4 ++--
>  arch/riscv/kernel/cpufeature.c            |  6 ++++--
>  arch/riscv/kernel/smp.c                   |  4 ++--
>  arch/riscv/kernel/smpboot.c               |  9 ++++----
>  drivers/clocksource/timer-riscv.c         | 15 +++++++------
>  drivers/firmware/efi/libstub/riscv-stub.c | 13 +++++++++---
>  drivers/irqchip/irq-riscv-intc.c          |  7 +++---
>  drivers/irqchip/irq-sifive-plic.c         |  7 +++---
>  12 files changed, 60 insertions(+), 43 deletions(-)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
