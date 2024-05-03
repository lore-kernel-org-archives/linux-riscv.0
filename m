Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75886C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+pkyKoETwE70hBajYtxhacE7QDLRmfsEds1lS2/ac0=; b=L8SjMN37rhY8xj
	71cJlHmf426u+2Ek78G9g+5/7iMvUcRRvXC3tKj/AtAScx8Dvq42fEIwL/eWGHnmzDE718ZfwRbNS
	qU4+YKTcJ2gn3uy7yJwKWuTL7RR5OclezPb9RHrEurLMCxga9ROy0bJMbiQHnnQqfYIa0vHXlFP12
	jOqqjKPfoGIdkElE4kXO8xHiKuMRJ8DOGaA8wTdZO8J/yKkugTooYw8zTU9A1/XxCKRhk+ik02I9j
	GR+7qsci1mIFYoBn4H8Me9UcgUXPhrr7eSLDef+zpM7jB3E0qTdamZ75WiagSo8XOjMYmaooRBno0
	oARcDc/wt7x11bGhyUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2utf-0000000H3Cp-3P1o;
	Fri, 03 May 2024 15:32:27 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2utc-0000000H3C2-3nsz;
	Fri, 03 May 2024 15:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714750345; x=1746286345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yxFVHXgO+anV8vLASPVvYb2Vlv6942qfs+GdKOTjrw4=;
  b=azuAXV6uuFS06XgaQHJ43ZVWbAWvlWpMdU1RtfM7aCR6TAv72xFrTSXd
   J/VPo5mp5bKAvbGdSLPSfMibOV6DYr3SIdxeKAoiIEmd5ZWBRp7Wovl8L
   OB1nWR/POA1/GqHaLbpfbQoG/ztTMsL0CQIatoBxh6eKlVwLK4hhlBpLw
   +xlKrxLIF9ZC7o833jOpN1WuP/LPrNW7k/X2joL7qXda8QsYdMbVEu7ei
   VDsIjHvKJ5vearorTnxjCp93jjzhMqrXtDffD6zU2ZBNN6YEL/6mCCh4K
   yli/acPA8tSwmbgBO0ackU1GkWKQd4fBGYMI1syImdn3TrnAGa6ASVO0f
   g==;
X-CSE-ConnectionGUID: 9iOiVj1OQq63qjLMesR3tg==
X-CSE-MsgGUID: Se4cJsd5TD+PRmOsA3Em9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10488960"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10488960"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:32:21 -0700
X-CSE-ConnectionGUID: 2M/Q9VVTTQOObdpg6it7mw==
X-CSE-MsgGUID: PPYkXuJ2SFy8qL2n0L+0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28070781"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:32:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2utO-00000003gli-2OHk;
	Fri, 03 May 2024 18:32:10 +0300
Date: Fri, 3 May 2024 18:32:10 +0300
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
Message-ID: <ZjUDeuCQNCuYgATA@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
 <ZjNaR-YtVTm4pbP7@smile.fi.intel.com>
 <ZjNh0Llcx+0VHevy@sunil-laptop>
 <ZjNmdfR2J6hNnYle@smile.fi.intel.com>
 <ZjN3GQI3gegYOIgS@sunil-laptop>
 <ZjOy2G0qN5G076i0@smile.fi.intel.com>
 <ZjTtx88zk4GvCImk@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjTtx88zk4GvCImk@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_083225_012445_66544662 
X-CRM114-Status: GOOD (  29.36  )
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

On Fri, May 03, 2024 at 07:29:35PM +0530, Sunil V L wrote:
> On Thu, May 02, 2024 at 06:35:52PM +0300, Andy Shevchenko wrote:
> > On Thu, May 02, 2024 at 04:50:57PM +0530, Sunil V L wrote:
> > > On Thu, May 02, 2024 at 01:09:57PM +0300, Andy Shevchenko wrote:
> > > > On Thu, May 02, 2024 at 03:20:08PM +0530, Sunil V L wrote:
> > > > > On Thu, May 02, 2024 at 12:17:59PM +0300, Andy Shevchenko wrote:

...

> > > > > This driver is not a duplicate of 8250_pnp. It just relies on UART
> > > > > enumerated as platform device instead of using PNP interfaces.
> > > > > Isn't it better and simple to have an option to enumerate as platform
> > > > > device instead of PNP? 
> > > > 
> > > > Ah, then extract platform driver first from 8250_core.c.
> > > > 
> > > Let me know if I understand your suggestion correctly. Do you mean call
> > > something like serial8250_acpi_init() from serial8250_init() and
> > > register the driver directly in serial8250_acpi_init()?
> > 
> > Extract the code to be 8250_platform.c and update that file.
> > I have locally the extraction of RSA code, I will see if I can help you
> > with the rest.
> > 
> Thanks!. That will be helpful. TBH, I don't understand what to do for
> extracting the platform driver code. There are already several vendor
> specific UART drivers (ex: 8250_fsl.c) which are enumerated as platform
> devices. 8250_core.c looks cleanly supporting such drivers which can
> register themselves with the core. For generic UART, DT has 8250_of.c
> and ACPI has 8250_pnp.c. But 8250_pnp.c comes with baggage of PNP
> contract. So, the driver in this patch is similar to vendor specific
> drivers to support generic uart devices which are enumerated as platform
> device.

> I can rename 8250_acpi.c to 8250_platform.c if that is better.

No, that's not what I meant. We _already_ have a generic platform driver,
it's just inline in the 8250_core.c and needs to be extracted. When it's done,
you may simply add an ACPI table to it.

> Could you please help with a patch even if not compiled so that I can
> understand your suggestion better? 

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
