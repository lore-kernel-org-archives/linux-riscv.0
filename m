Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D092C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70mNU00DrnIsTM/UlsL0u6TI82qOazLLgomnvNtyspU=; b=Ke57XP01btjmSv
	7l9fHwHu7I6lgcR+wUZcxJB2g3aF7eSEoxmGylhbs2okDfeiXP2YRo8lidpMOymLU6ZD8KWmhvEcu
	sAFp0LaJU3DiDF2aA7OKqCou0NRetLZjxGGBJ33W/4/ZB/MHxpQF7tq/i9jWIh/hvGsNkAUIPMD2r
	WrEMBNUiuUjVsdBNiflovOtasYZc7XMnblZYbGB2unrLwK5tSd8dl3q+2qW6FlTQj/PGSIQWhpvRq
	n+u+KHmp8TTQaASUG9yChDDQgdmbFyTMTTLqCUXtaXD+wmMs+wLVnu7gdxwrgRTBQ1T58qGTVqMYv
	0piCVkWopK9y4kYCk4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2SaC-0000000C7Zk-0A7y;
	Thu, 02 May 2024 09:18:28 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Sa8-0000000C7YV-2l8d;
	Thu, 02 May 2024 09:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714641504; x=1746177504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/QufiF272o3DvR0cKkQMFkYPKhS35DQjuKoUIBYmTk=;
  b=kbmXp/1B21yUuwq+qOXE9zjQItJoxrW/2C+eEUrkEy3LQ2lH2jLxIwx+
   AwSJZ/EJQAarnaf0qoNWS1XruUMeZOcD0Hw4/6e3/SmV462wYdArSITZR
   uiKAHHtUJOpAgm+8qVYoRLiKG109tgbtt2vW/YKqxVSZY/OSB/0DjxIki
   ePXmaRk8zCc1diDzeESnQdEb9NqDZx+FEHlC8yL8xX6cKfwAIr2kPzlXG
   /PsqvqsLBIcrSFDDJ5LHdCZjG1d7XyQZGiBevTx1/u3g595JG7K27FVMy
   lx1UZI0cnQlpl/NL3DjqXOr11cEKYayYGO4klvuv29rJgVwayr3lRxD9j
   g==;
X-CSE-ConnectionGUID: wmiPxgosSbSCCDdCK+UtmQ==
X-CSE-MsgGUID: 5FTnfNZbQ8ekEkdGMLFJmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10274163"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10274163"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:18:10 -0700
X-CSE-ConnectionGUID: weq2NrOvSyClDOUB0O6Igw==
X-CSE-MsgGUID: iZzhZm4ZT9S/eDC2HeXt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27142469"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:18:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2SZk-00000003GCl-0xR0;
	Thu, 02 May 2024 12:18:00 +0300
Date: Thu, 2 May 2024 12:17:59 +0300
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
Message-ID: <ZjNaR-YtVTm4pbP7@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-18-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_021824_778213_645847D1 
X-CRM114-Status: GOOD (  13.28  )
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

On Wed, May 01, 2024 at 05:47:42PM +0530, Sunil V L wrote:
> RISC-V has non-PNP generic 16550A compatible UART which needs to be
> enumerated as ACPI platform device. Add driver support for such devices
> similar to 8250_of.

...

> + * This driver is for generic 16550 compatible UART enumerated via ACPI
> + * platform bus instead of PNP bus like PNP0501. This is not a full

This has to be told in the commit message. Anyway, we don't need a duplication
code, please use 8250_pnp.

...

> +	{ "RSCV0003", 0 },

Does it have _CID to be PNP0501?
If not, add this ID to the 8250_pnp.

...

P.S.
The code you submitted has a lot of small style issues, I can comment on them
if you want, but as I said this code is not needed at all.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
