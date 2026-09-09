Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D313AC79FAA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAj+iOQ1DrIQXPrnabj1wnianhW0mNfKmSjYnzCTKRQ=; b=pG9ScwF7kM/FdC
	EHJpH6kNCSCQFFvbvCSgiE1XW0PQfWj31c/h6drkb4zAaJmxGfcEiCaFZZmRaSWfWa+hWL8kIr8jD
	HtnFBHjX3NSHNDJYbcUYUHhkacK4quNMCxOIwP/UH1G0E5b4+HZ5Ij9Qh5R1iYgXZCzFN3Hj1ZiDb
	MPjzf/kmwZxPBempThn1rqhr07InO/SM7iV+EOP8I+IWcJAYDZ44OVs5gXWcxn7Yj+yjRxnoQi6rF
	KaWwSkj0FijfXV5hW5+prxAXP9PY2fKTHKEeo3+BfnHu3mmAU4PJqyOpmbShpWREgD/4On7/6hFsQ
	OU9MmttmPJtR6b/FH8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DEy-0000000B3IK-2ObM;
	Wed, 09 Sep 2026 08:01:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DEw-0000000B3Hd-2919
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 08:01:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2dd020a2e44so2164985ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940865; x=1789545665; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qknjfqhsbIT0khBlZrKXrrNMX6l5W5qybKPm+PV6LpA=;
        b=kSH998D/ycRzJYf6RzNTW3DaggrfgVX7b6YAL164C5Ugfvxvc+JF7PRb5ucxVTYbtH
         8US1Bj9KKX61phQAtjUfq0yi3lq/vdruy7dbwPVVdD0/RBc4NqZqqcsXgMog0HU/JSGB
         lf3XCLuUTqFvNmhoSCd1v579/ZCx2NZkuBZ0GBAsdoofHc7KioKNbXHyvNOySBqGNw6J
         n97nuATRnfkuZjoD0FOWyypt0/2u82ckgpEmf1brmDHAyqdykYexbguL+JzEyZcvxIlU
         BeVMTT+Sd0zdBG06l9ahEjQgHkuyUXVB0CZXAYyomF9kjezSdxS3Eko50mFLCKngWq8u
         /nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940865; x=1789545665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qknjfqhsbIT0khBlZrKXrrNMX6l5W5qybKPm+PV6LpA=;
        b=XnpsF+1aDB+Lt8sp5Odrv+ygKcT8LkQkdDuUn84Qfq54Wx19l0HT6sGjNDJsA+oq5a
         3UfMCupwfBr/zUykDtfnCQZ+06mTfmgov1vn7D1LzM5xqKsn7wU5QVTr8MGa97cJge5P
         dGBnth8/l5MfzC1JycQG+wMWkajleAzKSm0MCEMg+Ssb2xTCgsA13DKFkXGAzLylDZDd
         7PKml4crtYUf+eVL+VRFo2vYJDClp4fEVWhX0mL6S2/0rNXF/XatEslryfPr0aR2blAy
         T0Jxqg0U/tiyStnwVeoFE95dr4vq6kTWXGmXmz3WtxLhdunq/f/uJArhdXFUT7O18qpH
         ex/g==
X-Forwarded-Encrypted: i=1; AKwUvBysokCvMgzqWf+/wdZog39cc764ezTqKO9nynnM6TDj/XnXSj/SA8+Lu//NwPCj8CyTDtegifoW3PF9VQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nwo0dXxKlPwINMU7m4XsgbH4332ejO9OJgEienrfIEoOJWCeQ9
	Xon+FQbWCekAbD1gWIj212LFNL5skv/BPf0gsBthXdOGF3Zpr/U8oT3o
X-Gm-Gg: AYBFou1m6NJCAT2sMmpZPubN//UPm0NQwqImToaZTnKoF31+sKkWd6ExK54F4eodJ12
	Rn0mn5gnlNVxkR+lrLEizNVlRlCL3fAoaVH671st7/j+/WZjPPx60dcdhRYPPb6qraL9C3glYFa
	WS2LRubnlbg+Wagl9JN/gggGmKbKGJj6QU9tdxc71Ffz1tNFF2s0r7tAMfq6HDMAMa8iN8Bstaa
	EFkjOenq/3TymzQE+RCn0FbcyTxRcnw6J66jgll8D6HAV+dAtXZbNLWA+8nsZKgUwbvf7E5f2nf
	F7dViGG65thEpU+rl1xxUDoEvp+dinLyVWVDT31EETAUheGSCWmXG4wrOgDAo5oI3Vuu7gMy+uh
	kPZZMC+uUR8gVt6LqBKmXU4B1RDYuRcM74pGtOs/pNRB8FH7WFfVxgyltxl5SbiO0udBTIuqtVb
	ykt8JPT3Io8UQLzej5CcKQ0XkZUIm/hn3tHmgofa/mDZbeV0DZMdHEU4+a7o7rw9USGSpm6A==
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr319851615ad.12.1788940865429;
        Wed, 09 Sep 2026 01:01:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aec084sm66832155ad.84.2026.09.09.01.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:01:05 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:00:33 +0800
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
Subject: Re: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <aqESGs3_BxOd4PYg@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-2-inochiama@gmail.com>
 <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap_i5Pw4nVB4LZ-7@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_010106_554897_7A07A5B7 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, Sep 08, 2026 at 01:26:44PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 07, 2026 at 07:26:00PM +0800, Inochi Amaoto wrote:
> > To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> > data to handle the K1 specific logic and make room for the incoming
> > logic for K3.
> 
> ...
> 
> >  static int k1_pcie_probe(struct platform_device *pdev)
> >  {
> > +	const struct k1_pcie_device_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct k1_pcie *k1;
> >  	int ret;
> >  
> > +	data = device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODEV;
> 
> It's better to use -ENODATA which will help to distinguish from other ENODEV
> cases (which are more often to happen).
> 

OK, thanks

> >  	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
> >  	if (!k1)
> >  		return -ENOMEM;
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
