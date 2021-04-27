Return-Path: <SRS0=01Py=JY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFB5C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 12:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B9D61073
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 12:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B9D61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zB/bgDXBmYEeCzQWSPd/ocdyhXdmljmY+y/KA8f+mGY=; b=UiBhOo2OxyzIshVBmo7sRbYOk
	8ZROTxV356sH4g0XssoCZVii1xeG9RJsbh3lQAZYpzAjWuwfKhTzYVRrmFGPDD/deLeHj4aYuwDzn
	W1t86Wst2X76Oq2mdftWKRJCtlhV3jGD55d5ZLuU7O4Ft6+hhG5omXHyjeEkFFgSLCZLJYmwLKEVf
	7wTXvbYKNZe9sWsmfe96fvetLB/XHFB7LWfkFdfAs27pHucjc5gh0RW6i7/dzZhYoWSI9jk6X4NhO
	E524DNzRnJKqPBqPc/ZjXFsgdj1E5e5E7i3fRgvHwJAnjWSEl5AAjhL+WJrip7L79anJPZEdBmHK8
	Mi59LFO1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbN3d-001dVm-DO; Tue, 27 Apr 2021 12:43:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbN3b-001dVc-M5
 for linux-riscv@desiato.infradead.org; Tue, 27 Apr 2021 12:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FkbGW4Gvj+ZnEA+/D9gCUAv1P3SsRDDAZVh2+Q2LN9g=; b=4GXZ6it4MXGHp6PUeRDPR5iMZg
 aqJkX81PHj9mCwFbD3pdjcsVhIQMcOGYHQ9KlFCCYLTYKU6hNBCbkIy6bVBtyBkDevFjRUOAR5ku1
 PF0sLU0FBA4JiaJP8I8p/uuXMub008041xz384UqRjBTzd9Z0c4S+86pVdtXjcWCOTb52a20/1fyI
 A+e5Bscg3IpupzwViAcIDK/7jLxPxW6081+OJfPriLrIzentGvGq79M+J0ACAwQNw4Yl3oaW5XaXy
 Htc7DLZCfNkODhP9CYNIdWK9JIKkFS0que7LnxmlcJMtrmO+lT8PCtIS+/SMmd08/hiWiZ3szvnlt
 DWyNC82A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbN3Y-00GjbA-TH
 for linux-riscv@lists.infradead.org; Tue, 27 Apr 2021 12:43:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2C53613E8
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619527391;
 bh=SBMydSe5kp0Nvgawklzbas5ZKFW7/l9q/mwcw/UIYvg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tcCcL8zMkgC8pv252U5tCzY3Tm3yP2HdRGj/OeMsM1bNsd18U2dl4OqwuGyAlNxj7
 024V3mj3y76NbjSso7Te5ghR9tM8mYwuKAsqT4Amte3CZMN7koTxUBlusaHVsIoi1I
 a5EfPyJYWxcR5RHAUc0BCNjI7IuEimi/GWPZJF3ahHD3aRdFbyqe7rWkZUEnPTYTCb
 qetEiZmBNTKvHguc2b/2LfKpRtCbNhKo44GrFFMpY7pSQL5R3ENf7PTZ89lMrD6ro3
 lJXI36nP6oNz6Nvv4RgKfRDr+pcUIgixZGjrTEnpTkFmxhA/avDfBM9aVU7w8eDN1I
 E+jV2A4R3joqw==
Received: by mail-ot1-f44.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so50031793otf.12
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 05:43:11 -0700 (PDT)
X-Gm-Message-State: AOAM531qgsFVlvfTgXBQ1O+Tf5TsqCOEhiLUvYr+NivMdH1v5cAMezlr
 Ag6uak7MJRmpmvDay17Fx9/Jr8U9pcK5ntxJRPc=
X-Google-Smtp-Source: ABdhPJyMQx/FiPIphY9VMEFj2ndPnbvhQmyfgZo7N2J+0K29BHhLG6JADN95Yku1nh8g4dEjFjn+rj6sR32e1BR8hfk=
X-Received: by 2002:a05:6830:4d1:: with SMTP id
 s17mr18536402otd.108.1619527390973; 
 Tue, 27 Apr 2021 05:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210427120607.2646166-1-arei@altlinux.org>
In-Reply-To: <20210427120607.2646166-1-arei@altlinux.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Apr 2021 14:42:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGm9d7SdBoozEoOP4G6ETmNiZR8kum91RVc_4eUTroE2w@mail.gmail.com>
Message-ID: <CAMj1kXGm9d7SdBoozEoOP4G6ETmNiZR8kum91RVc_4eUTroE2w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Relocate the kernel relative to a DRAM base.
To: Nikita Ermakov <arei@altlinux.org>
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_054313_019279_04830472 
X-CRM114-Status: GOOD (  21.99  )
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

On Tue, 27 Apr 2021 at 14:07, Nikita Ermakov <arei@altlinux.org> wrote:
>
> Try to get the base of the DRAM from a DTB to use it as a lowest address
> in physical memory to relocate the kernel. If it is not possible to
> obtain the base from a /memory node of the DTB let's make an assumption
> that the DRAM base at the beginning of the memory.
>

Why?

> Signed-off-by: Nikita Ermakov <arei@altlinux.org>
> ---
>  drivers/firmware/efi/libstub/riscv-stub.c | 39 ++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 380e4e251399..1b5944276e1a 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -46,6 +46,39 @@ static u32 get_boot_hartid_from_fdt(void)
>         return fdt32_to_cpu(*prop);
>  }
>
> +static unsigned long get_dram_base_from_fdt(void)
> +{
> +       const void *fdt;
> +       int node, len;
> +       const fdt32_t *addr_cells;
> +       const void *prop;
> +
> +       fdt = get_efi_config_table(DEVICE_TREE_GUID);
> +       if (!fdt)
> +               return ULONG_MAX;
> +
> +       node = fdt_path_offset(fdt, "/");
> +       if (node < 0)
> +               return ULONG_MAX;
> +
> +       addr_cells = fdt_getprop((void *)fdt, node, "#address-cells", &len);
> +       if (!addr_cells)
> +               return ULONG_MAX;
> +
> +       node = fdt_path_offset(fdt, "/memory");
> +       if (node < 0)
> +               return ULONG_MAX;
> +
> +       prop = fdt_getprop((void *)fdt, node, "reg", &len);
> +       if (!prop)
> +               return ULONG_MAX;
> +
> +       if (fdt32_to_cpu(*addr_cells) > 1)
> +               return fdt64_to_cpu(*((fdt64_t *)prop));
> +       else
> +               return fdt32_to_cpu(*((fdt32_t *)prop));
> +}
> +
>  efi_status_t check_platform_features(void)
>  {
>         hartid = get_boot_hartid_from_fdt();
> @@ -97,7 +130,11 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>          * lowest possible memory region as long as the address and size meets
>          * the alignment constraints.
>          */
> -       preferred_addr = MIN_KIMG_ALIGN;
> +       preferred_addr = get_dram_base_from_fdt();
> +       if (preferred_addr == ULONG_MAX)
> +               preferred_addr = MIN_KIMG_ALIGN;
> +       else
> +               preferred_addr += MIN_KIMG_ALIGN;
>         status = efi_relocate_kernel(image_addr, kernel_size, *image_size,
>                                      preferred_addr, MIN_KIMG_ALIGN, 0x0);
>
> --
> 2.29.3
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
