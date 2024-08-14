Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E92C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRQHf92x2UlcjeZLJxzSVkm2ee7areLiY3pcn2MEAAQ=; b=xwwX8KNkhRpKMA
	ftLvO/mW0sXq6RQqj+lFHP7FHcbRmAjyn29HrHfOGZTXl+N6/+ESjD8TXCy18VqXZoQcvTySc63dS
	Aot9Y/H7FEujYmFrIE8XieeZZe5iLLuwo3bAbQqtbMm+JvXKUm/AS1fVFbC7DyOWbKYDb5ZG7oR3m
	OBQiuWZ0ap0I4yKEJCxctgL1E6Qv/Hm896o3r9Y5OjhB8GdsHJskVtB5tSTOaxkwt9IJf5ACo1Rkg
	XDHlzDsIpe2xCjKXLZSYXdA9bCriGa9vo3zFpnpH+jL46BplvfZON2qLHHTpQpouvl04ZU+TA1TFK
	vMKn2CTOGXKEgwqh2FHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seKWO-00000008AMz-1JIr;
	Wed, 14 Aug 2024 20:23:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seKVQ-00000008A5p-3kHP
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 20:22:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fee6435a34so2067605ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723666923; x=1724271723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stUNjkX0MpnpU5tgftjr7ORKywYwQiBPnahluN05hMI=;
        b=bugtmaSD8HvGf0pFghjrObhwbGdjYEIZk5/5W9O1QQ5nsK7GGUoKc65gjXFvj4cg0K
         nv+yQtLKEjV+Fe9cY2MFELsCtr+9W2uOYQlkHZzPo+LtrK4mxDmZnXxe3b3QKzfHGY3k
         ZRhV3O+QvIu0BHHczPHyGYDitOhkG9p4edoYntxj0GaGyE6cdLF8/PWttPzO3Ru7T7Jc
         GV9IiLY4D0Iik9r8b40d4mNmilNES+3nScKUulTUrtcltb78qG42dJTPO+Pm+Dpa253t
         QN6mom30KKUH1otwUIO/jDHKDfA4bf4zznIDujMY1OKUiBRtzzLeT5TgPjwiaBkZBbtC
         vCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666923; x=1724271723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stUNjkX0MpnpU5tgftjr7ORKywYwQiBPnahluN05hMI=;
        b=BwhBY/hAA5NhWATc1bVDouLt3moHtKsklvEsy1QVAalDygULXwwyeU4ebBOzJowgrL
         CW+c8QA/J3EDaN4XVsSv16df988uPS3YmqsUaFUcxoMySv6T13MCOfZs8Zb8W0BeYt8o
         IY0LLWl0VLqv+nJMIZjU6leQkDBSICE5JwkitBj4wQCWBOMn1s0ZBZcSAbHZWjPVqyET
         MUzp8CttjPfli/dswaZvkt2LUA1mXn7fxmQuLGFwN5z3Gif0z7v3rC0u+YHAXEdlLQW2
         fdLoulexdWeOuw6mUZBTUIY6irBGCPA9muApQRpuQTkpa6MBGadKelWgJkiba/53Z69H
         wi8w==
X-Forwarded-Encrypted: i=1; AJvYcCVd0sbTBu12MP9ZwVoukOkYWKL+P+qTTvJ2VIdv+VevInzKFx3IkL11rykuHGkgScn7Fn5zsw9wOLZaOVPiBtjaVcXojN+VF1FDDtQkoy2m
X-Gm-Message-State: AOJu0Ywv+UyQUkV7sD8Cnc6LwPmROjzrsdCbdSAnXFaQo+b/qWI0uqr9
	EIH9TeuBP8elfZlJA139zLGYqd8ds5ySYCDs6C3CFpEwa0gCLoCmGT/CYOW0UDs=
X-Google-Smtp-Source: AGHT+IG0/CFBU9Bq6alVt+gaPLnIf7VfsUi7sesDXbH+O9QNL5l0cs0hatjNsXRKHdrcTaXkzS3OXQ==
X-Received: by 2002:a17:903:2291:b0:1fb:8c35:6022 with SMTP id d9443c01a7336-201d6393a51mr46560335ad.4.1723666923538;
        Wed, 14 Aug 2024 13:22:03 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f038b4d8sm238005ad.206.2024.08.14.13.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:22:02 -0700 (PDT)
Date: Wed, 14 Aug 2024 13:21:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2] riscv: Fix out-of-bounds when accessing Andes
 per hart vendor extension array
Message-ID: <Zr0R5/gHWGs+eK/5@ghost>
References: <20240814192619.276794-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814192619.276794-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_132205_210330_D181B1F3 
X-CRM114-Status: GOOD (  16.60  )
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

On Wed, Aug 14, 2024 at 09:26:19PM +0200, Alexandre Ghiti wrote:
> The out-of-bounds access is reported by UBSAN:
> 
> [    0.000000] UBSAN: array-index-out-of-bounds in ../arch/riscv/kernel/vendor_extensions.c:41:66
> [    0.000000] index -1 is out of range for type 'riscv_isavendorinfo [32]'
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc2ubuntu-defconfig #2
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] Call Trace:
> [    0.000000] [<ffffffff94e078ba>] dump_backtrace+0x32/0x40
> [    0.000000] [<ffffffff95c83c1a>] show_stack+0x38/0x44
> [    0.000000] [<ffffffff95c94614>] dump_stack_lvl+0x70/0x9c
> [    0.000000] [<ffffffff95c94658>] dump_stack+0x18/0x20
> [    0.000000] [<ffffffff95c8bbb2>] ubsan_epilogue+0x10/0x46
> [    0.000000] [<ffffffff95485a82>] __ubsan_handle_out_of_bounds+0x94/0x9c
> [    0.000000] [<ffffffff94e09442>] __riscv_isa_vendor_extension_available+0x90/0x92
> [    0.000000] [<ffffffff94e043b6>] riscv_cpufeature_patch_func+0xc4/0x148
> [    0.000000] [<ffffffff94e035f8>] _apply_alternatives+0x42/0x50
> [    0.000000] [<ffffffff95e04196>] apply_boot_alternatives+0x3c/0x100
> [    0.000000] [<ffffffff95e05b52>] setup_arch+0x85a/0x8bc
> [    0.000000] [<ffffffff95e00ca0>] start_kernel+0xa4/0xfb6
> 
> The dereferencing using cpu should actually not happen, so remove it.
> 
> Fixes: 23c996fc2bc1 ("riscv: Extend cpufeature.c to detect vendor extensions")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/vendor_extensions.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
> index b6c1e7b5d34b..a8126d118341 100644
> --- a/arch/riscv/kernel/vendor_extensions.c
> +++ b/arch/riscv/kernel/vendor_extensions.c
> @@ -38,7 +38,7 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
>  	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
>  	case ANDES_VENDOR_ID:
>  		bmap = &riscv_isa_vendor_ext_list_andes.all_harts_isa_bitmap;
> -		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
> +		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
>  		break;
>  	#endif
>  	default:
> -- 
> 2.39.2
> 

Thanks!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
