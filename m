Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC7F46457
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OwTjbtIJs0eLkpQZb6LQwszmpwP+TkKKIgiyvOQwiM=; b=qhlNDgEwtIGV0P
	r6rpFg6enX7uYUZZ0xffC1zHLQtV4Gc+i1nVm0pkYKfaVmm/rb2/UPJ89KcK7kswIOxoqyatnxcGn
	lHB0MWbM2xPn763Umv9moLh6wUzPo+Fl2Pa2PqFHb7ud6oUUvqoCC0bkwF9xnrvsFy0IEGjJ5OPPt
	q726XldPBEsy/vVlgAmOEc7qt28NjOV6T/nRLj7bEIAz1lg5FXxFiKukZQtMu5cZKI02M0l32OGFe
	12cm6XK7tqSv9jy+A6XyhjTdALDM3cJk+e6ZTWnEOn8AvGtk2/urHFcHijrX9ofJ5mVwdljSjDbmF
	JGU+5+mEt4aZSgBQ4HGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Et-00000003pxT-2s5T;
	Mon, 16 Mar 2026 11:36:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Em-00000003pw8-3bhc
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 11:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773660957; x=1805196957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvednJVD+S92uidTlYwGeaVVG/EK1t6E2q4V/k1EYxQ=;
  b=nF0PRN4DRsP4hmb7HRRMUTOVVdmol3VJxaVVhThCw/nn1aJsq73vEdzp
   76tYle5YoVDmuY4k+b11yUIFOboqsQq1TZQHSS6ANAInjPpRQbeIbEyNX
   yJADaHmv8iZ0BxpH7nEe5+mMN1XDaVHJmruyH3RY00gLNJ9FjU2XfpYr4
   F6zTZQJLqJ8CIenUE+/JWKFba0GPnApMDh890AsFnRDreY3Nq2kKg8Arg
   sVWqXIUEMOePXwejo68secNoYPr0HcqQXlNpCRXnL8A6EWtCiN7WU6bOD
   SNSgRBAaX4NNBlMN/zfgUYT+eF1XpcmBVrC53yw/CA7XAMSNWu20HD6Os
   A==;
X-CSE-ConnectionGUID: qjTo7E9wSAuLzl1/AQzz3g==
X-CSE-MsgGUID: DVxX18euTAKRBEJnRQMxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85374271"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85374271"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:35:46 -0700
X-CSE-ConnectionGUID: 9rp9XH9KR8yjZC4oTX02sA==
X-CSE-MsgGUID: eKVTAUAVRvKpRNtiZbTfzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218157295"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:35:42 -0700
Date: Mon, 16 Mar 2026 13:35:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: wangjia@ultrarisc.com
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
	Zhang Xincheng <zhangxincheng@ultrarisc.com>
Subject: Re: [PATCH v2 2/2] riscv: ultrarisc: 8250_dw: support DP1000 uart
Message-ID: <abfrDBeJrValJR9a@ashevche-desk.local>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-2-6ab3e7fa891c@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-serial-v2-2-6ab3e7fa891c@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_043556_914518_60466E03 
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

On Mon, Mar 16, 2026 at 02:33:23PM +0800, Jia Wang via B4 Relay wrote:

> The UART of DP1000 does not support automatic detection of
> buffer size. skip_autocfg needs to be set to true

Missed period at the end.


...

> +#define DW_UART_QUIRK_FIXED_TYPE	BIT(6)

Seems unrequired.

But to make sure, can you elaborate what's going on here?
What is the reads from UCV and CPR registers?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
