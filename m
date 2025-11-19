Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9E1CF58C2
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ho1awkCX4WB6cb4dKEPPO3cEllVnbt1Rgouy1n5fpw=; b=jjX0+O4qnY9mOO
	wkij4N6WD5ZYDJYbvtA6qagom0MoVe0Ha8vXiIJ9ULl+XcuU1bFtJcttPHGOEfZoWO3KF+gwITllj
	jMZZTgyFKdk9LIdFs5WoA5EdAGrcqEn0b+pR01qcH8Qojr4v/grpqZ/y1pBgvzmWnmZ1tj8vnnyaF
	HdABnJ/8Nd5WpTYNhUH59AMAwD3DILJPHndHqbMQIdYQwXVUObtFCJ10IEsVGbdfIiVKLmlWQgQcH
	4R2moJXDs1cJqsgykk9M7PI9/XMRjdgXs2tKeF/47RnJ4YkbZm/zaaC8c4s97CPIHctksmZXCzZHp
	SROVCxjNatjdQ7Rb/gaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmMy-00000004JaT-0gNy;
	Wed, 19 Nov 2025 17:53:28 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmMv-00000004JZN-1yiy
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 17:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574805; x=1795110805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9BicpL4nXo+3esO5FwqKJLNBLzof4vRm5DTLtVgfbUw=;
  b=INtHSYQOq/g4nz8T8Yc8w2hh/f9VqZH0n9noc9L7XCC4A8s0OMl3NmXv
   gbDczWgJs/L0ejewnviR5XsfaVK+XjXtnUUzakQzkYV0fgwYIz5ShBonD
   wSQpWM5ppQmTbm/DjVRdzBtobnWzT2zyVT3Um09+32UgIylO/pU1bKDmp
   G9iACT3nN/BJK9SmirGbkwnsBm5xOdsiOYNHbdZxSmStev8DXTLd5Lv9A
   S51ZOom2jnsLhZkovKK8VBnSuOyqkk+tcLRoMeEfiSiu75e83PRLoWLgo
   1Ufl2lLx85UTHtlRzTixeWs+QuVGFzThcpUq0/9PgAtnMEs77ekoCRSKQ
   Q==;
X-CSE-ConnectionGUID: 6SXC2SebTVKPS2jQr0q4MA==
X-CSE-MsgGUID: HKzTWzkyTRWm+i4byMcqMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68232128"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="68232128"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:53:25 -0800
X-CSE-ConnectionGUID: mcNnxbK0R4CG7P7v7goMgg==
X-CSE-MsgGUID: nVSgWJECT2GFUhpgch5Jww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="195432915"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:53:22 -0800
Date: Wed, 19 Nov 2025 19:53:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael =?iso-8859-1?Q?B=FCsch?= <mb@bues.ch>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Message-ID: <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
References: <20251119150049.13537-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119150049.13537-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_095325_544094_1EBFB3D1 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 19, 2025 at 11:00:49PM +0800, Jisheng Zhang wrote:
> Fold dwapb_context into struct dwapb_gpio_port to further simplify
> the code. Sure this brings a tiny 36 bytes data overhead for
> !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
> gpio port number is 6(the berlin2q soc family), so this means we will

GPIO

*and I believe this is limitation by Synopsys in HW, but I'm not going to c=
heck
the datasheet right now.

> waste 216 bytes memory in total which is trivial compared to the
> system memory.
> =

> From another side, as Michael mentioned:
> "The driver currently allocates the struct with kzalloc and stores a
> pointer to it in case of PM=3Dy.
> So this probably has an overhead in the same order of magnitude
> (pointer + malloc overhead/alignment/fragmentation) in case of PM=3Dy
> now."
> =

> So let's Fold dwapb_context into struct dwapb_gpio_port.
> =

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

> CC: Michael B=FCsch <mb@bues.ch>

Please, use --cc or move Cc list below...

> ---

...this cutter line. It will have the same effect on the emails, but it will
reduce the noise in the commit message.

> NOTE: this patch is applied against the following series:
> [PATCH v3 00/15] gpio: Use modern PM macros

It's better to just put a link to lore.kernel.org or at least message-id.

...

I have a mixed feelings about this, but if maintainers go with it,
let it be then.

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
