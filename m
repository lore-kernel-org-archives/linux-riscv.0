Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9DDD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYRzdIuzuqgPOmXKHTT6hhWuluB2HAlF+RDiUBylVJU=; b=yrWrIzfY3Knbnv
	u593CgCobFWyNyImhdaLoD0PdNdoi7JlD3lKwjiYN+lmXKSPYawvNzOBzx6QIC5wEGG7Ga2cKcOCp
	CG1aiII0E3d0AZnaWLm/dpJbQuZTmyADQgbvKijTHOe/4T3IT65+cKsAAAdwWboCeDsFh8BtEzly+
	GrmJDSki7+Le+AO/SYMdD6ZkQXDmfgHP5+9EhqGXH99N7bhNvrZv3Ac/zE9sfMCwHe9bw4Nd1U3Q8
	xhViozYhoWy33FfDOaaWrkkrelyFzvWZqF2hjxesx2N1j041u53hv8thIy/y5jZBw8nqf0OJi/Xq8
	3VsZof/7uhrP0+RLVGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6E2-00000003M2v-2bYj;
	Tue, 20 Jan 2026 07:32:30 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6E0-00000003M2K-13y9
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894348; x=1800430348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nb3aJk8nyDTzbplwGZGJ0Q/PSSQgwHA8tn4+tbQmuPs=;
  b=gU6PzSpc62pqOLwxNop6JTBrmcBUYhX/EvpZywd3ZBmsCeHe3brW9xa2
   wKs3Q5b/t4rJnnnQqslUTXN9MU1xu26Gznf1wycR75URbo9nQv1CLhJ/t
   kPlv9O2QJc7LtXxHtHm7Rae97QL/58eBXM4j8bKKgBG3D8D/CF4FReSjq
   qwjsBuOnlipZ+HZtL+iL87CvZuObYoVmGRK/AtKsOgCHaRJCLEhGMIWLQ
   ytg3bNMNVEpksOYP4s6Gjl2fyc/FeKy2vO4VEwVcBZUK4c1uQrw6k+Iz1
   Gj40feYpLTQryaw16HktMDdASmBMwP7MLpnoUlnHaKGAEg0kXuuVbtxBU
   g==;
X-CSE-ConnectionGUID: f8mPFMAxTDug+TWGmI+hOw==
X-CSE-MsgGUID: TGtoGsJnSkm59f3Vh+iq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70147562"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70147562"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:32:28 -0800
X-CSE-ConnectionGUID: tx2GBIdAQea0qouo7OESYA==
X-CSE-MsgGUID: F57grxlgTQGhgqj1ORpCbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210893958"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:32:23 -0800
Date: Tue, 20 Jan 2026 09:32:21 +0200
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
Subject: Re: [PATCH v3 8/8] riscv: lib: add strrchr implementation
Message-ID: <aW8vhU-ECUIITPoh@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-9-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-9-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_233228_299665_0BB0F95D 
X-CRM114-Status: UNSURE (   7.93  )
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

On Tue, Jan 20, 2026 at 02:58:52PM +0800, Feng Jiang wrote:
> Add an assembly implementation of strrchr() for RISC-V.
> 
> This implementation minimizes instruction count and avoids unnecessary
> memory access to the stack. The performance benefits are most visible
> on small workloads (1-16 bytes) where the architectural savings in
> function overhead outweigh the execution time of the scan loop.
> 
> Benchmark results (QEMU TCG, rv64):
>   Length | Original (MB/s) | Optimized (MB/s) | Improvement
>   -------|-----------------|------------------|------------
>   1 B    | 21              | 22               | +4.7%
>   7 B    | 116             | 122              | +5.1%
>   16 B   | 195             | 208              | +6.6%
>   512 B  | 388             | 399              | +2.8%
>   4096 B | 411             | 411              | +0.0%

> Suggested-by: Andy Shevchenko <andy@kernel.org>

Wrong tag.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
