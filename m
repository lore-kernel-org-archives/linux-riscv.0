Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9028CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/2k/tV2MOanj90chwKMk+occE8rPnbdQzOsELMgH2E=; b=r/N/dxmx2+H7ps
	F80JzwFMWKqqgMI4WyqgTLMBDkrCOeF/wULZTRFtfw8YIBF3lg7rBD4Q8V5xEewShkVj6HGmU7tL3
	Fn60Zg+LegvgJqEnjDGKVe4OEqaIA/bytBIpNsSs25LzbpHtMdqGyYlKwcmgMkekdEMC+fB0A264p
	PikJZ6ndkIIQKRP/6E8eA3x7eZHZM1ePGUHMSx1fflRROQHksbldIdlUTn4GjbBZUEZdiVsv06kJ7
	sCPq35wZnCVVViztirfvYrqR7xWYN/16ik1OQIvaSO4tpxU+5OjzzcjciKhTog/zSYuMchQTTrsfi
	m9yvTjcl8StHgoSopnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmAT-00ClaK-38;
	Tue, 17 Oct 2023 15:39:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmAR-00ClZZ-13
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 15:39:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ca816f868fso15242755ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697557172; x=1698161972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDD/uryQTLCU5uMx9saGkKWkdjsc7ClRnhXCpgMi6iw=;
        b=m7YFEv6kcXPBuMsHIR5Y+cz2GCGkbY9Bl4/WQfNY6K4QxpKphbKg1ncyTpem5BS2m4
         wVWf1ZnDzkupe21c5CzHQ3EHJn2EQIMdG9O7bJ2QLy2S9J993p/LzZytk0rrBdXgAC2I
         MHjp8PkzfsFYrCGnAX/lv8IDrCC23FC8+rUuGbPs45TSLH/GGnIR3o3HituzG3LB4/6w
         CKStvpLs6/rlxXK0Ce/Sbxy4yZ3XaPpy8VSLNmYl2OZw6oBC1fDGWPz79uOIrrvASS9c
         FGKwWl7u9UKIc0SZR/LkgtV/tkAZBEl3xJHJ+8WTa6TVtjgxhQO7xxQQIuNVG78aZlIX
         wJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557172; x=1698161972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDD/uryQTLCU5uMx9saGkKWkdjsc7ClRnhXCpgMi6iw=;
        b=OuXaa3avQd4XaZ6kRV30A3JcaPjg8SFvh4YtHtuv/jOVK6C3D3+slls/axoxDwur0N
         LUExEvJSxKAv4mcHpuArsrGG21jNJJO5LksSiyVmCQDsnuZvN1c4S5sATVr/fu7Bk60m
         h/Whej9XnCRWyMWagmztBX+LGhnbcV1GMF5Wmql/6PZh1idiUYq2OdazPuHfyv2dd6Fb
         UDbhlib6UdG1oYVIi5Wu73ol5tvRVUifI1QXOHTwq6fVnHV6DokUBqzaMHxVVz2p2Go0
         feodweZx/hXh9IPiSYqs9Vdl6TLYwsIfeX8cxjIUyR11BWOqm4VFY9Rveo68/rES9fAJ
         ng7Q==
X-Gm-Message-State: AOJu0YyR4TmB2XA8cFWqoFkxop+vz4HtyfT71gUx4kvxmxlWJ1wj+/IJ
	YK8bZcbwibMn7U0o2HzEjCpwmQ==
X-Google-Smtp-Source: AGHT+IGhHEDtApkkx2EbvNB6zNoc/nuobujehBrKazxvxt7EI5Z0029abtVr9kz7TlfWkAk9Q9siPA==
X-Received: by 2002:a17:903:27cf:b0:1ca:8e79:53af with SMTP id km15-20020a17090327cf00b001ca8e7953afmr2249385plb.3.1697557171977;
        Tue, 17 Oct 2023 08:39:31 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b001c619fbd5fbsm1707303plh.298.2023.10.17.08.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:39:31 -0700 (PDT)
Date: Tue, 17 Oct 2023 21:09:23 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 2/3] RISC-V: ACPI: RHCT: Add function to get CBO
 block sizes
Message-ID: <ZS6qq1Y9bLZ868KI@sunil-laptop>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
 <20231016164958.1191529-3-sunilvl@ventanamicro.com>
 <20231017-b394a120094eeee31693e9a7@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017-b394a120094eeee31693e9a7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_083935_370608_BBACEB39 
X-CRM114-Status: GOOD (  31.85  )
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

