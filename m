Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556ECCDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ILvZltKmY+FvOzWZvgH9J2ay9kgyRXUKVa56t+Myhc=; b=Si5Nb+HzYlprlp
	cKnqvYi1VLJRFl52nbP56xR0keGk6+QypSBQCCOJxSvK8aIo7Eu6wq2et4TcnlIAWUh6U1AY7B/qG
	+KLJTqqFaRWVe/BIcYWA5sVrUptKQ9BvqLpv5xC638aHphRfg2BCZ7b3zmqHIGAfDbiNYZc/urIcr
	uQAQowKKgbfITGkb3USHsZ3KSWvVz4jyNUZFcq7xaqTpjDddlekZ8tp2OtgwWmp0lzcMe9SnILFdT
	4rE+QEIa1ATtwDaskevKrOsbrisnZaLVVLaNWUPS6a1mioEXd6md2rwrORsMQPYNTCDZ/XLC8nX79
	lKqRvhbfR+cMOnkUuszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsnU9-00CsGA-0x;
	Tue, 17 Oct 2023 17:04:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsnU6-00CsFS-0t
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 17:03:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98377c5d53eso906481566b.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697562235; x=1698167035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXhmtE1WCmBrDAGjS0eBWsd0E/xae41wf+MbBCU4NSA=;
        b=Or+FYlQt7Lr8Iak4STXk5R9bCxokZRer62kDRw+pbfKhxCd7PoRfmw2WSSaWrkj5Nf
         m92rmVyo0ZfjmYpZqA0u/WPUE/gUuBJnr+h1ODbvaoIZ5F+tRdqRSWEBhA5BPThRWb5K
         6G8CYdjiDQJACqCgS3DRpGVjzhhSxE5onknW74WJU4P5MoXEpM4bCClvzgdQb2aw4vkj
         I/J4ZgB5Oa6FV+3kiPwc30ddSbMzGojPo2+1pxju2rzpdktAuvlpmudXjhCSnPA8jc7M
         gor3XoM4+hHwFql5ZhfTf2a4BmUUX4BI9Sx4XbiSXBZGkXQ5aRpQ9u45lt3uvV0bmu9P
         deKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697562235; x=1698167035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXhmtE1WCmBrDAGjS0eBWsd0E/xae41wf+MbBCU4NSA=;
        b=XuH1kaVw37IeREbs7n8hTjWFHeAfOx7xs5xQOXX0hjjJquJGKbxEpLhw5e/tul863A
         32QjQiZIzQCHkTchRA3GvuEsa+DCs9PUwaVNTajwoRNkh6Svn4cO+eMAmJBJnl5kQd+3
         usSpch4SS12ZIj3n1zdqs5uTzmxkw28FoO7945iQZKQyUdrN8z5QDzuYq0KxtCU8T7c8
         ROzywTU5IE8FEzppg70KFEZ3gwMf0eq8Qt7yJZ+4MPwszQ5CJJGF0STIGv1agIotuYNL
         nYrQMJpe7KuAYGpj8bQ5JbIxtaUDqJIyEfLVTw5eKOSFQ88QNYN509WmWhwUuuUdByjA
         XxZA==
X-Gm-Message-State: AOJu0YzupZAY2KCQk7XYv+CWi6/4/vuiqiie1/svk9Bey0rgCdJztXiu
	eZ4Sa6dfjbb8jroVYcsrHK+iIw==
X-Google-Smtp-Source: AGHT+IGSL1p1dW58mi53fADPrMS0amj8i+XSKhwo/9G/kLwvyqkWgWFskajXHp22eZHGdYu7upCp7w==
X-Received: by 2002:a17:907:2d0f:b0:9c1:edd8:43c1 with SMTP id gs15-20020a1709072d0f00b009c1edd843c1mr2248045ejc.51.1697562234710;
        Tue, 17 Oct 2023 10:03:54 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gz21-20020a170906f2d500b009ae0042e48bsm144903ejb.5.2023.10.17.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 10:03:54 -0700 (PDT)
