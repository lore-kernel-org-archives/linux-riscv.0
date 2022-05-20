Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7504FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Mw5m5fDwgBBYZMKCQV/enCmCIDXzHK0PEQWF4q7YWR8=; b=vfPWhQ/EN9pIMhBR2/6E72rtcU
	EizhWRHwubvBno1zXZk6AV7hghBy6LC8LcyIhwTS3oaOalIsCA06sBFDLAJIiiuNbIQQWz/u4Ecit
	m7tEVglLTdULHVrB8qW4XISpphSA+vlrTHTlYIWI7KYenABb1tyAqfq9X4BISUJhVMpAy7yLd4TKr
	rSYylPcHR9/ibATzvVxW1G6ccd+4/HGSW1i9dQI3jMxxVCkwGxc8mjLFUJaMl1Js/Rcucbc2+EnIe
	rRwcodeuvHowgHing3IYiij0zuScxVtFF+jXH+Pvk/p7vhoDIrgNDdGTm1sIYbYi3DjDKwSk6qbzB
	dgqK9I4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4of-00DJiN-70; Fri, 20 May 2022 15:45:25 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4ob-00DJfW-EP
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:23 +0000
Received: by mail-pg1-x532.google.com with SMTP id a9so6026240pgv.12
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=B+/7LZGrMlNtwgdHe90R2m8v3jGzIyKXW/TmqjH0p8o=;
 b=6VxjFURLsZvEfrO6ok+Lx9lmFcRJBm12JUllBnZVZD76AqbcSMzLhebLruJAq+jN5G
 8s4EFWw6zFTrCQ/X4Mlcfy4gDd5wf90NmwBV7+f45njOcQgTFrKjZ6UvbSNRqwx+X5PL
 8PSJKIYIuqIyLumun1RXxMZHPB8FgC7kxRwCFMuBpvklIhUhWEculHnw/0WgfeaaidF4
 pkhzJydJHEex70VhkFqveBSKucVLdoXH4NU6pn1L0M9LhNAPDdmr3Uhi7ceRuUNZApWK
 cHFX58KerxBXZcDFTokh+4W7sOJaJK5sDHnmzd/oi8EipjF301ooHmHDy2s/RQNnYOft
 hnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=B+/7LZGrMlNtwgdHe90R2m8v3jGzIyKXW/TmqjH0p8o=;
 b=ATadjzus/Zi0c6wbGxNjS0ZPKSpH9yGl7j7jYc6XnOZY6c6azt9/zY9hg4wv21nDyi
 4mbZa5XlDHprUfFvugjek6ZKpOCbWBBnr5q8yYSdgWEgGQM2M6o/RIMM5ovNuf8WYl/j
 uOrXAm9Vr2ZmbQmwGN/tbvBBehHgMAMOM3FwkbsWsSX0CqE0ocYcp0mm2w0GF+pJLa++
 41nqz6cSOUL+NGux3gbTABoXwztqWC2Hs5mwOEHi+js8PMlc4XXsljywz1ga98GUasgu
 QWEG8J4PAxpNSqxbMFFr35PMT47ijO6Xb0lUvxyqUI+sAOTi5U0iBUttOmGBXBn+zCRJ
 KChQ==
X-Gm-Message-State: AOAM533l9RMmHIWEt5aIgoRoiQ+bYccbcuAg7kMat79iKWsMYQnFcozT
 3trbriP8gxQovgE3QP8jhonknQ==
X-Google-Smtp-Source: ABdhPJx60xj4QICH8XoCnnzUISnMEjHTEBuDbRp2Z4SG2Z01pp7QsrJBL/FLnxnzL/aMMI6a2O+bcQ==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr10696130pfh.60.1653061520081; 
 Fri, 20 May 2022 08:45:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 je4-20020a170903264400b0015ebb3bf277sm5792454plb.238.2022.05.20.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:19 -0700 (PDT)
Date: Fri, 20 May 2022 08:45:19 -0700 (PDT)
X-Google-Original-Date: Thu, 19 May 2022 13:24:56 PDT (-0700)
Subject: Re: [PATCH v3 -next 1/6] kexec_file: Fix kexec_file.c build error for
 riscv platform
