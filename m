Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF10ECDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nF/pqobwILK9tD+e4gnkXfKDZT2gvpRKdQnpZhbA8uY=; b=1DAdxdc/eERRvl
	+oj7sFygCD2wa69QltVx+X3Yt2+/DBwcxySKVgHCENe45aCn20bD54NntGCkMbRPUutJBk+R2SJ71
	rQOvRMKvIZeGx+0ukkZTHpC+di3xCC/PFQqgiXr1fiNL7mTVo0EP45muCxLLpGvFxwuHH482wqiG9
	M1t5o4HYUBpAG1BFpipf1x6iRFplW4D94R+PetSjaIjBA/g9tfvgeOWVTtSE54EE+J3jGQLNKJEYc
	UxqHO5e/k0/AsoGSJoM72k1p0CcKHzCzKuT7IIJcRHBLUzonmiqFXtNzNiqBCzNEh3xhglMdB721D
	ILqaUSrzVYbHNoU9uxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfaH-00BhzU-38;
	Tue, 17 Oct 2023 08:37:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfaF-00BhxY-1C
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 08:37:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so57310445e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697531863; x=1698136663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fVCukcDlvPySj2NLX0qj8lhbtPyshCYJMi8M0ztHzn4=;
        b=Hdlr6VSRXMc1T1dsjNKDSLSLb7KX3ECX1l+i5zBoGBhU2eOpZEhy9zQvVmZboDAi3a
         XpYGWQzv435PzBwCRx/jgrIS1s/+COSHSI3Z+A4RasVsCt6ouDvgXqspTdtK7hepXWoy
         8PSJJ6TgL5Lg3NWFiY4ciPhws+dgMUz7Yyo31HeNFEZhMYB0m8I0LELGtuA+kneOFTpF
         up9fXh5Qf1EbSsFfaxt5EW2V7Y4o14KaHCca5a/dEKbg4EC33IlxndaTo4Lk+kKFYWKy
         hEe0ddOLTCAtFsqwtcrOWur0kbNHI1L125075aJrkdyCnQoJ8460/erkwa0ywyI0+aaC
         DVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697531863; x=1698136663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVCukcDlvPySj2NLX0qj8lhbtPyshCYJMi8M0ztHzn4=;
        b=ZNCrH9FsIDLcHdxz4ohfeRcdRzYfu6eg6wS6DqZNndmG8p+CdSGqYgvXuEfJCFbMqV
         X1/hVO7RDjn2tBk+MBPTYyRkeCApQJ1Byi+/drEeDguM3e2fuPHbtun++pokRbRp5wyv
         A67e4KgfSkuTpo6HEF92VdUWwx7iyQiDJlqgzC7bbbDa5CHB9oTI3/i5dtfbdB2/BMpH
         KePgaXLXaTz82yrg4IYFDvJ+azCdqYRt4NcN6RedZXoHkEJ3etrdfIxu0MN390lZfwOd
         2kYijqd0VyeIo3Q91XZdnINWUXCxNyy7/wDsj+i06+VlkSAhyraLiMYx0OJTJNc9U9ki
         0Wcg==
X-Gm-Message-State: AOJu0Yzi1isAoa9BOfkzjlfF9AXK+Cii5kU9RwNZm4qD8OkpNq0Sk4bo
	OmRjTd8/l+gNJsbLpYKioniouw==
X-Google-Smtp-Source: AGHT+IH1PWLI/m2AVOajpYxFQu3mRvEQWpnL/AMckzMiIlODM9qdoJ15Ly+Sxs75jHhj0Cl/nYxzGw==
X-Received: by 2002:a05:600c:3595:b0:3ff:ca80:eda3 with SMTP id p21-20020a05600c359500b003ffca80eda3mr1141353wmq.10.1697531862996;
        Tue, 17 Oct 2023 01:37:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s26-20020a05600c319a00b00405588aa40asm1258374wmp.24.2023.10.17.01.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 01:37:42 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:37:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 2/3] RISC-V: ACPI: RHCT: Add function to get CBO
 block sizes
Message-ID: <20231017-b394a120094eeee31693e9a7@orel>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
 <20231016164958.1191529-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016164958.1191529-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_013747_408961_8B823F13 
X-CRM114-Status: GOOD (  25.95  )
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

