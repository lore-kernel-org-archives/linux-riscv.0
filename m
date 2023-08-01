Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62479C00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtAo4lg1nm0hfBuij+x8q8QsZLKZb9pywJ3MoZcOQQk=; b=Y5SSC0moVt1CpJ
	shM9RZyDFp/RsVeqMj7Cb+LfJ4fv4Axd9A+O2CZ1YLY1WUyGoOhLiRTEppOuQ0znHCT9HkeQ3m8ET
	x1e74ZWByDZp4D6di4xhWGMzTywpJGar56HHuWz9j3AH5Aydr5aQ518J1moNfSBDOPHI97Wdv5f9H
	qqVx4WaMr9gwRG214fhF9OtTxxW4u9877tryF0mXNIlTxHJSw2+0ZpggLZW8RixOB12mPYH857+DC
	dBwtmzlgsNxW4N6zSL4U65E5aKbe03cxWV7sDNCNqL+G8koQc9aeg7LIOojjVhh/t7R6CPKaU378O
	kvTogIH+n1KalplUwy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQulh-0036oJ-2U;
	Tue, 01 Aug 2023 19:10:53 +0000
Received: from [192.55.52.151] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQulf-0036nh-0V
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 19:10:52 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="349697463"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="349697463"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 12:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="705892471"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="705892471"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 12:10:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qQulV-00G0N6-1J;
	Tue, 01 Aug 2023 22:10:41 +0300
Date: Tue, 1 Aug 2023 22:10:41 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, brgl@bgdev.pl, linus.walleij@linaro.org,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH] gpio: sifive: remove unneeded call to
 platform_set_drvdata()
Message-ID: <ZMlYsexmCbUR+nYD@smile.fi.intel.com>
References: <20230801074430.5179-1-aboutphysycs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801074430.5179-1-aboutphysycs@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_121051_205412_99337FCA 
X-CRM114-Status: GOOD (  10.21  )
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

On Tue, Aug 01, 2023 at 10:44:30AM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