On Tue, Oct 17, 2023 at 10:37:41AM +0200, Andrew Jones wrote:
> On Mon, Oct 16, 2023 at 10:19:57PM +0530, Sunil V L wrote:
> > Cache Block Operation (CBO) related block size in ACPI is provided by RHCT.
> > Add support to read the CMO node in RHCT to get this information.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/acpi.h |  6 +++
> >  drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 99 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > index d5604d2073bc..7dad0cf9d701 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -66,6 +66,8 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  		       unsigned int cpu, const char **isa);
> >  
> >  static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> > +void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
> > +			     u32 *cboz_size, u32 *cbop_size);
> >  #else
> >  static inline void acpi_init_rintc_map(void) { }
> >  static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> > @@ -79,6 +81,10 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  	return -EINVAL;
> >  }
> >  
> > +static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
> > +					   u32 *cbom_size, u32 *cboz_size,
> > +					   u32 *cbop_size) { }
> > +
> >  #endif /* CONFIG_ACPI */
> >  
> >  #endif /*_ASM_ACPI_H*/
> > diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> > index b280b3e9c7d9..105f1aaa3fac 100644
> > --- a/drivers/acpi/riscv/rhct.c
> > +++ b/drivers/acpi/riscv/rhct.c
> > @@ -8,6 +8,7 @@
> >  #define pr_fmt(fmt)     "ACPI: RHCT: " fmt
> >  
> >  #include <linux/acpi.h>
> > +#include <linux/bits.h>
> >  
> >  static struct acpi_table_header *acpi_get_rhct(void)
> >  {
> > @@ -81,3 +82,95 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
> >  
> >  	return -1;
> >  }
> > +
> > +static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
> > +					  struct acpi_rhct_hart_info *hart_info,
> > +					  u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
> > +{
> > +	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
> > +	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
> > +	struct acpi_rhct_node_header *ref_node;
> > +	struct acpi_rhct_cmo_node *cmo_node;
> > +	u32 *hart_info_node_offset;
> > +
> > +	hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
> > +	for (int i = 0; i < hart_info->num_offsets; i++) {
> > +		ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
> > +					rhct, hart_info_node_offset[i]);
> > +		if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
> > +			cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
> > +						ref_node, size_hdr);
> > +			if (cbom_size && cmo_node->cbom_size <= 30) {
> > +				if (!*cbom_size) {
> > +					*cbom_size = BIT(cmo_node->cbom_size);
> > +				} else if (*cbom_size !=
> > +						BIT(cmo_node->cbom_size)) {
> 
> No need to break the if line, we can go to 100 chars. And then, since both
> the if and else if arms only have single statements, all the {} can be
> dropped too. Same comment for cboz and cbop.
> 
Yeah, it is a side effect of working on repos with different coding
standards. It is interesting that checkpatch didn't recommend to remove
the braces. Let me fix it in next revision. Thanks!.

> > +					pr_warn("CBOM size is not the same across harts\n");
> > +				}
> > +			}
> > +
> > +			if (cboz_size && cmo_node->cboz_size <= 30) {
> > +				if (!*cboz_size) {
> > +					*cboz_size = BIT(cmo_node->cboz_size);
> > +				} else if (*cboz_size !=
> > +						BIT(cmo_node->cboz_size)) {
> > +					pr_warn("CBOZ size is not the same across harts\n");
> > +				}
> > +			}
> > +
> > +			if (cbop_size && cmo_node->cbop_size <= 30) {
> > +				if (!*cbop_size) {
> > +					*cbop_size = BIT(cmo_node->cbop_size);
> > +				} else if (*cbop_size !=
> > +						BIT(cmo_node->cbop_size)) {
> > +					pr_warn("CBOP size is not the same across harts\n");
> > +				}
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > +/*
> > + * During early boot, the caller should call acpi_get_table() and pass its pointer to
> > + * these functions(and free up later). At run time, since this table can be used
>                      ^ add a space here
> 
> > + * multiple times, pass NULL so that the table remains in memory
> > + */
> > +void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
> > +			     u32 *cboz_size, u32 *cbop_size)
> > +{
> > +	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
> > +	struct acpi_rhct_node_header *node, *end;
> > +	struct acpi_rhct_hart_info *hart_info;
> > +	struct acpi_table_rhct *rhct;
> > +
> > +	if (acpi_disabled)
> > +		return;
> > +
> > +	if (table) {
> > +		rhct = (struct acpi_table_rhct *)table;
> > +	} else {
> > +		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
> 
> Not an issue of this patch, but it seems like acpi_get_rhct() should
> return a struct acpi_table_rhct pointer instead of a struct
> acpi_table_header pointer since it's specifically returning an RHCT.
> 
Makes sense. Let me add a patch to improve this.

> > +		if (!rhct)
> > +			return;
> > +	}
> > +
> > +	if (cbom_size)
> > +		*cbom_size = 0;
> > +
> > +	if (cboz_size)
> > +		*cboz_size = 0;
> > +
> > +	if (cbop_size)
> > +		*cbop_size = 0;
> > +
> > +	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
> > +	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
> > +	     node < end;
> > +	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
> > +		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
> > +			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
> > +			acpi_parse_hart_info_cmo_node(rhct, hart_info, cbom_size,
> > +						      cboz_size, cbop_size);
> > +		}
> > +	}
> > +}
> > -- 
> > 2.39.2
> >
> 
> Other than the nits
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
Thanks a lot for the review!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
