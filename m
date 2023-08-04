Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C818C04A6A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 05:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FVOEKu1J7kM0qP6Tn1j3ZNUOeNXH0WnLN64kpOi/PI=; b=FxQkOhO5DZZuVP
	dBK2fmtnQ6PXDJFItvy+CupBO39lYlqu165e2ahoWlhJfvP5znuJLZ7JRqMxBZ/q+GdGQpOZemUTB
	v57RL4va3lRjjDEN9y34q8aRWnlVflmkjHrx/cMLT/LKnLd862z/DIbdIccVAYSaUYGRaGZ20AZzv
	sZABPi8qqz3kRz+nWWeFYf93mOhUk3pkP+ff8TyUd5/V1618T8O0rcetoavkv2rj2H/o/HA7qSqOp
	gKepVGXcBTG8vT3B0mgjSVFgRKMzeiwQqP87E9kQRfFhStNJf/Yl1aRM2a3MHeJTXycLx7JXYBrvb
	h6N3Y6UhDQgYe1wWTwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnkf-00BdFo-2x;
	Fri, 04 Aug 2023 05:53:29 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnkb-00BdF9-1n;
	Fri, 04 Aug 2023 05:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691128405; x=1722664405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4GC04UQtSW++hkGap/aB0IJ6PsV2/5cD7Mz2fax7+c4=;
  b=gCUEgQ+T5B+QtlodNByxErn0XNwZfl2Mxn4xRJeIqxzNMp7AWV1WkZg4
   pTyO518E2E4gfiK7vUrgZJK/GhHO7qF2a/drWzLOHP9P6lIQPxH6GOIfX
   7A9YBknPmoT4YDmmgKki6TuZliz//EdwgBTx424DGMaZTkbqCTzxgvo9B
   O0RT9hEQhB2yIAyYqC4NvumkEi3TBPSshmyni4usC6zEci6jYKfcFzJMD
   fcjQt9A72ABOhEUAh+ic7E/7AQMjrqeYn9/ZcQw3sVbcsEaLNjS9I3738
   QyCv51GCIywNs5qGD60aZ6zf3mhwpqRvHY+L3Rka9qSuxWxXWnOiYRzkq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368977387"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="368977387"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 22:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819973553"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="819973553"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 22:53:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qRnkQ-00CPJc-2v;
	Fri, 04 Aug 2023 08:53:14 +0300
Date: Fri, 4 Aug 2023 08:53:14 +0300
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
Subject: Re: [RFC PATCH v1 05/21] arm64: PCI: Migrate ACPI related functions
 to pci-acpi.c
Message-ID: <ZMySSmy0sNl7Q+rh@smile.fi.intel.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803175916.3174453-6-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_225325_611781_AC99DFCA 
X-CRM114-Status: GOOD (  13.09  )
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

On Thu, Aug 03, 2023 at 11:29:00PM +0530, Sunil V L wrote:
> The functions defined in arm64 for ACPI support are required
> for RISC-V also. To avoid duplication, copy these functions
> to common location.

...

>  }
> +

Stray change.

>  arch_initcall(acpi_pci_init);
> +
> +#if defined(CONFIG_ARM64)

...

> +	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> +	if (IS_ERR(cfg)) {
> +		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
> +			PTR_ERR(cfg));
> +		return NULL;
> +	}
> +
> +	return cfg;

Can be

	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
	ret = PTR_ERR_OR_ZERO(cfg);
	if (ret) {
		dev_err(dev, "%04x:%pR error %d mapping ECAM\n", seg, bus_res, ret);

but as far as I understand this is in the original code like this, so consider
as a suggestion for further cleanups.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
