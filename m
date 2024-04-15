Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D945C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLS2uue6ZKmsap/gL3DpZ+q87gzkOHoLKvBcekDxrw4=; b=YqFvejOWK43Ae5
	hVel89aQiyKcx2nJAT3Fl+L6fLELGBS9Nk9ZL2Snp9Rlw9ociqLCKH45YV54l425/etp84iYp5t+3
	JyLsbRcgzBCDxUw1Dp4T3+hntp0WdSZarZGAW4ejWFLbhyYQ9icPL6lI9LTdrfAsFIMQy+z6Fpzxs
	506Askx0k0Ck1wHwMGuGwfd+Gs2TBq0SN5BDR8uV/603khTZkzLnGOyT3voCPm2uGdk4TW3ySl0Zu
	5YLlLKlw+SPMmg17rIBDXtQZsqBUws0tAG8yrABrg7TE1sycIdxyZtcm4k7BFiGvnPewnL3DdYTnk
	MfkNnAH1YTp/mbJlEHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMJE-00000008SGi-3fYd;
	Mon, 15 Apr 2024 13:23:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMJA-00000008SDh-22dT
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:23:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so4447133a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713187418; x=1713792218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SsPjsW5vGyGQYslNcZfnPrf8zdlh6X3WXkIuouRF3Dg=;
        b=YmKvL+GXT/UCBr4boc4b6RdXKqXaeTKFjg6fP6nj3xh314dorupEZkdD14vTsAMart
         oqktoSJdolzFUWYfniURbSuopHe2HGAT/3scxgI7rSSl8UQZ/GSiyuyiBSIoaPIsK/6y
         H0Jhij6yIJ00OnusA8tcBzNL9uVB/YkC2XVKSdjRafT14/NBeMD7Wcrzk1zk8Nb7g94z
         ec7euuFoWRM3vbD549itNO4mfU8j6j61jXhe4gmpM1Q+3ibGj2j1i+6adaMysIqaqb2O
         jNPuxhNi4hWpm/oIbjbUKIk5+SzRmIL5nhrHIPDeA9bTcBVyEuhnf0lQj0VJxi3u3HiK
         ZN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713187418; x=1713792218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsPjsW5vGyGQYslNcZfnPrf8zdlh6X3WXkIuouRF3Dg=;
        b=UnUXmDlPK9hYe3KxReZVTfXojHEQKbI6jaJhIuvpwcJT/562yDubYiSfEjgQtKaV5e
         h5WRntkbxfiBCwKOUBESkHs4JketZVUQ/qaU8kfLphQ7WEGIZueZTElaMG/BnVSewYR7
         CHRH/ydagkHG3OySj7Rhs9D75N1xwBUrUJLbjuZXP0QwnVfKrlP7aQv1kEvsiaAy/W+a
         DFNx2NnFmdAsj7nDN4t/xFcWhscyZbOqNZEhS2xgEMowk8a4qX7rh1K2uhRVgrNQLfgh
         mSvNnkPU0qZ0uZGcyL3bIxDCiyzlOqop/sK+TZ4KoXzjMMTtJWPr2fwdtKnoSunmK4FJ
         VTTw==
X-Forwarded-Encrypted: i=1; AJvYcCUxxMWdbtHFvzw9gc8m1u5wX7TYFBaNFvKBetUr3cKpfrgEuuZXd4GjQ7sjXRyUPLQSqclWHGmhdTKPpvt9HxYPwsC6Zzr76dIsAZ8T8+no
X-Gm-Message-State: AOJu0YzX2DrCSHWsPTB+J/G1+ajTrbm1EI+M4DvvFA2X/7Lv2wxumn7d
	+u5Pi7SlWEV/kSz0KMoc9CrNkJcDrEiITigNkFozu9GjOYLlJ5hiCRbrLU1cy8A=
X-Google-Smtp-Source: AGHT+IHklOBQ3iGKHu088UkpOHw/VxcGUKSaeMTX9Gz3utwCjBi1O3+vYBQcukgR3YGBfTGMHvrvUA==
X-Received: by 2002:a17:906:f1c7:b0:a52:fb9:27ad with SMTP id gx7-20020a170906f1c700b00a520fb927admr6011866ejb.48.1713187416663;
        Mon, 15 Apr 2024 06:23:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ji16-20020a170907981000b00a5244a80cfcsm3480965ejc.91.2024.04.15.06.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:23:36 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:23:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 14/24] RISC-V: KVM: Add perf sampling support for
 guests
Message-ID: <20240415-cdc6d5bc6c5145f9d6f54afc@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-15-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-15-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_062340_640573_137DDE86 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, Apr 10, 2024 at 05:07:42PM -0700, Atish Patra wrote:
> KVM enables perf for guest via counter virtualization. However, the
> sampling can not be supported as there is no mechanism to enabled
> trap/emulate scountovf in ISA yet. Rely on the SBI PMU snapshot
> to provide the counter overflow data via the shared memory.
> 
> In case of sampling event, the host first sets the guest's LCOFI
> interrupt and injects to the guest via irq filtering mechanism defined
> in AIA specification. Thus, ssaia must be enabled in the host in order
> to use perf sampling in the guest. No other AIA dependency w.r.t kernel
> is required.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h          |  3 +-
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/aia.c                  |  5 ++
>  arch/riscv/kvm/vcpu.c                 | 15 ++++--
>  arch/riscv/kvm/vcpu_onereg.c          |  6 +++
>  arch/riscv/kvm/vcpu_pmu.c             | 68 +++++++++++++++++++++++++--
>  7 files changed, 93 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
