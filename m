Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AC9C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rx75gbML3BcENdPz9+856dupXlvZM1edkWLekc8Qmkk=; b=d/RD/ulFk/nEl1
	V7b45q6A8afdfM2+IU25iTJBnvWtng0azKFaQu2FH7E46WntlhNqiACU57jkWegPA5FtfUDx2fvTO
	vUSD4EJHSM4bujCjNzM0z4oGHFAMRFrrzObPHVuYzjno+c5Tkg1H8+mNKAIIxEjSf2RY+CGsGADvO
	FaIHI8qSOdUgjlba6P5dpwhCDCtVwayrMnfdbZWkfgAWMRyFE7kD+B7N0JiuDitA3mFwpcqnRC5B6
	CVuK+t1/NwFV+HxIC1aTZQcIVpeGFOhnAqlH+zZXSgSe8JFIv/4w42WX7GjfJZHYurj1EQqKZe04n
	D9ymhVyrbYydJgqHQjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskXs-00000009XiV-44Pt;
	Sat, 08 Aug 2026 17:09:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskXr-00000009XiN-2Rh1
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 17:09:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B94D6001A;
	Sat,  8 Aug 2026 17:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A461F000E9;
	Sat,  8 Aug 2026 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786208954;
	bh=3t2FU5QAhOESQfdCB5hI+9szIiZ8abQ+zdqjjWFA9FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPB8Woob7raC0tlwHTe2yEiGhF1JQCEbzsn7BjsYhQ/28Pnh9rAmfXM3c58q7AZzU
	 CiUTsdZa/IsA6BZGIXs3P0JMQ6w1OymlmbmU2pvzu5+0RdrwJxlNacCUG8o2HvNbwQ
	 FxKxMt78u6UVXKYrEzVtPSOMoXeJpHAwkaHeVghjWnd6r6W9AQcxYwLFsNvtOrhQu7
	 ut0uEP7nJk+osZdxed9zvq0z05XtUCxcjsuc7pdeVjt+MRiZqBM/WJ9jBwooFivfW7
	 swyQy2gbeQNjiFz3ENfbPkA3cd0+431CyOR+wXcUXLecvUCXgFZKEKNIfnhdFM0IqJ
	 L4mtvthCHrL3Q==
Date: Sat, 8 Aug 2026 10:09:13 -0700
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
Message-ID: <andiub47zsUsL4qh@x1>
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
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
> new file mode 100644
> index 000000000000..b0cd68997f17
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
> @@ -0,0 +1,27 @@
> +What:		/sys/class/iommu/<iommu>/qosid
> +Date:		June 2026
> +KernelVersion:	6.18
> +Contact:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> +Description:
> +		The RISC-V IOMMU global default QoS IDs for this IOMMU.
> +		The file is present only when the IOMMU reports the QOSID
> +		capability.
> +
> +		Reading the file returns the RCID and MCID fields from the
> +		iommu_qosid register:
> +
> +		  rcid=<rcid> mcid=<mcid>
> +
> +		Writing the file updates the RCID and MCID fields while
> +		preserving reserved/WPRI bits:
> +
> +		  rcid=<rcid> mcid=<mcid>

I think it might fit sysfs better if the rcid and mcid are separate
files in that directory. Is there a reason you combine them into one
file?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
