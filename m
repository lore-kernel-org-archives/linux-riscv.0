Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16705C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDPL08GDjjPKyS/lPG75xjIkAtKQ6wGvzaL9jWb35qk=; b=pNEOxbmSJQcRZc
	JUYduKenAZpnXKZr0VjYlK+7JGg8OjuMem/A3ET+/MGkYT3YEJTGUh9IA9dZm6kOROo9tYLfYgbs4
	4kQo8i31aZPYgIHUNMHiiykGHe2jIwFGxDB4A0TYCsQ1ZecV50+DyUkC8FIKWnsO1X+mprG4mvHFW
	L9RJHWmn3LqXAkB3KzUixxg6y3epU6riaZyRk7Hwjtg5lMIGKqrkldT6L7hKIKnJ1ePCXRXjKasZe
	VvkxT8jHOGByv3GcWnsEQL5lwL7usc1MIqAferknd12Ms45K42dG4vv6BAbEYIBEN3vtxE9Ry9VQl
	CfZilM1ILp+p5xXE9Tlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJhJ-00000009PNa-0otP;
	Wed, 28 Feb 2024 13:10:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJhG-00000009PM0-357a
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:10:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a3f893ad5f4so757413066b.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709125804; x=1709730604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FODdgKK2rthi98pSiTYr1xV3lmm83pq/eRUzwYsWbyA=;
        b=mQMv0zFjK3kDgQIpRqSU7WQBhsl/emnWm+OnZFxcbeXaz62VdpCzvIpg7RHkPbZkTO
         4ORMdeC9COdHv/8JZAamAX6pKDbBm1H77d3Zob8LQ5ItnZscxN15ZrVnFKFOjwZ+BJGp
         L2eXBnN2Wo18AEADY7qnYUsh5e9WnbuNnw08/KXnN/+AczcrlcAHHa5NGoU799Rw4B0z
         5mxuKNlxvXi8fCthQb/hFWsZ9SW5tV+fhm4ijagsHlJ8KouVTLKh+P+Q5rjMgluNCJjM
         E6sG1i/VpxCcdveJfBU7kVEsGzH3ME4KyK3vEvEbNwQGcS9EeRBtci+5JkS6IhFYswk5
         y27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125804; x=1709730604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FODdgKK2rthi98pSiTYr1xV3lmm83pq/eRUzwYsWbyA=;
        b=LmO7pO7DLhquG84pQ93fPwYMDixzHQQAvY1rjla8fQ7wcvv6AikQlRsK6uNKWPpH7Q
         KXulNxQSupcJzr+B+ZlIG+YveZ2YSvDvVXeO+QoUqyRthM5uHiYGWZ2tqb2scfhwj+bk
         QsUFeuvxJyfCeRV5RYvyEwEfAxCGS12GDKkVcTcJSLBBSUB2MnGwbbfc5LNzkkDJoFAV
         hJ6x5JqGrCYeLQL+EboGoRDVAX+rj3rSIlHMWwuBrj9X4dmvJnJNkr1Y/G43DKcJSKgM
         pttgWoxMZcDgQ5EYtGCKZUo3Iclq7YnwL527sv/z/hn5CMh0xQQ7XQW+wWp0kS1+TJfk
         vsKA==
X-Forwarded-Encrypted: i=1; AJvYcCVZlboUbXq9rLMNhsvGeaFkhSh9dm4v6MbboP52HeNXjX9ZZ9ZGiFOxeQ5aBF1KkzoCFhdK8PfjGEEG9ksE1V1Qtj9x/hT26YKvY9L7kAbE
X-Gm-Message-State: AOJu0Ywx5Z6h3Imo7Oi5jNo0wOXauUfQXOUqx3cTf3Me7WmGqcJTWIfX
	vlvU29itVjuhNyNRrwBdfNZT+eIOpB610AmLdRNR1SS7v5o8Yvtii58q+2CkIbY=
X-Google-Smtp-Source: AGHT+IFU51uS0qjugebF15xN6PYsd3m2xoOUPf6Oc1ZPyAiIyB/H+qifcBeGzcYm3FzvQHH5BVTPkQ==
X-Received: by 2002:a17:906:ecaf:b0:a43:a1b6:67a7 with SMTP id qh15-20020a170906ecaf00b00a43a1b667a7mr3790245ejb.73.1709125804046;
        Wed, 28 Feb 2024 05:10:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ty6-20020a170907c70600b00a3f27031d7bsm1845582ejc.104.2024.02.28.05.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:10:03 -0800 (PST)
Date: Wed, 28 Feb 2024 14:10:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/5] RISC-V: KVM: Allow Zacas extension for Guest/VM
Message-ID: <20240228-0e0165118517dc2a94e60941@orel>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214123757.305347-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_051006_787601_5B2BC755 
X-CRM114-Status: GOOD (  14.41  )
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

On Wed, Feb 14, 2024 at 06:07:56PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zacas extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f8aa9f2ace95..37fb0f70b3e5 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZVFHMIN,
>  	KVM_RISCV_ISA_EXT_ZFA,
>  	KVM_RISCV_ISA_EXT_ZTSO,
> +	KVM_RISCV_ISA_EXT_ZACAS,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 38f5cf286087..f4a6124d25c9 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -40,6 +40,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> +	KVM_ISA_EXT_ARR(ZACAS),
>  	KVM_ISA_EXT_ARR(ZBA),
>  	KVM_ISA_EXT_ARR(ZBB),
>  	KVM_ISA_EXT_ARR(ZBC),
> @@ -118,6 +119,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_RISCV_ISA_EXT_SVNAPOT:
> +	case KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_RISCV_ISA_EXT_ZBC:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
