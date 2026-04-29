Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C2FF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 09:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HckDo+z5Fg6RrX1K4ILRAqn8Z3D9HGR1HwO30OQVyJ0=; b=mI1KsU2XjVqZZK
	VUFE8AY0eTiW7e6dLaS9A9b5r2OBCL6QN8eX0WF9VAA4uUz8OuHaYR1LBsIwYESJKgGrFHeS3n2Ye
	b0fcBN5q6w3PlgFdjy4uhwkwpLLDLvRFuYxYFGJcgj8hbluUK+mmB62rHtSv3aHVXT20FcalaNSkq
	OVFeeAVNPBoRnMLo6trmyCzvD3bU/AzKvUntz7buu4Tb0mxii5AwUxQ8bkbLGZlVJTJ9naUsh5EeV
	JfSst6LW0pHgxdh/WYNr7dYCDcndzJMH3xJYeMz/k99n7T4wM46S8EZBW1VgNNomo51WQka/7Uila
	wtGH5dkkxjkFRTiD8nKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0rX-00000003HtI-0HgP;
	Wed, 29 Apr 2026 09:05:43 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0rT-00000003HsA-3ddp
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 09:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777453539; x=1808989539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1hxYCiayBlxyU/sHOL5JNJjVec/HYOBaNVT0PyswTsY=;
  b=hvc7elpgxIqMjNz+DeWzJlgEf2LvaJh2Qp3RBe7dSvEev95xhtZ7p2vJ
   s5jjIqajDqmpY6yGJ0R8TjZdRNk3R0+0Su3lfYPT2WeEFm+T2mLQK12mj
   z51plgMr//3PXPGWVoK+YQN8w/Hz4udeZdAEDDwMGcKk8uKJ55ZqXVtmH
   2R3VKyiN9IUu1ZUo7BpG4UdHsXhgrQoQhvsp70O161IPzPS3fVvkPHMbq
   PUmCvQ244YiAwnTmuHdVFpuNNW4a04LCw1kaKEzvZU5vC/hqWvMUsa7RC
   7lHwUThIJkZ01f07Xl1Fz24IxyfkaFRNEzjHsI1xIG2hvlaDN3O6wrSZK
   g==;
X-CSE-ConnectionGUID: rNy4XklZTb6ndOI6VHyK2g==
X-CSE-MsgGUID: vgrKatl3QQ6CpRp59MTMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="88975636"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="88975636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 02:05:38 -0700
X-CSE-ConnectionGUID: UEKWoQTOS4SMxFcTkePYlw==
X-CSE-MsgGUID: hxUwmqDhRbaVY3Ybs6Knpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="234080178"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 02:05:35 -0700
Date: Wed, 29 Apr 2026 12:05:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <afHJ3DArX34FQMuY@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
 <afBhkbGLsuqUitOl@ashevche-desk.local>
 <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
 <177736726936.2886867.7725295920724488690.b4-reply@b4>
 <afCS7GEG7gtyC7RH@ashevche-desk.local>
 <177742420562.3222151.9689419292413018986.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177742420562.3222151.9689419292413018986.b4-reply@b4>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020539_919240_FC6E5626 
X-CRM114-Status: GOOD (  14.24  )
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

On Wed, Apr 29, 2026 at 08:56:45AM +0800, Jia Wang wrote:
> On 2026-04-28 13:58 +0300, Andy Shevchenko wrote:
> > On Tue, Apr 28, 2026 at 05:07:49PM +0800, Jia Wang wrote:
> > > On 2026-04-28 11:41 +0300, Ilpo J=E4rvinen wrote:

...

> > > Thanks. I tried that approach, but the statement-expression form does
> > > not work in this case because the helper is used in static initialize=
rs.
> > > So I'll keep it as a plain expression macro for now, and just rework =
it
> > > into a cleaner multi-line form.
> > =

> > Still you can move FIELD_PREP_CONST() into it.
> =

> Right, I'll move FIELD_PREP_CONST() in. By the way, does your Reviewed-by
> still hold?

Not for this patch, as it seems we get too many modifications and discussio=
ns
around. Let have a fresh look in v6 (the rest of the patches are okay, plea=
se
keep tags there).

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
