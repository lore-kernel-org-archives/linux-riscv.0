Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8726C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bc6f0GyQuN2Qms+GXu4dc3+jEBPu74B8meWE9r6nvI=; b=Xa5GQmbN9Ad4w1
	ND5uAut4lwQipk5Ubeots1EHebrPYxjPknQ2sIqT7BN24yF4zknCWtGTiNDaEQ8fTRU6mGYPscp5a
	mloCMZy5BsDgpPL7g0ZRCyrbdaYK+m8lx5Pv9bQn7KglkS1ibqXiR4TKFggE17rdrQUQn3XWB1NRm
	fq81jauy4CcqQ+JjMwyFgzOXtG8eLMk6+Ae93xzpJJbUxmUYYukt7lu6rXbgzDsL6+vwoWbGcujTD
	xX1g68sjglu96/kstcQW29hnun3s3yVjwePvqJTVoPzWSz79JlMyYxK8oB0rAdQUWjolDLJ5H/u8k
	vsXKcBYvTBnry6SaPtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbUz-00GMbd-6i; Thu, 02 Feb 2023 15:27:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbTj-00GLx1-GJ
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 15:26:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id n13so1680772wmr.4
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JvyQzIXrYzZCLKNZaj6R2VAhQkxcWFvbrbB71vdxiY=;
        b=NFzaXziAMdjXMefgcdiIfAgykFIib8kqV4hgNeJjK7p5d5YDI2LqUstwoCbzQzurAz
         io45S8prq1FQH4h5x5dwUpFdaBwyK3neV2Gx5dQQ3zg1scQDvsEqJkvO6Qh2+G4+8tdv
         Vw+VGgpptbsjVhDVpNayJJ0o0V4+wF94Ou9oCfK9m6VtQdLQKEK5wNUFP9oU2jT5c8rL
         DWsi+i/SGgJKRq4aN/PUXbz/yIxZjyi35j0Chyy649aw33SAdtKaUTOPhMB4aklU3Ktd
         cd1N75tJ+YuGpuCsDmQ9thbyXUhda0nxpCxP7sBXIq8wgp/ZS1qiASJYyX1WVlJkXYr9
         hZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JvyQzIXrYzZCLKNZaj6R2VAhQkxcWFvbrbB71vdxiY=;
        b=hgIXwkd7oy8q7qWOp7xkU5Tzsgqfg6Bix7rUrH6+/A6GtLq8ZXlSL5rj6yGZt1+Zsx
         By6eGhqV27Zxjh8zepdF3MRzi/R9C0wLAnw6Y8Cu9cbLbeuapDgGnXffKS1COjStzSg1
         gdBVeStBGFPsg24L5mSYOthsCNjzTmeFIzq/h8xiyNlvSGSBXSc2I1j7vV+MtDfR4WfI
         AsbK+8m8vTUheoBWZJhIWFoBZcwVaFh75xOmDO7k6SOTOcfjHPljUW1jcYo8Dfn1ssEq
         utObwOP1dyUpiQ7pRGvdRhfFZK2Y9btuJVL1D3e0kLn9bvvi7Mgy4gUDChtt4QDm97dN
         KW3A==
X-Gm-Message-State: AO0yUKWnFt5QurZy6i3WYP9/YPYY2xe+9l2wL0QKHsVuTcZJv97fScD1
	u6MmbJVUmIgjIfzeSim8HjQEZA==
X-Google-Smtp-Source: AK7set9A4n18kl9i4UwguaAeoWR339x/GVj5QRqPXZsZybE64WhTf8z+GJ2nA61mcrarXb55EnXjHg==
X-Received: by 2002:a05:600c:601b:b0:3db:2063:425d with SMTP id az27-20020a05600c601b00b003db2063425dmr6128224wmb.2.1675351581811;
        Thu, 02 Feb 2023 07:26:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm41967wmq.14.2023.02.02.07.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:26:21 -0800 (PST)
Date: Thu, 2 Feb 2023 16:26:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 05/14] RISC-V: KVM: Return correct code for hsm stop
 function
Message-ID: <20230202152620.q4vfqqqtbz6cfyf4@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-6-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-6-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_072623_584246_DBE0DEF5 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, Feb 01, 2023 at 03:12:41PM -0800, Atish Patra wrote:
> According to the SBI specification, the stop function can only
> return error code SBI_ERR_FAILED. However, currently it returns
> -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.
> 
> Return an linux error code that maps to SBI_ERR_FAILED i.e doesn't map
> to any other SBI error code. While EACCES is not the best error code
> to describe the situation, it is close enough and will be replaced
> with SBI error codes directly anyways.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 2e915ca..619ac0f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
>  static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu->arch.power_off)
> -		return -EINVAL;
> +		return -EACCES;
>  
>  	kvm_riscv_vcpu_power_off(vcpu);
>  
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
