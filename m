Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38F1D15D82
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmuRzgMF1TjxNv640MA5+3xHpbzYCfwj7UlYqHAXQP0=; b=dhawJhcYeSvZ4l
	8NeDJANSG5rFzOxSj4AqRP7bNHR6l+03aUQhySDwl/RH4GqKbi+DwcXozwWH5M5NHKyOwroJ1DSKg
	z3ID/Aww7Bl9oCkX4ZH0sthfh7mg67Yz3o3cxC+tiYw3hE77BdHa4C28ZjquHjLnpWoXnI+2TO+DT
	GMFFhJPcPjkampBzznr2NuALP9IKHnd/9e7aAsyIsLAdqvKTxmYk4J4xajM0DeIvEcclzQtfjCLT0
	BIte2QfX2ZGE1AwjD8S/acG355jYDc25pHjsad+WF4O99IOmx3srPgGTGZvzpPv4n9SfSkzceqIHd
	RNucnwETog1ajDA1pMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2r9N-00000007A71-0ZVV;
	Mon, 21 Oct 2024 12:04:41 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2r8a-000000079tz-449K
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729512233; x=1761048233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=64w73gIGV4oF+vq2Rcl+l60DIPus9XsF4mUZMhA7ah8=;
  b=Qo7LrAp1gXHyOwCVs//Lf3nLu1g37jH7E/mAmfOzrIuPreAmHKBfdweL
   NpieOCxrHXpoq6KMdc9REQTOpL24i2lvzbInZzPXwEzNtDcrxToC6NK8/
   j/JkwMWwIAYwOBiasKbdHCjr4xRS7Qo6V86GstaG6ZrPhl6oTMLoEIQGi
   zJAL207qIpBGaDeIN7XKSC5lc4tSiIAMly1ciLZIOhdTVQhtf2f+8Y+Nm
   fbZAnaxOwqlyrrjARXJpVvYc7uD2ZcnIk9ATgsHCvp1u3pnbEDV/MFM8/
   eGVA+FMyxCx8cU9nbi91ctdgyR0rsKYHjmdiMDHDEcw+vkU13cQqnf03p
   w==;
X-CSE-ConnectionGUID: aTW9bRR/Tg+aqVbUG5Kz+w==
X-CSE-MsgGUID: mzKNd/rUQa+s1l1ZU1geAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="31855352"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="31855352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 05:03:43 -0700
X-CSE-ConnectionGUID: l0ULbCs3Qqmf1AxmMyh5ow==
X-CSE-MsgGUID: rf2wPc2FSPOFTqBlYa6gWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79456680"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 05:03:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t2r8I-00000005US1-2Urn;
	Mon, 21 Oct 2024 15:03:34 +0300
Date: Mon, 21 Oct 2024 15:03:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] serial: 8250_dw: Add Sophgo SG2044 quirk
Message-ID: <ZxZDFiUANo0Jqaai@smile.fi.intel.com>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-3-inochiama@gmail.com>
 <29d8e2a6-d0e7-0f74-1f5c-4f285ec1e9ee@linux.intel.com>
 <tm7jtf3swggiilznwo3xcqjlhd2a7cguwk3nay3bhmaxo23mf5@qw2fyjwapoxe>
 <3dafd285-f56f-de2a-1544-b6ce092607b5@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dafd285-f56f-de2a-1544-b6ce092607b5@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_050353_056476_6A6EE574 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Oct 21, 2024 at 01:17:55PM +0300, Ilpo J=E4rvinen wrote:
> On Mon, 21 Oct 2024, Inochi Amaoto wrote:
> > On Mon, Oct 21, 2024 at 11:52:38AM +0300, Ilpo J=E4rvinen wrote:
> > > On Mon, 21 Oct 2024, Inochi Amaoto wrote:

> > > > SG2044 relys on an internal divisor when calculating bitrate, which
> > > > means a wrong clock for the most common bitrates. So add a quirk for
> > > > this uart device to skip the set rate call and only relys on the
> > > > internal UART divisor.
> > > > =

> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > =

> > > Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > =

> > > I wonder though does this mean the numbers userspace can read from ke=
rnel =

> > > are bogus and if something can be done about that?
> > =

> > I am not sure whether the clock rate can be read by the userspace.
> > At least it report the right baud speed by using stty.
> =

> Okay, I meant baud & other settings. Thanks for checking it.

oBut there is clock rate for user space. I think Ilpo has a point.

Documentation/ABI/testing/sysfs-tty:21:What:            /sys/class/tty/ttyS=
<x>/uartclk

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
