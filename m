Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8526C8303F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RX/wOyjHw2FPfIhBa051s/81Fhh8gY2qzY94Chro76Q=; b=cy6kQqmHgoBXev
	NLJYJ/Ebby7sDlgGVT7hKLx590tueOkCBfO9JFNbyMl/itugs6iWa/kzst1tTQCkc7bqE+3m95tmP
	GfOUQ9L68MCYkHZa5LXl1BbJejqzKqTG+wjP/NfLl6KQrcvLF/eK2mvckE7go9PA4xIwS5A9USVGB
	XuGD42qL2r4gqIdiAjZmmnTc2kDaEoScybC2T4saL6kouSu5SGRDR13SIlbQA+ihr0zWjdJLWWdmj
	JZkUQj7OYDenW2AnzbzGS+OHW+J4i5u/da8lGTMor8Qe7kDKiNW6yyy1z6pi1zA01o4z58vTZiBdL
	yvlm+WhxaUed1b//VGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwQU-00000008Hgk-0Irx;
	Wed, 02 Jul 2025 12:18:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvgC-000000088lN-301i
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751455869; x=1782991869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQCMzYb6py2zdb+YdFBHZxoeQM3A3WG6DoBX46UnyrI=;
  b=Voxw8ELPVv67Y+tI6EgdZG7MbwupEJzWUgV1dquWkixAB/yUANhsyFAi
   TX7ICdskkxWG3dyuekYsUYCvP8bG+anOJdYIRTFJbbGJNJ4vMf2DMEKYM
   5T3mgQiYtMEmJhGW2hx909G3mQRtPO52fad+3+XLZ/U14h5XfTRCmmfFA
   QWhgWk2Ye30IA9EK2RF8z978AZ165YyOIAvJggLTAssF/cqjYWKkngTix
   EvY3taUyxKYjGfyDnnJy98Wj+cX4KHXse7AKQVRgTn3DVCgD+sitFk4Ag
   te3qJK2l98eYozMHYJMIJraZEHnIBfsLHcucCACSVzHgnhoIFAj81SPk8
   g==;
X-CSE-ConnectionGUID: /nS8d/WUQPuAlyYkF7uKaQ==
X-CSE-MsgGUID: /x7uk2a4QY6SRemf8g0nkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79186468"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79186468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:31:04 -0700
X-CSE-ConnectionGUID: GgPq3gDpQmWwNZsum2/JhQ==
X-CSE-MsgGUID: ITHP5AsvTvGxhlUG+acF+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153456263"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:30:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWvfw-0000000Bu4U-04v5;
	Wed, 02 Jul 2025 14:30:52 +0300
Date: Wed, 2 Jul 2025 14:30:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 06/24] byteorder: Add memcpy_to_le32() and
 memcpy_from_le32()
Message-ID: <aGUYa6PWYFy4TyLg@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-7-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043108_794867_7E46D5F9 
X-CRM114-Status: UNSURE (   7.15  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:27AM +0530, Anup Patel wrote:
> Add common memcpy APIs for copying u32 array to/from __le32 array.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
