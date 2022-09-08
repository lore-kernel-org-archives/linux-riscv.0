Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ECCC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bdJD12kP2uop5tTcdodYqfRmzDDDQxEUq2WeLVO2ro=; b=vkRVLBVtXVJlRJ
	qqP+4omkihGeE7jct+v/Iueuoe/EwYLC1zTieOXspqv09pvaDtxbszhuNT2gHdLR6vvmX0yFJf8hn
	EIjj5ERizU0r13jx5bArcFT6tX9soJZ3Yo4TAZw8ohbXka7xJRKUQfs88lTQ9SPQEhWL7Wd8RIp3Z
	Zcz53SagtCjI4sjnpNAjbM8j7abYOKRTLdspIEx8iep+fcPyHZc9owAvNJXSMTxbYT6G2ZFIUl6tT
	1GS8vC1bvDjG2g26cLMf1wqEBrFY2n0LJl9LG2OeFE2zo1K+Ynh4HRY1272Aaiu7aJD45bSFLc8LJ
	kCtAsFI/j+w0ftTPpgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLwT-006YYa-4I; Thu, 08 Sep 2022 18:07:57 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLwQ-006YWD-N5
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:07:55 +0000
Received: by mail-io1-xd35.google.com with SMTP id 62so14755758iov.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Sgue2it8oIQyCZ0dgiK+lfIOhc4Ojo+VX9+hlyU/fAM=;
        b=WpwXWk7ovo/Px0C6HQi+mrMV6vmY457JOa7D9wb3PNQyrhxq1IFQqzD+S3QhbrxmT8
         j27jbd+ucoBB/AaHGPNA9VGGf0Cp4hmrB4wuyO4h9FfHI1GQtKKVKmKnmKs03IO1+A8K
         JtyMeCHPQcqZqagARULCy3nQ5zGRxOT/McRQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Sgue2it8oIQyCZ0dgiK+lfIOhc4Ojo+VX9+hlyU/fAM=;
        b=D6JQMQXYp7gLCiIAiy6EPrBdDqdO+XatwEm+KmrBIDtIB3prQld9/8boqpLCxOc/yB
         GL/RsgltPoP9QCoSjNSyRumoFcFO8r+ub1D4uB9fzA+5TxviocKdvVt/jJUVxbR3/D4r
         PedXXPttIoaSZvhGL3EzY7xWyWa+vxyx52ruOndRtJshjwkFTFZodACPGwhUoHv0mmKY
         B7Y8Bsz+vzi9BM1utbwgHIgMtkSwV0OAzEwC3Lgp+bvKtokAvCzL7tu6YbQ/9SiBJ6Fi
         luvgQnOtx34ERA52248FptRzRDVWAFahCluOdY3JJKct0m2sKq87SboDvZ/et1p7TTIU
         wwGw==
X-Gm-Message-State: ACgBeo3mHmjqXJ37sptmCN5oZ9SWsuZTlRpfq78uBYoA0J9tRZDda9IH
	dGlHnemVZy8c9QU8V5bjQZZi9B7+KKfM5jZf1e57
X-Google-Smtp-Source: AA6agR5om7Zij8/Q2Sk3qE4xiianEiekmBgoO0hsMaV3qvOLptDT+b0crxMt2BaHlXCtF/DfIuUbrYNeeSjgOYWsy6o=
X-Received: by 2002:a6b:cf09:0:b0:68b:8602:e487 with SMTP id
 o9-20020a6bcf09000000b0068b8602e487mr4482792ioa.127.1662660473381; Thu, 08
 Sep 2022 11:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220908110404.186725-1-apatel@ventanamicro.com>
In-Reply-To: <20220908110404.186725-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 8 Sep 2022 11:07:42 -0700
Message-ID: <CAOnJCUKHCjmaJ2TCxUVnuYetWovwJQnEWJEi3geqf1hOGSM_Nw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Change the SBI specification version to v1.0
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_110754_771853_53A93442 
X-CRM114-Status: GOOD (  14.44  )
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

On Thu, Sep 8, 2022 at 4:04 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI v1.0 specificaiton is functionally same as SBI v0.3
> specification except that SBI v1.0 specification went through
> the full RISC-V International ratification process.
>
> Let us change the SBI specification version to v1.0.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 26a446a34057..d4e3e600beef 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,8 +11,8 @@
>
>  #define KVM_SBI_IMPID 3
>
> -#define KVM_SBI_VERSION_MAJOR 0
> -#define KVM_SBI_VERSION_MINOR 3
> +#define KVM_SBI_VERSION_MAJOR 1
> +#define KVM_SBI_VERSION_MINOR 0
>
>  struct kvm_vcpu_sbi_extension {
>         unsigned long extid_start;
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
