Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB5D29DEC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XO0bLXc2fDiHIx0FO1PPZm2RM2O86E7E3LF622VY8Q=; b=vsl+F17ISKkGUt
	/nYeIBofpwTA8LLxEqle/OkviRbmY6ugS10Htl6aZVL/jsLLQO+mPupxQzbL9/VDVk1GzKv8F5Bjf
	Sj3a69Qx4b2bfr5bRT2gtZdhR/TEBmRsQGR6bp13HgS+JNQ9mymRYnbDNs3m3+iLpIM5BdA2iojFO
	iMTIBPavPbRnNzdMN4anAkOHh70u2FJ9HRacpXT92y6GPT+GiVRKWYmIUOM1oGriRoi3/WZTRlwvC
	Vruaf2R99Sp3i87/gtJU1G7Dkn73q1Z03fS6CbL4J/vr7Dp+ohlSpOuHbqmY00MuM3/19P5DoaMXu
	Z12OHQHm3y27Qv7My1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfa4g-00000006mBQ-3ZXR;
	Tue, 13 Jan 2026 08:48:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfa4e-00000006mB3-2x4F
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768294104; x=1799830104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Z8m9ne8uMWPSyQ17MDx7WtVbnaLwvr/m/iHHlitTok=;
  b=KB/j0NTj6rnqxFpWa2HcOjtoACxPyzf1EXGhNc8J5JZLWVGNSzVpijSv
   FwoY+1WbV3rFFGCM1wY6GUritWMPV1xwUbRxEy/HVrB6/GsAFFBdSPklX
   avLyVBM3DYlFBjn1l36/xVsQKNe8f/7NwW9KhpqG3OlZk4kJxHDiheRBv
   Ng3NMksyOhRHSFMiqV3pPz5/GY4ZFpqebs6HHd/X9V3Vid8j3BA0O003C
   gHqrbULeTSvsUvCkNKz3kjAzrrz1GPxtiPZj98nVqPSD12fPuS60eGHKP
   ThMR+EC/yEH7evExQH+wjHe+Y+FQDg4Oobr0OR4cfLNGSJsKEOaokkQsu
   w==;
X-CSE-ConnectionGUID: Nl4Uen9kScGOWlAG8rLi+w==
X-CSE-MsgGUID: fnnRVTeHQyywbe694DVwsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68579658"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68579658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:48:24 -0800
X-CSE-ConnectionGUID: RlkPL+LBRJGO3qW9byN2pw==
X-CSE-MsgGUID: spgj6BHXQv+xPGtLwavlrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="241844401"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:48:20 -0800
Date: Tue, 13 Jan 2026 10:48:16 +0200
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
Subject: Re: [PATCH v2 12/14] riscv: lib: add strnlen implementation
Message-ID: <aWYG0AAsDix5rs1Z@smile.fi.intel.com>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-13-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-13-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_004824_779620_7DDD549D 
X-CRM114-Status: UNSURE (   7.34  )
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

On Tue, Jan 13, 2026 at 04:27:46PM +0800, Feng Jiang wrote:
> Add strnlen() implementation for RISC-V with both generic and
> Zbb-optimized versions, derived from strlen.S.

Now you have benchmark tool, what are the results? Please, put them in a short
form here in the commit message. (Yes, I know about cover letter.)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
