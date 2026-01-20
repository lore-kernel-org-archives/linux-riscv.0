Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4184D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sc1372iLwz+TAf+YsJ6dZ/QF1m1Uvi4DW23/Sa3DkhQ=; b=Z6/vJQfYGYcKxL
	FQWt/pBqD4yXzN3tk+wZ8xFv3Lob92B1vFJ26hzoo81K/ey/fvltYynzqH8JKtoJRLWFzPJZJJFNS
	J4FL0RNxtKbTsGJI3hcixWc/JXo9/7CsRweVdq0WufvvEskiPFfHtgQzQMqLQ0nWLwpdcD+NLf7Ng
	mZiW983tCaI4r/7U12iWPMha6xum2nFVJNpl34kWB61lOpmvWoCoqRHrFrT2Yp42a96wBe10q9EWj
	UQqVPOoRNRwW0waILlmEy/Z2BPj1zSlcd24GPO3NKrWkRzQNAyPlieIRC1CBvfXwaTPevGwAksqpi
	2+bdPvxq/usPDVSF72iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Ah-00000003La9-3Upi;
	Tue, 20 Jan 2026 07:29:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Af-00000003LZp-0Mcl
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894141; x=1800430141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sAp1+vaHM3hb/JwJTI2V37THMHOSLDD7cH4NC0bdoO4=;
  b=ICXZtzA8Tt+2NAeV/+Ylud2Fm0yuWMKck5GT+reIaPJykyvc6mc9YWRo
   VEse/n4znJDUgRpWPwFfV2l3OKEruD+vOhJy7agBY5wGZKbFNDiG/ijeR
   cFzWFDPj3SYU5z3YG7hDttOggHI4ntktnzeTeiDnwoXnGFvNlfgQQfD1W
   0r1bhixv5wHNYnH/oGojMYnAK6w3Oo1lftGsa4d9WL2arU1q7D/auG5fF
   +u0zpmD85RCXMw4NvPF6PAXwl6vTOyUPJYmUsdcCJwBZ8MV1EDK9Bsj68
   S88rFslDpKgkPZveL4FQMk+vUXGr+kCryt74lbEAxIhAqYsEPm/vMf0VB
   Q==;
X-CSE-ConnectionGUID: 3yxAiKmkQMSiK6dNS/ASAw==
X-CSE-MsgGUID: lOxAgRJ0SP2mI1VfJ2xAqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80817197"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80817197"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:28:59 -0800
X-CSE-ConnectionGUID: Z3NshSj7TN6iP/nQfbYOKg==
X-CSE-MsgGUID: r+tg7TRGQcGL7cGtQXODgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="237311151"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:28:55 -0800
Date: Tue, 20 Jan 2026 09:28:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	ardb@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 1/8] lib/string_kunit: add correctness test for strlen
Message-ID: <aW8utSeRsKSD8kg5@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-2-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-2-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_232901_135569_D0FD345A 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, Jan 20, 2026 at 02:58:45PM +0800, Feng Jiang wrote:
> Add a KUnit test for strlen() to verify correctness across
> different string lengths and memory alignments.

Acked-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
