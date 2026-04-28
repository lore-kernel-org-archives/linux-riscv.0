Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07E1FF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+H+EqgYPSnxjFjqWp6a/agNFdj8Bb8tyk30CApioUi4=; b=JATFCl0SHVAsSQ
	8xW2KwqJwPMHVIKpFtXPK5EtC3ySGW0akfIpU+yPAhMJ5imagGXC3JDX90ijfBGZJ4CWf853YbNFt
	0waMyeIsZ0VZ3dXA4nDpm9oZV7HQJ6YIQSVC7RRvCVYkYjz+ZOaY1e7oxEnybvqqdJky2pRpRdlJr
	hfwmQOSzBcumoqY5hDftk7j8FcLL0/rQ2xy5wsV5TeQK2nqH7dhb2hFHQqNC7YTwIEydc1oPaKK1X
	VdYfowc00+g00+GswfhMRnu7bXwI6YI5vUzLi0adNQJ9k96aJkHE1kS08C1QQNnwUsV2Eft5s/c5l
	cQqqWa7YXs3XcQHpkzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdfA-00000000s3r-1tQM;
	Tue, 28 Apr 2026 08:19:24 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdf7-00000000s2e-2w3p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 08:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777364361; x=1808900361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPlcOO4oTr6lzEKDfTYi1Sv2tWWa1TpBzwz0HZv8geQ=;
  b=nSg5fHvXuYGtYdyDADgCz6UsLt7SA6QSCwRoyq88go+rXPUa0nsWoljN
   mdqT9HrNoWbpjMFHDJ/r/GaPTfFtS/QF0f15UMigbgj+RjoQzgTFs1q6u
   J3d3g+6ysbXSpZBKob8Vsz6NqEFGTQYhyOAQLzUnYjU4GJ/yi1fhoOS45
   8SC2zwUCL5KcNw8d+63OvecvCWQXlbGTNs+LtPj8b/tc/KrEDE3PDhVYn
   eXN7HsCdRU9U885xRPyB9zf2bndgRqYx0Kt0avGQ4R3ABNVdEe52klJHS
   zNtk24ULWeTSt2Sl+bn6pk3lt79cbDxcJkF92UuaklpepXo2jYiBcN+5r
   A==;
X-CSE-ConnectionGUID: +cLuDOvuTQWE4wivoJoVIA==
X-CSE-MsgGUID: p45kdsJHSbyf84SACBW7iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65795858"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="65795858"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:19:17 -0700
X-CSE-ConnectionGUID: IatilBlqQmimrRvkgbIzXQ==
X-CSE-MsgGUID: DjGukAhZRVSuOyhPJS1zNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="233759413"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:19:14 -0700
Date: Tue, 28 Apr 2026 11:19:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/4] serial: 8250_dw: Use a fixed CPR value for
 UltraRISC DP1000 UART
Message-ID: <afBtf0gx8r2Z9a2E@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-4-97de63b1e3eb@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428-ultrarisc-serial-v5-4-97de63b1e3eb@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_011921_746485_63C03005 
X-CRM114-Status: UNSURE (   8.04  )
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

On Tue, Apr 28, 2026 at 01:26:29PM +0800, Jia Wang wrote:
> The UltraRISC DP1000 UART does not provide the standard CPR register used
> by 8250_dw to discover port capabilities.
> 
> Provide a fixed CPR value for the DP1000-specific compatible so the
> driver can configure the port correctly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
