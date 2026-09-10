Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E637C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 05:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0LXEGyXTHhgDUZerYP0IbBKed2nLeMDhQJo/X0USKE=; b=RTvONF+foHaj2e
	7UaKT2SY26k3eWN3z3uIUIcFpC0Cb8V1O4rVGeKAzH5DD7LfjwQR7pZVBRgEIq9ScbmLMn/3YvKB+
	8BXg004b5YBPqvDMxik3MUcz/ZrlKXKOpgXLndceUdXu/o85lGzrTHmyGa+N2Gg8awrxGiqTcM5Vb
	QX1P81GEsAR78tcMqhGpoH9+aAcT+5V4jLpOcHM7eMr03dmeqKH8RWgMVXm+fz7N1SJ2OSHZIN3Q/
	+z1gaCZRtum2siYGqi1ISF/PS86QUZqn08RLjaj2XWkEZXXR7u24y8pJcwbVGO+KKjwKqAeYLnVXi
	WaQoUwoqyalM5ceEPC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Xbc-0000000DTRs-3Lri;
	Thu, 10 Sep 2026 05:45:52 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Xbb-0000000DTRM-0I2k
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 05:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789019110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AkQWj5X2/WfkO6AuIy0TCQ1tG9312gOD3opHqvuSuXenAlsy6sjD8nEWUM6u/OxbXtSB7rcldEYAOYPoLVUDRc3tNkihEMnZYibMnkYG4XrnYV0wNB1Igh2Eo/Zw8VVBx4QtiYQvhe3grL3qBDxP4SVeMQuEcg7+mDfob1QDJ2o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789019110; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gSn3Fj7xFgo+r0eHxl6g7t6RSpvjjOk+wb4fUejubdY=; 
	b=AUn5a2goTpVrQ8O17s8qeAvcAcpm9jWzPaN0TbprNnbB9r3ctPRCjjKZ3MKeIKWvfS271CSpRJ2O26M9Aa4xMRlxnIx4qhGruvbBHgCpGLGFdeNB7kbfDviPssfXPgqhKrhEvl5YyFB5gVisclvKa2Sh56s3OBL8e8Rp795XK0o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789019110;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=gSn3Fj7xFgo+r0eHxl6g7t6RSpvjjOk+wb4fUejubdY=;
	b=BViIfc2jSXaV5qCndq2qxXIi/yhYpkr2fIHGSTQY7C4N4AQCC9L6shvguAwLLpa0
	j0qgMZqfiWXFbLn3PMCzSfWmSGbsBCDRA1/uHBlxujS0Pjg/14q42l7vJdoewV+jxAJ
	CnuNfTLwDFbsmRBBK0fKAAGmWU47BjYfznWfx104=
Received: by mx.zohomail.com with SMTPS id 1789019108502587.6996467974229;
	Wed, 9 Sep 2026 22:45:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 05:44:50 +0000
From: Yao Zi <me@ziyao.cc>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
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
	Longbin Li <looong.bin@gmail.com>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <aqJDvogeo3avWWQ3@pie>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-2-inochiama@gmail.com>
 <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
 <aqESGs3_BxOd4PYg@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqESGs3_BxOd4PYg@inochi.infowork>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.6.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_224551_327669_0B8183C3 
X-CRM114-Status: GOOD (  19.86  )
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

On Wed, Sep 09, 2026 at 04:00:33PM +0800, Inochi Amaoto wrote:
> On Tue, Sep 08, 2026 at 01:26:44PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 07, 2026 at 07:26:00PM +0800, Inochi Amaoto wrote:
> > > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > > data to handle the K1 specific logic and make room for the incoming
> > > logic for K3.
> > 
> > ...
> > 
> > >  static int k1_pcie_probe(struct platform_device *pdev)
> > >  {
> > > +	const struct k1_pcie_device_data *data;
> > >  	struct device *dev = &pdev->dev;
> > >  	struct k1_pcie *k1;
> > >  	int ret;
> > >  
> > > +	data = device_get_match_data(dev);
> > > +	if (!data)
> > > +		return -ENODEV;
> > 
> > It's better to use -ENODATA which will help to distinguish from other ENODEV
> > cases (which are more often to happen).
> > 
> 
> OK, thanks

Honestly, I don't think this should even happen, since every compatible
supported by the driver carries its own of_match_data, and failing to
do so is obviously a driver bug, so I think this branch could be
dropped.

> > >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> > >  	if (!k1)
> > >  		return -ENOMEM;
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
> 

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
