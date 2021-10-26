Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13709C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 22:46:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C966760F70
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 22:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C966760F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JAb7K+bkIcuhytOu3qN2I3ujnEybagCSZccGu2VjX48=; b=s7oDBmwa9xTOv7lYmCa0A5apEc
	fjPOt6l8kQV/jZkYN8PspGEmElgXneODDD8MX28VfLDLCg1yBTF0Ml1Icr+LJoyDa0C14N9GBsD0W
	ybk9d8+NubJ+/vfO/kMr11p7DRC5feAbpdZTwaHlg7DdfYSLUlzNyJatyJ/pkU9v/1iFSKy7xfBpF
	hDLkXBT/Lk1JsD9ifThxBgfZ2VWAjw63I26Otk5dJB9NNDR6q2q0PAj0pdTWGFB7u1h2kkTi4BHXf
	OOZzoZPygu+/VtjpxW6uAWAgwh3z1JWFKoGGKpadjO6h4StNBYXFgS1wd2hlLKedJ0MYVdS1r2BBR
	UlhgcMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfVD2-003EmV-CS; Tue, 26 Oct 2021 22:46:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfVCz-003ElI-90
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 22:46:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id i5so614306pla.5
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 15:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iIMkXweimO7pawEkHuFr2l7SgIpFt/lxrub1AQqGQnY=;
 b=mfiNVg6qzbbOe9p7cElyDtbR6+i1Je1PPN5ulfwoHDvgdRn5c/bMna3FdC/q+f6Wo1
 gsoCm2y1//+UUrFvZHWjg2OZPFpd2OaWnb+wHgaBDRtdS5IXTeyMpcLMqSdKJzxmqv9b
 pGXn/Wvv0ape9Mh6U40KkkRyQdzEs7m80odLU9zF8XSJuUDUDMY2aBakM4nG5Ku4OEwu
 GuQ9zD5CeRsw/ApYXoFdrvHwk0YPejg12P600Uoak+0TefMofnKaTzM1TRXTqDe2Nrqd
 fIn3Pb8D8SDTnY0PxqcpC5l4CLpVSdxt/7N6p/oQ9MCL4otKNMNsBTza3Nw1GVB/Xmce
 TM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iIMkXweimO7pawEkHuFr2l7SgIpFt/lxrub1AQqGQnY=;
 b=J6L8ctbxwSRU06QofsuzvKYNobWvX0tpDui12Xc3Tu/65qVN/Ef0bDmeLnq/QVZGLc
 M2EWxFi7pJi0ln4GLqpJK+DrlzQRQ9iKRH65rJDcU/MJ5sXcpVj6Bq78CcMm1S0LDIMI
 /sTZPRw+zmQbLUnAdrjlJqb7GroDKmZDl+9EEECLcs4syGPiNCR3ilOh0WcJuc5+Ygxd
 tfD/7vDGvIFtdpkQOp7X9bic8Ho9mh1fEMzLQNJnMemwT7KyNXXnLcCmdqjWS5xq3vXu
 kQRf9TR6JdKtgqNRR4UPbRYPeJyuhNMqwjCuvZItKIubzZv/oIyrJ2+8zAk+SAnzbqZy
 5zaA==
X-Gm-Message-State: AOAM530t0mfgBbZfufwyRgm+MVMK09q2NsJH20YGH2BCxcRCgW+yuo61
 ioL5g/4hcXqPkoSWxBuYomCbsz83mg4E/Q==
X-Google-Smtp-Source: ABdhPJwHXd7GO0zZiMnfYQHChi+GRzh97ptsyZyPOv1UHPY24b3nwrwcyzk1vExOjXE30LVzSNA0nw==
X-Received: by 2002:a17:902:6ac7:b0:140:14d5:cfb6 with SMTP id
 i7-20020a1709026ac700b0014014d5cfb6mr24814432plt.58.1635288372888; 
 Tue, 26 Oct 2021 15:46:12 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id h2sm1822528pjk.44.2021.10.26.15.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 15:46:12 -0700 (PDT)
Date: Tue, 26 Oct 2021 15:46:12 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Oct 2021 15:46:09 PDT (-0700)
Subject: Re: [PATCH] riscv: remove .text section size limitation for XIP
In-Reply-To: <20211011091414.1998846-1-vitaly.wool@konsulko.com>
CC: linux-riscv@lists.infradead.org, alex@ghiti.fr, jszhang@kernel.org,
 linux-mm@kvack.org, nico@fluxnic.net, vitaly.wool@konsulko.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vitaly.wool@konsulko.com
Message-ID: <mhng-9c793de5-4223-4833-b244-4dd2636b2dd5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_154617_343088_0BE3068A 
X-CRM114-Status: GOOD (  23.67  )
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

