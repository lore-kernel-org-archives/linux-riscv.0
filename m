Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4AEC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJZTu1k9Am2CAZm4/jvXFoumRdrzI12v7kHPCsXjZMo=; b=W7ms8+K94DV2JD
	H6+U3F1nGwE0NdeLnz51o5H3zMfcCoBWWyQmBKpuokCmBu5WAl3ZnDracC+lmGUDKYFXAM2XDlhKv
	yp4iZdsDaWmYDyvjuuUH0EXOsTMyVMdHFunI28GSo5AYLu/ZEnZWhjriOJ40Osj18FieGK8CS+peu
	zuaTlUvFZ7vQTtMmyFCvPZ8HRE61B09Y5pZF5sGGNbX3VVyPBo8gPU2dfdip7JIKVkYJtDwvpmEtF
	Y5GNt6PDY+0bKE7+RGGzSQXiqlkrfeDXep9h0txE/ZMTzIQCthahtNW+3jydDTMGcDHuVIxF2NQ1V
	aBHe5k6UI0GAY4SFoYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YV9-0000000DYjn-1sDX;
	Thu, 10 Sep 2026 06:43:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YV8-0000000DYjd-1Mnh
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 06:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5K5oyeKOtL71G+azzJACPyPgWDYOvDRyBlKfZlUph/8=; b=T5vl131+YByK7pBT3AB5X4J6sL
	d7BDHp6dsZ3RPFh6ApXD6DTHLY4COZfM6x+Q0lqbe/tRm3fNoV84gbBbF7d5v+RG6laKaaZrGVWuF
	PbUoBFOzTotN018oHCx8yAxj81p/BwcSOg2gVTf9zJIdnkB2Mv0kxezzwaemLWI/2Lcp61rEAynlx
	y4k4HVRi3oLAO3MsK3boUMmw4Pak3NvNFnFLSveecU6YoqKaBq5Lw+bm71IAH9i8rRpWVLkh/pyRW
	4ni36ObNXlcfHK55Ekn0yKV5V756NPsIS/pCTAWbkfP2XrgQstaHQ+7euFr40TkfRMGb2b8tgJyCW
	CbTPF8Qg==;
Received: from mgamail.intel.com ([198.175.65.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YV5-000000025ot-0RH2
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789022591; x=1820558591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PnSdyt8IKSG7Cusf+et3nfCE6GN+a6K2xDtnxZ+Uwgk=;
  b=n1nNYgEwgkMCPzLQOB+dcYlu7OZ+qUaRutLrnXcZVo0FI6LPvS+JGFDG
   q44nW5mHB2NCCoTfeFYt4OBYsruAyJcfbEVi34c3pnB16qTrNoBBFytbb
   ViKE3DSLnHjNNp7jda4+UqOs++TLSudvJgJ7ac6K8yKiMV0j+17qyTwnU
   WWPsGuqNqzTbso/qELoHfmlR7//JmHlAwHC8agjW1HvYbqyPF3py6C8np
   gWIIWGds4qk/cm7vKBJZlI78wpxgn8bTkU+TffK1UCUVvbBddqPZYlW2A
   h/qOMTKy8PQu4TugYIJT4E+otQhvi09R8K0Ahr6TPNJgftQHia02bIY9l
   w==;
X-CSE-ConnectionGUID: 0vkm+V0FSKiTMGTjZyarCA==
X-CSE-MsgGUID: vhAeNb7JSkC21qq5shbaFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99792621"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="99792621"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:43:06 -0700
X-CSE-ConnectionGUID: qMrwe2q5S86Ch2Xiv4qJ6A==
X-CSE-MsgGUID: vOjSCGXARA64SzNa76+uMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="275058100"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:42:58 -0700
Date: Thu, 10 Sep 2026 09:42:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yao Zi <me@ziyao.cc>
Cc: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <aqJRbzZhROtXncZu@ashevche-desk.local>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-2-inochiama@gmail.com>
 <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
 <aqESGs3_BxOd4PYg@inochi.infowork>
 <aqJDvogeo3avWWQ3@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqJDvogeo3avWWQ3@pie>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_074311_606229_BDDEE10C 
X-CRM114-Status: GOOD (  18.07  )
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

On Thu, Sep 10, 2026 at 05:44:50AM +0000, Yao Zi wrote:
> On Wed, Sep 09, 2026 at 04:00:33PM +0800, Inochi Amaoto wrote:
> > On Tue, Sep 08, 2026 at 01:26:44PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 07, 2026 at 07:26:00PM +0800, Inochi Amaoto wrote:

...

> > > > +	data = device_get_match_data(dev);
> > > > +	if (!data)
> > > > +		return -ENODEV;
> > > 
> > > It's better to use -ENODATA which will help to distinguish from other ENODEV
> > > cases (which are more often to happen).
> > 
> > OK, thanks
> 
> Honestly, I don't think this should even happen, since every compatible
> supported by the driver carries its own of_match_data, and failing to
> do so is obviously a driver bug, so I think this branch could be
> dropped.

Does this driver do not support driver_override? How comes?

(Note, Sashiko is full of the issues of not checking for NULL the matching data
 and hence it describes a scenario in which this leads to NULL pointer
 dereference.)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
