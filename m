Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A6BD690EC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbLd9DzoVMqg6yGUukS+VSnYvCIA6sHhZdOCtVq4uqY=; b=bf472+b3SHze+i
	/gY1fyPwndmTicO5FMrpkRSJw57+zw4T1pvsI98EcNH8YJc0o+Gl+qOwylqSxkK3l+1JW6L0gmp1g
	y9ezf9jzfK7DwVfDLBBmysMum9CVjGLV3Z9Y1QTQ1q2jr7FMwilSChyO2XufxklBrrTiZpfakcnKS
	mDWClIIQUZf22WqtkqRNnedSEwUMLnszOxNhHeELX2Oz9pG+SqsrQK3pO43CRr51lHXCIf+h9uwlT
	AcFa31fGR/qaCdu/Oi4xBGLV4O2K13exM4dsAXKpJ1/kNTA/qHMJe+SqPictivZBg+DkFey/YlPfX
	I3JsroVabTBioFkE+zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaJh-0000000F53l-1v5X;
	Thu, 28 Nov 2024 08:56:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaEK-0000000F42R-27Is
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:50:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38232c6311fso370951f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732783831; x=1733388631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QECfFTmNEKncBrHJdBggIZG8ZqozV1xvM8dgwyM0qgs=;
        b=MKek+IMSa3EilLZivMp9GVOXWWC5jO2FMFk7jC/9h2sPEy3X+CkyBOY6N1Pdht4Uew
         YqH1fRDU0TF99yb+AZ5+FpqfVDnjs4AqUp0ZqPUSLEpf/FPuxbO3LusKOx3+jMH8TtJg
         eSKwaAc5Lmjxu9vS7L20oMkQyV6kOHJZ1dYNjHXEIZceD25uD0Adj9NDj15dQvLWybSh
         zcFzppnAZjfemxW70qmcbWqAhihB64qET4ZMjltOvZNn8mYyYr+OrcbiOM7xFd+UHgsw
         aZtNp8D8YHHiTGPnlHxcv3yo5ZrEXVXGosBTjBFaTXkznGtnUlZuxS9Mb0Dza2LBgzcY
         Q/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783831; x=1733388631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QECfFTmNEKncBrHJdBggIZG8ZqozV1xvM8dgwyM0qgs=;
        b=M3yYuwgFtaryBdIaP8LnjPvcAi9QUKPXvvDT+3hT0AklynwHm5UwZ61f402fulNbIW
         90P5/iZzl63V8a7/kdkTuwYkvwP0yW6ivvkVrNHQsDEI3TbgF2IysoBF4Rgqh5kqVNcv
         aIBvDkMGxMl17uQG6Yu1mQD7yzxjoN9M9PjlzLYkJ/bS3XO6RxSUx0hQ7bk4XowxFiKL
         kbF2wZYZBiipCfWcGLTm3cyDJc6wdYoerfDLfCqgCaVEQKZHhtlDlT4ofGuGI6raY1Ls
         gVjiQrsXjlfqjpO+ZLtivBUfWx4dTqbhUbfsVY/HUSFbV3ySUoZHda5PPeLBndvcUlqJ
         /cIw==
X-Forwarded-Encrypted: i=1; AJvYcCV6CitXHb5smIHnT+C+2uSPSVkU3dQ3qnY/DYxLl0zaKfUOvM0evkYbeFrgrkn29FhX0k9mEPMZmzv8wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbcjTTl/QvJDUykzYfQjon01Oa8B+JWBuEmSHcuwzkWvaqmx13
	nr17FCoXU+LCtxVYe4O62ERxMU8WOPNDQJ3Df7dajFtF/KKZCq7vIX8ohVk34JU=
X-Gm-Gg: ASbGncs/rML3ApcqnU2+Qs8fmpyH/rj9+EbAPDQ/9MOhQlyeE5UrZMUPUkyyq154q2A
	hcKgzYkWe5vuDKxsENCiOfcTPeb7koToIVN1YV/WXq8SKdAFy/kHyEF7ZMEBBS9mxX2MqFnkTxx
	6wwCXNsk58jYq1B/k5fJdfz1YYL1BN+jzV0ubXqjXCXQZret4KKSYrSaZF57uikOrLDzLdlq79j
	KYB1T9169U+gd2Pb72eMBgclTSzZVZjM3/T84IvvRHeUw1h0jtXKEwrMezctGDWKXKPMYw3VT3K
	qUMYIAUKeQd9hx3HlNU8cG4mDpQ29/ittEw=
X-Google-Smtp-Source: AGHT+IG+6tIq/ymmeTyN+HZZy4E/zimUHRxIE/bdOFPe6GsuR8aMA9Q+PN66vVJzXIjP6nnnerBmMg==
X-Received: by 2002:a5d:6dab:0:b0:37d:9476:45f6 with SMTP id ffacd0b85a97d-385c6eb8e19mr5105817f8f.7.1732783830638;
        Thu, 28 Nov 2024 00:50:30 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f7148fsm14832265e9.41.2024.11.28.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:50:30 -0800 (PST)
Date: Thu, 28 Nov 2024 09:50:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] RISC-V: KVM: Allow Svvptc extension for Guest/VM
Message-ID: <20241128-1e20d2226e4be72c121df6fc@orel>
References: <cover.1732762121.git.zhouquan@iscas.ac.cn>
 <35d9c91a69ebcb81b40dc4f7f51e290c3d94b2d9.1732762121.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35d9c91a69ebcb81b40dc4f7f51e290c3d94b2d9.1732762121.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_005032_540115_433ECB55 
X-CRM114-Status: GOOD (  14.22  )
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

On Thu, Nov 28, 2024 at 11:21:15AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Svvptc extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 4f24201376b1..9db33f52f56e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -177,6 +177,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZAWRS,
>  	KVM_RISCV_ISA_EXT_SMNPM,
>  	KVM_RISCV_ISA_EXT_SSNPM,
> +	KVM_RISCV_ISA_EXT_SVVPTC,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 5b68490ad9b7..67965feb5b74 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -41,6 +41,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SSNPM),
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),
> +	KVM_ISA_EXT_ARR(SVVPTC),

Alphabetic order, please.

>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
>  	KVM_ISA_EXT_ARR(ZACAS),
> @@ -135,6 +136,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SSNPM:
>  	case KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_RISCV_ISA_EXT_SVINVAL:
> +	case KVM_RISCV_ISA_EXT_SVVPTC:

Same comment as above.

>  	case KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_RISCV_ISA_EXT_ZAWRS:
> -- 
> 2.34.1
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
