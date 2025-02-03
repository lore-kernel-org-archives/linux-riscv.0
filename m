Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB11C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15wa4OuDlww7xYynyudlYWxMkVFCL7DU4LhgRSzCdaU=; b=KGvvX8Ed4vkN2B
	Z673/ippWnOxvmuoVaPFfVV6xWUNngwpCL24xWcD6HvJVyVgXCFl5Ui/Cx4lNZb7pvUlrZ+BLObe8
	IonSVzpFvNWK1/nZSgfEceH9hFYCqr7K/WAA7TVWiAPxWS4tMdh+WtVkTailE3Tbdu7uR/OJbC2M+
	PNLp/+nxrrSTvDhJwaIy9GhfFo8novB/JzI3ySsPZKyKFD3kV/9La20NzbUhgoWTkFeW0tIL3Cq8s
	WlO2STJJ0f6KyVUxXrFBnahbIecJjyXDrqoB7eoTCpIj+WQLRfpWSMx5KY3bJ61vNR0mv8zYdPsoZ
	yhzCumr5Q6beKW4rUo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuHt-0000000FCRY-2V9S;
	Mon, 03 Feb 2025 11:06:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teuAP-0000000FB9X-1l6k
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UT6iujwd4LJPPLje6FFz/D9TczT6sRtrFzaWlemM0vI=; b=d0aaJUFq4God8W+NhXAR17FxQ6
	O6EHDKIQx5gcoDclRyuXppAkSDlMKNvszff+BlDBMaDdV1zFCHKlZmkcqTWThD5kCQbQDtbumrNFr
	xmmzsPTnpGI42NpvYOPTXdvwfIFRQFQgfYBElTzrDoPBqN6l4ii+75mIpQXFPs//fz473Cika9pvE
	AOm6Z7kzDZX7T5rWdQRZfVWbFKwfUEMxjFwHSfp1kqr5E48nLXv7/aloermMh1XX60BGTGhu4hVgc
	JCJLdKqM83iJ1sN48rrn5mShwUg7ClOVoada9ExOwaohpKHW89eskfbwgtpXi+7jrY67fwK5oThOK
	na4VVCNA==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teuAK-0000000G4cN-43CG
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 10:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738580337; x=1770116337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SR6S50EegGgplWqOre9ZfXPRLkLlRwOigQB40MvBL4o=;
  b=Wm7e4EtpcGfxHiGL2TP5cBjYx9t92lTGOyGKtd6Ue0cvYiK1+q3h/gDJ
   /K/sv4Wphrqr5u3XwgPPg/pDewoQXVARkMzkT7aUaDEqcwKiAKAh2MlWg
   6n2QuIgCcBQZrDZGDWTD6iH+i7gMqiPvNBMtlhlFhyyCG+VTtFvZ11Fd2
   DjbJakkQ323iFTQ7VOyTsS5fpWAbICMh+PYL+B994yNdeHANDPD3xzdwD
   FoqJkyhplFD1J8vOh9etRk38b0j9C+Xr3pBGTYSRtyh3mkwxkhjQ4INBM
   +UmnAoIs1B3N8qVMIbsebSyapa1l+PvmJcl43e9kSYMqFDDHdzy4RElfj
   g==;
X-CSE-ConnectionGUID: w4WWwSxSTnOlVKPlz89KvQ==
X-CSE-MsgGUID: wZbMjHhDQZu/9CTKV3ZwLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38274024"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38274024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 02:58:47 -0800
X-CSE-ConnectionGUID: yUZ9ybxJQxKd1zvikw0xzQ==
X-CSE-MsgGUID: gK/kZ4cyR8uM+cJCjynQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110413582"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 02:58:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D91A7214; Mon, 03 Feb 2025 12:58:40 +0200 (EET)
Date: Mon, 3 Feb 2025 12:58:40 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <20250203105840.GH3713119@black.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6CPvteWv89Xo70j@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_105857_904113_8E4D6C55 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > a property name like #mbox-cells which needs to be fetched from the
> > reference node to determine the number of arguments needed for the
> > property. However, the ACPI version of this function doesn't support
> > this and simply ignores the parameter passed from the wrapper function.
> > Add support for dynamically finding number of arguments by reading the
> > nargs property value. Update the callers to pass extra parameter.
> 
> I don't like this (implementation).

Agree.

> It seems that we basically have two parameters which values are duplicating
> each other. This is error prone API and confusing in the cases when both are
> defined. If you want property, add a new API that takes const char *nargs
> and relies on the property be present.

Also this is not really needed for ACPI case because it has types so it can
distinguish references from integer. Having separate property for this just
makes things more complex than they need to be IMHO.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
