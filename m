Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28805C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwPK9MXzbfPBN46t/lCJihx/R1CRlTSBVYXdE93gIUs=; b=v2jkgWb+HaKMzJ
	PkYtlzW08BtGW38QsOJjFuYUNjLH33KFmSg+KepumPcevpeStWM+myGrD7ompxCB/rLwVRG7i/mcg
	mWYNap3VNSTG1XUn5YdAtj3X+zZdUqZQWGV095Z3796sNr3D/3r3mSJYNQEOseL/2M6H/4lSoxDRp
	ntUngzIiGJ5FC1HG7CVCzlgQac5DffzPj4ca6MFl+6lJC7h9KdHodpzXFfM1/CFipFFD3IjiNvToU
	1As9D21o44zKLlWLW/rG+QLL+oYefUhXeaLO4yJbYPsCiD1Kwtya72XWzxMwearqAiIRlfs9r0rPq
	zM8OVETO3L4S9qjKZM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2SeV-0000000C8kJ-14nN;
	Thu, 02 May 2024 09:22:55 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2SeL-0000000C8fe-3SjE;
	Thu, 02 May 2024 09:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714641765; x=1746177765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2oA8ldgZYHkMjR2V+LxaGdrDpb1xKBe+lL+dxCNsNr8=;
  b=eQTwq8fgIuUu0AZaTLqjJdJ6m/OPqOFphEOcFS8+2fLlEZzgdVXnxw7U
   r75d/yDs2WSuYFPCGcZetfIDddUzflUfcqWagJq7OIRdQKdwkrwx174IO
   CupJeUTZn51IC/7wb30z8NbZOuUFs+H2u/jYQ618DXLQH6QpuMFpxJ2WG
   BLdD8X7B3SQxeg4I4PdKsvTT3S9OKcIuJfoWVULQF1KrIpBeey43AhtFM
   xJezqRexZtkeU2X9dJ7b2VJ26Ht60I1pDr4BUEoio71wCqtK+ggBda7u6
   uUHNnC9E5rKC668qQbgqrE8PONFiSWsYXhI4UeIF3OxEkkf5P6hnY0v43
   A==;
X-CSE-ConnectionGUID: IuXH3EbwR4OQBj0baXTNaA==
X-CSE-MsgGUID: cwWUN0KBTWiJZlYCh7/IVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10225129"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10225129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:22:40 -0700
X-CSE-ConnectionGUID: rOlQAAf0R+mpvFFX9nD5Sw==
X-CSE-MsgGUID: hJxq4rkXSQqFppQsZhlRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31539169"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:22:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2Se4-00000003GHS-2Yz6;
	Thu, 02 May 2024 12:22:28 +0300
Date: Thu, 2 May 2024 12:22:28 +0300
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
Subject: Re: [PATCH v5 01/17] arm64: PCI: Migrate ACPI related functions to
 pci-acpi.c
Message-ID: <ZjNbVPYIjINdk4Fn@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-2-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_022245_961838_534E2873 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, May 01, 2024 at 05:47:26PM +0530, Sunil V L wrote:
> The functions defined in arm64 for ACPI support are required
> for RISC-V also. To avoid duplication, move these functions
> to common location.

...

There are -M -C parameters to git format-patch. Use them in the next version of
the series. (Note, you may add percentage numbers to each of those parameters
to get prettier result.)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
