Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9491C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcifyBwV+iGmeXxsnHRIcJlNGjDkFwjye1SQ9ka4HRM=; b=qEx0CBpgvhOBq2
	UTh5CTwk24NwBK4zg+w4ZIq8PvZP/fYooPiHKvVhaAYz9F9fPEAKUY+GEmT3HHokDqBusvO4VRI/R
	I/BBbM17ZGlzaJAbaDFxY7XKcF5CAdlsTPUBVgiaWCCKwluLWwqKIY+p4K3sFd/9piEQXdxZ/8h9u
	6n4zT6v5RV7Nf4ZpVKyxxWO8H7zFMJqUBy5MO+JKdbH45DQPgEIpIDkrHwujdgWYmffr5pjn6S46X
	w4ydxE4zrJkLJs7//ukb2AqiZoY+KZdwtwailID7YDNSbMpgzj6FTD+54f2mFfGdxuagn1sVEPDf1
	o+DX7THPHoLk55YawxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Bm7-00000006qfM-1q0I;
	Wed, 23 Sep 2026 01:27:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Bm6-00000006qfC-04Fb
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:27:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70C5040189;
	Wed, 23 Sep 2026 01:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C361F000FF;
	Wed, 23 Sep 2026 01:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790126873;
	bh=/08pGxKrLgqH3ERhly0BGeg2r9Qnfihq7jzAwh7thOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b7/yIza17KoIcJbVW0SsFsnrIaYGmaENCr/JDYQjp8vTfW1wZkKyvNUuDwSPHTsVN
	 J03clZlPkW+FFdJZL3rngToL60D8ryQsTIBkQRHLzLj4D7XGdzLLazs5MaGAP6pOw8
	 3Xa2LiY4xTekH9Hj/3CucNkLh0Lc4zl1fTaJnIKCFzcm17a4v56sfQ2+oH2+5/IfI+
	 zhyu1zRMbKsX6K/EAZP7SY8hrXzrcphiH08wUIffWzdhq4G3gtPMxgWhFNItxFhtj7
	 5MFZXax+40tDUFcoQMvzoiCdm4R0XcLUYGjUkIsHdgXZ2TmWqgtZb8hg6ds9WkV4/D
	 N2Ipq9+eLp1mQ==
Date: Tue, 22 Sep 2026 18:27:51 -0700
From: Drew Fustini <fustini@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, babu.moger@amd.com,
	baolin.wang@linux.alibaba.com, ben.horgan@arm.com, corbet@lwn.net,
	cuiyunhui@bytedance.com, Dave.Martin@arm.com, james.morse@arm.com,
	jgg@ziepe.ca, joro@8bytes.org, kevin.tian@intel.com,
	palmer@dabbelt.com, pjw@kernel.org, reinette.chatre@intel.com,
	robin.murphy@arm.com, shuah@kernel.org, tomasz.jeznach@linux.dev,
	wangzhou1@hisilicon.com, will@kernel.org, xiaqinxin@huawei.com,
	yuanzhu@bytedance.com, zengheng4@huawei.com,
	zhangzhanpeng.jasper@bytedance.com, x86@kernel.org,
	iommu@lists.linux.dev, linuxarm@huawei.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: Resctrl and I/O
Message-ID: <arMrF51oJAXJrikO@thelio>
References: <arKx__kOPe4B5gDW@agluck-desk3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arKx__kOPe4B5gDW@agluck-desk3>
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

On Tue, Sep 22, 2026 at 09:51:11AM -0700, Luck, Tony wrote:
> Patches for ARM[1] and RISC-V[2] are both at RFC status.
> 
> They appear to be based on similar h/w capabilities where architecture
> specific tags can be added to transactions from I/O devices by the IOMMU
> servicing the device. Device enumeration is handled outside of the resctrl
> file system.

Thanks for starting a discussion on this topic.

> RISC-V description of "architecture specific device tokens" sounds great.
> I'll have to find some ares of /sys to provide the mapping of tokens to
> "device groups". There's no association with IOMMUs, so this will be some
> other path in /sys. Perhaps under /sys/firmware/acpi since the data comes
> from ACPI IRDT table.

resctrl could parse iommu_group:<id> itself which should cover the IOMMU
case on ARM and RISC-V. Maybe other prefixes could be passed on to arch
code?

> Need an info file to tell users the format and source for device tokens.

I agree and it could list which token namespaces the platform uses.

> I'd like to avoid limiting resctrl monitoring of CPU activity due to the small
> number of I/O RMIDs. Perhaps don't include a "devices" file or mon_data/{i/o
> events} files in resctrl group directories when rdtgroup::mon::rmid >=
> num_io_rmids? But that feels clumsy.

There's no separate I/O ID space on RISC-V that could be smaller. The
IDs a device carries are the same IDs the hart (e.g. cpu) carries. The
number of RCIDs (e.g. CLOSID) and MCIDs (e.g. RMID) is a property of
each capacity or bandwidth (CBQRI) controller. The RISC-V IOMMU spec
also requires the IOMMU to support RCID and MCID at least as wide as any
hart.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
