Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E2FC7EE32
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/N1mK2YBULNFXauOOFWnc+udbZm3q+lhv8Jq/D91cQ=; b=CJZLUo3z1bqtzw
	htDLxsVUoqBY+Y5HyncE0Q816xAL06ID+QRdqX3Xs/PGNerF2aq/j2Xtt0mAhWvmgskRwGhW5zxkF
	jsPJfyX8eJtk5E+MO3i1jkODIzoxxozxuSpE9i82EwUBVJfDfOhs22vr2a/a9kdRjDm47OKXX1ELF
	vsaq7T2dvGO4i0j8MRfaIfZZ/d8iv70uCCTNAA5HgvZiZn0dtie2I+vnYJpobCpw96rktiQRnlNne
	Y2AsQ8c1hg4AVpREBVuOVbx11FOs4KFoCCwhGe3FDKL6bi0pm+9FhGl/0kYx2n38BQzZnjwEMuiYf
	3f47EUqySd+PEvqTQdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTd82-000000026jm-1iWD;
	Mon, 23 Jun 2025 09:06:14 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcnl-000000022jW-3Qyw
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668318; x=1782204318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czCnr454L0Rdgtenujc5uQtXulaQ8IYmBZKADIw/Euw=;
  b=N5sN8uEneAvTT0cZzPVj75II/sCMkhI14ZotKmLgnwZkpyfktQCc82Eg
   vGv8GyzYsLh17N/p+IajmYGjRVfaYwt0uH9w7ts9+fYVKJG7QF0dH9y/E
   aJU60BuWxbPDy52GX2/voc1tMI1mESuzaLbnohZwsc0XUgYlNACPy6niG
   Emf2OPaUgDnMAfLJfc0R/XVWe3LmOwZahT8oa5TlikZO2/JH6ZBqCvIbw
   C/Jl9ih+/eGTn+FmMT4MbD2jh+hMyezIZXnPlxl8Lp3jnhc9dNau6RVgI
   Vc4RopYWhEDdY+jHi7ZdJTAbfnoW2/2W77Qxr6U/Tqk+3gz87F9xyEEmA
   g==;
X-CSE-ConnectionGUID: lICck0mPQhqN8BIp6YsFeg==
X-CSE-MsgGUID: eQhgdm8aT76UxN3DsR7Vag==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55498542"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="55498542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:45:16 -0700
X-CSE-ConnectionGUID: a/sJG7yBTmO0RoMIxh1VOw==
X-CSE-MsgGUID: sQ1iTc6BQKKm1IEI9yq6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155547323"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:45:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTcna-0000000973l-0JQc;
	Mon, 23 Jun 2025 11:45:06 +0300
Date: Mon, 23 Jun 2025 11:45:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 05/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aFkUETH_R30-CNOX@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_014517_872857_8CF18CD2 
X-CRM114-Status: GOOD (  14.38  )
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

On Wed, Jun 18, 2025 at 05:43:40PM +0530, Anup Patel wrote:
> Introduce optional fw_node() callback which allows a mailbox controller
> driver to provide controller specific mapping using fwnode.
> 
> The Linux OF framework already implements fwnode operations for the
> Linux DD framework so the fw_xlate() callback works fine with device
> tree as well.

...

> +	fwnode = dev_fwnode(dev);
> +	if (!fwnode) {
> +		dev_dbg(dev, "No owner fwnode\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",

Why not using fwnode directly here?

> +						 "#mbox-cells", 0, index, &fwspec);
>  	if (ret) {
> -		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
> +		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
>  		return ERR_PTR(ret);
>  	}

...

Otherwise looks like a good solution to get rid of OF-centric code from mailbox
in the future.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
