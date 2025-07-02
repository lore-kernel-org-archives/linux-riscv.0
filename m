Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55933C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfvzPAGprrhsXXdhvOTOM98CQD83vKecaDrwT8LOUcA=; b=UQSp2e6b0AD4BP
	9hY5V7uYz1f2dpRE83HIXILaz5JgsRfkTgWG44sLu7XpgyvEn3h0BRCFYJ+MkPCSY7qKpEQqwoH86
	MsHbkAOr26rg23ipu4K+KeoBy/5i/6W0EGFByDsS6f4VQpBDOCvQBAXuAcr5uySQ/qQiTeqHWvhJw
	TwuVPReXh9MlgP86Um+8pip/1I2qI2xsX13NRBc0C7l+DmyL6vNlmZmqKvNRtmxXYHcAqHrumLTAV
	iYSJSY40vytnSh2GbEMBgt0NPmfKPBHk2hW0f5CH+YzLhUdWwbGUjUpaq+h/rW039L1QJHJFCGwV2
	q5NNWDlmqCnLNssjlp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwXT-00000008Je6-0Hrx;
	Wed, 02 Jul 2025 12:26:11 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvuJ-00000008BCj-1MCa
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751456743; x=1782992743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dErZgu/HmVYj+emESiL6/oyn/LFKoTLtLdPT26fxZz8=;
  b=TdqSUVh4Un0m7GT8ni06YCHl+cjHPf1InMdKa8VzudHTSJhUb773+NiA
   eEGNGYw16fc3r0qpUxfN9Z/VRxx4dz7Ke9JJ3TkhId7hIh2bhxA0bFxg3
   b8MDgaa0Xjtd1kR4erSdcvbs76LRb1cuXt1wBCYtf/nUPkBzLBcTlJcTu
   zXvnfGeeGsSU/ClcATcKbKXDyOdDQDVaqWSdXY5E9wPbpp6LmKGzomRHT
   SrZiUOcVWayD7C344kXN/CcbD2w2s5qY5+DescHBd9FqiaWmLYyuZVhHh
   kN0W8hqS1t8CNquCo2X/x2oCmP8Y/2dKzGP4LPhuDVGwRqcYSBCQhVGNU
   Q==;
X-CSE-ConnectionGUID: vDrt/i9kTF2jJdPXGQGFhg==
X-CSE-MsgGUID: PKgk8W2lQQKyPC09rMsVrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="41374948"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="41374948"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:45:42 -0700
X-CSE-ConnectionGUID: Lp6tvve7RQCCemKpcNKtgQ==
X-CSE-MsgGUID: hw5JwzpsRDumshym1GmB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154786702"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:45:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWvu7-0000000BuHj-416w;
	Wed, 02 Jul 2025 14:45:31 +0300
Date: Wed, 2 Jul 2025 14:45:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 16/24] ACPI: scan: Update honor list for RPMI System
 MSI
Message-ID: <aGUb2yjvC3zhqKyk@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-17-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-17-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_044543_374156_E9911F59 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Atish Patra <atishp@rivosinc.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:37AM +0530, Anup Patel wrote:
> 
> The RPMI System MSI interrupt controller (just like PLIC and APLIC)
> needs to probed prior to devices like GED which use interrupts provided
> by it. Also, it has dependency on the SBI MPXY mailbox device.
> 
> Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
> list so that those dependencies are handled.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
