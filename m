Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D39FED3C3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zx7qNe2Utr0YEyzlxBCKna+r0k6S/qJrJbSZuAYPEME=; b=q7zb7OW7CzjpoJ
	XnEH3ZFhcEILE9W79dSm4vu6iJ0f9AMaGkqpnGoKLj3C3GXRQQWvsO0oGPtFdmrgViFbNPg3muVnE
	IEYkvFT9TlWUjdulQduSKgSkCUTttM94AMp91RqcFTm+4vcDql3wPuLGUnnK9tiFT8/q/vcoKEwHh
	ZW6ifvymdHXfu3uaP3pMQ5TWZaX1+sspl8W2N7km3nXB8Lb3qj6eLu4l+lR+u4iMUAfJGI/tZ6n9W
	7lrs85T7CrxlpkcNcU0FJABfXxRJig7Mcigp++V7Xx5QLZr8HTLPS8eNeMhvy6MwKy6NsK6vU2+a1
	PmI6pasTzXdQrR+iaOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGZi-0000000DF2x-06Gg;
	Fri, 24 Apr 2026 13:28:06 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGZe-0000000DF2H-1Xw0
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 13:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777037282; x=1808573282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TgBvaySXJAlZGQpJKL99VsTHVkEs72ypMcQq2IoSJQs=;
  b=N3GfRH2Ke0Oa0a8IN46v5zy7Ivfq1lwDFsWMAaecyxtiwMZ1iQX6Qd5s
   7/6WgFCtHYYP4OHHw9HwxdmGvrN1j/5x8DYQFtH8WkapkqdfhgxoqfzeQ
   d62HHt2HAUpWadPM7BCaZrU11mB+pA+S3rQcGxvQfFT9/6b4Xjx3XxWeE
   fN4AKF2egsy+CSSnQpMdM0RKA03ynVnwIKS3Q39jMIKG3oHbZtrZOsezc
   uA/AaQ0eVKWFraXVCjEp6gYo89FBGAfVdrI2zKwoqEyEsniJ65U+ZMi7K
   q0N6JKR/0r0X87ZvCC45FGds/xMnpDLtybBT5K4GSLHB647V6WMsNprA4
   g==;
X-CSE-ConnectionGUID: 9b5Ia+vnThCmKCGsSr3QAw==
X-CSE-MsgGUID: 5l1GVrIKTs2Gt85877+M8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78072893"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="78072893"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 06:28:01 -0700
X-CSE-ConnectionGUID: UJWsomBYR4K6abvvtjBnPw==
X-CSE-MsgGUID: Cyj4oll4QMqvdi8CvLbxNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="231946987"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 06:27:57 -0700
Date: Fri, 24 Apr 2026 16:27:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <aetv2ljDOpH_Hs4s@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com>
 <4548483c-cbba-899e-6b1a-1290d36b59cd@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4548483c-cbba-899e-6b1a-1290d36b59cd@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_062803_267129_EEBBEDD1 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 24, 2026 at 02:38:56PM +0300, Ilpo J=E4rvinen wrote:
> On Fri, 24 Apr 2026, Jia Wang wrote:

...

> Hmm, maybe there should also be macro also for this one which takes the =

> fifosize as input and converts it to CPR field vlaue (effectively, the =

> macro is an inverse of DW_UART_CPR_FIFO_SIZE()). It would be more readabl=
e =

> than the literal.

But this can be done separately, right?

> Also include BUILD_BUG_ON(!IS_ALIGNED(fifosize, 16) + bounds checks) =

> inside that macro to catch invalid fifo sizes (+ don't forget the =

> necessary headers for those two new things).

Hmm... Some devices may have FIFO =3D 8 or 4 bytes (Intel Quark IIRC has le=
ss
than 16 and it's DW IP).

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
