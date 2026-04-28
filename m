Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EADFF886F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTkFCN6Us7cMsQ9gzoMHS2ml/IPZn+N4Q9eViezfXco=; b=TLPaa4uuhoKASe
	QpGrtpHNJnbDyi7+cdi5csSHCwCEWM3HBdstddoVwqQ0QLnrNj3tEalWFIPxRV0YgQ9CxuKcOb/xM
	o3Mrl6s/y1Zwd5y4CJ4ftdsff3XNofH89HIskNGxsOAMNhW7CsvohLpEIjPOYvkMFO92snduMK9FL
	b91EZ2wDouTP0VGKIvX3hEucXb3wjsfBjtRdfSiLo9l0IFfR6LnDH7rf4gwkxcq6/dPY/pjYNQAVW
	uuciozBWyjRYsj2ESJ6CWLcUDDj1DKe0X+9AnLFSFhU0a/AV8+Qy4ZGsv1zhM/eH/KsqAh4reuK5o
	Qe5t9itomM8iQUNFNaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcf4-00000000fmb-2Gul;
	Tue, 28 Apr 2026 07:15:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcf2-00000000fla-0rmj
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 07:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777360512; x=1808896512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q7LiYqnlwsUZrSNZmU+aGajjRZKDNMhNNKIUhLLiISw=;
  b=RayTBhY9Hxn+H/s2TufJObQph8f3KZuGPuKUG/ux1PGES5jabiyCt+WO
   2/8YudUhYbPX2N5pmufX0cU3jxE/2xblQK8we3BDdvdLZylhE7LU5Pt1n
   XOgY29j8icHcHE0KRXdRu7Lrq5WwpECYFTotplCuks5bAUM9GVY++tsOD
   FmtPMenknYoV4AyNUgbLEexhZchmSdeRDbd6T8e9BiO2UlrB3sm2mUjnl
   P7ktEsWK8bHu7rH1KvG5pVGZif8+YdQ7yoSZkJ0PjkpyPunzvkX5dJgE1
   Aic3AboTgg1xnb2bIspl+QAVDAytma1+1h1+JTxUMQp/docN3GAoaO3AA
   Q==;
X-CSE-ConnectionGUID: wufA58ZETTWcnX8c/JrTVw==
X-CSE-MsgGUID: w/avsZenR8egfnl0v4MXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78281057"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78281057"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:15:10 -0700
X-CSE-ConnectionGUID: Bj30AuJCQeefJA5s34H2Uw==
X-CSE-MsgGUID: Tizm7nbvQJmDwmSH4lCy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229514829"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:15:06 -0700
Date: Tue, 28 Apr 2026 10:15:04 +0300
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
Subject: Re: [PATCH v5 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
Message-ID: <afBeeGxD-ABOTqpf@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-1-97de63b1e3eb@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428-ultrarisc-serial-v5-1-97de63b1e3eb@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001512_287187_0E163D01 
X-CRM114-Status: UNSURE (   7.56  )
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

On Tue, Apr 28, 2026 at 01:26:26PM +0800, Jia Wang wrote:
> Move the DW_UART_* register offsets and CPR bit/field definitions from
> 8250_dwlib.c into 8250_dwlib.h so they can be shared by 8250_dw and
> 8250_dwlib users.
> 
> Add an include guard for 8250_dwlib.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
