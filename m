Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC50EC001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM+Sl8lnQR21lTEmipUkbzWVmUtXUcnGOMP5QDbKt+I=; b=z9VM39P3G1BVnp
	+tjyftiLaGpHlnzCDXxCTkznjecsAD1BwNzqJXsxwBVCbdNbIRn1ZVHR3Fxt7nsUFO8TkvwJjak45
	byJfEUJ0A84T0/MhWbw347AiFOt6JhKX+CPP+lguc8V6S+/J6IRtZ6CUgc/QKrDTcNxKxRh5YOWFC
	K8MVtXUeN2rfE6onRnrE0bJWfdJWs/+SG5PrEQ8kI4kEEHzOqtlR9pUPtKmTA9mPzp6+rjPdSFfJX
	IF4w5dkiXsIDb10yhK3odE8UH0utjLcVS/Nknrc1gXJaKHdXeuiV8MoK7v2rwXREXQ6ZXATSU55FG
	HkKoZAMTgtNHYN9duqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnrz-00Bdoa-2c;
	Fri, 04 Aug 2023 06:01:03 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnrw-00Bdmg-0v;
	Fri, 04 Aug 2023 06:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691128860; x=1722664860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAvcwaw2V/Hs8D65jgLxC2s97VzPceMveowD167hosQ=;
  b=cIsnvX/QRS8HADyYQNYlJktf7254HBDLrove7Gxd/Thyc22M9vdsekEx
   ZQMolWgZwgShQmfheEFArkKizdzulQzG2QP/Q37f/IxnjNlqqMrInesZK
   xt8ZHI0EKNN00HN2ikKt8+o3ptT9ZbvVSpAZBdP474AJgvtWOqsdQP0BH
   pDiZC6iqQ2aeMD4oYpowP/yqKjn2QkJRDCNizoNxoyq+/oohWN4/Hda9G
   dW6Q2bizHBZr3//9EYNaN7+p2hhU+pSm1JtZUt2swyvaqsIfl0PLylbbH
   iHp+wb1tveSbQkMjDHgbZf+t/soPVTPul/50VCe7MiUM8xXL04clNGRT6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367536845"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="367536845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 23:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853584925"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="853584925"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 03 Aug 2023 23:00:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qRnrh-00CegX-2B;
	Fri, 04 Aug 2023 09:00:45 +0300
Date: Fri, 4 Aug 2023 09:00:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
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
Message-ID: <ZMyUDZE0SxoOC696@smile.fi.intel.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803175916.3174453-9-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_230100_336122_EFC7BB35 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, Aug 03, 2023 at 11:29:03PM +0530, Sunil V L wrote:
> CBO related block size in ACPI is provided by RHCT. Add
> support to read the CMO node in RHCT to get this information.

...

> +	if (!table) {

Why not positive conditional?

> +		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
> +		if (!rhct)
> +			return -ENOENT;
> +	} else {
> +		rhct = (struct acpi_table_rhct *)table;
> +	}

...

> +	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);

> +

Blank line here is not needed.

> +	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
> +	     node < end;
> +	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {

> +			for (int i = 0; i < hart_info->num_offsets; i++) {
> +				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
> +							rhct, hart_info_node_offset[i]);
> +				if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
> +					cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
> +								ref_node, size_hdr);
> +					if (cbom_size)
> +						*cbom_size = 1 << cmo_node->cbom_size;
> +
> +					if (cboz_size)
> +						*cboz_size = 1 << cmo_node->cboz_size;
> +
> +					if (cbop_size)
> +						*cbop_size = 1 << cmo_node->cbop_size;

BIT() in all three cases?

But how you guarantee it will not overflow? I mean who prevents cboX_size to be
bigger than 30 (note also that 31 in your case is Undefined Behaviour in
accordance with the C standard).

> +					return 0;
> +				}
> +			}

> +	}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
