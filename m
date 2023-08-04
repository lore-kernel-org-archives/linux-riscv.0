Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E7C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KK2CC5C46SEUyBHGz8IZmZCtBSbMNxwAkFsX+aybjTY=; b=jRtPaCurxQ+NgV
	CgNjb26Iux7kuubC+nnJRvtM2yHkZrzHqVvp7siiu2tGAkghtq6tBZxz8Sv7DV96HMyW4KmOPSqdv
	jiwJB0inh32VF51D/9xbBq/t79nz0h5u7vLgT9ByymkEM/QZXd0HaWZj9zpDhI4i961Emtwk4M9Xq
	1urgaQuEB8ma8A6nLGO3N5Fp9sMhAgRV3+OVxGvW3ryoul2LfwSuwsUfuiINBusq9xN0YdBoEgP3Q
	ayUp8Rr8X/yqskaTMfgWNQCg/phVadwKMkC//hhuHiIH1EJEIQUHK4UP0kO2f750nN3JwVKZIUUJa
	Vl9GSrVkYiAkvlS6ePEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrBs-00C1cw-0z;
	Fri, 04 Aug 2023 09:33:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrBp-00C1a3-1S
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:33:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686f090310dso1797040b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691141621; x=1691746421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6pJFE+LbN3t9KX562ET/U8O9x6jKkVFfcHxU4OoKLU=;
        b=GaIVrBlWNau1bDYf593GlJiU6Af7nAeBxxB4u4JryuWCHG8sEeuZrKeXi0Jkc5ydvg
         f5XIIJXgZ6tFqSs1y6JJluCYxHah8cYi2iM/peqn9wrByAlUjT+T5EwQdGIKOSObiBdh
         vXZrFjRXul+2bYCK0XU0x719gMWrepNiI/ld1MZjlcvoWzgIWyqD4vQWEGTYvdAlr4vl
         yOuYWt4cBHch29OVlaSlUWs+NHFRivXWHfPcmPSAIcRaXJrYop/kZMlqspmCLYJAq1TM
         RzOhjzIV+E8WdLg0Scjri0wwQ7hnaraeQULqXHImH4YHHGDqMS4OttacG9d3If/bcmxc
         an/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691141621; x=1691746421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6pJFE+LbN3t9KX562ET/U8O9x6jKkVFfcHxU4OoKLU=;
        b=GSzxXROIUPlkBx706FyPvyJGnwCpqARasaLV0uTDnC70/XK4UGlfhStKMaPAFSYvn4
         iq1bT90VH8ljw/t19LhB/J4r7/ovXPPq0v6zBkreZlrdJj6QTcVS6IXPgcmZh2Pow1HN
         jpaGLO+5WDO8wEOWKtRCd3yMdBan+FvBnIN3cf49u+XiGZs0eCU0aPafnqSFveCKdbKl
         YGmW3JnP+tZp8SLpZrKvkdj8ZgiEQij5BCAqzKAsP/3vPKA5DjVQnPA8ph8YVP2HRz+A
         rNtqqBFgcxOomDCGicpSXmnGU+yEacqyxvkDC5fu3aENJ4HD1Z7ecNJJDxfXp/ZSh6FZ
         /pyw==
X-Gm-Message-State: AOJu0Ywel3pqJngk6S3H4EXPhJXUwNn9JU4+u2yCfOWrpBCFuO0rkFcD
	jUJlT+pIPquKQV38/lX4xv3XrA==
X-Google-Smtp-Source: AGHT+IE9uAGKFQAVKKVyBKP+6lj+Wv4xxWX0reh7x6nnrpB1UJCiBCXbpcTB9CxHE+g7R/t5zY0Rzw==
X-Received: by 2002:a05:6a00:21d5:b0:687:7d09:c0f with SMTP id t21-20020a056a0021d500b006877d090c0fmr1517925pfj.12.1691141620733;
        Fri, 04 Aug 2023 02:33:40 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id v13-20020a62a50d000000b00686ee7ba3easm1180143pfm.216.2023.08.04.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:33:40 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:03:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC PATCH v1 08/21] RISC-V: ACPI: RHCT: Add function to get CBO
 block sizes
Message-ID: <ZMzF6e8jjGY2YNjm@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-9-sunilvl@ventanamicro.com>
 <ZMyUDZE0SxoOC696@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMyUDZE0SxoOC696@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_023345_494373_ADB439D7 
X-CRM114-Status: GOOD (  17.84  )
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

On Fri, Aug 04, 2023 at 09:00:45AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:29:03PM +0530, Sunil V L wrote:
> > CBO related block size in ACPI is provided by RHCT. Add
> > support to read the CMO node in RHCT to get this information.
> 
> ...
> 
> > +	if (!table) {
> 
> Why not positive conditional?
> 
Sure.

> > +		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
> > +		if (!rhct)
> > +			return -ENOENT;
> > +	} else {
> > +		rhct = (struct acpi_table_rhct *)table;
> > +	}
> 
> ...
> 
> > +	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
> 
> > +
> 
> Blank line here is not needed.
> 
Okay.

> > +	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
> > +	     node < end;
> > +	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
> 
> > +			for (int i = 0; i < hart_info->num_offsets; i++) {
> > +				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
> > +							rhct, hart_info_node_offset[i]);
> > +				if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
> > +					cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
> > +								ref_node, size_hdr);
> > +					if (cbom_size)
> > +						*cbom_size = 1 << cmo_node->cbom_size;
> > +
> > +					if (cboz_size)
> > +						*cboz_size = 1 << cmo_node->cboz_size;
> > +
> > +					if (cbop_size)
> > +						*cbop_size = 1 << cmo_node->cbop_size;
> 
> BIT() in all three cases?
>
Sure.
 
> But how you guarantee it will not overflow? I mean who prevents cboX_size to be
> bigger than 30 (note also that 31 in your case is Undefined Behaviour in
> accordance with the C standard).
> 
Good catch!. Let me add a check that the value is not more than 30.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
