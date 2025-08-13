Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC783C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7nXSU1jLeRbyVY0uCOl60bqhPzewBtpc75eDxuiaKI=; b=0bVzmkrUPCc26J
	csQ2kR7q4dLK4wabBiHfdByUFol4E7pRtFESMO9yRgoPTPtNWwwp0dlt4NT1kAHFG1Wjjjj/Jy2fV
	nAwbCn0n/aVtt5mOmqlJiYdpxZii+5+uFxdIvbojSryEZhFfxOnguWk3xiSLCBDlTSZQh6Ug43wLG
	DhkiUPMMvZEehsZkMWe5mTrvFOeoaPAcPEER6zoQG3vZsCxjVHtarEuvMpdtOsg/VEHqlHYwkVob1
	7ViUZ9t/NnfEqIPllN/KDcLpnBvirD7TXJiguPJR4wGgZX7aRCaBEu2dfG1GFnuvp9anIczn1YBHS
	zL9NDWNoiepXwVvTg0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJ0L-0000000F1Lc-1chn;
	Wed, 13 Aug 2025 21:27:29 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJ0I-0000000F1Kt-1Txa
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 21:27:27 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e56fe7a3d6so2741645ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755120445; x=1755725245; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrFzekosij5RO32ErAHxgIo8Kdw6RXeQrtvQE1dGiUY=;
        b=Wp/4dqvPYsnK+Bq2LUGMkJVwIYI1+i2k1TugrWTFzCfO58YzCG154rXAm2TSEArrvH
         jOpP8x7T3SmuHnuG8rjaotmk9eTG+BroaD2bw2OeeCc05peN5rXw9fiugOQ4m2HMjM6U
         8v1paYWp4mPGp99sTWupCmy9J4uqhb0tRYD+6AtQxicclZ3gpsN8PV5OmKt8MGhJSLb8
         MBvBLUJ4K6gPmjPGXxxZ1ajlqRowVHlyFhcIFi0h51flDKpwkYNc/ptE5690EmBxIQ3p
         uR4E72Rf9ivY8GSnNO3Ve3vmZwHCwDeH8BBzF0o+jv+No2e1D+ZyvB5JtcY0buQMei5R
         pcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120445; x=1755725245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrFzekosij5RO32ErAHxgIo8Kdw6RXeQrtvQE1dGiUY=;
        b=ela8b77IsPjIj/2y1x51hXBzPkNLRi8u3KzLpH+HYdUN1xz0aTn+gvBJq5fbeBhFHo
         9kgC5OUtiejoCRhReJxR6q4aSqUA2vdDA+5wUtptPnljk5cfdzjF9+LVgK+FxlfjaA7P
         gH07Mfj0cIxiPlCD8Y9btmjWISwOymukuj/JhTStTF97rgJg59twXmNX6agaNFEFcFvP
         TrPp0KyOdHGha8mWkMGOZ26S7hJFsvq1JtVWB+myb92ZaIr/8sofOgvbRxBwXMhnJkKu
         Y1J5uoiX1TvT/Hf28rwRxxgqltgItHU5EPh1QoEBkFRRPk32CSWD8F28HLVVCNYh/rww
         +LfA==
X-Forwarded-Encrypted: i=1; AJvYcCVAACj64FSNW5A/ssYOFq58TCv8dPAwoSsfwpVbKto5fbI10i07t6hfAef3wHQMdkW0+/PRORQbM6CvZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfwozkV899cqH2M9PRpVFGFtcruFi7PtgYB1XYdZWTcoMkMwa5
	cWf6P9GZCygfznPSeXnF0lE9spWpN+PUhWxBUQsfm2Q4Kf2s72+xc99Exhp9FPOiN/8=
X-Gm-Gg: ASbGncs6FP1c48LPhS587n3sIriZV+rqkJadvHIsqDo329kPu5SlPl2LQ++7iB/KS43
	YjGLbPpii6mFHQxzWtfrbB5drIJdKsA4AgW00OgSljveimYlI482OSYKmzqQAThRyUA/xvcYkEk
	8BdpkC7YHlLlcRM/paLC2hFr24c5KdQe4Rcy/ehNJWn124TJiY/DEWKllEH/kQPU6Na7Lar0UX0
	TYyW3pwDsdoSyCvU20IE3xctH+4NO5m7OPTQrkY1HermC07hne7YhbbdYS+/ZQ3Z/kp4t+T4UVH
	mJ8W2pCf8SwDRNjDdwY07FuLVGWp9K8+D0MsQnn9PxYQKqVshIk3/VDgCs9Y9DuDyvdaricB75a
	CHY5f7+zRhWtheHy4TLkR2YPpqkFGkA89fbtQ1nDTjjMrOHAfCYPEqAzE2nfrYXREfgdZ31FZ
