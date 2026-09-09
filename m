Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68B5C79FAA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHHJn71L0x3xyOnKZvyZ3gNMtFUo4frpIk5JY6TuYyE=; b=qVRsaFhuW+Nz9A
	T5TI1yY/7CVma3dKty0IA0uwiJSDAGyDLAsEEXxrrW6Tr4f0L6AdTPZ8n4oKEg69KbcDigx3wLhrn
	ROKLskNJJ1pPOrCXUbYGr2Ynb7nn/ygTEAzvL4ipODudrv9yl3V7/zFFP9KCvpRgJG56jbLtLxzon
	LkjO3IpejOLo6ykGf5ELQ8NiOZ+UUjujn1gYeBi9ce92Vf7F5aFwwG0Jr7hWGly7aHhnThRvIqCzv
	QTADtWizynx4OCU10z2lH3taowY1ZtbYvd4Nc3HcVlos6rQEjljr+UgvamctQR/ITL7Y4HQ3LLvQf
	oSWATS1HrcHNRt38tW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DEh-0000000B3FT-1m6U;
	Wed, 09 Sep 2026 08:00:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DEf-0000000B3EU-064Y
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 08:00:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d9520b9155so46614625ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940848; x=1789545648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTUPUjrKl8uCmmUdksk98ps3euLofcTsZvaXovInbao=;
        b=cslLQM5aPyiSeugdtQj9pe9/LJyrr/CyM2LayJoATH3KMgrgs12uBPqc1++78GYSt4
         SD0CDsvXIHji2gxggoZDQ7DTQCoQy8P/zTzPeYfpakmJYpUA77t66Y3Kq+N0uaiPmJxl
         ERH5TXUFDuQsA1wKcaefh294rcg93hjNyJVWch0nTinmjCHbdG3ih4jrqfjWftHxbtEa
         ijIsdeI3WjaBMXJktPt3l1dNL1vT6hB/p7LKWJIIwBQ7KkupUwCTPhJmimTdxXCI5gyp
         GMb1rWTxKIeM2fTR4Gdjywo+JCBGYMyLUFk9HhxUY0kynSGZnCoAA6rS3nmQRX06WdAa
         jspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940848; x=1789545648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTUPUjrKl8uCmmUdksk98ps3euLofcTsZvaXovInbao=;
        b=RPf7Xr5FWKHwDWgMOW/wjGIyi7eO1DXUTg+xw4vm+dRqi9nRpOI/h1m+tqNFKhceTt
         t8jxY2a4V5l3tJVyHq2lW19UlfT6Ki8DPLwuSb7rDtjosYONae+59ycJ0FD56Ntxk0i4
         lzZqXMuqM7SdNa1rMcap/VnfQiiWLqdn2r9vBRn4AtkN3a3YMNRKyaUeq4lBVTCKlGNl
         Rc6xQfrYnKCpY4Gd4yIUlaw3v/5Hgkn8+JpjTMrcHdVx77uwMQM5SyKx3QyucLabsaJe
         W59IzDzK9qKqImilPKDzE9d+7uF+2iE7O6cTCSHqZ3zV9xASOMiEhb2tOY4aFP3CywLw
         oXPA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ7jFqz18UrS+dbd/P34o0cHk1rasXkZiPitnP8VDaLJpYnkLUO+0AE3zaLe9JaOK/lsjoUkNQ/eIQ0w==@lists.infradead.org
X-Gm-Message-State: AFuF++knyZcxuQBwcTN94Ur1ogaNXhlanulFPxzSPv/OW51nUrLV+VCv
	HVRkks32H60t7Lp+wqih3u5rGlUH/1MfD5ZfrewzcrXRH5XWh5Nuk4H4
X-Gm-Gg: AYBFou1rP0z/b4toV5w/FOb7Mb7bl41CCpoejIR8XdEz7/A1GKPBoUWF86+zFm33eKg
	l1Jwvxz4Fo4902snfr+Soo7eTXIfXkD82+EjK0+Q7phdqL2HIfvV7Kuw7A56FdFY3gRFB1hdSwz
	kg7QKK1zc3ruMwjXe50D1J4i06O/w93kdjt4DZF9MHw8Te9vXCIbcmJT+hwVcxaSaM+qB1hFpHT
	TP0LHAPq9PCw2F3Z1+R7+WcRMU5yM5EGkQCDKHOrdI6R4dUxjMlWaChgIs3iXbmwKp17ieogdsu
	CuzpF0T28rYHrpFfX6+/+JizhY/cvZtT0R4EmBJeAIPZHwvh0dii048reikrXMzUkhbGF21xCCK
	w0ufDproMUaQ6dh3yXInwsiiJLxj4LF6i1FWsSR7BZmrgwGo4uy4or93hrlDJB/Et6z6sw1Wmwa
	gdQyasY2CEKiVPFSIhz9yZRrR3o1Rd12w/8lO1VVrJLBhjrDZoPhLTlOApij7Dv8wJMMX/QcsFP
	C6ktd/N
X-Received: by 2002:a17:902:f70f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2db1225b297mr497594465ad.0.1788940847987;
        Wed, 09 Sep 2026 01:00:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db56c2a1f1sm37775965ad.78.2026.09.09.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:00:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:00:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <aqEQnkrPSKB-3fam@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap_jh_NAqHnIlZeu@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_010049_245652_8CDF3755 
X-CRM114-Status: GOOD (  19.24  )
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

On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not supported by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> > +static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
> > +{
> > +	const struct k1_pcie_device_data *data = k1->data;
> > +	struct device *dev = k1->pci.dev;
> > +	int count;
> > +
> > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > +	if (count < 0)
> > +		return count;
> > +	if (count == 0 || count > data->max_phy_count)
> > +		return -EINVAL;
> 
> Elsewhere we distinguish count == 0 with -ENOENT.
> 

Is there is an example? I think it is suitable for its internal check 
to translate -ENOENT to count 0, because no phys property means no
phy. For a get helper with optional semantics. I think it is fine
to return 0.

Regards,
Inochi

> > +	k1->phy_count = count;
> > +
> > +	return 0;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
