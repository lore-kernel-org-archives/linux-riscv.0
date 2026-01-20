Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5331AD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McLVYA8ZfxtGuD7+CCwPyugd1QmTNukLkbJqXcArqak=; b=SjLKy5jqH33+zG
	ERM/zpHWNJCZjhYmpSvxSMxozr20M5Ac508hR8gyndpVdn5xhiFrGT/fj/Ap63MrF0TPC51QK+pCc
	apurDHQPK+D4squr3eWNteHKqFFsu3yFIv4u8FxeU2xytGaSDL/0jkSuIDN0H9Dbo8z/trCljr0M3
	DOrcEHm3eiyyoZNYIRe+++5Fk1+dWR9ByK4Piz3RiEPhumUYmd5erp37eEW4PrW1aWFsHqpVG4Z5d
	Nh6tfOYUTzsgiel762/9f3MqJQgEYfHo1Whls+8EB7OjEZ4Ev1X1f69v9LD4zXMKy2iJ1l2zYxGEq
	6ZNyv5WqmYH0IbXOmFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6DB-00000003Ltw-0oCr;
	Tue, 20 Jan 2026 07:31:37 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6D7-00000003LtT-45Kt
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894294; x=1800430294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G9HzxjN0Yu3oOjEo97n42KKy1eIhD6tKisYWbW2wsH0=;
  b=MThM998lviTFOgGFRL9aceugnz9gKfJ2oTx18JPuMIQE4RQvsDZWMg+h
   mBRnzIgtCnk2p5knOlOuofqXnGX/WBmODFHAg7GOgtPu43CiFvpw7BYp4
   TwBBlCrL6UEe7ZxlK+j912g2uxd6utvGBOc/ZAr745TQXhNDmGjMUMTMA
   Yj5vfEUCge896b5tPdnRwo2o7ha1vKRDBSq8EaK9inoFqtLuuNszwRX3V
   GIExuShWgnVHfpkB/KlWweUfa/vQC6b9/+LSt2MV/jXpC+tFwmhqRwe0b
   deHcQMWwTacF5dY2lbWd/je6r4tRALW7M1Z1CSszIu/6bSYCBfi6VKmlM
   w==;
X-CSE-ConnectionGUID: YNBMkaTHQ9y88oVGotNhUg==
X-CSE-MsgGUID: 9vH4P97FRBeMS4hQ73VFtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70147478"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70147478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:31:33 -0800
X-CSE-ConnectionGUID: eFNTO8iUTJ6+e71sTJ6Yvg==
X-CSE-MsgGUID: 6SjcySW9QJu2PdVpZUWjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206078277"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:31:28 -0800
Date: Tue, 20 Jan 2026 09:31:25 +0200
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
Subject: Re: [PATCH v3 6/8] riscv: lib: add strnlen implementation
Message-ID: <aW8vTc4mieqmJKhE@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-7-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-7-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_233134_022590_E7E126AA 
X-CRM114-Status: UNSURE (   7.59  )
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

On Tue, Jan 20, 2026 at 02:58:50PM +0800, Feng Jiang wrote:
> Add an optimized strnlen() implementation for RISC-V. This version
> includes a generic word-at-a-time optimization and a Zbb-powered
> optimization using the 'orc.b' instruction, derived from the strlen
> implementation.
> 
> Benchmark results (QEMU TCG, rv64):
>   Length | Original (MB/s) | Optimized (MB/s) | Improvement
>   -------|-----------------|------------------|------------
>   16 B   | 189             | 310              | +64.0%
>   512 B  | 344             | 1535             | +346.2%
>   4096 B | 363             | 1854             | +410.7%

> Suggested-by: Andy Shevchenko <andy@kernel.org>

Wrong tag, I have zero knowledge about RISC V.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
