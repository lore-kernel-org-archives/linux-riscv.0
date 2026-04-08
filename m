Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E8A10F9972
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XyotDcqjJVgOuBWJ806oYcRtShqtJijT1ymNq1SNSs=; b=pXA8ZBn/2qVCcp
	GplP6yMlM2Lx4c7dkbq28cBgEl0TZst7gz6z0CKMOQE/UcT+DJ3HVVvIjLzDqUk2CCVxE+w+NbFhI
	46TPhKwzxPvvHb/i3R9Uvb2ci6dumzxJkEbHrrlzremg0fE0YDrmQoVGK8hbIXDNCIoHbSfTKe6Hn
	0chtAzgwBjaRL67DCCZw1WC9ZMSSJq3oTrk+u0ZWx8MhXQyT5P5fj+pn6eiJY/jPzmGr4V5WYZvhz
	EplpxdJZFhnJB4/DlncQS0qZZtjVL5F65dWw9PWIjpMm6BG4FwJiWaplGTOH9kteQ8oP+5TO7TiPw
	hm4W8yyBgoNaUuensjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmp-00000009KEY-0sPj;
	Wed, 08 Apr 2026 19:42:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmm-00000009KD3-1iEZ
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 19:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677321; x=1807213321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4SF3j+B4RPtm4tqfKi8V5EPf+bx1nMf950zOTZVQ4g=;
  b=Z637Ns8OycI+GXV2O1aZApEPk0BkBH3SrfjmeZ0TwinMdTdryqTRpOe8
   wcEVRR/qZJlci6uVCf9XrVqS5uwn3R7b7djshqbEksAQjKofPfAuaXQGc
   eNv75X8wvKnc4v0ZGIQPPllJLI34YF+y34LO1nIVECnMDT5y0G21Y/+AC
   0rEltLj2GnKR1VjluG6cJMFWZijIteSrKl/ZbbV5blkeN0Lqr837wNLzb
   bS+sTPSyNuBbWa4oDpbzro8X/B9C5/qdFBbhl3wWbL3bnJwt6tegauB7X
   gbJonLOtPXFK4W0/Iql55rR1P4Tdt4JLntlQsDmCWdUxiDlu+pJ4/mL1K
   w==;
X-CSE-ConnectionGUID: k5IIduZARPa/NBRDwQwN3g==
X-CSE-MsgGUID: 8+qFbsvHQRK2On65ifQfRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87373217"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="87373217"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:58 -0700
X-CSE-ConnectionGUID: 9B3njR3FSpOBDfl18YDeQg==
X-CSE-MsgGUID: 52lB/fuSSW2pH5s4BCTE/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="232596880"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:41:56 -0700
Date: Wed, 8 Apr 2026 22:41:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] lib: kunit: add tests for __ashldi3(), __ashrdi3(),
 and __lshrdi3()
Message-ID: <adavgV5IF9jMzxr3@ashevche-desk.local>
References: <20260407052824.1260071-1-dmantipov@yandex.ru>
 <20260407052824.1260071-3-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407052824.1260071-3-dmantipov@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124200_460102_10EB5E48 
X-CRM114-Status: UNSURE (   8.87  )
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

On Tue, Apr 07, 2026 at 08:28:24AM +0300, Dmitry Antipov wrote:
> Add KUnit tests for '__ashldi3()', '__ashrdi3()', and '__lshrdi3()'
> helper functions used to implement 64-bit arithmetic shift left,
> arithmetic shift right and logical shift right, respectively,
> on a 32-bit CPUs.
> 
> Tested with 'qemu-system-riscv32 -M virt' and 'qemu-system-arm -M virt'.

...

> +#include <linux/kernel.h>
> +#include <linux/libgcc.h>
> +#include <kunit/test.h>

Always try to follow IWYU principle. The kernel.h is a niche header and rarely
should be included. I do not see any use of it here. OTOH module.h and
array_size.h are missing.

With that being addressed, I'm always in love with new test cases!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
