Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8888CD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRX24Jve4ois4cTSiGdSEN7/Fd7X4UyvQPzSdi7HMLg=; b=q7zyEKOu11k3Pa
	zt1D06HwRXm3fazkNT8lv4sgK/ouf3RNpnGPMSwOE2hZbthnMILU2esRVC7QrxOU8GDkfCEh2xUoW
	X7JmdKAeINGFAAqWbR3v9QynDq+iUitVS+8Yy6nYD0cMAe9v30SNbbwgVrthOPlVX/zSrhveEketo
	b5v3eq+w4jdB+3XAFdIJV7HzEUxqM5jEM20uPH1aDfextebyFnDgzPhxA7ldOeLQhLH8Y6hCgq8UI
	5KxjC2NEh9VlBgowsfpmF+dCYKE1WGELcSl/2T3Z+WhUAxo23ir33slh8GcL6rnousL7HLMwZptS4
	0eAN+M7ziwSqmHDw5vjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Br-00000003LjK-26xq;
	Tue, 20 Jan 2026 07:30:15 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Bp-00000003Liq-1dy0
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894213; x=1800430213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PiHIgy9pcNcdJAMceILghC2Fv+8K8xr6hlv+TwIM2Yg=;
  b=VzknItaq3gx6q+rchKofKOsLjkxLrxWP/Tmb7FjPsy0jpgrB1jZIuL0R
   FEOgNsQOiWSwn9BmwMgYw0FPIX0PdoXSEKHiDSPaW76IFEm6UO0Z3pqr4
   y40cWbOsQbeoqLG7XLWxKg06AHnrQFEwbJ4LEAwLiez/YOJSK3dmeBvTY
   DL4MX1PMwNhQHpi4/+a9afmxCtU4QzojKSOd8izDmlKMXzO1pZdeJMyEQ
   ouJERp2y162fcii8uaJNmF8qUj1TXoOZueIaNxdR2tsnWlAqZGBbUKPZk
   UNocbLTFJW5HomJU6/ZA7G1K8AJBWqmk6Q2L3FKuYDIO28FIcMBrf8KWk
   Q==;
X-CSE-ConnectionGUID: Dqwjl80JQdGvX5rQznFfVg==
X-CSE-MsgGUID: +vEomjZ8TM6sT9Zu3H414w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87675957"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="87675957"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:30:12 -0800
X-CSE-ConnectionGUID: xxK9hBXyQtKPYrXh5SEPWw==
X-CSE-MsgGUID: x2HfyupBQ2aWASUyUHTbEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210519062"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:30:08 -0800
Date: Tue, 20 Jan 2026 09:30:06 +0200
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
Subject: Re: [PATCH v3 3/8] lib/string_kunit: add correctness test for
 strrchr()
Message-ID: <aW8u_hqxNThnnizm@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-4-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-4-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_233013_440053_0D84E649 
X-CRM114-Status: UNSURE (   6.67  )
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

On Tue, Jan 20, 2026 at 02:58:47PM +0800, Feng Jiang wrote:
> Introduce a KUnit test to verify strrchr() across various memory
> alignments and character positions. This ensures the implementation
> correctly identifies the last occurrence of a character.

Acked-by: Andy Shevchenko <andy@kernel.org>


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
