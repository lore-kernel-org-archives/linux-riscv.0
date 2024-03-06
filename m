Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3D5C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Nje5D3ST9d4PVCaNWDiG2vAyfkq2IXZ3+X9Cf8GTnw=; b=3Ls+mqrKc/q6yZ
	luMTOoWlvdsZXj1LNCsK6AIxQZcTk5zjbZTKnl3zR7z9FnpuDE2TXOgFosmEJX0TKNoUQeMOyLWdB
	3f/Z09zX8WYWDtbHfgyIkNDwq0K7jnf9++qW+DKxY2nTQw8Ivi4alWPWcSI0UrBQvdLSeZsu7PdGh
	jQATxgzAEoDAq7pscI8lHGQUHfQMroU6RIsFwcZaMt5t8Tgb8y9xWY1vqy04p3yGBywtSV9YxNwD6
	LxTGVsvXZ08vm+dLMK4iUh2FYV/uZYheUhaHFh2yp1SdHhIeJu1+N3314c7blaMhdjAiOQovz9kU+
	NXiGNwTmxqRX/+zN5xOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnhH-0000000HBc1-3yba;
	Wed, 06 Mar 2024 09:36:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnhE-0000000HBaS-2g2u
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 09:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 678FC6197E
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 09:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2056C43330
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709717778;
	bh=Se9wdvPcfwsLMnlMhoVHGwUCXB5idZL8wbJKmJcBmmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OkKyx24LBAtPLpc+TBxhgzpXcEfA6howp/kefDleQHw1Ve1Yoq3DexZu/yWkqCHgy
	 QDAuqr6mNXVpuCReXUD9B+/jcurZcl8jH4IFfS3/ba08mTQB2FhNfK067Lqg99LwPK
	 Dkq+SkOEQ412pRRgAXoWMl8hhq8pFlLpRZqnXWwWX8mlzw5prIMwJybTutxjDby+zy
	 AF/9UmncS2StBFHApltsRz+X9+jo7Auh/y7yeaE9Eg+ZCRRU0nTuJTFvTppQ13LUma
	 wiFfFwyrzxMve+vGQpyCBUTJq+J7LuVTqQtAGZkUPpMemaRtk7pOAJyowoP/uBHmdv
	 y827Gf95BgS8g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51341a5aafbso3891613e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 01:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDzILRybuyUzi7oRghJXMOdGRguiwXEEw1Okw5onR8HI/QnDzV9mClb0nSpJftjDfYSRDvBc3/IvuOFJ3j29MGoiSAg8hwyMwCij339aHx
X-Gm-Message-State: AOJu0Yy+d+ASKXvj7unGMO9T/LDzgNKrQRUkxxRu2N0lJK9cfY+Zr/wY
	Y4BPHrg5T4gOeQf11TZ4ycpsOQkn8Taq8Bqj9btO/a4mlUOzu92Hq+AbtrCSpOJ+1aC8cSUHywq
	N8LLSKz0iGwOECtjkl3Dj4LvI01I=
X-Google-Smtp-Source: AGHT+IEMgCslxhLZ/P5O8FRuHnnFrVW+nfIzYlt8WG8WJRe/qMTqTOr5zH3MK7+X6hnJM9t4viwIHIiySb9OGMZ6odM=
X-Received: by 2002:a05:6512:2c8b:b0:513:4777:f8c9 with SMTP id
 dw11-20020a0565122c8b00b005134777f8c9mr3591641lfb.6.1709717776891; Wed, 06
 Mar 2024 01:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com> <20240306085622.87248-3-cuiyunhui@bytedance.com>
In-Reply-To: <20240306085622.87248-3-cuiyunhui@bytedance.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 10:36:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
Message-ID: <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] efistub: fix missed the initialization of gp
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_013620_806394_C9350689 
X-CRM114-Status: GOOD (  16.25  )
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

On Wed, 6 Mar 2024 at 09:56, Yunhui Cui <cuiyunhui@bytedance.com> wrote:
>
> Compared with gcc version 12, gcc version 13 uses the gp
> register for compilation optimization, but the efistub module
> does not initialize gp.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Co-Developed-by: Zhipeng Xu <xuzhipeng.1973@bytedance.com>

This needs a sign-off, and your signoff needs to come after.

> ---
>  arch/riscv/kernel/efi-header.S | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
> index 515b2dfbca75..fa17c08c092a 100644
> --- a/arch/riscv/kernel/efi-header.S
> +++ b/arch/riscv/kernel/efi-header.S
> @@ -40,7 +40,7 @@ optional_header:
>         .long   __pecoff_data_virt_end - __pecoff_text_end      // SizeOfInitializedData
>  #endif
>         .long   0                                       // SizeOfUninitializedData
> -       .long   __efistub_efi_pe_entry - _start         // AddressOfEntryPoint
> +       .long   _efistub_entry - _start         // AddressOfEntryPoint
>         .long   efi_header_end - _start                 // BaseOfCode
>  #ifdef CONFIG_32BIT
>         .long  __pecoff_text_end - _start               // BaseOfData
> @@ -121,4 +121,13 @@ section_table:
>
>         .balign 0x1000
>  efi_header_end:
> +
> +       .global _efistub_entry
> +_efistub_entry:

This should go into .text or .init.text, not the header.

> +       /* Reload the global pointer */
> +       load_global_pointer
> +

What is supposed to happen here if CONFIG_SHADOW_CALL_STACK=y? The EFI
stub Makefile removes the SCS CFLAGS, so the stub will be built
without shadow call stack support, which I guess means that it might
use GP as a global pointer as usual?

> +       call __efistub_efi_pe_entry
> +       ret
> +

You are returning to the firmware here, but after modifying the GP
register. Shouldn't you restore it to its old value?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
