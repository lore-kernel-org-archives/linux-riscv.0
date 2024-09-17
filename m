Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0CBC3601E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jecH/p+s4cVp8cVZ3BXs0vP3dWaGdtEpKGnaGgkaZMM=; b=LBtY9yDIoAMYBA
	IE4bbqrCQCh8XfR4VuWsWaNQAQuJOrT34S7GG/D6QH1ijyK4yZFm9wTg4zXwPyVg9w5/vuEJfFDqr
	tAbPh4VcafFDDiJWaZICAZNP+AhloOqfXIaIxvY1zI3s9YYRi4mr7m6HQJBQ1qyxEwEWW5MxRuOTe
	DxQYnPm6Pm7Y3itB4ZZjnPlaMJhM3LSE0Tj60UT+OnPt+Zcylmq3jESxc9g4JTRMkFaUPJs8T/V4D
	lydelHGMtIU4CtN+s0g4CKIrm58DbVLhjyVKQDpJErmP64rli72zTEdfk+vhNbCtMu6nVFl3OqkSr
	ir0q5GajOiycakquuBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYj7-00000006Gtd-2XpC;
	Tue, 17 Sep 2024 13:58:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYj4-00000006GtE-1w4q
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726581523; x=1758117523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZXeO3cCGpQp8km56A8jsnfTWizOI32RKsbTpSpPVZrM=;
  b=E4yB86KRVjEe5Ms0VFY298YXHLURFDig19oD28PTWwAUWFteJewatiEW
   4SVeIwGMOoV3szNaLgb5O1G7CPRRZbcnhuU/VVAfRNKaKYsOyAx//f7FA
   kd2irkQ7yOjiQMCjOGIhc9rpDtDKstl8OIcndzXuWoIULvNTcIUBrWnEk
   5K6tlO88g7/UD9GWwGMAIfIbSMrGv1CEmx6k06sXZBjoMChBDxftBcD/+
   hMs9r05+7IZIaAUTWVxgXssicvUwNfqw8InEK9b0vo5xregLh8fm3BhYO
   DuxodQyhyJuk2Cp6ol9TZd4yOhIz+8n5ZCmQ09XNyxX+L4HaNbd0Lyl07
   Q==;
X-CSE-ConnectionGUID: cvVwbTjoRrmPABTOmesCtA==
X-CSE-MsgGUID: kYfKR6FGQWeiT2JuqsrC5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25538896"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25538896"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 06:58:41 -0700
X-CSE-ConnectionGUID: DrsjfDWiQXS1CygqQkRpgQ==
X-CSE-MsgGUID: +42bj6NxTM6E86iNmlIkXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="100036764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 06:58:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqYix-00000009q6z-1l1f;
	Tue, 17 Sep 2024 16:58:35 +0300
Date: Tue, 17 Sep 2024 16:58:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] serial: 8250_platform: Enable generic 16550A platform
 devices
Message-ID: <ZumLC9I1Jf82Y8T-@smile.fi.intel.com>
References: <20240730051218.767580-1-sunilvl@ventanamicro.com>
 <mhng-d52ac6ff-2221-4613-9fce-f73467495389@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d52ac6ff-2221-4613-9fce-f73467495389@palmer-ri-x1c9>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_065842_583391_28E564DD 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: apatel@ventanamicro.com, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, andrei.warkentin@intel.com, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, dfustini@tenstorrent.com, jirislaby@kernel.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 17, 2024 at 06:10:25AM -0700, Palmer Dabbelt wrote:
> On Mon, 29 Jul 2024 22:12:18 PDT (-0700), Sunil V L wrote:
> > Currently, 8250_platform driver is used only for devices with fixed
> > serial ports (plat_serial8250_port). Extend this driver for any generic
> > 16550A platform devices which can be probed using standard hardware
> > discovery mechanisms like ACPI.
> >
> > This is required in particular for RISC-V which has non-PNP generic
> > 16550A compatible UART that needs to be enumerated as ACPI platform
> > device.

> It seems a bit awkward that we need something RISC-V specific here.  I 
> guess the idea is that we don't want to depend on PNP because we'd end 
> up with a bunch of PCI dependencies as well?  That seems like kind of an 
> odd way to do things, but I'm frequently suprised by ACPI stuff so

We have the same for HSUART on Intel (see 8250_dw.c). The ACPI devices use
different approach than PNP. PNP has the exact requirements for compatibility
with the legacy UARTs (to some extend). It puts some limitations. I believe
having specifics for RISC-V is fine. But I haven't checked the real IP used
in the SoC. If it's one that we have the existing driver for (like again
mentioned 8250_dw.c), then it should be added there.

TL;DR: so, what is the IP is in hardware for UART? Custom?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
