Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ADCC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bP5DUKIqgwmPG4wbIzl8/m++XIUzd8PP9tK+3YiM1Rg=; b=h4bYHvkD3cBVrl
	KK1aBf61P0w8ds+e9E3Vb9rIYrZuq72uSs0lr3IVLA0WwjM9+f74QXs0ix8qrBM/OtJHlmq/g28PP
	AnvlzPdcLDjKOaGU0DS6XYpiroPiJJIjkONEZrdBlFd2uZnChRFX7Kvibn1oBogTPDlOPgASLvBZD
	hapMNbqPjtZWIdjMd/gEQLQrllFJnHvpudOjnigwyuVULOTAEAQjOJlINEsL12cm75+DzPkr6MYPd
	Fwj793dkkSucSjCAcT0vt0MdYsW6SjSwxDBZaM2nlLq5BKO8uATA8Kz7fKT5hZ6hf7UHk9BOkXvkR
	9hv1SE7IJT1bfSRNtU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdLw-000000029R0-0reE;
	Mon, 23 Jun 2025 09:20:36 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAT-000000027Ki-2voI
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 09:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750669726; x=1782205726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W7hiJd78r+59Ny4okc/0aID6HplmUdQ4ZRFh1yeSVfc=;
  b=cGQbN2C2+EloY1PliYfaVHSgvrC1C4hpz43xLMoAoEJl0oZy3rjkyPEI
   JJ7s3vU9UJtoBLu29pNtmHAkt1GvVz+z3D/CYe/SiQ+9QEp3d8U/jqfW1
   Cw9KMbRr/hckbg9dV+Bicr+OSq3TAAEs6/gVYuB3qvUuhli4SICGmFBzX
   ehh9fHguvvcbgZxkLXCEpXq+8rwl2rLNiRP0uj7wIDVW0bjQzKXmgaaHS
   /6OgdO3S3qc1heqrFieorg8hY2U9Yi87hk3iNKizN7uu2IM/FaKl6aXBw
   iqDs4WeZjfpqNGaeUnCiayIBu1Wey6/kwuRgsrR1fZIBJay7k2B35ZOqK
   w==;
X-CSE-ConnectionGUID: MVDYocNFTpab4ZRQJdGwWA==
X-CSE-MsgGUID: rHxukoOwSqOOivOnYHO7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53007170"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="53007170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:08:42 -0700
X-CSE-ConnectionGUID: NFYrKPxFSoSykF6AvZkAyQ==
X-CSE-MsgGUID: OhoYh5ZHRFKw4wgUN/vAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151115142"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:08:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdAF-000000097MM-339k;
	Mon, 23 Jun 2025 12:08:31 +0300
Date: Mon, 23 Jun 2025 12:08:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 13/23] ACPI: property: Refactor
 acpi_fwnode_get_reference_args()
Message-ID: <aFkZj2QCU2LfTI30@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-14-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-14-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_020845_759228_35B34D7B 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 18, 2025 at 05:43:48PM +0530, Anup Patel wrote:
> 
> Currently acpi_fwnode_get_reference_args() calls the public function
> __acpi_node_get_property_reference() which ignores the nargs_prop
> parameter. To fix this, make __acpi_node_get_property_reference() to
> call the static acpi_fwnode_get_reference() so that callers of
> fwnode_get_reference_args() can still pass a valid property name to
> fetch the number of arguments.

Looks okay to me, but I think it's better to have more eyes here (Mika,
Rafael?).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
