Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC79D29DE8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHk2YalNNLL0xGp9k81v0/fFzss2kAAorH7daoh3iTs=; b=OSzwYK+XV3mzZY
	k7fpPGolnWmoqXZAJLz3t+GKuwyDFYstYqlV90hE1W0iDZFQA8xFo3VZNuzHCHIFS31Vo5u32DTnw
	I6H1zrFvANojPdfqgFQCL2NJHbGTKowTwOK4EAwLB2Xr0ToBWtExb5mzHln6afKTRTAj++kvEhY7y
	dtBbEIiFBuDbOmrZUPF/z1Y8FW9UMeyJuVMDyyJoX6HgCMq3aObv8P7iQeZLAPQLKM2UCQpu53xQw
	WNb9LKl2SL/ue2OkA2bZR66zMpo1gzM0dLd11UNWxiY3/FOlkA7cNDkOYlPPMJrbGaeHHuMtXK3Zt
	kE1LDNgEjEpYFvH63Djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyS-00000006lZK-2vNJ;
	Tue, 13 Jan 2026 08:42:00 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZyQ-00000006lYz-3iAX
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293719; x=1799829719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rdCdfQup+4kSnpj06pCND7wWAwUHXOWyknYZJSfjJv8=;
  b=EnIrWxB3Rq4/Ew1AHNU5Q9UL/DOkD73KfA5eJ+o8rl7MwusUxK7En0iO
   z6qnqVd1c0ReQ2RkXCUK/PhQcN6FwEUB/FtXZbF9COGUEcZym8ShiqEvS
   IQ97FSWuG1zHBhMoMi74GUzwY+YQoVEaEt5An7aQWRrgrdzgz07A5fSdh
   Jlj3RCcHO3NVLBwMKyZXJlWReNkvgR7LLi/DvXne4GHMgSJOeYdZoCeDn
   AuI7zxVdsHenGnl+0v1UY/KFNwCsXrk3AmlxXPZzBl/CwrmhZkR3XUbCf
   8EooqBkuLoydryKzl6r/8xLzKUt2BKOxqMCmBklMILD9uM7anQFtkBg34
   Q==;
X-CSE-ConnectionGUID: NYFcHLBlSqCr+N+NVBxjAA==
X-CSE-MsgGUID: zl7ZG2WLTI2fPXrl5YruFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79870680"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79870680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:41:58 -0800
X-CSE-ConnectionGUID: 3c4fC4lWTUy29UxPmIOjBw==
X-CSE-MsgGUID: h02g43C1RH2fpv29WtVzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204136155"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:41:53 -0800
Date: Tue, 13 Jan 2026 10:41:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, kees@kernel.org, andy@kernel.org,
	akpm@linux-foundation.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, ardb@kernel.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	samuel.holland@sifive.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 06/14] lib/string_kunit: add correctness test for
 strnlen
Message-ID: <aWYFT1yoktjDLFTm@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-7-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-7-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_004158_993239_90E0946A 
X-CRM114-Status: GOOD (  11.51  )
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

On Tue, Jan 13, 2026 at 04:27:40PM +0800, Feng Jiang wrote:
> Add a KUnit test for strnlen() to verify correctness across
> different string lengths and memory alignments.

...

> +	for (offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
> +		for (len = 0; len <= STRING_TEST_MAX_LEN; len++) {
> +			s[offset + len] = '\0';

This should be one or two characters further so you check should also check for
non-NUL terminated strings...

> +			if (len > 0)
> +				KUNIT_EXPECT_EQ(test, strnlen(s + offset, len - 1), len - 1);

...or make more tests, with len - 2 at least.

> +			KUNIT_EXPECT_EQ(test, strnlen(s + offset, len), len);

> +			KUNIT_EXPECT_EQ(test, strnlen(s + offset, len + 1), len);

I would also add + 2 test case.

> +			KUNIT_EXPECT_EQ(test, strnlen(s + offset, len + 10), len);

> +			s[offset + len] = 'A';
> +		}
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
