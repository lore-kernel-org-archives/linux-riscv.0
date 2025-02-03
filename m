Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79FBC02194
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sdg6EmLl6MiU/0Eq6B5IgabPIXSsgSOjWW4dwino8Mc=; b=gWXFEEDEQWmUp4
	YsG7o/Ji1fRds3aBgCVhTpn4EOyznj1Z5ifVu3ikbuPEdG0Lu67ZKqCozdQJoAh+y4G/kI558vppb
	ycrIBk92QYkv5dfo0j8s7BloH9XUj4B4Gh8tLrDaEACnxfCeE78f919PxplVLaQiMml4n2eXvHNjm
	+j/Dr7KlFo4B4X5cWxAv7fCIAgW1bU0xWijtohri+IZTm9dZWwG8LDO1bho2Vz64XNuL4yPpIAtwN
	GOLxR7YAHt0xyYgU1Gb5Cqw5Byq3g3vGBTsLzjv4zNVXv+6RjKiizpK4Zp7ockYPT/VmHgngBxZxT
	B7+4TiKyiNn/sBT30qhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevi1-0000000FOR5-29rs;
	Mon, 03 Feb 2025 12:37:49 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevhO-0000000FOLZ-2Ko5
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 12:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738586230; x=1770122230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hfIDKazatu6zjWjzZX8NO2y9nDwJDIinki/gvRlLn8=;
  b=Z1wnpGn8FIlfdnLrNVI8AG/2Uuudls3+jS12AH3h47qv0Ftu6rrTGLQL
   F4ZAu0fDihYQ3dG1tDCiIK59I7Tqg9dNBoOO8+KiXkZdCc/nQqiOwbwbh
   SOUeJHqx4cWSwn/PtZbtjA5FPaonwfD8glhM1USnFyDnI6Kcpt88fKQD8
   GtyACykx34kFarNzfIpdo/YhkC6urAU3QjyuYjlWl+7F6xMGDB+IN8Nao
   3Rt3VRuQ8tqJ62OOQX56wI+dx6/M9FHYRkS/5AwTUqQvh7gsrEci2kT29
   mbhBXcrLlLPGAzj18jJOQVJ34X/DvnK7eKsDw1THxz6tgIIoMpklwLo/T
   A==;
X-CSE-ConnectionGUID: GdUOpKaqTrGtWi5s2G8clQ==
X-CSE-MsgGUID: MjRGLtpNSZy0R4gbZ1VTcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38954783"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38954783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:37:07 -0800
X-CSE-ConnectionGUID: Qktvc/okRsyrMX4rQS+URA==
X-CSE-MsgGUID: rVXpaxrpS82OVaBvVMjFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110451647"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 04:37:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 71CCF23F; Mon, 03 Feb 2025 14:36:58 +0200 (EET)
Date: Mon, 3 Feb 2025 14:36:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <20250203123658.GI3713119@black.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6C1cg3cqik8ZxvU@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_043710_646429_97ACC6F4 
X-CRM114-Status: GOOD (  29.09  )
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

On Mon, Feb 03, 2025 at 05:54:18PM +0530, Sunil V L wrote:
> On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> > On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > > 
> > > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > > a property name like #mbox-cells which needs to be fetched from the
> > > > reference node to determine the number of arguments needed for the
> > > > property. However, the ACPI version of this function doesn't support
> > > > this and simply ignores the parameter passed from the wrapper function.
> > > > Add support for dynamically finding number of arguments by reading the
> > > > nargs property value. Update the callers to pass extra parameter.
> > > 
> > > I don't like this (implementation).
> > 
> > Agree.
> > 
> > > It seems that we basically have two parameters which values are duplicating
> > > each other. This is error prone API and confusing in the cases when both are
> > > defined. If you want property, add a new API that takes const char *nargs
> > > and relies on the property be present.
> > 
> > Also this is not really needed for ACPI case because it has types so it can
> > distinguish references from integer. Having separate property for this just
> > makes things more complex than they need to be IMHO.
> 
> Thanks! Andy and Mika for your kind feedback. I agree that having both
> property name and nargs is confusing and also ACPI would not need
> nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
> as well from the caller since all integers after the reference are
> counted as arguments.  However, the issue is acpi_get_ref_args() assumes
> that caller passes valid num_args. But typically the common
> fwnode_property_get_reference_args() doesn't usually pass both valid
> values. So, should fwnode_property_get_reference_args() pass both
> nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
> remove the check for num_args in the loop inside acpi_get_ref_args()
> function?

Can you show an example of a case you are trying to solve with this? So far
we have been able to go with the current implementation so why this is
needed now?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
