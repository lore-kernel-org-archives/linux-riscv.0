Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12522CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 05:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZNqY6Z5EBT0NgswrXAZmOlEJb5CHG3qZPYIkflMGKU=; b=451SUIwZKT2qUl
	2xnQw4l+ng7eYU78jemhFE6VqI3ulRpgWvaN3M2SSLrDllC20Ia9K6kUebZb6Axd6jUsciNR8JOKM
	nfcHVxDzjUS49bys1TiKiWl14058SNNCKjigySWNVoN5NGZ6kFOR88L1sQtWUHDwrLGvzCddGc7ZM
	h6FNtklIIk/vY2ZJapxTSltkIHyyE7R1FkdAsFiIxsX/ClprDLfmqhxAd6q2Fq4+vdK6fq+Gx9HSU
	X756ZsxUYq3NmVxIcQwIXWt4hzyy/IoFh2uMB4Jsu5nH+HvwY3Mx7qnUfGhOxKpvn0mWcCpqe9Ocz
	apNhGDzaK3wq1CaJwPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlB8-00000007PdX-33jU;
	Fri, 15 May 2026 05:33:42 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlB5-00000007Pcl-1CNz
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 05:33:41 +0000
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 141E31C4468;
	Fri, 15 May 2026 07:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778823218;
	bh=IdE+5QckUKJsOY0SqFgq0B6ndKFhdOzLoIpIy9ewB1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXfvDGUCpdzhSStQ+5FNvvKVKIb5bfI/tra6RxWRl0Fr2cYISLt/6jKIL/8zFFMUw
	 vWsx/uVSMjivtppJdFHNbmf+jv4wMl9AhP9Qx7u1fu63p/02JLQPWoQqnZSwbLsO1E
	 cq+s6oAEbTMsFV3FwtxlK7Ql6h72snP3f6N0WpBbnRAnIXZBke5ErYsyAkVNjy9Chk
	 doFiCUTBPkwDzwfXcwwrkSfvBt1w/faR29lPievpO6aqHngZX3zZu1nZArv9LmwKoo
	 x6BReTY5Lde7ZIuxqYXMOqAwIp9qSU4+y9gzQ71IMATyL/PSBipmyuCrT18rqYd2qd
	 olhFsvpT6ZoNg==
Date: Fri, 15 May 2026 07:33:37 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jgg@ziepe.ca, 
	kevin.tian@intel.com, jgg@nvidia.com, nutty.liu@hotmail.com, guoren@kernel.org, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] iommupt: Fixup build warning by using BIT_ULL() for
 RISCVPT_NC/IO
Message-ID: <yol3yy64tafo77wp25mrvsehceovq5radmt6wdoc4jz5alsoqj@awpnkmdnzxox>
References: <20260512144330.91113-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512144330.91113-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_223339_646307_4765656B 
X-CRM114-Status: UNSURE (   8.61  )
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

On Tue, May 12, 2026 at 10:43:30PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Fix build warning on 32-bit configurations by using BIT_ULL() for
> RISCVPT_NC and RISCVPT_IO.
> 
> Fixes: 6c21eb174c6c ("iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605121350.wZxB51k0-lkp@intel.com/
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
