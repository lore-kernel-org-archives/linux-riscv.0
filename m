Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B61FE51FC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWW+0AjFbhxcunqIyPyXDFvy1oWuXoXVOAbiiVlwb7A=; b=WvYIHM0e88tDB+
	cxPsxR6vvd/K45+k/07tIrQGlBCnrduicQbTZcBSeneEmwed3tpbdUKnXOO8s0mf5ZdF6XKZZeROO
	QtvnEcRM1h5WPDHK/tpNqtsqwxuLfvHuyOUbwQ4eCxLJt3X0snIEiVNdEwRvzY8OHVgeD9Po9e/5t
	/vlsM50T66tCEA9osuQeQd70US8kYQzbSxKOreveE7A6oBXug9xUWtP4rJYQvOLpHK3IPqv3CVv/j
	f4SToZUA7mY283dgmsXgMC0KdWTi09nbaQsvL/yK3+0w3JejBvfMtrqQWCe6MXO8UdFei8uTIhbr7
	SR4mhQxIGg4QIX7iehww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDIZ-0000000CyfP-3vpo;
	Fri, 24 Apr 2026 09:58:11 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDIW-0000000Cyf5-3N1G
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 09:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777024689; x=1808560689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aMzRaQGPcbJXEzShNriK1H0VOmBVn5aR4ZpHPSZRFXg=;
  b=ClK+t9Ao8NJL8bbIsQLhMQxNYBxzgvFv9G/UcLlFZmm+U6QD5VPUHVUQ
   7WyoCu26kK33mxbYbzjIEzemrUC/nfMRBRKn2YrO/oYc+t1NNx1YDlvLK
   FCQmsK1XVETwvrxwkmYCmpf9r/8SHjU8wxhwfyqidryE9rlsM5niFnHrj
   OA3q/iHtlGAT/ZKiUyWhgOHzcTsn7vSv7Kt3kED69hrL8Ex+hAVIYx31Y
   QUcLhbPOK3TYvJJIXtU7t2XOwz5KJS4udLug6C0/XQkNCnd8FWEQm/O7w
   zIZpc3JD3kzC0lFFMAmomjbwDr24t+E1wgI+gzuAMspS9iMS6Mxx5MfI3
   Q==;
X-CSE-ConnectionGUID: yvFRLorgRn+JJZsXrm3ZWg==
X-CSE-MsgGUID: U68upz8bS2KXH9cyLFNXnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81610189"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81610189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:58:08 -0700
X-CSE-ConnectionGUID: OqNbak6vS+uSahwuqFslqA==
X-CSE-MsgGUID: uGHSkmPrShy6N71Wm+mYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237969085"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:58:04 -0700
Date: Fri, 24 Apr 2026 12:58:01 +0300
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
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] serial: 8250_dw: Add support for UltraRISC DP1000
 UART
Message-ID: <aes-qdaT_9wMbTsm@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025808_935329_6A7D53D4 
X-CRM114-Status: GOOD (  11.89  )
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

On Fri, Apr 24, 2026 at 01:39:27PM +0800, Jia Wang wrote:
> This patch series adds support for the UltraRISC DP1000 UART controller.
> 
> The series includes four patches. The first two are preparatory cleanups;
> the last two add the DP1000 compatible and fixed CPR handling.
> 
> The patches have been tested on an UltraRISC DP1000 development board with
> Linux v7.0-rc7, verifying basic UART functionality.

Now it looks good to me, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(except DT bindings, not an expert, no tag)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
