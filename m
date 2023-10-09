Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EC9CD610A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqT/dweeEmsVzX3E2KrnTMQkhuiRDldDMmYG3sDL++I=; b=KzN+UoAdKF1tyf
	HPR+69Ccj4HNJF8UD18MLyuL+BHleHXod47V1s7QZlbG5qAHYRMsiHbHTYFCaeOyrzduKYkH4pfw9
	3S+4BH5JsGSMUjX9cWcNmTIyn9Bxkt6GKIl4s8Cj60z/QqThIYLT0UrP3ZLKRSM1nuw1vrQz24M/k
	b/4AxprS7CwAlZKYWC9vDxdAM8Wiax03kQXSqFJs9jc7gqCRdCxv0WGSEFa6RRuSDcwudB+9X/lgS
	A/faG/GHpFsf8DdtISfL/LQ7LYurybW0q8UsLpojnkp/ss1oX/ees+XwVCkM7P7t+v1hqnFb2KiIJ
	MLuEGDGcMCtObJi2J8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qptOV-00BDXw-2k;
	Mon, 09 Oct 2023 16:46:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qptOS-00BDX4-29
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 16:46:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A27161FB;
	Mon,  9 Oct 2023 09:46:46 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29A853F762;
	Mon,  9 Oct 2023 09:46:04 -0700 (PDT)
Message-ID: <74e81490-1765-4f13-9fee-04b58696bbde@arm.com>
Date: Mon, 9 Oct 2023 17:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
To: Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
 Jim Quinlan <james.quinlan@broadcom.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 arm-soc <soc@kernel.org>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de>
 <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
 <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
 <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
 <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
 <20231009124805.GA7042@lst.de>
Content-Language: en-GB
In-Reply-To: <20231009124805.GA7042@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_094608_750907_A109ED52 
X-CRM114-Status: GOOD (  10.41  )
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

On 09/10/2023 1:48 pm, Christoph Hellwig wrote:
> On Mon, Oct 09, 2023 at 01:10:26PM +0200, Geert Uytterhoeven wrote:
>> RISCV_DMA_NONCOHERENT does not select DMA_GLOBAL_POOL,
>> ARCH_R9A07G043 selects DMA_GLOBAL_POOL.
>> RISCV_DMA_NONCOHERENT does select DMA_DIRECT_REMAP if MMU.

Bleh, guess I should have known better than to trust my Monday morning 
memory without double-checking the code :)

> Yeah, and we'll basically need to split RISCV_DMA_NONCOHERENT into
> an option for each type of non-coherent support.  This is why we
> should never have added support for any of the non-standard versions,
> as it's turning into a giant mess.

Indeed the main point I was trying to get at is for ARCH_R9A07G043 (or 
rather possibly ERRATA_ANDES_CMO) to not select RISCV_DMA_NONCOHERENT in 
its current form, since that ending up selecting DMA_DIRECT_REMAP on a 
platform which can't support it is the thing that's most obviously wrong.

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
