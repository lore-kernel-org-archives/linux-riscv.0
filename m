Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E48AC79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDwDo6/xbGKHBg9UPiU4CG4ZBwQadBXFI3XzRChU5TQ=; b=CeUDEDwXHBKZqX
	HbneZvtM4UC4Vj2W5gCPMSTBPfARKcmTwOg4WqMQfgBTUh8w/9iA+tyhshF9UHifMD89vmCHL6nAs
	3R2raX581E/LOQGmGUWkY0TJgMklwiF8lsYGa/2vawDCcu5lRJO6NVz/C/wHHCjO/KpZOxZjuiBJJ
	5zSVWCsJIo7+AHKX2051XV/r8uC/7RfZpd9oumi5LB8dhwuyDPel8FN8waR/JlYK721EYP7w4Dup+
	1DUvZQIHWcEFEAdR+cBmg/nSQWymldAj5+fUQJxx/XPiYO2UH4tx8V7Rp3rygLBDPoiIHgmMfuecQ
	zImjVLFce22aMTmYDTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YZT-00000006okf-3UCA;
	Mon, 07 Sep 2026 12:35:35 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YZO-00000006ohl-3Abv
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 12:35:34 +0000
Received: from 8bytes.org (p200300f6af085a0015db8e28914752a6.dip0.t-ipconnect.de [IPv6:2003:f6:af08:5a00:15db:8e28:9147:52a6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8E03620A085;
	Mon,  7 Sep 2026 14:35:25 +0200 (CEST)
Date: Mon, 7 Sep 2026 14:35:24 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: tomasz.jeznach@linux.dev, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	baolu.lu@linux.intel.com, jroedel@suse.de, zong.li@sifive.com, 
	andrew.jones@oss.qualcomm.com, anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, 
	guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] iommu/riscv: Fix command queue publishing races
Message-ID: <ap6veD4V8RGHL9zE@8bytes.org>
References: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_053530_941070_20C7A38C 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 01, 2026 at 09:39:17PM +0800, fangyu.yu@linux.alibaba.com wrote:
> Changes in v2:
>     - Avoid reacquiring the command queue lock after waiting for space
>       times out.
>     - Link to v1:
>       https://lore.kernel.org/linux-riscv/20260817142728.61783-1-fangyu.yu@linux.alibaba.com/
> 
> Fangyu Yu (3):
>   iommu/riscv: Add command queue lock
>   iommu/riscv: Serialize command queue publishing
>   iommu/riscv: Avoid waiting on failed command enqueue
> 
>  drivers/iommu/riscv/iommu.c | 117 +++++++++++++++++++++---------------
>  drivers/iommu/riscv/iommu.h |   2 +
>  2 files changed, 72 insertions(+), 47 deletions(-)

Queued for -rc, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
