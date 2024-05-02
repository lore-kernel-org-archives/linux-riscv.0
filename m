Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2B4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0U6O1AJtO3o8Xe5tFNnZSUeoICIWrvprZS3f1IY9MKk=; b=vl7PmTDo2bwGYD
	bWM1jvM1aRyCH4PCy+rTHVYn2gZLL7DgeK5i62SAMgFTJa+J5plf7g8S0VdP7lajezXN0gQbNIyP2
	PxLlu4G4ttcbGb4mMfdtBHAeLubwrRz4tOO5KRaZVuL7B3qMo6BrKTBtcRSvCicbhSmIxfq0ZmGMu
	MaegkOW+Xs2Ej3wlZe72LdDpHn5KhooBfE7fCjttmeFvS6fSVZIL/qyeDJVb5lGe0ZVzZTmDULuWp
	JeLLfrIh9kGL3A+/vbRUk16BdNjvfTLNezZAu5oOjZMnZHAIMTvsNh0K2zpKV1sdcZl/l70XcgIet
	7pgpNihQkwkIIAQY2YsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TOG-0000000CHJ1-2uRL;
	Thu, 02 May 2024 10:10:12 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TOC-0000000CHIA-3PjM;
	Thu, 02 May 2024 10:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714644608; x=1746180608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=87FHMmdpw7b1gNaTVQbqStrtd0TI+1EIp0z248aiwBY=;
  b=n/UkU6cgDKch9lFCzQnb9VSQGA6dMmldbWv0jpFsjE22AWNlk2wG7Q+j
   eCb4nA9QUYkEk2XpnsJFDS4V9MHHu187f88oWYQG8zJBS+OpSDGvbaGiR
   VqmhDvYrqgIubZUUcRmbBes4C2jTK5jLUexdDwrDj3i0uTaFWYL3VKXkc
   IjeImfg0FlEGhGo72YbUn3PmvHwDkOQ6dXJ6CjmweyXP4ZbSPOPo5tmIl
   EK09yX3JucOJvF/n8V+F3s4SD/2V2JOU92BrcXqiu50VCo4iUMjEf5TQY
   eO2+ftiRuY8oQWYJOr/q1NMeqtNyDE0JTd6oJ3WluMYCrAPkcNkFtLRv3
   A==;
X-CSE-ConnectionGUID: i77+PysLTNq0SrSRBUY9ug==
X-CSE-MsgGUID: yiI0L3OFRUWPKZwZUST8fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10561139"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10561139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:10:07 -0700
X-CSE-ConnectionGUID: 0RR7KSU8Tby1qIbwmggvCQ==
X-CSE-MsgGUID: Rj5lDDuMQi2fWogM38doFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31743098"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:10:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2TO1-00000003HAt-11R5;
	Thu, 02 May 2024 13:09:57 +0300
Date: Thu, 2 May 2024 13:09:57 +0300
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
Message-ID: <ZjNmdfR2J6hNnYle@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
 <ZjNaR-YtVTm4pbP7@smile.fi.intel.com>
 <ZjNh0Llcx+0VHevy@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNh0Llcx+0VHevy@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_031008_897282_07116724 
X-CRM114-Status: GOOD (  21.47  )
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

On Thu, May 02, 2024 at 03:20:08PM +0530, Sunil V L wrote:
> On Thu, May 02, 2024 at 12:17:59PM +0300, Andy Shevchenko wrote:
> > On Wed, May 01, 2024 at 05:47:42PM +0530, Sunil V L wrote:

...

> > > + * This driver is for generic 16550 compatible UART enumerated via ACPI
> > > + * platform bus instead of PNP bus like PNP0501. This is not a full
> > 
> > This has to be told in the commit message. Anyway, we don't need a duplication
> > code, please use 8250_pnp.
> 
> Thank you for the review!. Major issue with PNP0501 is, it gets enumerated
> in a different way which causes issue to get _DEP to work.
> pnpacpi_init() creates PNP data structures which gets skipped if the
> UART puts _DEP on the GSI provider (interrupt controller). In that case,
> we need to somehow reinitialize such PNP devices after interrupt
> controller gets probed.

Then fix that code, we don't want a hack driver on top of the existing one for
the same.

What I might think out of head is that used IRQ core for your case should
return a deferred probe error code when it's not ready, then 8250_pnp will
get reprobed.

> I tried a solution [1] but it required several
> functions to be moved out of __init. 

> This driver is not a duplicate of 8250_pnp. It just relies on UART
> enumerated as platform device instead of using PNP interfaces.
> Isn't it better and simple to have an option to enumerate as platform
> device instead of PNP? 

Ah, then extract platform driver first from 8250_core.c.

> [1] - https://patchwork.kernel.org/project/linux-pci/patch/20240415170113.662318-14-sunilvl@ventanamicro.com/

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
