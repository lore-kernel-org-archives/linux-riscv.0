Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01800CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tHb59XqVxduvBox/DXdNUI41x8LHfSpfZSUsJwZnAM=; b=D3q54FEmMm2BLv
	bSMoSUSDXEq7iuQf+ftq/9dyf/meoGhDiNExjioQlkF1bp/JWwRXuPRxrfbfTFb+Sc5dqQp3EsNtS
	2aRpbbMxomvKmnAmc6vwEWilLBtFkdWdfqV5QtUf3MCHfgt/JU3Mhj9HRLnJTJcbHNy/3B2n+RUwt
	OxDl6H/3LAsoFjqTcDNlknv8wWI5ntx9/05QmOMsfQkvrliVrfOOXVboAPspDI9cgvQjCfD6o/2dk
	e6xPJpN3E+MFxD8UXO+QcE2ScDVBFC8HdLmdbQe/BH/xyN2twp+BFnnQyoqbOS5IbaCzcxCYlDI02
	YTVFIymRRnXVDeAIv2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0sp-00000007kxk-3LKQ;
	Mon, 18 Aug 2025 14:30:47 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ne-00000007k0R-0oUh
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 14:25:27 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-88432e60eebso93868539f.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755527125; x=1756131925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyQYJ8E1IoELk0qTlvKHUstdV7nwQIqLjOnOuTovC8w=;
        b=b0aSvsgLWsF3EQSjC6Xw1QKp4FE92Q37/ybMa9OVm8TtO2WaZLuHOxuWTlO7jKeHej
         6ndhkhfyf/XTo3okUSZbpeuJHl3lv5G/zdz5kgupdt68TrlhHf91gi4Bmw1dNVdahw50
         ud7tPWwbpKzw3QBcEC887kYd1QjaSwf2Gcn92/ELF56bbd9EbClx5/o5UoL3bw6NA52M
         VOKEMkcIX0r7nKD+4t3RRxpK3EAPjzIjLMbydloeJyNwkJphSo3OUE+/Xx53UWCYo7NU
         YyZbIt3Hv343jBvD8kBCc2Ih+td7KLqEXfbcUgcFKna7wlytn0ZCM0PP7/YVh3pZeC+Z
         PScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527125; x=1756131925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyQYJ8E1IoELk0qTlvKHUstdV7nwQIqLjOnOuTovC8w=;
        b=aPzo3L5FnehHG8xeNVNmMtSeL2wIhTM3fZz+6MP5v7fYhvOuy4dIkEIp0CRtoL2HQF
         EYuz5jbYsmy+3dQYBK9kLmhSZqQYTHopMtVoY3jHbrt30sC8ix/SsBOMALvuzuV9Vb+A
         xE4nHAcI/7Y8val0N6tLoiv6MBDBhpEkEDmrse4c1ntWRm5Vlig8cLJZEFy4H6maYcHT
         Q8Bz9dJk0ciAIgz6f/iTljDs/8m4fsxntmoGFGOOcQ6CChoALvEP3RdPxPEw1a7tu5Q5
         ZVnrnvfAev+bvU4duRxhAoghpifftrCUTxu9P3sD/U6DlGWDmzcLLXu1wQqIq/Fse7L8
         5tXA==
X-Forwarded-Encrypted: i=1; AJvYcCWndzOtDeorRETw+QCZjTr35IzKesbFdNJs+h6V/bupFNQK4bNR9Bk5M2FzwFZRQTFubJw/a2hJdTH0Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW2y+w9inNAgU/G+OJU0HsszsQmHkUn1DHIJ1FMtdfOtZSeFTd
	gZaf0rFqT5YzghjsAsnwanbIzniaf5BAbVhn6DlzxkI1zOKwR51YpgrviERMYjUcgg4=
X-Gm-Gg: ASbGncvWQAkI0EX3Q1qdm+MeXZgGb+pKbcezjRO5RyATR9IPZQ3YIGf6QRlV+Vo+Bx/
	QFgIlzpOGrJLyJKu1b3y42Q4KSeNxdIRJFTpmL1iKfjlFIpp4ygx2dQRZnaPMBN1G8/5TGPLmvz
	XWhjHzYI3hQe5KDUaA7cVjUT4B/RxCDW/x6kpfiS754ctnpDIz3ntqWd0mHIMXvU60KQ0T3Zc2A
	juptE40CdFrjf+O+Cydyon63PMsfHnh4jWyhMV9vJHssHDoP/Rynr7zn4cS3cqtQpoe9RMq3KaH
	II91E0fz4kh+fNV2PTkASjF3weXhLAaYkvsyuysEBE4CGzSxJypAA6uQ0FoUPoaicrHeC1dkR3s
	mCUSNnaXqfal/3WWo22+BOzNT
X-Google-Smtp-Source: AGHT+IE64bGylTNTCod6VJPB6Kdqx/YvIcxD3l3x6WiSKJyPUG0tS+DbyXFafnmRow5N9BI1j9Ev6A==
X-Received: by 2002:a05:6602:1687:b0:881:8a24:55c3 with SMTP id ca18e2360f4ac-8843e36de4bmr2011895139f.1.1755527124401;
        Mon, 18 Aug 2025 07:25:24 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c94999fe0sm2564173173.57.2025.08.18.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:25:23 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:25:23 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Correct kvm_riscv_check_vcpu_requests()
 comment
Message-ID: <20250818-3808a778aca8606ddd126ebf@orel>
References: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_072526_235302_D480BF3C 
X-CRM114-Status: GOOD (  15.90  )
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

On Mon, Aug 11, 2025 at 10:18:29AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Correct `check_vcpu_requests` to `kvm_riscv_check_vcpu_requests`.
> 
> Fixes: f55ffaf89636 ("RISC-V: KVM: Enable ring-based dirty memory tracking")
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f001e56403f9..3ebcfffaa978 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -683,7 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  }
>  
>  /**
> - * check_vcpu_requests - check and handle pending vCPU requests
> + * kvm_riscv_check_vcpu_requests - check and handle pending vCPU requests
>   * @vcpu:	the VCPU pointer
>   *
>   * Return: 1 if we should enter the guest
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
