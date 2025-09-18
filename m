Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84E7CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 03:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LW0EpvShAuLGEeb7VGpgli6vhJeOX97YMwemvUewneg=; b=As9+4iCghmejr7
	SosZSx5BwGdM2QXRnTRPgHhX1cIRF+aUZXNwigqSpZLMQbx0p3k4EEOhNJPicKHWko8RxsE5iQdN0
	8VHt2+4KH3TtbAxds92OeTxYX9bAGwow26XzQuR+3h22QJyoyinO0JPtYlQ6056eGUVCcieYOub5I
	WBAc53zIMN/qM9meRjGZBzAhu7PsxBDXN2Q4Nxk8Fdns6ZgXLKQCiAopx/juhTUKodiJ1FnP4mw5a
	Zncab6NrT++9Qgd0BH7v6Iuw1nBB6J1bsDd7PNwg+Ztwb5d5u9o2pnQ0hp3jJaLRTjFQm6N5d6iI3
	Ys38avgMnFgqMgEmIv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5Cn-0000000G7NZ-3hoL;
	Thu, 18 Sep 2025 03:21:09 +0000
Received: from out28-97.mail.aliyun.com ([115.124.28.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5Ck-0000000G7ML-0ICS
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 03:21:08 +0000
Received: from 172.38.29.243(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ehi8CF8_1758165655 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 18 Sep 2025 11:20:56 +0800
Message-ID: <48b8385a-ad44-4098-a647-109a3cfe3bbb@bosc.ac.cn>
Date: Thu, 18 Sep 2025 11:20:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
To: Will Deacon <will@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 iommu <iommu@lists.linux.dev>, tjeznach <tjeznach@rivosinc.com>,
 joro <joro@8bytes.org>, "robin.murphy" <robin.murphy@arm.com>,
 "paul.walmsley" <paul.walmsley@sifive.com>, palmer <palmer@dabbelt.com>,
 aou <aou@eecs.berkeley.edu>, alex <alex@ghiti.fr>, anxu <anxu@bosc.ac.cn>,
 wangran <wangran@bosc.ac.cn>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
 <aMfsj1U7NY2m68T4@willie-the-truck> <202509161827232434929@bosc.ac.cn>
 <aMqlR4vDOgrFuCUj@willie-the-truck>
From: =?UTF-8?B?6YOt5Lqa5pif?= <guoyaxing@bosc.ac.cn>
In-Reply-To: <aMqlR4vDOgrFuCUj@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_202106_274874_2268DF0F 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

[Sorry, I tried switching a new email client and made some settings...]

On 9/17/2025 8:10 PM, Will Deacon wrote:
> [nit: your email client has made a big mess of the thread here]
> 
> On Tue, Sep 16, 2025 at 06:27:23PM +0800, guoyaxing@bosc.ac.cn wrote:
>>> PMU drivers are better placed under drivers/perf/
>>
>> I did a quick reading of SMMU pmu driver in drivers/perf/.  However, If
>> the RISC-V IOMMU PMU driver is placed under drivers/perf/ as the SMMU did,
>> it would cause an overlap in the iomem resource region between the two
>> devices(iommu & iommu pmu), because it needs to share interrupt-related
>> registers (such as the IPSR register) with the main IOMMU driver.
> 
> Is that not something you can resolve with IRQF_SHARED?
> 

Actually IOMMU perf is using stand-along interrupt, so might not need 
IRQF_SHARED with IOMMU driver.

What I mean is the IOMMU and IOMMU perf share the same registers, such 
as IPSR. This could result in overlap on this iomem regions between 
them, which is highly undesirable.

For now, two ideas come to my mind:
1. Integrate IOMMU perf functionality into IOMMU driver, just as 
previous version patch.

2. Let IOMMU driver export external api for IOMMU perf
(to obtain virtual address of IPSR register) for perf related operations.

So what's your suggestion?

> Will

Yaxing Guo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
