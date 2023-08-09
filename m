Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3235EC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 05:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BD1F0tYYo/hu+SzcYp8lB+yqVv0hwNnyN390rZd9O8I=; b=ial7jaMEVUefnm
	n7CtEcSFvkwxI5LbVe9IY4bIwXokOqzF0zBTozjakwEeb8dgWLRrqv/zM3LPUbWTvxzpQRHTnSL67
	XooCpjDaaELc3aUJwCmayRh9v33TtOraVE9ofY7cUfd6j2C2B6c/h6acoEH7++wp0weQzs9xKHoEC
	JfLPfBLjsW5jeASwSL9mB6mqXjMEGg00U33vZKcQgv216vABXE3nk5ug8GJcK+mNOFnB5gNDuP1Lg
	ePbpqe2TJ3M0rLQL6hhusfWSAYOHayUhxea0k/AbOBtQGK+TwBYN4xr8zapD30/GVSNmm4iOUKM/4
	/E1AOTMxCN2DGSulBCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTc2N-0045v5-3B;
	Wed, 09 Aug 2023 05:47:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTc2L-0045uU-2m
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 05:47:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc3d94d40fso55714365ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 22:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691560033; x=1692164833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCeIptmtpKy5q98QjD4SUtd19PTpMTjSWPCM/pRkRaI=;
        b=haeX18sUQdxxqI7SQwmn8SHKct03Vake+IzrKwZQdTEOTgqFjhH0yzb6gVvecUp++M
         LMJV1cVhnL5cBk05TA0BuUeVgPeqBBT5xVYYg8Fmt6oC4KEFpsb20dfFQp1sUhdBnv+U
         Agka3B9ydKgYsr/ueR6T9DXKuK4mFb7fnEgx45MrDCaANoCelYzVXJwVJd52Zm6ffFeo
         vlwzfD2WG7skOwNLlyX+ou/s/8GC3sc0bR5XFkYBOl3Ac4CqFz3U8O83n9htUtpGlbxX
         5MHrYLjZAe/fPUGNNnFPHYXY6gLf92Ljy74BtQmvCjyQU740MtA8mhZgL163A/u/3c14
         57jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691560033; x=1692164833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCeIptmtpKy5q98QjD4SUtd19PTpMTjSWPCM/pRkRaI=;
        b=awYdyvMcNjYwue57tfjwdRrtzfCahO8IT2prQrZdXmDM8yc9dnCKYxedg/qchnpywX
         xfpx1OcqWqevD+v/ubAjog+Nlkk+X81KINlwRu5xWYzbB1rvgr2AJCqYYKzm0XOf+nTa
         /DHddPbfgz+bGTnmJ96LuF2+M1XYTACYI2dmqBMvQCqPgJ5rIcs4ra3si555c9mLddd2
         uwqCh3pINhF2ITgDkE/ENSjvKxqKIHnLHKQFhqctJxAE3Ra5UuOjOHJLSosPDVYI2F6b
         cNBa315L1iapi/LPpiQ00jCWVYTSCWXjP5ak++F5CSoUz952EJ2PsPxwxmgD1CiHYvaB
         atDg==
X-Gm-Message-State: AOJu0YwlUYNLwUJCvnVSJtlSSX5x5KqpXUSH5Ochz2B7z5gFtS6Ifol7
	rhMLil9a0ry5wGEL/hC8DltjMA==
X-Google-Smtp-Source: AGHT+IFrTYPQ+5b8uQBjS2fcGKsPAzUjAy1/yAOVWR8AwSQ1NP6723J3EcH5VFWoXC6GPw4jT3aUkA==
X-Received: by 2002:a17:903:230d:b0:1bb:a85c:23cc with SMTP id d13-20020a170903230d00b001bba85c23ccmr2339537plh.15.1691560032814;
        Tue, 08 Aug 2023 22:47:12 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id r14-20020a170902be0e00b001bb381b8260sm10098918pls.100.2023.08.08.22.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 22:47:12 -0700 (PDT)
Date: Wed, 9 Aug 2023 11:17:02 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Robert Moore <robert.moore@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Subject: Re: [RFC PATCH v1 20/21] RISC-V: ACPI: Create PLIC platform device
Message-ID: <ZNMoVgO7mEDV07OJ@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-21-sunilvl@ventanamicro.com>
 <20230808-chalice-easing-1369c7386082@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808-chalice-easing-1369c7386082@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_224713_900180_223F7EEE 
X-CRM114-Status: GOOD (  19.75  )
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

Hi Conor,

On Tue, Aug 08, 2023 at 09:41:45AM +0100, Conor Dooley wrote:
> On Thu, Aug 03, 2023 at 11:29:15PM +0530, Sunil V L wrote:
> > Since PLIC needs to be a platform device
> 
> For the unwashed, why does the PLCI need to be a platform device?
> (And while you're at that, please try to make use of the extra ~20
> characters per line that you can use here.)
>
Sure, let me add more details and use extra characters.
 
> > probe the
> > MADT and create platform devices for each PLIC in the
> > system. Use software node framework for the fwnode
> > which allows to create properties and hence the
> > actual irqchip driver doesn't need to do anything
> > different for ACPI vs DT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Co-developed-by: Haibo Xu <haibo1.xu@intel.com>
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> 
> > +static struct fwnode_handle *acpi_plic_create_fwnode(struct acpi_madt_plic *plic)
> > +{
> > +	struct fwnode_handle *fwnode, *parent_fwnode;
> > +	struct riscv_irqchip_list *plic_element;
> > +	struct software_node_ref_args *refs;
> > +	struct property_entry props[8] = {};
> > +	int nr_contexts;
> > +
> > +	props[0] = PROPERTY_ENTRY_U32("riscv,gsi-base", plic->gsi_base);
> > +	props[1] = PROPERTY_ENTRY_U32("riscv,ndev", plic->num_irqs);
> > +	props[2] = PROPERTY_ENTRY_U32("riscv,max_prio", plic->max_prio);
> 
> My OCD wants to know why this gets an _ but the others have a -.
> 
It should be -. But with Marc's recommendation, this is no longer
required.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
