Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FD6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=svRYJOyuy/Mkq/eadFODQYCpQHzzL1VKlOFFDg7S0F8=; b=pjMezpFZ5I9O9943F4NraBTZSl
	R8ZePybGzxK2a9Q2X9xHYx0YcV/C5vR9gQIT8NWtx29CMpF2c56AsTspgMG6SdUKliC+nVeFE3QSD
	iAte9j8pJbNURWVo5NQFZeBKdlfYTD3AxkK9o3YqfMglGIWHrLxzvRu5v+OehHB/YHo8ubaZ9b9T3
	4Cerpz72sjtT1RmSxcsAUceRbh4R5hgkr6kd+aXv9E3OBOvqUi+jI9PF/USd0Hwo5LR/wW7ao1sgl
	3flLYlUVzuzrDHgbLstvdMesUwBBjPA8csgPtiXUbUzn7cI99KCMFbVGKUmhAg9AIiEi68PlRkHoR
	c/VlJPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAgH-00EsRA-Sq; Tue, 14 Dec 2021 16:29:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgB-00EsJM-1X
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id q17so13894211plr.11
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eGG/x4QPCqQaP6RMM2MdkMv32cbPnjErqQtlCB+0gYU=;
 b=glgVLWX7QdhSZMa+a5vYgaJNAC6Eun2qtkU6G4DuAhBKTePbsoQ0rQfp+LKTdbZv4L
 AZBBsQDh3nlUwz8Sg2KxLy06NLZshqPGCOUnfRb+VaYhapvTpAmOf14EAHvr49fBYs2L
 NnciCdq7E2Pe0IVgR4tyw2gnMJgx9UAjfMyQ8OOo2v/0G2GceDxa6ACzQOxQFjFbGscR
 RrhZYHtvF88ZWRoDke9HIR8ISicxXy/TCBsp7+DGvMn0RMdB3MODY0LhWcjV9JlUQs8f
 7sGdreaJ/pmbNSBaDJ70UFOTJVgXvG7jBAd+82M0xwkm2pN2kb/qNnOUJeq4a7QK7OtR
 jXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eGG/x4QPCqQaP6RMM2MdkMv32cbPnjErqQtlCB+0gYU=;
 b=ZzDtuhK/2POvLWi3nGtZdkbES2Z2mpNZB30OUonqeeHWcqQ6GTmatUp1iKap5z2KQl
 /7XWPHDdsyyR6UcQPu1BbruAleUuRkFe9dnbJbdpdncaE5S85xqzAZlFuDp/xWtnSGNd
 Z2q5SWvap2tHs6haKyVtsD55B92nOBc5MIUrWgrQaSEzQ8G4YBE99/vOnabbbc/KpZtb
 daQO10cGUjbIGIg9ZzBo+VzW8wsMtav7PY/GHswfmIGzV8roYMSe3EF5A2BGQZyu3YHm
 ZSfc6mnapiQPr5YcDvdxrnzASmAJwWG4+UQZ1vQ/qmwpdt0tmrg+5+uCCXfU/ZKo0Ihl
 Mn+g==
X-Gm-Message-State: AOAM53268LEPD+ZNliGxL146maUXX4ZPdbrZjbEyh4hQ2jqntN8XZFmT
 TpZ58sSrY63FY2AjFp/oN1lOcw==
X-Google-Smtp-Source: ABdhPJy1wQZ5WGmO3vI65foVzRWZ21x/ADXJMxiQZn5VY0tHECLjo8zjzS6MdJfZJLL+1q0/L+EfBg==
X-Received: by 2002:a17:902:b097:b0:141:ec7d:a055 with SMTP id
 p23-20020a170902b09700b00141ec7da055mr6449771plr.3.1639499361893; 
 Tue, 14 Dec 2021 08:29:21 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id h15sm301593pfc.134.2021.12.14.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:21 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:21 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:18:04 PST (-0800)
Subject: Re: [PATCH v9 03/17] riscv: Extending cpufeature.c to detect
 V-extension
In-Reply-To: <802edef897b4bd40f3ebc2cb47c02b8e2f61a666.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-37fab3bf-8fa6-4f02-a7ea-a19f775369a6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082927_126632_BD444A27 
X-CRM114-Status: GOOD (  16.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Nov 2021 01:48:15 PST (-0800), greentime.hu@sifive.com wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>
> Current cpufeature.c doesn't support detecting V-extension, because
> "rv64" also contain a 'v' letter and we need to skip it.
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c      | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> index 46dc3f5ee99f..c52bb7bbbabe 100644
> --- a/arch/riscv/include/uapi/asm/hwcap.h
> +++ b/arch/riscv/include/uapi/asm/hwcap.h
> @@ -21,5 +21,6 @@
>  #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
>  #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
>  #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
> +#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
>
>  #endif /* _UAPI_ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index d959d207a40d..7069e55335d0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -73,6 +73,7 @@ void __init riscv_fill_hwcap(void)
>  	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
>  	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
>  	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
> +	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
>
>  	elf_hwcap = 0;

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
