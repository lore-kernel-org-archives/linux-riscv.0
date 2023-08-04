Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE21C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 05:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSjUGkJaMOqbDH7TpnUIiKspLoiKXaUtH5Xr0Bot7Qc=; b=AbM/ql9kWSncMO
	VALZ/hE2MA8v0hR99/ZKbbu3X/eFzs7WoMuAVJwnGJkr3aRAQBT4Nr+eA9kOMx/9KzwuT1chQLnHg
	IcY1NLNfUUXuN0nRV1YTNpDetb8X5Q69FxmnFRuKLyiCdvmb8nzvOPZGW0fDmgJuEvfRiXIVExrir
	rXVbcMlh1KCnV99W4Ae7OqmhvQK06vj10nvHwoCyGR1nOxGK+yXMgqmXP6TjdeQPLTG7ZDwoL8zDX
	EHFHxKT8CD9f6cQkrDPgZOm/vi/CAyJKXhRrSrUbWKz+ovUA1sM7P9QpRFuN5CNt94q8BlbtyfHZ1
	cIXV9utuxN42ZxNImkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnno-00BdVV-33;
	Fri, 04 Aug 2023 05:56:44 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRnnl-00BdUs-1J;
	Fri, 04 Aug 2023 05:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691128601; x=1722664601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rzakUJWPnPS3f3ldJfSEhOcAq/FjOCfS+YHo0F1hwLw=;
  b=newRIlsCIG8STJjiGaxOg/lcOjRv+b6TWH6ilUaorC+n9+uIRX948Bda
   N0azRjx17wJCvsP3yuh1yVqA7QnR0QQ+64pm5OrEe+eP1c/fkX3EuuUQe
   0YSv/tDKp6AvXxYdCx+TjtGsdwtvfFGgVnX9jSqGX5ULGgfmpYbamL3wj
   xNz2gFe8/zKNbNUHRgxBrR2HQHl5JNdWgb3OkKkRi/UUUYg2UPvOPtmhM
   zw0Vhp353HhX1S5Uset7k/eCLWJ7KnOu89y1w6uKPKpbF2uOQgBubvsDL
   LYBxaAiiBJumlfrw5z0FzkVAMjrCjbR+9zgf1C60wvjGof9sLRndoBh+E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349665940"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="349665940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 22:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="903744022"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="903744022"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 22:56:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qRnna-00CWIR-0J;
	Fri, 04 Aug 2023 08:56:30 +0300
Date: Fri, 4 Aug 2023 08:56:29 +0300
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
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC PATCH v1 09/21] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <ZMyTDcffqXYT29JX@smile.fi.intel.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803175916.3174453-10-sunilvl@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_225641_931218_5F516C9B 
X-CRM114-Status: UNSURE (   9.59  )
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

On Thu, Aug 03, 2023 at 11:29:04PM +0530, Sunil V L wrote:
> Using new interface to get the CBO block size information in
> RHCT, initialize the variables on ACPI platforms.

...

>  #include <linux/of.h>
> +#include <linux/acpi.h>

Can you keep it sorted (to some extent)?

> +#include <asm/acpi.h>

What do you need this for?

>  #include <asm/cacheflush.h>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
