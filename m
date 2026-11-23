Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A60606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aWJW0N9w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/09oUYo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IsjbbL/fo6YSy2B58fIAeBBCkjSHxr8wektaSv3BzX8=; b=aWJW0N9whfsKmD8b3olmZImhLM
	aekvtb6ZEIvYdggn9PFEHWEmEG/y8FNCA6b211IjIBVD7RXncqvG4ZYZ7rHE/npNMCFH586Vzd9ss
	/pjfDHNg+I+PA4V5+pHz0zCRkdT+XnN6bTfgIvalonqlEtTHvPWDry1JExEorPLSzcuLkvfYNErQz
	A3B8AyTjMNAFW6HGH758hEixVzz1C7Bjkj+FVCn/c7SyFdZVKicT9pqrIl5DJ47z3JnGkDXacurJR
	wi+/HQioVTYIH9bWPE6l2VNo6j3r5AVXMRjOlREbQK16Lh7+gj36r8cTUYW11PFWXCY6YUUNCiQHa
	QDP2aMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOn7-00000002UGm-2JeM;
	Mon, 23 Nov 2026 07:48:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOn4-00000002UGN-3uLc
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 07:48:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 181AF61902;
	Mon, 23 Nov 2026 07:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3393A1F000C0;
	Mon, 23 Nov 2026 07:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420121;
	bh=wokkkNFzIsEepckDi99FN8dnTWAUR1CbtTzouCd22Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H/09oUYoKCSYwJaW3GkPBONE8TRwPwEk8ZbiKnv9b9YP27Y3LV5Q84YuhNBNtkNkH
	 x0yS+zWDWDfVwBvmGas7wYDYLry6drkRy1/QTYfS2XDJIAoU3fzJq7ZpEqHIYAltSt
	 Vy8j0HsJJ30DjVtr+Tvww2mWIQMRRIt0+7lgMENzmB0yIBEY8c6+XwSdlF+ZVqe78v
	 j7xYhMrH41G4+tv6YpjNzUrCE55V15wmLv9usx+oK3EnhbrWkKkZp9SR8F66yMOpnr
	 z2jP+17DrGid3+IM1hL7Cdx0qGFgCeDGtcghVmjk5Ra1ox4L4s5RVOeqyPKT6CrLeY
	 pLollFP25n7yg==
Date: Sun, 22 Nov 2026 23:48:40 -0800
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, jgg@ziepe.ca,
	james.morse@arm.com, ben.horgan@arm.com, xiaqinxin@huawei.com,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	babu.moger@amd.com, kevin.tian@intel.com, corbet@lwn.net,
	skhan@linuxfoundation.org, shuah@kernel.org,
	randy.dunlap@infradead.org, cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH v2 2/4] iommu/riscv: Register independently tagged
 devices with resctrl
Message-ID: <awPv2KwSZdE_Biuj@thelio>
References: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
 <20261116071338.35991-8-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116071338.35991-8-zhangzhanpeng.jasper@bytedance.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 03:13:41PM +0800, Zhanpeng Zhang wrote:
> Register independently tagged devices after default-domain setup and
> retain their IDs in driver-private state across domain changes. Program
> all firmware IDs under the context-update lock and report command
> completion failures to resctrl.
>
> The DC.ta field size does not describe the implemented QoS ID widths.
> Probe the low bits of the global write-any, read-legal fields with DDTP
> OFF and all queues disabled and idle. Preserve and verify restoration of
> the original register. If the widths cannot be obtained safely, do not
> register devices with resctrl. Reject IDs outside the probed range before
> changing any device context.
>
> Track exclusive device-context ownership without changing IOMMU core.
> Discovering an alias resets and unregisters any previous QoS owner before
> marking the context shared. Shared contexts are excluded from independent
> QoS assignment until IOMMU reprobe, without failing ordinary DMA probing.
> Serialize registration, alias discovery and release so an old owner
> cannot become independently assignable again after its context is shared.
>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
[..]
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index fbdca69c436e..dd2ebb25312d 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
[..]
> +static void riscv_iommu_probe_qosid_limits(struct riscv_iommu_device *iommu)
[..]
> +	iommu->qos_rcid_max = rcid;
> +	iommu->qos_mcid_max = mcid;
> +	iommu->qos_ids_valid = true;

The iommu spec requires rcid and mcid to be at least as wide as on any
hart, and resctrl only hands out IDs that the harts already use in
srmcfg. Maybe the limit probe could be dropped?

[..]
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 5676001548cc..72bb536190d1 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -15,6 +15,9 @@
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/iopoll.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/xarray.h>

spinlock.h is already included above.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
