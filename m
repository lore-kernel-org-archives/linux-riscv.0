Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC8C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clLU+X9s472JbiC3WqsxFi5G/ko4z4gzyod1sRsctlM=; b=u45Eku8zFwIAoZ
	cz1sxKmvLzefNdzpORwaZsn0gj/RbqLk3PpVprXxM14H1LJMUJRDQlXEUEfrRmuZbLlBt8Gqz2/7s
	XXxZSszzfuv+IWPjzNJtse+3s9r1MXvojyMkkQihfJ19dabxxyUoBBIv/j7ZHHiB3PYd7aDpNLmFR
	2aRmqnM7QgssVRGmgrhtQOSuZS6X67J6ahpEz6t85q46V9CRZcWu025VVEVIA7VzeKNZGtxfFtdJQ
	dBmCn1geXxXSRO2KezcyVbpT7paLzD8jQJpYd9EO5Wnh4XwhmAXI/Srqt6kyHSG4iyT99Mcl/yG2f
	O4ogxshkHHYJfGYZQO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YTj-0000000D8zW-02Tw;
	Thu, 02 May 2024 15:36:11 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2YTe-0000000D8yP-138P;
	Thu, 02 May 2024 15:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714664166; x=1746200166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E8C2qPCeaHtiAjUVZaWnodtIyl8a3pqbTM+93AmJ71Y=;
  b=QtoE4S2TD/Zydye5zbGRRId3hC7L9M5OTp+r+du9wNpqjwx+wPItdfEi
   EjIhVKNtk/8HARD0XH1xe3TOTnB89rzC1s8wqJn527bpNWblSVb9HdvAI
   i0qIYZPJsfZZxwP+JgExeM2q/mgIf0HSQvklCsPE5nc9ypJs/MLWmxRGa
   +pklcts+rAKBQ4QFbaWjUsZs9t1IALE+AqTEjRV09UTXCon4zPxTZxKm7
   a+ZbMJTo/eI0RWg+x/9yIDEvfDi97m+8CQxgT4OX/rGRW5CnTyl2TNI5j
   X+ohPCJXrRHmj0oXHhRg0UOMaRAEVcz8NVVYX5C7s3yPqPbJPWmOwrmCD
   g==;
X-CSE-ConnectionGUID: g7duYMl3S5KeaS1BGnsulQ==
X-CSE-MsgGUID: LPLlUDuQQKStV0QqIpXKvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10570076"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10570076"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 08:36:03 -0700
X-CSE-ConnectionGUID: b+Q2+7rHQo2NCSK+Z3AvIg==
X-CSE-MsgGUID: qhp105huQHCdu0Ee90JJ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27208567"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 08:35:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2YTQ-00000003Mdz-43wp;
	Thu, 02 May 2024 18:35:52 +0300
Date: Thu, 2 May 2024 18:35:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 17/17] serial: 8250: Add 8250_acpi driver
Message-ID: <ZjOy2G0qN5G076i0@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
 <ZjNaR-YtVTm4pbP7@smile.fi.intel.com>
 <ZjNh0Llcx+0VHevy@sunil-laptop>
 <ZjNmdfR2J6hNnYle@smile.fi.intel.com>
 <ZjN3GQI3gegYOIgS@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjN3GQI3gegYOIgS@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_083606_441826_5408A11C 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, May 02, 2024 at 04:50:57PM +0530, Sunil V L wrote:
> On Thu, May 02, 2024 at 01:09:57PM +0300, Andy Shevchenko wrote:
> > On Thu, May 02, 2024 at 03:20:08PM +0530, Sunil V L wrote:
> > > On Thu, May 02, 2024 at 12:17:59PM +0300, Andy Shevchenko wrote:

...

> > > This driver is not a duplicate of 8250_pnp. It just relies on UART
> > > enumerated as platform device instead of using PNP interfaces.
> > > Isn't it better and simple to have an option to enumerate as platform
> > > device instead of PNP? 
> > 
> > Ah, then extract platform driver first from 8250_core.c.
> > 
> Let me know if I understand your suggestion correctly. Do you mean call
> something like serial8250_acpi_init() from serial8250_init() and
> register the driver directly in serial8250_acpi_init()?

Extract the code to be 8250_platform.c and update that file.
I have locally the extraction of RSA code, I will see if I can help you
with the rest.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
