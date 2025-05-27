Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB429C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKKDJIV3hFKKAb/VtaKaFjJQ/eLZ26wcHHv5pggDnww=; b=Epu/d1HdbNUe00
	8SCKfaStM/nGzkmJ2gbHwuY/1yiArSSDLiZ73eRWB2wWwAtGr60nqIDz3a7VpWUa+6MzipNCEm7xR
	g7m08oZSUntsw8jyPgOFCEHZBkRTNHO7UBNAkJGELLo7NE+9oH9D2fhXugHlqkicwhwg78V/MV4/0
	sZUEr9xW3JfaiRvFe2dCwRYKScswZ6TfvnZsfXtIBpVn1vBAcF5Bwe9zR6Q5LATsTaRZSHLgPn9aF
	VUBDKYuixC9mp2ervpdcO0ZDaVDiJe6cPppA8t6OVyefO58167emwAkfqTaeYnZVYlp7ngRrVf0LV
	jLcaGMicz4bOfdAtcfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJq0F-0000000AIrJ-2ltA;
	Tue, 27 May 2025 08:49:43 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpy2-0000000AILC-31IZ
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 08:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748335647; x=1779871647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtysCbwslxqlZwIM9UyV2hJeTATNz4K07lC7vqcAAIk=;
  b=RAFVJbFRRgw502CtTQ/tyhKWc1zrnjLRuhXBcFr0d5g4JzvyvcogtQZN
   OaQnBiC1gfS9xHsDaht/9HGdPLNy6sRmiFNn6AMgL01uGy/zpWDzkYbqp
   pw5A/monwpffcCpUBrCQFSzMB3RSLyyFJUzB70cXV3elEOHlXtMIqKF9/
   hPzz2WyccqPEXl+lxaULucGk7Yk0/SEGSTBwqw1aECgkm7tW25YFLMoyO
   /su1nwTCPvIFT9se0iAGi3WqCF+NSwzjStNxTpBKpLTBQmolCqgWmb6fT
   2xAGuBwpU+h9Icy5aZgHoTPyT3fO9cobW3ZkvKMLz6/1AJu2pkXgllJWe
   A==;
X-CSE-ConnectionGUID: S8Nu5aM4TzaFT0QHyh82dg==
X-CSE-MsgGUID: Gzj74Nd8T9iqLmvLVOv90g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61721369"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="61721369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 01:47:26 -0700
X-CSE-ConnectionGUID: HVEXZxs7TFG9P6EBNM/jiA==
X-CSE-MsgGUID: lk/4bV7NTUubzL1z1c6XGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143691745"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 01:47:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJpxr-000000017WH-1MGm;
	Tue, 27 May 2025 11:47:15 +0300
Date: Tue, 27 May 2025 11:47:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 04/23] RISC-V: Add defines for the SBI message proxy
 extension
Message-ID: <aDV8E0TF_cYuoQ4A@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-5-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_014726_797864_4A722E01 
X-CRM114-Status: GOOD (  11.08  )
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

On Sun, May 25, 2025 at 02:16:51PM +0530, Anup Patel wrote:
> Add defines for the new SBI message proxy extension which is part
> of the SBI v3.0 specification.

...

> +/** RPMI message protocol specific MPXY attributes */

If you do a kernel-doc, do it properly.

> +enum sbi_mpxy_rpmi_attribute_id {
> +	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
> +	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,

> +	SBI_MPXY_RPMI_ATTR_MAX_ID,

Remove trailing comma for the terminator.

> +};
> +
> +/* Encoding of MSG_PROT_VER attribute */
> +#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	(((__ver) >> 16) & 0xffff)
> +#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	((__ver) & 0xffff)

This can utilise GENAMSK() or even upper_16_bits()/lower_16_bits().

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