On Mon, Oct 16, 2023 at 10:19:57PM +0530, Sunil V L wrote:
> Cache Block Operation (CBO) related block size in ACPI is provided by RHCT.
> Add support to read the CMO node in RHCT to get this information.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acpi.h |  6 +++
>  drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index d5604d2073bc..7dad0cf9d701 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -66,6 +66,8 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
>  		       unsigned int cpu, const char **isa);
>  
>  static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> +void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
> +			     u32 *cboz_size, u32 *cbop_size);
>  #else
>  static inline void acpi_init_rintc_map(void) { }
>  static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> @@ -79,6 +81,10 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
>  	return -EINVAL;
>  }
>  
> +static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
> +					   u32 *cbom_size, u32 *cboz_size,
> +					   u32 *cbop_size) { }
> +
>  #endif /* CONFIG_ACPI */
>  
>  #endif /*_ASM_ACPI_H*/
> diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> index b280b3e9c7d9..105f1aaa3fac 100644
> --- a/drivers/acpi/riscv/rhct.c
> +++ b/drivers/acpi/riscv/rhct.c
> @@ -8,6 +8,7 @@
>  #define pr_fmt(fmt)     "ACPI: RHCT: " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/bits.h>
>  
>  static struct acpi_table_header *acpi_get_rhct(void)
>  {
> @@ -81,3 +82,95 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
>  
>  	return -1;
>  }
> +
> +static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
> +					  struct acpi_rhct_hart_info *hart_info,
> +					  u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
> +{
> +	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
> +	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
> +	struct acpi_rhct_node_header *ref_node;
> +	struct acpi_rhct_cmo_node *cmo_node;
> +	u32 *hart_info_node_offset;
> +
> +	hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
> +	for (int i = 0; i < hart_info->num_offsets; i++) {
> +		ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
> +					rhct, hart_info_node_offset[i]);
> +		if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
> +			cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
> +						ref_node, size_hdr);
> +			if (cbom_size && cmo_node->cbom_size <= 30) {
> +				if (!*cbom_size) {
> +					*cbom_size = BIT(cmo_node->cbom_size);
> +				} else if (*cbom_size !=
> +						BIT(cmo_node->cbom_size)) {

No need to break the if line, we can go to 100 chars. And then, since both
the if and else if arms only have single statements, all the {} can be
dropped too. Same comment for cboz and cbop.

> +					pr_warn("CBOM size is not the same across harts\n");
> +				}
> +			}
> +
> +			if (cboz_size && cmo_node->cboz_size <= 30) {
> +				if (!*cboz_size) {
> +					*cboz_size = BIT(cmo_node->cboz_size);
> +				} else if (*cboz_size !=
> +						BIT(cmo_node->cboz_size)) {
> +					pr_warn("CBOZ size is not the same across harts\n");
> +				}
> +			}
> +
> +			if (cbop_size && cmo_node->cbop_size <= 30) {
> +				if (!*cbop_size) {
> +					*cbop_size = BIT(cmo_node->cbop_size);
> +				} else if (*cbop_size !=
> +						BIT(cmo_node->cbop_size)) {
> +					pr_warn("CBOP size is not the same across harts\n");
> +				}
> +			}
> +		}
> +	}
> +}
> +
> +/*
> + * During early boot, the caller should call acpi_get_table() and pass its pointer to
> + * these functions(and free up later). At run time, since this table can be used
                     ^ add a space here

> + * multiple times, pass NULL so that the table remains in memory
> + */
> +void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
> +			     u32 *cboz_size, u32 *cbop_size)
> +{
> +	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
> +	struct acpi_rhct_node_header *node, *end;
> +	struct acpi_rhct_hart_info *hart_info;
> +	struct acpi_table_rhct *rhct;
> +
> +	if (acpi_disabled)
> +		return;
> +
> +	if (table) {
> +		rhct = (struct acpi_table_rhct *)table;
> +	} else {
> +		rhct = (struct acpi_table_rhct *)acpi_get_rhct();

Not an issue of this patch, but it seems like acpi_get_rhct() should
return a struct acpi_table_rhct pointer instead of a struct
acpi_table_header pointer since it's specifically returning an RHCT.

> +		if (!rhct)
> +			return;
> +	}
> +
> +	if (cbom_size)
> +		*cbom_size = 0;
> +
> +	if (cboz_size)
> +		*cboz_size = 0;
> +
> +	if (cbop_size)
> +		*cbop_size = 0;
> +
> +	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
> +	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
> +	     node < end;
> +	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
> +		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
> +			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
> +			acpi_parse_hart_info_cmo_node(rhct, hart_info, cbom_size,
> +						      cboz_size, cbop_size);
> +		}
> +	}
> +}
> -- 
> 2.39.2
>

Other than the nits

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
