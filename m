Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A917DC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4Qw/BrQTF1cB65Ev6rXcovsQvj/iu30TtwTB+3TR2M=; b=N42pddq5KGruOb
	OrAXhOp50LuOeTRwvkEpkUPmuZrpfybjjfY6n1uUfNtaJdSVgu6vy0zBH35B/5JhTOGW2BDCZUbv+
	InHFo/wNtb6fhGIFTwtuS8PIHN9PQa3tL9IQQULF+HlTdUAja9jD0bpG2Q4LJvM6svMoogX8HXCva
	MfHN4+3be+Un57iUIX4JD3r1NeBmbjJuwpG2c0vLd1PhXCEbes4VejY/zyRh+nFvBqBooUbzp3bJH
	oPj0j4gPniexV3VXWH20liw2KMx8cMWqqMrUnkM82jqqio3vvPOLCXw9UfvyYsCcclhxfXfctni1x
	Sly6PJK/Wb48cgLmFxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJhg-00000009PYJ-3FLC;
	Wed, 28 Feb 2024 13:10:32 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJhe-00000009PWo-1Mb3
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:10:31 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a3f4464c48dso657247466b.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709125829; x=1709730629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2NAebkb74PRN2BzyJL1cyLz7aGeJCOrEFsttYow7lE=;
        b=MnIYJ1lcry4m1N1MNQkCaSAZ9FngIrrcBIUW3znHDOzQW3x72Rpf2q+HVaW+mZEhKZ
         Lvu1eFw/WV0TdZ/OmabVbpLYrDIwHf1ds0+lJVfuT9rasAV8hQMX1+ihg+NY9aOjmvOX
         JslDQQgAjmR9XNVeg+pg8hOKbGNP9RzcliI4g/hYuAfxaFmsf/k9Z/j/LweYkSIQG1tR
         rjC+Qo8PfN+a7KKkB9xnzev+rBTtEL1TrhPxS+Yt6rXx2HQc1Xnn6ocVD/RWSwfxfDMB
         88gkr5ffewIEm4YprmJNrDnQxM0gssdzfrZt5ZWV/xPu5PYOUG6anSBJYO+Fp3CXzRvW
         Q17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125829; x=1709730629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2NAebkb74PRN2BzyJL1cyLz7aGeJCOrEFsttYow7lE=;
        b=bUAbCfUBxBg6a4xvqqpmtA2j8de5UzT5cRvhUGMvysfJkVGxquSRVX7ieS+K0b3pVD
         Ow9L5iILO+9cyUQre1Q3qmjYaFxFUrgRd5ozUZlHuvld2H9V1JdNZx0/lfNXErOfLuB0
         RbwQ5I3v1D761JtH8Cyds5EwSQM5efkjBVB1rh2N4iB3kmBJjHQysoVbr5d27oSgkY3R
         F5BjFUxqyVlWkE3fibIHu/TPAhjh13PlsKKZEFcORBAJO/qd3lh1f3JSf3xzJaNiuY79
         SyAbBk95uDwTa3423G322T8ZQ/+SGxkxketp9sxUKwNjLnoeB3WlQqU+52BadN0BD6AI
         6jwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmp0gtlyuwFD85u9Js4LAxECuY4zvw8ZRG+i7vYl6Wt8a4F2VcVE3tT71alof04c4V92jE0XlieRDv4qcYqmWWSoSX+dPA28LGSj1xngyQ
X-Gm-Message-State: AOJu0YwTaa6Okz3cgl6xGPB6AZLZedgURVbUP5FW5G1kxpeSiz/bdWft
	mwVw6HwHGLBGnVMzAYFay7JFWiUp/cnZylJjxJrI8vAC11FwYFRm/cJkVcJbXWMW98ycm/mwInj
	c
X-Google-Smtp-Source: AGHT+IF5HIjUzKDomFUnEg6DOvdb72PcuesnipX63O5viuhCdygq+/+gijCmgtIJP5epcZJ7ZF3eDQ==
X-Received: by 2002:a17:906:c305:b0:a44:21c4:91b3 with SMTP id s5-20020a170906c30500b00a4421c491b3mr105263ejz.44.1709125828798;
        Wed, 28 Feb 2024 05:10:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i25-20020a1709063c5900b00a3f596aaf9dsm1851570ejg.26.2024.02.28.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:10:28 -0800 (PST)
Date: Wed, 28 Feb 2024 14:10:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 5/5] KVM: riscv: selftests: Add Zacas extension to
 get-reg-list test
Message-ID: <20240228-8f3f6703b3c14ceaf169da3b@orel>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214123757.305347-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_051030_389047_43E4FEDA 
X-CRM114-Status: GOOD (  14.21  )
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

On Wed, Feb 14, 2024 at 06:07:57PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zacas extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 5429453561d7..d334c4c9765f 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -47,6 +47,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:
> @@ -411,6 +412,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(SVINVAL),
>  		KVM_ISA_EXT_ARR(SVNAPOT),
>  		KVM_ISA_EXT_ARR(SVPBMT),
> +		KVM_ISA_EXT_ARR(ZACAS),
>  		KVM_ISA_EXT_ARR(ZBA),
>  		KVM_ISA_EXT_ARR(ZBB),
>  		KVM_ISA_EXT_ARR(ZBC),
> @@ -933,6 +935,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
> @@ -987,6 +990,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_svinval,
>  	&config_svnapot,
>  	&config_svpbmt,
> +	&config_zacas,
>  	&config_zba,
>  	&config_zbb,
>  	&config_zbc,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