On Mon, 11 Oct 2021 02:14:14 PDT (-0700), vitaly.wool@konsulko.com wrote:
> Currently there's a limit of 8MB for the .text section of a RISC-V
> image in the XIP case. This breaks compilation of many automatic
> builds and is generally inconvenient. This patch removes that
> limitation and optimizes XIP image file size at the same time.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/include/asm/pgtable.h    |  6 ++++--
>  arch/riscv/kernel/head.S            | 12 ++++++++++++
>  arch/riscv/kernel/vmlinux-xip.lds.S | 10 +++++++---
>  arch/riscv/mm/init.c                |  7 +++----
>  4 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 39b550310ec6..bf204e7c1f74 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -75,7 +75,8 @@
>  #endif
>
>  #ifdef CONFIG_XIP_KERNEL
> -#define XIP_OFFSET		SZ_8M
> +#define XIP_OFFSET		SZ_32M
> +#define XIP_OFFSET_MASK		(SZ_32M - 1)
>  #else
>  #define XIP_OFFSET		0
>  #endif
> @@ -97,7 +98,8 @@
>  #ifdef CONFIG_XIP_KERNEL
>  #define XIP_FIXUP(addr) ({							\
>  	uintptr_t __a = (uintptr_t)(addr);					\
> -	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
> +	(__a >= CONFIG_XIP_PHYS_ADDR && \
> +	 __a < CONFIG_XIP_PHYS_ADDR + XIP_OFFSET * 2) ?	\
>  		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
>  		__a;								\
>  	})
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fce5184b22c3..ed316d02cd7e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -20,10 +20,20 @@
>  	REG_L t0, _xip_fixup
>  	add \reg, \reg, t0
>  .endm
> +.macro XIP_FIXUP_FLASH_OFFSET reg
> +	la t1, __data_loc
> +	li t0, XIP_OFFSET_MASK
> +	and t1, t1, t0
> +	li t1, XIP_OFFSET
> +	sub t0, t0, t1
> +	sub \reg, \reg, t0
> +.endm
>  _xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
>  #else
>  .macro XIP_FIXUP_OFFSET reg
>  .endm
> +.macro XIP_FIXUP_FLASH_OFFSET reg
> +.endm
>  #endif /* CONFIG_XIP_KERNEL */
>
>  __HEAD
> @@ -266,6 +276,7 @@ pmp_done:
>  	la a3, hart_lottery
>  	mv a2, a3
>  	XIP_FIXUP_OFFSET a2
> +	XIP_FIXUP_FLASH_OFFSET a3
>  	lw t1, (a3)
>  	amoswap.w t0, t1, (a2)
>  	/* first time here if hart_lottery in RAM is not set */
> @@ -304,6 +315,7 @@ clear_bss_done:
>  	XIP_FIXUP_OFFSET sp
>  #ifdef CONFIG_BUILTIN_DTB
>  	la a0, __dtb_start
> +	XIP_FIXUP_OFFSET a0
>  #else
>  	mv a0, s1
>  #endif /* CONFIG_BUILTIN_DTB */
> diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
> index 9c9f35091ef0..f5ed08262139 100644
> --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> @@ -64,8 +64,11 @@ SECTIONS
>  /*
>   * From this point, stuff is considered writable and will be copied to RAM
>   */
> -	__data_loc = ALIGN(16);		/* location in file */
> -	. = LOAD_OFFSET + XIP_OFFSET;	/* location in memory */
> +	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
> +	. = KERNEL_LINK_ADDR + XIP_OFFSET;	/* location in memory */
> +
> +#undef LOAD_OFFSET
> +#define LOAD_OFFSET (KERNEL_LINK_ADDR + XIP_OFFSET - (__data_loc & XIP_OFFSET_MASK))
>
>  	_sdata = .;			/* Start of data section */
>  	_data = .;
> @@ -96,7 +99,6 @@ SECTIONS
>  		KEEP(*(__soc_builtin_dtb_table))
>  		__soc_builtin_dtb_table_end = .;
>  	}
> -	PERCPU_SECTION(L1_CACHE_BYTES)
>
>  	. = ALIGN(8);
>  	.alternative : {
> @@ -122,6 +124,8 @@ SECTIONS
>
>  	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
>
> +	PERCPU_SECTION(L1_CACHE_BYTES)
> +
>  	.rel.dyn : AT(ADDR(.rel.dyn) - LOAD_OFFSET) {
>  		*(.rel.dyn*)
>  	}
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c0cddf0fc22d..24b2b8044602 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -41,7 +41,7 @@ phys_addr_t phys_ram_base __ro_after_init;
>  EXPORT_SYMBOL(phys_ram_base);
>
>  #ifdef CONFIG_XIP_KERNEL
> -extern char _xiprom[], _exiprom[];
> +extern char _xiprom[], _exiprom[], __data_loc;
>  #endif
>
>  unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
> @@ -454,10 +454,9 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  /* called from head.S with MMU off */
>  asmlinkage void __init __copy_data(void)
>  {
> -	void *from = (void *)(&_sdata);
> -	void *end = (void *)(&_end);
> +	void *from = (void *)(&__data_loc);
>  	void *to = (void *)CONFIG_PHYS_RAM_BASE;
> -	size_t sz = (size_t)(end - from + 1);
> +	size_t sz = (size_t)((uintptr_t)(&_end) - (uintptr_t)(&_sdata));
>
>  	memcpy(to, from, sz);
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
