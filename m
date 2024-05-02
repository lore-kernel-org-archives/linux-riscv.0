Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F87C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEofZ9bb895EfFjkaWUf0uzuE04DV58LARFT0BTu9BE=; b=PUxb8n171tWsKh
	IPniCmiXammpGkfb3QoQe6Fw0smPp1kj2y3o1aOtDP3kFiOqrfswc5sGw1akVsWHPvtbLIf+8omWP
	yRbn3+wnX2FPOom6lc9KdEYqtw/lNT1HnwFFvxqm4sUt6gy5s4qZDKE1Jk6iDCOS5kbTLqoeIPfZd
	2sIERvRwgWhzrordXsFfmxW9oWa0reHJ9+3X3dFs9rgqQ+WEcMoaTHJgvvcI2IwrizMI1cV/3Vf6h
	MC7gtJ1yCpfcQ1Q8Sx3DAGKubbrwneaZyKxR4RO5FReA9YfU4AIUujF37nda1KDyXOc9H1ipunewT
	4MTG/RZTPXjU8gimbe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Sc0-0000000C83w-46pW;
	Thu, 02 May 2024 09:20:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Sbx-0000000C82e-0DAe;
	Thu, 02 May 2024 09:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714641617; x=1746177617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ELzIZ73e2akUHQJpgdE0zMt86IGlmi1Bdva3N+17hw=;
  b=B4zw7CzzHSC8ETZDjRajNp/4oiLBsbclgg+7fybgK/jNDA7HHSBmmyZ5
   VvAnig4TwIhgLgIRWXs17aNBoVE7brbbO0mGF8QQVpfAClI9G9nITiU7F
   o7JVHOkAW1Se+8kaCuh74iKdYBo9qoSVymKOwE5gmdIgfDVxg6SxedZEK
   buJURjrmG20D+PxdMAgB0sZ8CrSrbHQQtZ1Myj4VR2Kfr2FXSILKQWYH1
   Q9X3FKfaJs14+0H2HEMs2RcdXX+13KPDpBuIsSs8Bg9347peN94J76JRy
   80m6UdO9/eIc1mT/4O8l2SxxaPK7ZoFBOKMcfNbJfZHuR6stfwuMN2njO
   w==;
X-CSE-ConnectionGUID: eW+c52VwTVuk+62uaQji9w==
X-CSE-MsgGUID: PoTr1mx3QlO2dCYt7VVZnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14205207"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="14205207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:20:16 -0700
X-CSE-ConnectionGUID: P6lk84EsQEGlm9RlHsRk/g==
X-CSE-MsgGUID: mTWM/FTNSfil7mVmwM/XnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="64501407"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 02:20:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2Sbm-00000003GEk-2Bl0;
	Thu, 02 May 2024 12:20:06 +0300
Date: Thu, 2 May 2024 12:20:06 +0300
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
Subject: Re: [PATCH v5 04/17] ACPI: scan: Refactor dependency creation
Message-ID: <ZjNaxvh2ZSfDcTa8@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501121742.1215792-5-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_022017_135547_3FF60185 
X-CRM114-Status: UNSURE (   9.23  )
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

On Wed, May 01, 2024 at 05:47:29PM +0530, Sunil V L wrote:
> Some architectures like RISC-V will use implicit dependencies like GSI
> map to create dependencies between interrupt controller and devices. To
> support doing that, the function which creates the dependency, is
> refactored bit and made public so that dependency can be added from
> outside of scan.c as well.

Side note: If you haven't used --histogram diff algo when preparing
the patches, do it from now on.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
