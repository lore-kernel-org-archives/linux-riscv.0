Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09463C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GV2uYlNJoDA6yj5IHUAIjwMxm3VRu4VrHA6IXq/bdzc=; b=FhQx0q271zXAZQ
	g+xc57ZL+X0RVGbsiNvwgb/JWa4B7skxq9X36JEOfinswDHhn8YjJMVNJDAeBWoSwOc1EhZdjMwT5
	40P6FWQGdxWWhK+i7UnhsLRd4+vR0Nkas/2aY1IenQHquLfUXkJU1chMF5zwsSayQiIdrv5RpxfOo
	zJry1u7e9ki79jtC+AfjBy9TfQCZWq8u029zQQ4BsLdshmVNsezILN0vRnyFJEnuJuSbz5irDOFmF
	kvO//sMjk2Qvi8jlyQ7JoE6nYXa4odAxUf6daCxeoEa341sOHrUpvgDITERt3eGXtG3bH+T4JZVne
	qdxnnmdEv947nWkuisQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwHz-00CeMF-1c;
	Fri, 04 Aug 2023 15:00:27 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwHp-00CeGe-0W;
	Fri, 04 Aug 2023 15:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691161217; x=1722697217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MpvATlDjjJZIna8broQzbePYRa5IYY2XnpYjRR2L2Mg=;
  b=P4DNPlDpOjaHrVRWn3Wy7sS/FpauNxNnHt/rvW/GEJOenPHBgPTkd+33
   q1oyJmJWz7jrfrU2JtmT7j4t4C971MxanetmfKXcZHTLlKenjXKL6B46N
   HwV8FpHQREKqOGYM+6LSCpFaWbge2BW4vu1IIIq2QXCBJu/TBSg4ldB6O
   /W5FSyogjIehq9Q9/6NnF0TvqlB8cpVEp+B6qsuRFHREVGi1eHDRX2zDy
   jqgO6Qg2+2fkK2+wLqQff9SbZEO9GfuNRrsKsv+geX3mvHEtVwmwDpRxJ
   NT79MCO7GxGVZAArn1uQ8KZC6HEo2CRS4Uk6AP2EjZnufAViAEUvGicXI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369070005"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="369070005"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 08:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="730091090"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="730091090"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 04 Aug 2023 07:59:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qRwHP-00DIKr-1l;
	Fri, 04 Aug 2023 17:59:51 +0300
Date: Fri, 4 Aug 2023 17:59:51 +0300
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
Subject: Re: [RFC PATCH v1 09/21] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <ZM0SZwL9SXrEuFMT@smile.fi.intel.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-10-sunilvl@ventanamicro.com>
 <ZMyTDcffqXYT29JX@smile.fi.intel.com>
 <ZMzC4nHOJOfp0vaa@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMzC4nHOJOfp0vaa@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_080017_222269_0B4A7E54 
X-CRM114-Status: GOOD (  16.39  )
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

On Fri, Aug 04, 2023 at 02:50:34PM +0530, Sunil V L wrote:
> On Fri, Aug 04, 2023 at 08:56:29AM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 03, 2023 at 11:29:04PM +0530, Sunil V L wrote:
> > > Using new interface to get the CBO block size information in
> > > RHCT, initialize the variables on ACPI platforms.

...

> > > +#include <asm/acpi.h>
> > 
> > What do you need this for?
> > 
> > >  #include <asm/cacheflush.h>
> > 
> When CONFIG_ACPI is disabled, this include is required to get
> acpi_get_cbo_block_size().

How is it useful without ACPI being enabled?  If it's indeed
(in which I do not believe), better to make sure you have it
avaiable independently on CONFIG_ACPI. Otherwise, just put
#ifdef CONFIG_ACPI around the call.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
