Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1F2C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOTRQxcw/5i98YcjGGxGeA8hlAVjOZqwzQ0SexjOGtk=; b=chpmsXFfJCoTD3
	seTzOENxrXNDZg9f9Yjaln7odYbafeJ9GEp/YTZPdtL8QonFKknu3hfgJSbK8PR+sHxLsa72ujvts
	CF8nzo8hHnev5OeD1r6ivBnH9rNAaa3vQwYBTTYed4yFDuT8TiyjRDmSKyF4VLLfeoGNBSaHTPy21
	q+oK3smAzc0jCnYlRH29FUEowc8azkT2LEf2gr7zsKjCSCigNkWPSqy5GnPa+ESKqqG5EksKCdiB/
	J7b3azt8srxS9fmo6zgR60PJSLM0n3ghpTuTokQ9ZDPG+51VxKL/jjzCXW7w3qcf6HprKeForcoMK
	yhC8TaUuSy97+Smbx6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dhy-0000000EJXo-42Rc;
	Thu, 10 Sep 2026 12:16:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dhx-0000000EJXi-3gcO
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0rFMiU8kFEuo55R90X9kb89jBCP9eUdAYLBLr3iWUq0=; b=VNdjqUeKCjqBLT6zrsyYG63nt8
	+uyG8JoYK/mYwvMNwDS/rojcULQUhVX/RbqmEz1bM6pYNokGS/j0uSE9LY77Xwo1x+UFP+xFqXgbu
	R+oHYTZOPWy3GPO5VrcZtW9GOEoW7n0CxrVrMRgET24qMB7qPayC0T6WA2DlVubNENZvbcq05qtPs
	0rSNi0pUQupfsS6QN+JcZ6DDApfBp7Y+vL/vdeHvOpLFbuKjOjkizwz8NqEeSBW3RX6/tco9Fc9XW
	3sY4ZziNUW30kvzG7pS9t+kX58u1EaQQi1Pq4znUk2JhPocCvfvFkTSJqpRaYxTqbbqjRJWIfKUas
	+yQOn+EQ==;
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4dhu-00000002SAG-3HK9
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 12:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789042561; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eiFmGZSkzZnvdcn2Yd4jasR4zJjj/F3mE8Zk084P5wgyf1KLSWejb1wGED5LCfCSESZbB583Lflwg6+lsAz2UzTS4PO6OGjOHhbvaVaJEA0QdyhZSXPnhhEPpFPypsWsWdhQ2eKWvP0FGXktp8yyX5xy3Fxzbn85nUmNfsZlZjo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789042561; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0rFMiU8kFEuo55R90X9kb89jBCP9eUdAYLBLr3iWUq0=; 
	b=Zj3b8x0gzciX6Vq74QXuL7uFWmnaqeU+KkQZTAorb0IjLhPyKLqJMVP+A+/7HsX3vBRKrvE+GEA4LKqd63QBUkRodwcEwhvWc3nMtgM9Hi7xw85EDdV2LnT60KaPQrb6AzJyrHh4fcnl0S3d5ABpY/xQEHlMANrgHzxdx4IGESM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789042561;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=0rFMiU8kFEuo55R90X9kb89jBCP9eUdAYLBLr3iWUq0=;
	b=E5SFTABpWoUMa04sEEBesqi8SptYqwobUdF1WVfyP+/hd3zcf6yjL/2JAi2leF0z
	lNnSIk3c91rFkUWNH83saTh5TqyDrQjstRV7Pmw4cprofqm1RreJzX77NhmKmst8rcI
	khTHOC+QkyQoSpPGqXHaKWXl+mV2IcIvxICBSxyM=
Received: by mx.zohomail.com with SMTPS id 1789042559214896.8848926233107;
	Thu, 10 Sep 2026 05:15:59 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:15:39 +0000
From: Yao Zi <me@ziyao.cc>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Yao Zi <me@ziyao.cc>
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
Message-ID: <aqKfa8KAh2JJwivA@pie>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-2-inochiama@gmail.com>
 <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
 <aqESGs3_BxOd4PYg@inochi.infowork>
 <aqJDvogeo3avWWQ3@pie>
 <aqJRbzZhROtXncZu@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqJRbzZhROtXncZu@ashevche-desk.local>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.29.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_131647_262178_C9BEA95E 
X-CRM114-Status: GOOD (  21.12  )
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

On Thu, Sep 10, 2026 at 09:42:55AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 10, 2026 at 05:44:50AM +0000, Yao Zi wrote:
> > On Wed, Sep 09, 2026 at 04:00:33PM +0800, Inochi Amaoto wrote:
> > > On Tue, Sep 08, 2026 at 01:26:44PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 07, 2026 at 07:26:00PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > > +	data = device_get_match_data(dev);
> > > > > +	if (!data)
> > > > > +		return -ENODEV;
> > > > 
> > > > It's better to use -ENODATA which will help to distinguish from other ENODEV
> > > > cases (which are more often to happen).
> > > 
> > > OK, thanks
> > 
> > Honestly, I don't think this should even happen, since every compatible
> > supported by the driver carries its own of_match_data, and failing to
> > do so is obviously a driver bug, so I think this branch could be
> > dropped.
> 
> Does this driver do not support driver_override? How comes?

Oops, it's my fault not to come up with this case. Sorry for the noise.

> (Note, Sashiko is full of the issues of not checking for NULL the matching data
>  and hence it describes a scenario in which this leads to NULL pointer
>  dereference.)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Thanks,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
