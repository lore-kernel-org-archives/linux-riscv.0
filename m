Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F67C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVuvrsjS+lZ9he9roDzXdSTPSLhDJ9UzlTpBk48V55I=; b=LOzyCq1Bbm9luX
	bgCbQSMsCUvWOz9Xe3d+ohA7VKv2Vvgl7EPnf+wa40J6Ul4k8QEErqINDh2CP1Ra3dLtnximLp/vq
	pa5XmGoBw0fNv5yBVI4gsVgg4n9lqP8Pct0x7J7TVPNeDtdH4TeKUs44Q2Wiawc3xkvtwnZi2xecz
	hXuNCYhCx73srja9VK49vfuU4cpKQ8ASwEXk91abs61y6UYB9UyujaLjpyn0vM53Ikj4SVI/uQjsX
	pQt9CJUNOhGkjAdDR2jFMoLmIxKVTlI1JRI/2moJiYujoZTH+GEH0/tQztN1jLSorg7j5BGYwHW2J
	62b6BkGHRAk6qyt6kHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMVG-002cV4-0i;
	Tue, 08 Aug 2023 13:12:02 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMVD-002cU4-0J;
	Tue, 08 Aug 2023 13:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691500319; x=1723036319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZvqL6gMp+MCmbuOfROmsCakRiUiVbzabkm79pxLHYV4=;
  b=nvS6rPbXXxwhFyDPVN2TvfF92BYf9HTtHO0h8+9W4A/c9MvdJ2HqxRh6
   0RP4wXxVYLsqxfoq3zC97TXtO/2YIVRvmrsG2IkY25nnkiglij+l6p9M0
   IOLtSRupIfnoqqLqQOS+1ufsuhAMBYw/JzBCWADpQrppFcrxUmumEVUR/
   QS8YbngoBXMxm59bxCaAtj6224UHQx+i6ZOkwmsZtYL1lAspzbP9HbKdv
   L2etTlNxx0EomdL8NTn0dFYZqOD8covfViWpCgc781zMA435jUgNd7fU4
   KSxLQRQoVQ0wGTSWlG9XLdci6pIduwWsYrEpveVLlqUZL1U9ihqlyju4t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434668220"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="434668220"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 06:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845472710"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="845472710"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2023 06:11:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qTMV2-009CPF-28;
	Tue, 08 Aug 2023 16:11:48 +0300
Date: Tue, 8 Aug 2023 16:11:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [RFC PATCH v1 05/21] arm64: PCI: Migrate ACPI related functions
 to pci-acpi.c
Message-ID: <ZNI/FEkj4VJnZqrF@smile.fi.intel.com>
References: <20230803175916.3174453-6-sunilvl@ventanamicro.com>
 <20230807224152.GA274647@bhelgaas>
 <ZNHJ+lO21c+0P4WN@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNHJ+lO21c+0P4WN@sunil-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_061159_179874_F209ED61 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, Aug 08, 2023 at 10:22:10AM +0530, Sunil V L wrote:
> On Mon, Aug 07, 2023 at 05:41:52PM -0500, Bjorn Helgaas wrote:
> > On Thu, Aug 03, 2023 at 11:29:00PM +0530, Sunil V L wrote:
> > > The functions defined in arm64 for ACPI support are required
> > > for RISC-V also. To avoid duplication, copy these functions
> > > to common location.
> > 
> > I assume this is a "move" (not a copy) and the code being moved isn't
> > being changed.
> 
> Thank you very much for the review!. Yes, it is a move as is. Let me
> update the commit message in next version.

Try to play with -M -C

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
