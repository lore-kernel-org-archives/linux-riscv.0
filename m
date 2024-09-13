Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328BCEEE27F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 02:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdt7atHWZlOVyAAkNjKsN1/FEG+t90BjlQg0R9JRBQo=; b=jIHviI+B24FaOT
	ObeG5C6QHYkWJyzAB2Cj7Xrr87f150BVrbKXi0AK/X3ftnxEg4KwFlVoXhjWP8Q3zUkyGm2jGc7d0
	uXWXmocPrBCbdhIqaZ0wyvz24PQtN96k9CeukM7Gsj2rS1LE5CDcv9fzu3vqNLSTvl10yO5PYFunh
	7f6bmF8iUrF942d7BOD36MGxjvehUXjFEPThxGFIhlJ6ByvcOJaRiWTViquJIjFoaWwQZyjf4Zv6S
	tOXSgBqZueKzXhrxux0yFpxnBVkAYABf948fLoZJs00N9NzG5uYdo3og7H7/jPGAwwRaZjqrCTBQL
	ABk5nBNsdbyxmvyE89/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowPA-0000000ElXs-1Mog;
	Fri, 13 Sep 2024 02:51:28 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowP6-0000000ElX2-3tFf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 02:51:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7179802b8fcso370859b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 19:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726195884; x=1726800684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lucKHZRD1F8sNhQoF0GbULdmAnhRsrGT0LLKCZjQ8Q=;
        b=DJxOE68iCzM4Qr4PEvBnsz9fwYA4dXZAtsWv5EcBNM0OYYyKoXuXGlQkD0I4gWjCXR
         ahAzn7hH9Nlm0xPkqXNfBAz5KQ3e+Y5fTVvC8ljQGpb8lCn/comPw0EHqKHL9U0iQ8Rx
         W10SuOPS5FZ5Thy5CXnBoxSUVpBgAWGXaOpgIa9hEqUVFoeNwqqbhvg37wCKdhaFE+r8
         Ge2nDSed9icHSd0/D3udDtdkKffw2ftKhTaQdugFwJUFwh4ntMF7G3VoGYEaXq4YO1gW
         1ULJtm0KvbIMfwCn3P/tt2xnZM5W/yhAyVSKXPMEKgPJXBNVt8YXP+ZZ1W1C4f/D1FWn
         vo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726195884; x=1726800684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lucKHZRD1F8sNhQoF0GbULdmAnhRsrGT0LLKCZjQ8Q=;
        b=J7rPAHXV4IWmDwBGDp9BT6VylSAEszMjEBrCN1IoDAb7F/S7yvL88XUpRk3pgmfip6
         GMnQZ24aX9QGKmCJe7A25m2xr9YJwzfPAkeZM4x7KvrLIhn/IyR7I1ev1iVoC0Oc5W0k
         5PiXv0Z+rmE0dDc42yjH8zcXtydDOcIPzwrqbEomjKUrcqrhEeBdF+mImpw/aLJpk1hw
         JNYJCOY1wtmQTK88co+g6fsJEdGrSNNW/wQBc85BzHpFVEjcBvH5FKIXqv5S+3bQsDE9
         7XvDfoCmV+D8NHSqPj9jwWbfCnUzn+M2AhGfTychBBrs6LA70lVFksieokFRv0UaODbW
         gzJg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Ww5Zrelj3xTr9+4fCyh/mGVnbQkFVRu8xqta5XS0j5jsVCRodYfTwtn74adRvplpGZ2polb1bx7+HA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0+kaO6k2a4J6dUjk7aIO6VkuF5CWIU/2d7DIZQ+met+dvpu71
	9vqarA6aWItljQekppsuB3ATY64Me+Bu3dirQkt6s0inHB2l8ElD14NhktPPRo4=
X-Google-Smtp-Source: AGHT+IF0SPnqCcWggj+ZbMP5BdP/rIV8aCEiZw6gABT7Jq6B8FmEO+5IPUNs4ZDtOMOgvUeBHKH7Nw==
X-Received: by 2002:a05:6300:668a:b0:1cc:cdb6:c116 with SMTP id adf61e73a8af0-1d112db1368mr1881160637.24.1726195883833;
        Thu, 12 Sep 2024 19:51:23 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fc8febsm5398290b3a.19.2024.09.12.19.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 19:51:23 -0700 (PDT)
Date: Thu, 12 Sep 2024 19:51:21 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v4 06/10] riscv: Allow ptrace control of the tagged
 address ABI
Message-ID: <ZuOoqTfKs/7G075O@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-7-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829010151.2813377-7-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_195124_994090_EFDD54C6 
X-CRM114-Status: GOOD (  24.42  )
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

On Wed, Aug 28, 2024 at 06:01:28PM -0700, Samuel Holland wrote:
> This allows a tracer to control the ABI of the tracee, as on arm64.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Since this code is identical to the arm64 port, could it be extracted
out into the generic ptrace.c and ifdef on either CONFIG_RISCV_ISA_SUPM
or CONFIG_ARM64_TAGGED_ADDR_ABI by adding some generic flag like
CONFIG_HAVE_ARCH_TAGGED_ADDR_ABI?

- Charlie

>
> (no changes since v1)
> 
>  arch/riscv/kernel/ptrace.c | 42 ++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h   |  1 +
>  2 files changed, 43 insertions(+)
> 
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 92731ff8c79a..ea67e9fb7a58 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -28,6 +28,9 @@ enum riscv_regset {
>  #ifdef CONFIG_RISCV_ISA_V
>  	REGSET_V,
>  #endif
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +	REGSET_TAGGED_ADDR_CTRL,
> +#endif
>  };
>  
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -152,6 +155,35 @@ static int riscv_vr_set(struct task_struct *target,
>  }
>  #endif
>  
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +static int tagged_addr_ctrl_get(struct task_struct *target,
> +				const struct user_regset *regset,
> +				struct membuf to)
> +{
> +	long ctrl = get_tagged_addr_ctrl(target);
> +
> +	if (IS_ERR_VALUE(ctrl))
> +		return ctrl;
> +
> +	return membuf_write(&to, &ctrl, sizeof(ctrl));
> +}
> +
> +static int tagged_addr_ctrl_set(struct task_struct *target,
> +				const struct user_regset *regset,
> +				unsigned int pos, unsigned int count,
> +				const void *kbuf, const void __user *ubuf)
> +{
> +	int ret;
> +	long ctrl;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
> +	if (ret)
> +		return ret;
> +
> +	return set_tagged_addr_ctrl(target, ctrl);
> +}
> +#endif
> +
>  static const struct user_regset riscv_user_regset[] = {
>  	[REGSET_X] = {
>  		.core_note_type = NT_PRSTATUS,
> @@ -182,6 +214,16 @@ static const struct user_regset riscv_user_regset[] = {
>  		.set = riscv_vr_set,
>  	},
>  #endif
> +#ifdef CONFIG_RISCV_ISA_SUPM
> +	[REGSET_TAGGED_ADDR_CTRL] = {
> +		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
> +		.n = 1,
> +		.size = sizeof(long),
> +		.align = sizeof(long),
> +		.regset_get = tagged_addr_ctrl_get,
> +		.set = tagged_addr_ctrl_set,
> +	},
> +#endif
>  };
>  
>  static const struct user_regset_view riscv_user_native_view = {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b54b313bcf07..9a32532d7264 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -448,6 +448,7 @@ typedef struct elf64_shdr {
>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
>  #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
>  #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
> +#define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
> -- 
> 2.45.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
