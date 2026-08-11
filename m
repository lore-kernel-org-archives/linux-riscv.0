Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670FFC5B56A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlYE7lkeiUoBHntIYBzda2LpezB/Isuhr+Y4c9rUPos=; b=mnkUea5JS13Jpl
	k0dLz+R8u7UGSEnDv9eaDGtJfhZKtMNjnptmL9VHenHXTlDdE+PHEpeqlmbTIq8rnNch/64iUI8RH
	vDtnwLzBGZ+/mzpUHIK7w77OuDqTMP3El8UbPeCZrXl156cCwY1CqsR50fYFSwI7gs0JfuBQGqMtu
	alr2XPg0gKVIaHHJ+DILJIe8HmCjFCr2r29irPazAjO+8hhgdGrOaFGyqBMBvMp4F/1XfPB3ttwrG
	WdxGCW7Eqg/fhLCxW18EYP1DaE4nrGqKWFKs4dW8C9KPKmCGVFoP0srWUoL4kA4jd5iWOksGxptTs
	pVsXDXML5TS0BgYzKTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttv8-0000000EymA-10qF;
	Tue, 11 Aug 2026 21:22:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttv6-0000000Eyly-2MfA
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 21:22:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C1B060A7E;
	Tue, 11 Aug 2026 21:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB7E1F000E9;
	Tue, 11 Aug 2026 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786483318;
	bh=zIlAl7RJ8yMOdVKvygcDu2T8idi0tcM0JETLZGdlNSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bEJbRNHQnCMabxHAnFfiywgX2vqVBKBCg++fbDMzkOVMLpuF47eS3paHExQT8MMef
	 XBGYbGIglHf2k2pEcKBuXX6Mf/bTcnh9B7SHkDeQHTTOWi4WI5ugx0snplra0PtAgu
	 D+xwpxfbQjddS69xB+p6N+WoH4gx/l17B1gvyUc41qcT8YFGwFjsLMbFrpo0NytOpK
	 4wH2urQ+fSpSli7Y4GpCaHrpXYfrqZREHb55eRmV/Fkyi6x9ioJDbikUcqAeDR48Gs
	 juzWXdOw7xrZ/C65qEtkOCFA8QxoFJVyxj78n7txmR18DHeQ4t7ObhqbVOVed1cHs4
	 Htf1/tV+S7UQA==
Date: Tue, 11 Aug 2026 14:21:56 -0700
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net,
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 5/7] iommu/riscv: Expose global QoS IDs in sysfs
Message-ID: <anuSdFS4Enajdqff@x1>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Jul 14, 2026 at 09:06:55PM +0800, Zhanpeng Zhang wrote:
> The RISC-V IOMMU QoS extension provides iommu_qosid as a per-IOMMU
> global default tag. It is used for IOMMU-originated DDT, CQ, FQ, PQ, and
> MSI accesses, and for device-originated requests when DDTP is in BARE
> mode.
> 
> Initialize iommu_qosid to RCID 0 and MCID 0 when the hardware advertises
> QOSID support. Preserve reserved and WPRI bits with read-modify-write,
> and use register readback to reject values which the WARL fields do not
> retain.
> 
> Add a qosid attribute to the RISC-V IOMMU class device. Reading returns
> the current RCID and MCID values. Writing the documented
> 'rcid=<rcid> mcid=<mcid>' form updates both fields while preserving the
> other register bits.
> 
> Keep this interface separate from resctrl group QoS. The sysfs attribute
> controls the IOMMU-wide default, while resctrl device assignment programs
> per-device DC.ta in translated modes.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +++
>  MAINTAINERS                                   |  10 ++
>  drivers/iommu/riscv/iommu.c                   | 159 +++++++++++++++++-
>  drivers/iommu/riscv/iommu.h                   |   9 +-
>  4 files changed, 202 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
[..]
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 2c57625637bf..13ea67b7e42d 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -12,8 +12,12 @@
>  #define _RISCV_IOMMU_H_
>  
>  #include <linux/iommu.h>
> -#include <linux/types.h>
>  #include <linux/iopoll.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#ifdef CONFIG_RISCV_IOMMU_32BIT
> +#include <linux/spinlock.h>
> +#endif

RISCV_IOMMU_32BIT does not seem to exist upstream and these lines 
to just be deleted later in patch 6.


Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
