Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1178FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxuXe77Skdc+CZw8WqR87ZYdHJHtn+uoLeVNt5HJkpk=; b=dlAHCKBMoayG17
	DiBzblwiCQ2hDLSpfeugLWrO72VzWYI1nY2eOebbhKV9lBngLzL1odx7i8k+chjPHDzEkaRnKHZNK
	GbANAVxLvTEo9TGczxud0MG1XTOo4qrfw0zrM5L93Gd5bNW7SrmW5dnafPJBZRDm9kltstONf0DpP
	3haWx3WSyGvTAdnvPaZ1NRdruiwFZvw0YqxKUGWDiTVlEEaZGur4yvn+UYN/FQz3Dlda6OHEOoVvv
	djFX+Z7mrNsdPEn8WImAf4ca86sqNgUFeKmSM3XkbLTB2pQOIPoaUUZVz3GG280WvPeYBcV9qJA10
	2BqyYeaFEitvmf/bLzQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2QG-00000003TVj-2fxr;
	Wed, 29 Apr 2026 10:45:40 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2QE-00000003TVR-3Alh
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 10:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777459539; x=1808995539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jTs2jXpT8MY877Aa+6EyG9UgBha0r9w/ax/uyCnkrgs=;
  b=WtRc22kaEaja3VnpY6Sx/iLAW85jBY6NvYNmgotrvzmKfUB2XA7btgYr
   PcUTPsZWQdN6JCBjWOvZPdVwK5pN6txYM45w8fm7noqL/buVNhPk2NraQ
   prNmEZwQ3Pr2Tze/g0eCTHn+TwOFpvtQWKPc3oBFqegPLvxqTQZfFjLgs
   BhL4ZSvv1RN29B0owC0bVqYVjBFO0c46mSqisvARLvy/9xO8ja8NAOYny
   J1lj1U2r3q+7JCJlv5jhhAVajWP8XBwfvs/CZyungF2w1jjHX1BaereIj
   Qh4k6iOkzx58cwK2XRhsrXhYLPM2qPN71tNe6GKXem+veSUUYC7Jl0EAw
   w==;
X-CSE-ConnectionGUID: L97k7EMeRBaH7xowBLyfVQ==
X-CSE-MsgGUID: BkY9Ow6lT6KcR4u+WzsjKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95804533"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="95804533"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:45:36 -0700
X-CSE-ConnectionGUID: IoYrrtycSY6wea6WEkbOiA==
X-CSE-MsgGUID: UHYGc4ZgQ0CvsD3uS0C7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="238558358"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:45:33 -0700
Date: Wed, 29 Apr 2026 13:45:29 +0300
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
Subject: Re: [PATCH v7 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <afHhSQ-GQ5vocc2k@ashevche-desk.local>
References: <20260429-ultrarisc-serial-v7-0-e475cce9e274@ultrarisc.com>
 <20260429-ultrarisc-serial-v7-2-e475cce9e274@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429-ultrarisc-serial-v7-2-e475cce9e274@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_034538_843167_C9196013 
X-CRM114-Status: UNSURE (   8.17  )
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

On Wed, Apr 29, 2026 at 05:13:26PM +0800, Jia Wang wrote:
> Replace the magic CPR value for Renesas RZ/N1 with a composition using
> DW_UART_CPR_* bit/field definitions and FIELD_PREP_CONST().
> 
> Introduce a helper macro to convert a FIFO size (bytes) into the CPR
> FIFO_MODE field value, with BUILD_BUG_ON_ZERO() checks for alignment and
> bounds. Use it to replace the literal FIFO_MODE values in the RZN1.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
