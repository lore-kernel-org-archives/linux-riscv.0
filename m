Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41CAC001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MYnPAj8UCSt+e3+oAmZkQCA9j869+AIMWmVvANxBYg=; b=ZZfY0HNW+A1LQT
	GxdutBJ1NpLsUy1Ob30VgzEwcJ5rkg5DhvB4FNJE4DerIqBwVGk9phDlNAEOEbZF3FnGqerbuO/kw
	yyyjr1L6+enlcdp9geTz5e9W3dIQhZi5NK+4ivTuzRyjDa9Cl0wdo2Evetj+mp6RdCmykBENzlfYW
	HihoAF9BocRW6E+bxpRZq0CoJIyuFbH2r6/xIAUURSEdyeb1lEfjZsYyjoujN/5Zso/ewKUWSDaE1
	gkDvIfvjXwWU4xVSaLy+jm3u52/bnvxmJXhTiKTiWc1hMAFauwEg7nE2Bc9ZYiX/9ij8NlJKsUMYa
	AzAIjmolPzt70udXjLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMUh-002cPe-0r;
	Tue, 08 Aug 2023 13:11:27 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMUe-002cOt-0D;
	Tue, 08 Aug 2023 13:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691500284; x=1723036284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bekUQmkLqiuuNXeg0IhE6M5EXx5phX87uLqdbgvDBug=;
  b=IZ+LXeGzirzicC6IcCDt/BG0e8K91iEgDbiQI+KQwrp61WgWmtFKC7lK
   AyDdUlkCXh1qlEHT0MzvgEqCf653W5qsxzCj9LXHs3jvSHJZFx2Edkylf
   CIKUkZNxVrKQgv7WVIlISn+pYZeYNLDMQHcsWSTNZWLEksUvsg8f0xZvz
   +Ho9cv9PEp1b0T9QJojRlyd4AhsVkaRHH3Xvy8xOU2Ndcs+XxjffRFZX4
   3KObNDU6q4lDCgpCYsTA17opRx6wMjhcIO8GafF+hH+vwwlfOwym9GyHf
   KtaS1D7xTgy3vi0argeJy6oTh1QDoycG3mdO3FP/ySj0d/4b7w0JV161c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434668100"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="434668100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 06:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731407306"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="731407306"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 08 Aug 2023 06:11:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qTMUS-009BJF-2O;
	Tue, 08 Aug 2023 16:11:12 +0300
Date: Tue, 8 Aug 2023 16:11:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH v1 05/21] arm64: PCI: Migrate ACPI related functions
 to pci-acpi.c
Message-ID: <ZNI+8CHSLT4g1UM6@smile.fi.intel.com>
References: <20230803175916.3174453-6-sunilvl@ventanamicro.com>
 <20230807224152.GA274647@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807224152.GA274647@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_061124_149552_631FDC25 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 07, 2023 at 05:41:52PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 03, 2023 at 11:29:00PM +0530, Sunil V L wrote:
> > The functions defined in arm64 for ACPI support are required
> > for RISC-V also. To avoid duplication, copy these functions
> > to common location.
> 
> I assume this is a "move" (not a copy) and the code being moved isn't
> being changed.

Not sure is proper -M -C will help to recognize that on the patch generation.
Maybe -M 50 (or another carefully chosen percentage) can help.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
