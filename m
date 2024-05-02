Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64502C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohmJfD2hn/MehpCOGXJyeZzulcaQNTv1cadslYMhzyg=; b=A0ggaEC//vmraU
	Y7UTVTb7kf5vV4+ueNzCOztGVOWOHRCwsap3dyJcxoYfdxT7YPu/y4+KGehRBgj9vlOGT0iMuIi3j
	xNWoT5cmgYRlmyTHi8/f9KpGYOZLdBjgkkPBu6HVH9SdhCkAmWbW/JDr9VKeuS66O3PDIgrNF/0fu
	3vBqGpkDwCXXxZMp8EOw69xojIBOVSx7lqgbiyhcAv4wkVkeCj/TK++sjfj/xZaz1/a7VveC+4nQL
	mL6vg3SA56jjkoCuVLR7H44GZ2+AsfuQT2/EhI1AXB2H8ApC2u//7CM50QdERG+TiW/jlhZq40D1+
	68qxKVC37lIRARfWBiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ShL-0000000C9hq-25Bj;
	Thu, 02 May 2024 09:25:51 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ShH-0000000C9gN-3Xbi;
	Thu, 02 May 2024 09:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714641947; x=1746177947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=orCRNPEGAfKwIw6UvvJyK2arZHKNDah7xC0rf7Z7J6s=;
  b=V6dnYg4B9UEz6gdTQ/uKhWauHh9BtDAznDSvrU3J17Pft1BpfI/2KmOH
   pApUte/7Ztl1v8W/W3xgNzMBRGrYGNiO0djHYy3+PcYyISn1U+uGoMtuH
   zWIfwWx9JFdSqVz6Q+TcVTZ9B7QxnMijb55BFDX7/V5vUwpUyrhK92cS2
   mx/mZ1MjZQD6CzCc2jLtGugo5NhhfHv/wXs+6krxTAKOj8BzCjdGWFH5Y
   hg7BaX0T830cHU8PGFihyVvKY0fBz+3LDamXWnStttAOgw+zy3T9WJwVa
   QxBMV8YuqPTz7+q6zQ9gk4fvd4F6QpZY9COIVmqqSWOZwckkDQXpGRl/j
   Q==;
X-CSE-ConnectionGUID: Z1x8GsEsTECqrFzhBcpzUA==
X-CSE-MsgGUID: TrnwXfZ0Rtabkfsccg9GOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10259503"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10259503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:25:46 -0700
X-CSE-ConnectionGUID: yWLUxasgQhKC0pOq8PsOKA==
X-CSE-MsgGUID: kfSrOKcPQKK7QxLmkg/vWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="58264038"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:25:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2Sh6-00000003GJd-0vLh;
	Thu, 02 May 2024 12:25:36 +0300
Date: Thu, 2 May 2024 12:25:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <ZjNcDyLRm9c7BAi3@smile.fi.intel.com>
References: <20240501121742.1215792-9-sunilvl@ventanamicro.com>
 <20240501165615.GA758227@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501165615.GA758227@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_022547_956455_6E614689 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <anup@brainfault.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Andrei Warkentin <andrei.warkentin@intel.com>, linux-serial@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Marc Zyngier <maz@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 01, 2024 at 11:56:15AM -0500, Bjorn Helgaas wrote:
> On Wed, May 01, 2024 at 05:47:33PM +0530, Sunil V L wrote:
> > RISC-V platforms need to use dependencies between PCI host bridge, Link
> > devices and the interrupt controllers to ensure probe order. The
> > dependency is like below.
> > 
> > Interrupt controller <-- Link Device <-- PCI Host bridge.
> > 
> > If there is no dependency added between Link device and PCI Host Bridge,
> > then the PCI end points can get probed prior to link device, unable to
> > get mapping for INTx.
> > 
> > So, add the link device's HID to dependency honor list and also clear it
> > after its probe.
> > 
> > Since this is required only for architectures like RISC-V, enable this
> > code under a new config option and set this only in RISC-V.

...

> > +	if (IS_ENABLED(CONFIG_ARCH_ACPI_DEFERRED_GSI))
> > +		acpi_dev_clear_dependencies(device);
> 
> This is really a question for Rafael, but it doesn't seem right that
> this completely depends on a config option.

+1 here, fells like a hack and looks like a hack.

> Is there a reason this wouldn't work for all architectures, i.e., what
> would happen if you just called acpi_dev_clear_dependencies()
> unconditionally?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