Date: Tue, 17 Oct 2023 19:03:53 +0200
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
Message-ID: <20231017-3518118151d433af9905238f@orel>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
 <20231016164958.1191529-3-sunilvl@ventanamicro.com>
 <20231017-b394a120094eeee31693e9a7@orel>
 <ZS6qq1Y9bLZ868KI@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZS6qq1Y9bLZ868KI@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_100358_336644_CA4155AE 
X-CRM114-Status: GOOD (  25.70  )
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

On Tue, Oct 17, 2023 at 09:09:23PM +0530, Sunil V L wrote:
> On Tue, Oct 17, 2023 at 10:37:41AM +0200, Andrew Jones wrote:
> > On Mon, Oct 16, 2023 at 10:19:57PM +0530, Sunil V L wrote:
> > > Cache Block Operation (CBO) related block size in ACPI is provided by RHCT.
> > > Add support to read the CMO node in RHCT to get this information.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/acpi.h |  6 +++
> > >  drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 99 insertions(+)
> > > 
> > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > index d5604d2073bc..7dad0cf9d701 100644
> > > --- a/arch/riscv/include/asm/acpi.h
> > > +++ b/arch/riscv/include/asm/acpi.h
> > > @@ -66,6 +66,8 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  		       unsigned int cpu, const char **isa);
> > >  
> > >  static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> > > +void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
> > > +			     u32 *cboz_size, u32 *cbop_size);
> > >  #else
> > >  static inline void acpi_init_rintc_map(void) { }
> > >  static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> > > @@ -79,6 +81,10 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  	return -EINVAL;
> > >  }
> > >  
> > > +static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
> > > +					   u32 *cbom_size, u32 *cboz_size,
> > > +					   u32 *cbop_size) { }
> > > +
> > >  #endif /* CONFIG_ACPI */
> > >  
> > >  #endif /*_ASM_ACPI_H*/
> > > diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> > > index b280b3e9c7d9..105f1aaa3fac 100644
> > > --- a/drivers/acpi/riscv/rhct.c
> > > +++ b/drivers/acpi/riscv/rhct.c
> > > @@ -8,6 +8,7 @@
> > >  #define pr_fmt(fmt)     "ACPI: RHCT: " fmt
> > >  
> > >  #include <linux/acpi.h>
> > > +#include <linux/bits.h>
> > >  
> > >  static struct acpi_table_header *acpi_get_rhct(void)
> > >  {
> > > @@ -81,3 +82,95 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
> > >  
> > >  	return -1;
> > >  }
> > > +
> > > +static void acpi_parse_hart_info_cmo_node(struct acpi_table_rhct *rhct,
> > > +					  struct acpi_rhct_hart_info *hart_info,
> > > +					  u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
> > > +{
> > > +	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
> > > +	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
> > > +	struct acpi_rhct_node_header *ref_node;
> > > +	struct acpi_rhct_cmo_node *cmo_node;
> > > +	u32 *hart_info_node_offset;
> > > +
> > > +	hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
> > > +	for (int i = 0; i < hart_info->num_offsets; i++) {
> > > +		ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
> > > +					rhct, hart_info_node_offset[i]);
> > > +		if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
> > > +			cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
> > > +						ref_node, size_hdr);
> > > +			if (cbom_size && cmo_node->cbom_size <= 30) {
> > > +				if (!*cbom_size) {
> > > +					*cbom_size = BIT(cmo_node->cbom_size);
> > > +				} else if (*cbom_size !=
> > > +						BIT(cmo_node->cbom_size)) {
> > 
> > No need to break the if line, we can go to 100 chars. And then, since both
> > the if and else if arms only have single statements, all the {} can be
> > dropped too. Same comment for cboz and cbop.
> > 
> Yeah, it is a side effect of working on repos with different coding
> standards. It is interesting that checkpatch didn't recommend to remove
> the braces. Let me fix it in next revision. Thanks!.

I think checkpatch is OK with single lines that get broken into multiple
lines having braces around them. In fact, it may even be preferred. My
suggestion is to not break the line though, so checkpatch would likely
complain after turning these lines into true single lines.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
