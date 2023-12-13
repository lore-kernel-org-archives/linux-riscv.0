Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F7BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrEhvqeUXO0F8Zii0lCisSicZpCENtkd3XD+a982yKk=; b=B0vO1sHf04y9K5
	9Y7kurS4X7LO5b3P5Z9PA5rxTYj7LrwnYt0chhK7jT7+9oynqIDhvpcObIk22OMtpj36Nu4fvydrc
	Pnu3a0NRhiOABxRvPIkFX1zFEW3V+YCfwRJlHkKiOD/OsLA0NIjZ2APF03NQEpeC5rl6OV435KbYT
	B4bSKuZNLCKADQPhNXSiSffMKboDtKMpdrtfKiktHv79p5AYlsM1Z+PNRH6k/uo/gZ5S3lbrjSA4T
	Qhs6+36uWHzYeVYkv4BIq2ZLiyRH7pYBUN+yKfON3vgv7ND2btrOQ0VUuujOOz6sMU5LfG79V0DPj
	W8ujLmTrenPR5DkppvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQ45-00F11a-1w;
	Wed, 13 Dec 2023 14:18:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQ43-00F10F-2N
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 14:18:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-336417c565eso400500f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 06:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702477096; x=1703081896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMvhSkMSE/Am1VRqFroHUAOOjs4iyetVHF646YQvvOI=;
        b=IfVPGEKM0AQTTkdSjEHXPuEB5v7I5jrxAtcdi53M/TQ9pIiEsNvJH64duWWGhxx0lh
         0A1ovIH2GBARTaSsrMpavp/PPQLVjtUpjfZtvqvd2+WQH+p1XXi33Qb4vFXe/38iQiuc
         vxpykIH0OLf/ii0IMlSOSLdg2dVeK9LWfn7ION0FEaZQ/3sXn7KK3Wr7s9a7XupnvFTd
         0ORG1f+UWJFbXMg7f/hLoZqjASLWn3qU+0dO0dwmNu01a+8Hv2ubotosXKMuqS8do0bu
         bRZtZcnTU+FOsyLWm533SH8LryiX9B0KTuokjmEx3FKkajNU4aGdvwZwehSFBK/Na2oq
         QjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477096; x=1703081896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMvhSkMSE/Am1VRqFroHUAOOjs4iyetVHF646YQvvOI=;
        b=eb2pYzXdmEf7B65eF3Y6Qb8ITQQ0pgCv5fsxdkQ/hiRLvEwH1IIbfKEziN6pFfao9e
         xo3i2xrxsTTWiNuvRIjvOX6XQ1Zw2Yp1dkjGdjxK/XONNgkknkTJdABx9oS0ykEHL3RJ
         81U7RBvl1/tPrjjECT0FAz05BQrhH2oaVZ4vAE2ouDLrIR21p8pCFsqCBlIvwejAQP91
         gaJ75JbPbVRPy0bqjWCA6k0A54ZDwNDg4qGJ4X5Roto1+Zz5yalqUfMhSTMAavr1mXB+
         dRHKJOJY1/uUbg4IfmXG1y+mAB3qsF8zxNARnQEKgY1GXor+tI4rwuGmrPVV7Q3sdCEG
         SQ+g==
X-Gm-Message-State: AOJu0YzuJGeUSHrnx5LEDqKXmBzOUhv/A0fz0wTc8PkRlSKtKOkfBNBR
	eIahg9Vl+fId1sTCWw2Yld7s4Q==
X-Google-Smtp-Source: AGHT+IHHAN8IaZVRK1Ps8W71SJhwMq4xLyWFOqoAIKM4rFfgBhljotdkzECz0shi/fy3fHhekB11VQ==
X-Received: by 2002:a5d:6242:0:b0:333:3c06:b433 with SMTP id m2-20020a5d6242000000b003333c06b433mr2848127wrv.0.1702477095654;
        Wed, 13 Dec 2023 06:18:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v16-20020adfa1d0000000b003362e9b75c3sm4056912wrv.88.2023.12.13.06.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:18:15 -0800 (PST)
Date: Wed, 13 Dec 2023 15:18:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Samuel Holland <samuel@sholland.org>, Sean Christopherson <seanjc@google.com>, 
	Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 10/11] KVM: riscv: selftests: Add sstc timer test
Message-ID: <20231213-4ba5fcc75b41cd19ec96f08e@orel>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <3bb7d5ae5a1a016e970faa0759c47214c9391b19.1702371136.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bb7d5ae5a1a016e970faa0759c47214c9391b19.1702371136.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_061819_773533_80E074FA 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 12, 2023 at 05:31:19PM +0800, Haibo Xu wrote:
> Add a KVM selftests to validate the Sstc timer functionality.
> The test was ported from arm64 arch timer test.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/aarch64/arch_timer.c        |  12 +-
>  tools/testing/selftests/kvm/arch_timer.c      |  10 +-
>  .../selftests/kvm/include/riscv/arch_timer.h  |  71 ++++++++++++
>  .../selftests/kvm/include/riscv/processor.h   |  10 ++
>  .../selftests/kvm/include/timer_test.h        |   5 +-
>  .../testing/selftests/kvm/riscv/arch_timer.c  | 107 ++++++++++++++++++
>  7 files changed, 206 insertions(+), 10 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
>  create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
