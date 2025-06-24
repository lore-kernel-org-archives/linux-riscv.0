Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F2C7EE32
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJdnvGR+cwUfg4aVramoilH8dR/vZzUQtyxDJHjGJ78=; b=o4KXgBh/4iJGRW
	KYyy/F/K5c2B5e8aiAJ+CKTDqM1Ft9FWnafunt+f7DDaioBYkqmTMdH0xDFbCKTPte78/K5aCnjIe
	t/1MGEzgVlmMNKqgu0aLNgaiaych/V6nBimoV13S8003h56VEQfyVYwntm7AGYlDtQMhHO6fJujcl
	ayoJ7r9vdxiNHSyjGLead5UhWss/9RT7DV06uIuincFyYlY3+HMGqy48j2Zi2WCoDOQzjJenRKQaH
	ls9X1lAxBkrkIzjFqEEchfWAdo9xXfmrH6dHZdBrNY7R8OE12drhG2ItmwWJy3vIRUqHEJPQd5yWY
	du662r3idV78X5ooVbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pd-00000005r4x-29h6;
	Tue, 24 Jun 2025 14:14:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3yu-00000005lRB-3yr9
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:46:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a575a988f9so323156f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772795; x=1751377595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohkRZnrz54pdAWpLhDbJvMYBolnW2mbJhdCUdnmMbJk=;
        b=QTLKqYWcmeuKxJPqMrF/4fN1SNIJ8MNHMxRipOpl2IFmO+j6VI2DaRi/9y2JLUXIfc
         a9Ph2vhoTrBlQUv3YVuwIfcffnrWsV9djjXSzPEOkiYcEqLkeHepAIquNx2MgiUUZOWy
         qAthUCGk34iSUOP0hczgh7StsMm8PGp0/sjxH+YT4Z6hZL+mj7AZ0LC/PgW9CW4TbOSm
         rwa3X10QNPvKTKq1JV80NBhZl6hEEFC0N30SePzfNfpVDZCYyOwMh+AB3VhuVOyUiJRi
         hnBXIX5nT9vq9TRAFyGjRAB3sAzTyk6YM51aFvFCX0Sb4LYebxmLNpuAIRrzJqrp1gXu
         g3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772795; x=1751377595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohkRZnrz54pdAWpLhDbJvMYBolnW2mbJhdCUdnmMbJk=;
        b=GwnNh2DnLU+V63Qa5dAWjtnaDHVmz/US5nHfxvHJfbCxQZq8fUJTss7Tp6MSq7jM5j
         heATaNljhjMQSf3sX4//y14ukaXkf+t6o/RkXBbtxUPTqxBSpclll0clxOvplQShc/9Z
         ILQL9BOTKW+Nq2rdxR0MSIDzFTnCilwQ5ZcrXaIshUD1Qw+tf/EfQu9VYk1DEPYcDBN1
         Y4JNgbYxkpIyVChOXH2sH9ErnD8/rDI1+W6qj7L59Vvab1yUhQGUqDo5fH9T8iF0Xald
         5Ne8TyKslPt3SIhsaatINJiohl5Na9Yvy04GUgMmDIhb4hu0Fts3yEzzthFLPyVVK1CJ
         RObw==
X-Forwarded-Encrypted: i=1; AJvYcCUBOOmZ1bzVQP4kc4tNGUCyCRzUipQeqBNOY+xb07c/NuI9bv09VK3aZo1KuIDk1W9w0Lkab4NIWO42hw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw86wrJPU+yZlW9cq8InFbOgJGAqNUWz0VP47oVTR6jiS1I90Zr
	z1ETeUZuhytrvWg/gdr6DD6/OHq/FiHymcaCexSuoLbebIBP3Yw5UK6VehRQJYkTRoA=
X-Gm-Gg: ASbGncs7el/mzBrcEX/4szpmrKdz4nceCgOyo5O46E7vBCoIqyIN1vOEtcfL8NYUT3O
	ACBypHKMZWzj/axEPWAVsjVdp09ElabGqcB9UbxqFj8OuhOLZFHZEzKESO0cEasAA3Ug9BE9k6u
	QG2aGZweZcuY40arPRrNvfqGayqI+hSwK41ZAJh6tA9jL+c4XUtZLuj6olQq+2CXgJSsaFDsN9B
	LOsB493dmhyt/tGHCvPswOK4G7/Stqi7bksEQjh1uVeU5Ls/b/9a5APXQ5WMFjGXhN3bA8GMCVc
	PCPMskVpTVU9vzAoVbpIoiGywOntwYp1sz8GLnHJi54gK/Qdww==
X-Google-Smtp-Source: AGHT+IEt7t69RQwxRY3eEXaaUWMwhnlyw5hwc/9b4j97KSvQHGz9sdCKF+wVdRShxiN6h2dbaEha3A==
X-Received: by 2002:a05:6000:491d:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6d12d92e1mr13250210f8f.36.1750772795336;
        Tue, 24 Jun 2025 06:46:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f279dsm2047840f8f.64.2025.06.24.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:46:34 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:46:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/5] RISC-V: KVM: Allow bfloat16 extension for Guest/VM
Message-ID: <20250624-08753b120b1b5b7b88416057@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064636_990870_876956FE 
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

On Tue, Jun 17, 2025 at 09:10:35PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zfbmin/Zvfbfmin/Zvfbfwma extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 3 +++
>  arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 56959d277e86..79a5ac86597c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -186,6 +186,9 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZAAMO,
>  	KVM_RISCV_ISA_EXT_ZALRSC,
>  	KVM_RISCV_ISA_EXT_ZICBOP,
> +	KVM_RISCV_ISA_EXT_ZFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFWMA,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index d444ec9e9e8e..2ba3f2c942ee 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -65,6 +65,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZCF),
>  	KVM_ISA_EXT_ARR(ZCMOP),
>  	KVM_ISA_EXT_ARR(ZFA),
> +	KVM_ISA_EXT_ARR(ZFBFMIN),
>  	KVM_ISA_EXT_ARR(ZFH),
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> @@ -89,6 +90,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZTSO),
>  	KVM_ISA_EXT_ARR(ZVBB),
>  	KVM_ISA_EXT_ARR(ZVBC),
> +	KVM_ISA_EXT_ARR(ZVFBFMIN),
> +	KVM_ISA_EXT_ARR(ZVFBFWMA),
>  	KVM_ISA_EXT_ARR(ZVFH),
>  	KVM_ISA_EXT_ARR(ZVFHMIN),
>  	KVM_ISA_EXT_ARR(ZVKB),
> @@ -170,6 +173,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZCF:
>  	case KVM_RISCV_ISA_EXT_ZCMOP:
>  	case KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_RISCV_ISA_EXT_ZFBFMIN:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_RISCV_ISA_EXT_ZICBOP:
> @@ -192,6 +196,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_RISCV_ISA_EXT_ZVFBFWMA:
>  	case KVM_RISCV_ISA_EXT_ZVFH:
>  	case KVM_RISCV_ISA_EXT_ZVFHMIN:
>  	case KVM_RISCV_ISA_EXT_ZVKB:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
