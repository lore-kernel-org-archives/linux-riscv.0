Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFAC3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2+t+2VJDZe1F4m76myRhBjiJb8glMVVd/4krjWhUfA=; b=SEcvCyF5+TM83D
	A6IHfDYPkD7OAiQPkcWHzvh5fANUccnP1LTWq3muFC8/LXSG0PazwnqVTz9ECehxgCosaId63IbFw
	D6mf/Lz5Wr/b1XeCgkbv7lmF69E9LNU4RXVUOdlPEMY7+A9jqlip6z2L1w5jrFCmXKNV2t3HHEAjx
	h7mepnxCROiLUeIid2E0guB7iN+qWYRx9tdLrpsrNzrDQI2l5tJvb0ri2enBTYdW2lJQbnfnP7dym
	+fWNdksRkSLHvmZUVm2E7ykBV760b6IssonMGYpnPnfmodnrQC3k0By0Z5PoyJWqC7YuDoHHW/iDk
	nZNfQOcawDsxw4FcxXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4Tw-0000000DrAZ-295z;
	Wed, 17 Jul 2024 13:14:08 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4Tu-0000000Dr9U-0iKy
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:14:07 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-36da84df7adso2522725ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721222044; x=1721826844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5uVCb0H5+qw23qlc6XhoPIVvBE69YNuKQHQJOvzKA2E=;
        b=F18JXOmrNmI0lFB4LJUI2ltYyyQcHlrlUtw+h7x6rxzMdkG0zKlV6IfHZxMuFWHg28
         E3HJBrpaYVcL5OvmsdsTIo26yoqiVbiJB3KpcpVO8W6Ksx4bA0FM0j/zG3IfQhnwldPf
         e/JstgnrQTHo4HS7jl2F704pUZqdf9rH2d26zEZV7hOPXLJLU9tlq/dj6/9oG6ERFE4Z
         0qEqPBe/zvK3mX3ZcJkRazQsibYAzQuoHPD4ewBxaAh7naNVnHuUvMDoXY4TiwW+1gzi
         2XUPbx/TzghhlCqd1pZxfJY5zgYKvUGuXPlGcsuX0AY8NG/70HIT1qktV5vry7I58KGY
         FJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721222044; x=1721826844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uVCb0H5+qw23qlc6XhoPIVvBE69YNuKQHQJOvzKA2E=;
        b=RozTZT+J5Bqaj7tASIPxMHB7mk84L2u/OEaLbebQa43rTX5toBHsb3r1FFfXNBLF1o
         THm+TBpy4ljOXtzjHVecUmH0CkCCj4b7p/l5acBlzp/RABAApvAdBb6oABpQXe8FjL+6
         m2yx9fmHPmAqPQFCRhdWxGOq8q42xk8j6e7X/nlwKlm0tDTjxnp8MG/WTt/nixfqj82K
         VpUun5+Oj60L8jtP5WXfW2wQmR9RGVXT4cF43syh0Jekbf4hFAX9mGgRxF9qGOdyyPsv
         2ppkyoD1mimOMmYCRyskfUB/8M3sDntGhKUn1FrwAUc9lrEpaNKTFjdBepsY1ryN/nxV
         Rc4g==
X-Forwarded-Encrypted: i=1; AJvYcCXjLK6KvBfpeZ9wSuk/BFzBAfhCbWo52hpy+1oE2T1xQIqrEOnogoSEtcjcaL537t9iJd5bAWYfyQL9fhnFTw142oYjqG3JeD8D6PruXgvb
X-Gm-Message-State: AOJu0Yzt9r3ugfX6fEmwzchSJgWN38LewtrgXver9DIUtUS0s7gat+Yq
	FNNY1eKzyasClYmp/0etowNW9ryy+tgn844F6f8OKt/1mDmd1UsAdKRk4azilO8=
X-Google-Smtp-Source: AGHT+IFhw3MWoZSEt2rfShEC06vRpqsGgviNG/vejjaH60Y+5HYzE8TtnavkRKo4N4oXKY9d7Dnl1A==
X-Received: by 2002:a05:6e02:1c0d:b0:376:3c3b:e235 with SMTP id e9e14a558f8ab-3950f2855e2mr16902955ab.13.1721222043808;
        Wed, 17 Jul 2024 06:14:03 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c210f7c4c8sm651830173.130.2024.07.17.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:14:03 -0700 (PDT)
Date: Wed, 17 Jul 2024 08:14:02 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: sunying@isrc.iscas.ac.cn
Cc: ebiederm@xmission.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kexec@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhuhengbo@iscas.ac.cn, Petr Tesarik <petr@tesarici.cz>
Subject: Re: [PATCH v1] riscv/kexec_file: Fix relocation type R_RISCV_ADD16
 and R_RISCV_SUB16 unknown
Message-ID: <20240717-c761f5af7369cdeba5b9c759@orel>
References: <20240711083236.2859632-1-sunying@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711083236.2859632-1-sunying@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_061406_234462_A487B8C6 
X-CRM114-Status: GOOD (  14.23  )
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

On Thu, Jul 11, 2024 at 08:32:36AM GMT, sunying@isrc.iscas.ac.cn wrote:
> From: Ying Sun <sunying@isrc.iscas.ac.cn>
> 
> Runs on the kernel with CONFIG_RISCV_ALTERNATIVE enabled:
>   kexec -sl vmlinux
> 
> Error:
>   kexec_image: Unknown rela relocation: 34
>   kexec_image: Error loading purgatory ret=-8
> and
>   kexec_image: Unknown rela relocation: 38
>   kexec_image: Error loading purgatory ret=-8
> 
> The purgatory code uses the 16-bit addition and subtraction relocation
> type, but not handled, resulting in kexec_file_load failure.
> So add handle to arch_kexec_apply_relocations_add().
> 
> Tested on RISC-V64 Qemu-virt, issue fixed.
> 
> Co-developed-by: Petr Tesarik <petr@tesarici.cz>
> Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> Signed-off-by: Ying Sun <sunying@isrc.iscas.ac.cn>
> ---
>  arch/riscv/kernel/elf_kexec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 11c0d2e0becf..3c37661801f9 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -451,6 +451,12 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>  			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
>  				 ENCODE_CJTYPE_IMM(val - addr);
>  			break;
> +		case R_RISCV_ADD16:
> +			*(u16 *)loc += val;
> +			break;
> +		case R_RISCV_SUB16:
> +			*(u16 *)loc -= val;
> +			break;
>  		case R_RISCV_ADD32:
>  			*(u32 *)loc += val;
>  			break;
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
