Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319E8C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5z8Do9Cer+OEaTA7vzbFMGGpxyaL705NhNmvMMHDvv8=; b=LOh5I+eLRHMGJB
	+GvwEfh7RZvkRKtzEI5LSnr1ZBp1QkPTSwUB+pogp82EXJ6Wk5CD1buSXY4Zunmx/0cbMRj2kEkF4
	bgm2CMvJbsMeUhjQQ4F5yfeS7epvlxPmSCEnHxKNzYwngOUv1itzLv0go/foEUvSAXl3tU0vgwk3G
	Ut1EETmzKabcoyxEg7TudpknbAsWN4hsSf/UsZn+C5ghwVg+gsnJzjBTbE8JT07YoaeHCjxoLGQKH
	ddAW5FLPTR0NOBCIMJYOzMVT7RLrCs1oKs8aZKw/EfUyQEzRpSOsk06fl9OkO/aWCZIDFAzbAAeLQ
	2Ka5n10YVZ356i/zrM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Sg4-0000000C9Dj-2bpy;
	Thu, 02 May 2024 09:24:32 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Sg0-0000000C9Ap-3BMv;
	Thu, 02 May 2024 09:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714641869; x=1746177869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vob8HwvNIBqShNlkC5WdH3AbXBzht4hKUtEPIm9WJPo=;
  b=SC/zJsZKr9jBezIZn9gD37jEOj3oPZuYYg8Z6IIjpeQ969NrSXJqxFr/
   4FKmosksvZt5YHAuH/TvhRYvUqi63mcC6Fqxx3SRHFxJZnAuS9RLm7wG4
   u+3oP/ilY/Kwo8XMDatwAaCj6hPcUKyrj8ZbKgtjv64esMxezIewLLSJW
   blkOirpTMyWB+QciNNSmx9D04G/AbdoyyNShv03FS+sFavMnmgVevlmdj
   40TVGmgfYZBT1GyQS0ORCrgvJQCceyh3wor/Bxw3QwkNXebt0OGIXFppG
   kW+SfOOf1TgXNi2vMlF6RxAR277wtpEi13J5RgkfCDBKLIdcNKwotM3ns
   A==;
X-CSE-ConnectionGUID: C9oiGl3URxGJqGoK431rwQ==
X-CSE-MsgGUID: 9kdvVuAPRZutzPfzFR5ypw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21090201"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21090201"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:24:25 -0700
X-CSE-ConnectionGUID: FEKRVKUMRuKOBCq34jlVbQ==
X-CSE-MsgGUID: dEi7c3UlRCKUTgL7Jf9ogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27466047"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:24:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2Sfm-00000003GIa-3iCp;
	Thu, 02 May 2024 12:24:14 +0300
Date: Thu, 2 May 2024 12:24:14 +0300
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
Subject: Re: [PATCH v5 03/17] ACPI: bus: Add acpi_riscv_init function
Message-ID: <ZjNbvlUoCfa5UUHF@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-4-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_022428_830663_D9AC35D1 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 01, 2024 at 05:47:28PM +0530, Sunil V L wrote:
> Add a new function for RISC-V to do any architecture specific
> initialization. This function will be used to create platform devices
> like APLIC, PLIC, RISC-V IOMMU etc. This is similar to acpi_arm_init().

What is the special about this architecture that it requires a separate
initialization that is _not_ going to be in other cases?
Please, elaborate.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
