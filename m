Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AFF606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwibQZLc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EUe5kQ0C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIG+FXvf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84ezoGys1OsW4GJXIrmxmOmQKihTcP6+cKuP8K6pjsM=; b=HwibQZLcAsk8SJ
	y0jsWlwMHafwE4NG10wFssXYtf1E1EHCByJe1kpkWD+qncC4daKJVVCXNFgZzexhYnJKQYo5P8y6Y
	Aeo+gEVe8INw7EljZAcIkKXkLX787BOaDbLs2D/Ww3un/1/dNdtLeHRpWAOWsc4fFAhyclLXdxqfp
	T4UmdKWwXUaQZBh0Xc+9UITe9E3/tOEUlCAwu8zmZw7DZgaOfzFfgk53pY7ajBwHMCyw1+8xQrdng
	UXOGyvzkZu7aI79r81wudkAP742q8iKjI8cX6uAiAmfLSvHNFdoIMdkLXqDmxIi91n9U2c7ScgVkO
	Bk6BcJlQqhNm1Czr3Ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSNA-0000000BSW0-3QDC;
	Wed, 21 Oct 2026 09:12:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSN8-0000000BSVZ-35xN
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q5o4c9Se3qqfB0CkHzs+jJJ9WgHiDHng2N6iX71Z4eM=; b=EUe5kQ0CT851F/S2OxJ+TxdeuU
	vEWxHqkg2P5ziCSSpsVSx/OATMmUAzXsCvnZtEBMj8IQmvTARu1QqTcH70n1AohFLPhMEDibSCKxP
	GiW9RJjCaYa3sj5e3CS4KZeYPY5Q6TvhDKnIWsYvWM63pkH5JR+qo9Y6KCc3rnnmFsMsur7YOkOOB
	oFqfvGNWR8VKFmbkp1TUz8X57kuJ4d5geXsJpgXWpod4DhrFcZ3C7JvXKDSLCk9saz9miYtyH6Pao
	ZSGYR2Wz4mlwwsOv6Zl8e0qGcvKD/5RJygAv+/c41ev/byt9eb5vOiVKfm3VivJudB5fQXji8Tbct
	9eJrrTlQ==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSN4-00000005dl8-3YHd
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 09:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792573951; x=1824109951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smbmGXOgf53sUhVEG5nOCbt/F7K1bGkWUk3QHVbfxqM=;
  b=OIG+FXvfDPQUhhx/5+nZ384+MxP8Ymh2y5c0SaIDsombe5lr0K3iugVw
   REP+AXNf9W9t+0a6n2w/n4i45a8hd2JzU/+LazVXWn/IpDwkayJRb0A45
   N4QHDHlxzBZ4DFBPiwZLrA14KQNQ5kUoRZs6t0fPtjQQMmTNgdOi6dd1D
   I5rp9Z6phuBeGmy/3dKQNa9WN+NAZMMnsxnQWpCEYNtbs++x2C9trcYFN
   uI2a3VnPz05lPPynpIjpYs72EIY/+lRTzXwi/ngKrSzblFfxD7iReRpLy
   WkUp4358MbrpvQMCtDoIzxo4IrZvQg8lFkdwxKMIPkwHIGVRBJ6b2Uoe8
   g==;
X-CSE-ConnectionGUID: 9SxFV9DJSfKBUdaRotg/wA==
X-CSE-MsgGUID: Cjgdcj+ISB+9h5okUdmevA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1286664"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1286664"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 02:12:26 -0700
X-CSE-ConnectionGUID: zBKMWarpT7ayhJrrRQriow==
X-CSE-MsgGUID: 1W7CIl06TNCcqn7kFEwRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3059375"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 02:12:18 -0700
Date: Wed, 21 Oct 2026 12:12:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <atiB7-u5bxJbf-1q@ashevche-desk.local>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
 <athuYJjPMkrecGm3@inochi.infowork>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <athuYJjPMkrecGm3@inochi.infowork>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101231_469828_AF984294 
X-CRM114-Status: GOOD (  18.67  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 03:51:20PM +0800, Inochi Amaoto wrote:
> On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> > On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:

...

> > > +struct k1_pcie_device_data {
> > > +	const struct dw_pcie_host_ops *host_ops;
> > > +	const struct dw_pcie_ops *ops;
> > > +	int (*parse_port)(struct k1_pcie *k1);
> > > +};
> > 
> > Does the "const" here add anything useful?  This patch suggests maybe
> > not:
> > 
> >   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> 
> I am not sure whether the compiler can make use it.
> And I have not seen any explaination for why no reason
> for that. It is good to have a clarification.

These const make no sense. First of all, the third one is missing it.
And I have no idea what would be the proper syntax to add a such. But
adding a such make it clear that there no sense to have them. Either
you make the const the whole data type instance on the user level or
don't do it at all.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