In-Reply-To: <20220408100914.150110-2-lizhengyu3@huawei.com>
CC: liaochang1@huawei.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 Bjorn Topel <bjorn.topel@gmail.com>, ebiederm@xmission.com,
 guoren@linux.alibaba.com, jszhang@kernel.org, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>, penberg@kernel.org,
 sunnanyong@huawei.com, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lizhengyu3@huawei.com
Message-ID: <mhng-33c63a92-49e5-48a0-8f54-797c797ee373@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084521_726563_38731869 
X-CRM114-Status: GOOD (  24.23  )
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

On Fri, 08 Apr 2022 03:09:09 PDT (-0700), lizhengyu3@huawei.com wrote:
> From: Liao Chang <liaochang1@huawei.com>
>
> When CONFIG_KEXEC_FILE is set for riscv platform, the compilation of
> kernel/kexec_file.c generate build error:
>
> kernel/kexec_file.c: In function 'crash_prepare_elf64_headers':
> ./arch/riscv/include/asm/page.h:110:71: error: request for member 'virt_addr' in something not a structure or union
>   110 |  ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < kernel_map.virt_addr))
>       |                                                                       ^
> ./arch/riscv/include/asm/page.h:131:2: note: in expansion of macro 'is_linear_mapping'
>   131 |  is_linear_mapping(_x) ?       \
>       |  ^~~~~~~~~~~~~~~~~
> ./arch/riscv/include/asm/page.h:140:31: note: in expansion of macro '__va_to_pa_nodebug'
>   140 | #define __phys_addr_symbol(x) __va_to_pa_nodebug(x)
>       |                               ^~~~~~~~~~~~~~~~~~
> ./arch/riscv/include/asm/page.h:143:24: note: in expansion of macro '__phys_addr_symbol'
>   143 | #define __pa_symbol(x) __phys_addr_symbol(RELOC_HIDE((unsigned long)(x), 0))
>       |                        ^~~~~~~~~~~~~~~~~~
> kernel/kexec_file.c:1327:36: note: in expansion of macro '__pa_symbol'
>  1327 |   phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
>
> This occurs is because the "kernel_map" referenced in macro
> is_linear_mapping()  is suppose to be the one of struct kernel_mapping
> defined in arch/riscv/mm/init.c, but the 2nd argument of
> crash_prepare_elf64_header() has same symbol name, in expansion of macro
> is_linear_mapping in function crash_prepare_elf64_header(), "kernel_map"
> actually is the local variable.
>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  include/linux/kexec.h | 2 +-
>  kernel/kexec_file.c   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 58d1b58a971e..ebb1bffbf068 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -227,7 +227,7 @@ struct crash_mem {
>  extern int crash_exclude_mem_range(struct crash_mem *mem,
>  				   unsigned long long mstart,
>  				   unsigned long long mend);
> -extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
> +extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  				       void **addr, unsigned long *sz);
>  #endif /* CONFIG_KEXEC_FILE */
>
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 8347fc158d2b..331a4f0f10f5 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -1260,7 +1260,7 @@ int crash_exclude_mem_range(struct crash_mem *mem,
>  	return 0;
>  }
>
> -int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
> +int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  			  void **addr, unsigned long *sz)
>  {
>  	Elf64_Ehdr *ehdr;
> @@ -1324,7 +1324,7 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
>  	phdr++;
>
>  	/* Prepare PT_LOAD type program header for kernel text region */
> -	if (kernel_map) {
> +	if (need_kernel_map) {
>  		phdr->p_type = PT_LOAD;
>  		phdr->p_flags = PF_R|PF_W|PF_X;
>  		phdr->p_vaddr = (unsigned long) _text;

IMO this is fine: we could rename all the kernel_map stuff in 
arch/riscv, but this is much more self-contained.  It's not been ack'd 
by anyone else, but get_maintainers just suggests the kexec@ list so I'm 
going to take it via the RISC-V tree along with the rest of these.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
