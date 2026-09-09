Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36028C79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCBggV12aoPKj84pJHRqVvYf6CuKVTe6DCUljKH66hg=; b=dQkHwVy/67AqT+
	gXGoUeKeBsAHK8MQY0TszEuTCPIgULu/1sQn8rWA7dyxWwFDriFGXjiet5+Cxw2bIBCp++LJL6UUD
	hKP2fTUWlyqhbgQQ6ByYhgyV7uhPBuichCW40kkTmoDtaiLUUKdp62Hpn7XdpQmJVEwryi6t1ZPI9
	AgZH3BPuucFi5Tp84GgWiKasZvnpX07SxlcgqtHYBQfMXNNAHvHFIN5wsuw01WKsMqnfMce3iwfXy
	Z6VqeyWvGtfbjtmTy7lkUA7k69NXhIKlN43UF5v7ap4RT0NOERIx0YoDfxTkqc45HKDPcw8wNiwp6
	kgRZ3h4wHFqmWbii0cdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DFV-0000000B3QJ-2uHB;
	Wed, 09 Sep 2026 08:01:41 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DFS-0000000B3PH-3Pqp
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 08:01:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso7145230a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940898; x=1789545698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8CIem4P/Or0F4qZW5iNmZjHo/TZnFkGYTym/tguf0U=;
        b=S6EOPbJ1yRx2OZ8WF1vu3KHZQ9e2TuirxT5stOIFJ8ovImxrtRFPdZXTAiA2uXKHDo
         o+mWQRU+7/LfXYKMGj/8y9MTA2pAHlupgm08n/2RDSruuOZXNpicz/lpAQ2CdvRXHWTd
         EmvVOl/dwabcABRY0RckR9T5x5dOc3yuGBDfc8xEK/4c60sGRl/jdwCuVK+LnngFafVg
         8g0K3P284E/ZGuE+MZe58bdr4sY9UsZQDC4B9Tl6GxMhA/nrhNcACLW/foZlvF7T5sol
         Um04W7KQXZyIz0Osg/nZHdqeqzyg22FHQk9nA+gx0h2baIz0mAzfHc8RvEoRTC3A0RDu
         Bzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940898; x=1789545698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8CIem4P/Or0F4qZW5iNmZjHo/TZnFkGYTym/tguf0U=;
        b=WhQ9ZkKLTRIDPVubsHFx+f4RBaTKco5dk5hyz4AK9da1PwWdK3Y7chqB5MfhwGTP7+
         Gsu1PgEXG84uL7z61S8jpIprzdrxT3pXO6Et6gYzLwfVX0e0p3k0kfAC/6B8hY31yyyN
         C2dmRYqpj85GD4ib658mdJRo27Luo4awLfRGbi6PCMSy283nDVOhSxwwFxO5551UOoo6
         pcsHmS0qH3MZ4wWTv4t0MTvyF4UmzHuTquXHtBKRkQWRPnI0lYbaLIkklhxPdGT+8vAH
         LUVTNT4x66J/a+Qa+SdVZHAPoTG3ln1jFcAoOOIfpPtMD+/16VTcIAiNn30/xSl1G/Tb
         Xpuw==
X-Forwarded-Encrypted: i=1; AKwUvBy0XzL5PUZ4jWw94BiAn8gBWKkbUuRpaHChFR7o2tUEcY+3Z3XMwPuV2cwjcoO0MM5B7nAnzzb1yL05zQ==@lists.infradead.org
X-Gm-Message-State: AFuF++neH6IioS/OYbJ4i7BCcpv3ovoOk4yJjjJ+mivm+N0aA/nQJDMZ
	Yrg1g2xeVHsnLuTc7LfcNIitqd+RtIQR8lwlHYxx/KuOecbG5HA20ifM
X-Gm-Gg: AYBFou0s3wzoITOJ3cPopM6LP4fr41IGGxVfRdkkO0K/xKQ2t3qtfe4aeSO/RJhNvld
	PBeJgol7RBaoj5FbR3S7gdjEPmtjHwnGDnR2AgMsL23ZPLGU+aGxSYH24nf6CMCmtqirV2BpvTN
	m2FMokjIydDZpLE9hoyhSueIkGerVb7MNd07KFPx/55Sq6oDlpgxtDehL5OQYELoTwVV5BoJYdF
	8i7tWO1VGhzfY+JZhnUnoXJtlERvP2u+RSuzkFLC2DOW1N/L8r7HuOtCClqUHKJy2532mz0cuXz
	62zWjokfjASXTa2KsnK61cChuns/L5wKvsCALvA+3jMQYRPkGwwCWfiheB9KmaXi07JmBq1bKC6
	KgvZHlQI0WvJ9yVLKn0bbQoKwu+L1NsWnmNCN4Od049QTA4SwG7/8fMvN5N38ZwcPy6FsgdT8ST
	/gmaqu0JeyOHBnvzSVr66LuitPTpcBquxavzkq2g5ioV0F3WX3bvCZXW82sD5FQyGjuhiOeQ==
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr47242447a91.8.1788940897733;
        Wed, 09 Sep 2026 01:01:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm38584020a91.16.2026.09.09.01.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:01:37 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:01:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
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
	Siddharth Vadapalli <s-vadapalli@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <aqESLh8EO77U2nWQ@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-6-inochiama@gmail.com>
 <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_010138_856843_36D77DEC 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Sep 07, 2026 at 09:08:28PM +0800, Troy Mitchell wrote:
> On Mon, Sep 7, 2026 at 07:26:04PM +0800, Inochi Amaoto wrote:
> > @@ -14,26 +14,29 @@ description: >
> >    PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
> >    controller, and supports 256 MSIs.
> >  
> > -allOf:
> > -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > -
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pcie
> > +    enum:
> > +      - spacemit,k1-pcie
> > +      - spacemit,k3-pcie
> >  
> 
> Please update the title and description to cover K3 as well. They still describe
> only K1.
> 
>                                             - Troy

Right, I forgot this. Thanks for the reminder.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
