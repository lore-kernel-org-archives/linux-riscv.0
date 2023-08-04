Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632E8C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 05:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mu8EPfX8LKK9/QV345lh8vCpQ2LhqakORjZQrSuwDBs=; b=2V8Gj6c2xAvAlL
	oaUcaA6tGDLAOjAVlTRkXsqRvRQCEn5pEFy76WlOtGQbn3LLagcPMlUv3BCMbV3ePlbxBXqfZUR29
	2zU+VHFs6f6OJCPPnEaS65i1zvwIbkQsAhpVxHRQwuwWeT4vNDszBujE0yxbYqIiy8UuBW/IXOpoJ
	mgAmv616oJjYflPyhUeucaMUnFqrPiiQNyJP2vufZ9RazNq3kSza5/LK9d4QJpVv1xvLzroa2Fnz/
	hbfUtsM+X/Fj4qu+LZ7+bBhOTJ3r9eTMwXAql2VltmhSo6dGYif4hEbs0oXR0z2yrTgtv31OjmGJk
	hUUZfI++np9GL81Bt9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnfU-00BcuM-3A;
	Fri, 04 Aug 2023 05:48:08 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnfR-00Bctl-1j;
	Fri, 04 Aug 2023 05:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691128085; x=1722664085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qUPFpNRJFHWbyQNHSkm00uWou7NNHfy0yV5vWVrDgkE=;
  b=LYKBjj5BBKXktg4sZLrE8dFP8hOKGI5yJDT+ubcM1IaeRuaU8hdBMq0w
   yi8sktgnaQI/WZwR9d53LR7r/enoyryBUlxsqO+v6cGLamvMYo7c1b1C5
   oI+1ujQDneQD73VwtH3v6o/peFgQgE2mjAgMc9RrdCa1ghrf3u2XpKctb
   wgOFLSr73ZYxWeRQZUiQfayqUwZR7I6aZ70+Gnwl39Gh3xMkthvAAuC0s
   rS+WEuzCSD+WyAbb0cmaPdBGSeEbGPb7Qa/YrmUBbXmChoRSeEbT3VGTd
   nFEfOYvy6oqdpZAHVivKlzhpCVe+HRwgE5JZyCGtF/WJDkMmNuTrbtydu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349664482"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="349664482"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 22:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060595126"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="1060595126"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2023 22:47:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qRnfF-00CEBQ-0v;
	Fri, 04 Aug 2023 08:47:53 +0300
Date: Fri, 4 Aug 2023 08:47:53 +0300
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
	Atish Kumar Patra <atishp@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [RFC PATCH v1 04/21] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
Message-ID: <ZMyRCRRkTnR/sK0u@smile.fi.intel.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803175916.3174453-5-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_224805_590677_83797730 
X-CRM114-Status: GOOD (  15.25  )
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

On Thu, Aug 03, 2023 at 11:28:59PM +0530, Sunil V L wrote:
> Enhance the acpi_os_ioremap() to support opregions in MMIO
> space. Also, have strict checks using EFI memory map
> to allow remapping the RAM similar to arm64.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>

You may use --cc to the command line when forming patches.

Also we usually consider Cc: as a part of the tag block, meaning no blank line
should be here.

> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

...

>  #include <linux/io.h>
>  #include <linux/pci.h>
>  #include <linux/efi.h>
> +#include <linux/memblock.h>

Can you squeeze it to have some order, like to be after io.h (taking into
account given context)?

...

> +			if (memblock_is_map_memory(phys) ||
> +			    !memblock_is_region_memory(phys, size)) {
> +				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
> +					&phys);

How %p can be useful here (it's mangled), but also wouldn't this give a hint to
an attacker about the kernel memory location and diminish the KASLR protection?
(IIRC after boot we always have the same salt for the mangling the pointers when
 printing, so at least theoretically it might be possible to bruteforce the
 printing algo to give a clue about the kernel address.)

> +				return NULL;
> +			}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