X-Google-Smtp-Source: AGHT+IHhxOnH0kTjTpaPF32KB8bFgpsjlYZNdzvmJrAc6sUo4I9UVSc/FXuQewT8WYi7PJE6uX0raQ==
X-Received: by 2002:a05:6e02:b27:b0:3e5:4869:fdd3 with SMTP id e9e14a558f8ab-3e570810a71mr11947605ab.7.1755120445360;
        Wed, 13 Aug 2025 14:27:25 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e56ddf9ad0sm4921475ab.34.2025.08.13.14.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:27:25 -0700 (PDT)
Message-ID: <5d5eacff-4c32-4df4-8da0-3b55974b74aa@riscstar.com>
Date: Wed, 13 Aug 2025 16:27:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] PCI: spacemit: introduce SpacemiT PCIe host driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de,
 johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de,
 mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813212219.GA294849@bhelgaas>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250813212219.GA294849@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_142726_398698_9EE9E430 
X-CRM114-Status: GOOD (  22.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/13/25 4:22 PM, Bjorn Helgaas wrote:
> On Wed, Aug 13, 2025 at 01:46:59PM -0500, Alex Elder wrote:
>> Introduce a driver for the PCIe root complex found in the SpacemiT
>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>> The driver supports three PCIe ports that operate at PCIe v2 transfer
>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>> configured for use for USB 3 instead.
> 
> I assume "PCIe v2" means what most people call "PCIe gen2", but the
> spec encourages avoidance "genX" because it's ambiguous.

Yes, that's what I meant, but I did try to clarify with the
transfer rate.

>> +config PCIE_K1
>> +	bool "SpacemiT K1 host mode PCIe controller"
> 
> Style of nearby entries is:
> 
>    "SpacemiT K1 PCIe controller (host mode)"

OK I'll fix that.

> Please alphabetize by the company name ("SpacemiT") in the menu entry.

OK.

>> +#define K1_PCIE_VENDOR_ID	0x201f
>> +#define K1_PCIE_DEVICE_ID	0x0001
> 
> I assume this (0x201f) has been reserved by the PCI-SIG?  I don't see
> it at:
> 
>    https://pcisig.com/membership/member-companies?combine=0x201f

I hadn't even thought to check that.  I will follow up.  Thanks
for pointing this out.

> Possibly rename this to PCI_VENDOR_ID_K1 (or maybe
> PCI_VENDOR_ID_SPACEMIT?) to match the usual format in
> include/linux/pci_ids.h, since it seems likely to end up there
> eventually.

OK.

>> +#define PCIE_RC_PERST			BIT(12)	/* 0: PERST# high; 1: low */
> 
> Maybe avoid confusion by describing as "1: assert PERST#" or similar?

OK.  I struggled with how to express this to avoid confusion.
But I do think "assert PERST#" is better.

>> +	/* Wait the PCIe-mandated 100 msec before deasserting PERST# */
>> +	mdelay(100);
> 
> I think this is PCIE_T_PVPERL_MS.  Comment is superfluous then.

Excellent, thank you, I'll use that.

>> +static int k1_pcie_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct dw_pcie_rp *pp;
>> +	struct dw_pcie *pci;
>> +	struct k1_pcie *k1;
>> +	int ret;
>> +
>> +	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>> +	if (!k1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, k1);
> 
> Most neighboring drivers use platform_set_drvdata().  Personally, I
> would set drvdata after initializing k1 because I don't like to
> advertise pointers to uninitialized things.

OK, I understand that and will do it the way you suggest.

>> +static void k1_pcie_remove(struct platform_device *pdev)
>> +{
>> +	struct k1_pcie *k1 = dev_get_drvdata(&pdev->dev);
> 
> Neighbors use platform_get_drvdata().

Yes, that goes with platform_set_drvdata().

>> +	struct dw_pcie_rp *pp = &k1->pci.pp;
>> +
>> +	dw_pcie_host_deinit(pp);
>> +}

Thank you very much for your review.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
