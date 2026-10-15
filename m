Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC25CCA462
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 23:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTUjgUZ5+tcD/mjhFov7B1SWvO8UlmcxStK4WzOLm0A=; b=SygrpmHnXy8dM7
	Z6Yn5vsRD9QoE4pNlVCTR9PUeJMiZ/Oo3aHitWLCtv7cJZIuwf/0RNqqdVJ3JgWsBBd0ASqYl5UAI
	YqszKt0EEc1QMLuguvan75IZWI/uZ0fOTzZlMh8u6mC27hjayBKtUTFd6Dk08c49c25VrodgTSVCg
	yznAYVdSCCSTRR6X7uTky7CBUHeANUtou+wKKNT18gnIHOrpa3ENlERlLYSITDBsum09RgetodpPj
	tvGoWmgyIUqsef1+Qv6hxjLNgm4F0PwudDfb85iXhPLawNnLLoRZnlEAQlyTyJCFUA9pEHONwLwiK
	6OLu5RoFdUzM2OTNfByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVIR-00000001aJw-3xJu;
	Thu, 15 Oct 2026 23:55:39 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVIP-00000001aIw-0ijs
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 23:55:38 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-533972e0cccso66149201cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 16:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108536; x=1792713336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9upklymhAO5QkQciFGrhvMFEHYA5CmaaRGixe6VBms=;
        b=GVedO2+kVvGVxz9rokzYgbowi+WZ7rv+JxXFw8cc8AXb8IwqsUjL7ISEEMqNfYIfNq
         WVU47ggnBZ44df+q4AstlVnd2et+S+guir+e1/e0GW+pOVtfXplF0cZ7QRhzdIrfAvkX
         9xa0wu0I/wm1Q2xsCF7GWdtHgcM2xmvr2sZ1FHDQ816+SHHPc9/v6RgK4w/p0eyxXGEk
         Hkvnasc/RAeGdLE1Ca8LBN+qOzofyEUb6d9hNyqUEZlB/CJqHQMD8HEhu/B4MGJ3jEDL
         w8R1BoCR3N7CysIEjj3niozFngTmTewlzrS7Xb3da1/zZVoUq8GDjbhxUACHwJFxno36
         mKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108536; x=1792713336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9upklymhAO5QkQciFGrhvMFEHYA5CmaaRGixe6VBms=;
        b=oxjlktg3gjsUezTDoCh/+F/SXAB3b8E/pyyLRZdYWQlLR1DCBnPuOBUkCv73xkz5vd
         rzM7Tri/gqx4oUEdmtJx1sJi8rOMJM9tSKkWimDOx+q+1oGz95pwAz2SfjIUxTrTCa2s
         2gfUqPM8pL3vM5BxvYeUFkwVHsSp2F3JNWzF7580ow9o6HfNXwfbpjgq3leQ1QTKStn8
         odnqyOabpCnk/stciPKUkyvhT4piw/rfyJNKNJISEbIRFd4e7CDBN3rRBG78POPjtZ7o
         KJntXtbsFm3qEdqg1jID2L2HnZMWpCPxC/NhKtUaOYXPe8fYkMKJmO8FsO3HkURV8ykk
         2P2w==
X-Forwarded-Encrypted: i=1; AKwUvBxAU3SH+TseoyuHr0cHvUrq8SQpyFcBWZbw4koXlVPVGJ7f2vYzaPS04JMdQ2b1PhS+pvTLnDsVLow5EA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJQBEvugLLeB2beuob7bd5Zyw5lQLTgd2kkMVrjVfsy3ZhqrE/4
	ln5l+3b07AdBU7sucMMyi1V+xDGaJsj2M0vSMHeKFZVHTnd2tKGoEssY1cmugIhEaeQ=
X-Gm-Gg: AYBFou3SbVlJIt8xysvG2v1uHUZhS4OQ4sCG50AhHESSLPGrFuOyGNTtl66GD4LvZeL
	3y71sq4JfpZBRBRvhPDb0k+tMguw5DGHqCr7BMzJapfBMsIO/69PTy8XtXME9FjquVlu80l7JoB
	VHxn4ETKi+/DuntdjqXFZltn7F6zthQ+3yhkaqTSe0QnjWhyinX/vVztz+S+MrBHyUHuBf34VVc
	9WrBr+64U7hTA0GD/wxmMQwfmjoZdstvZnBS9tJaDhdnF56P9jQGIQpQvKsUi8c/6f4ubEOeiHY
	rZsr3uUn8mPtdCBPPJ2fKEUXsAZPdVEEGdDqY4H7vmH6Cg8rJtjAQxlBAYr6RVBM6/fFLtkts8s
	V/GvxmqOb1pl0EKJolZ7ugPGwQiXHWjZoz3Folq7DvtyEWu80SJyhwKIlTvg5X7CqhfusGj07lb
	ZBevJ0png8pfrtbNlXJ/DVkrQt/vAnG47Deyl7bi/BBTjaw68bOf4vXvNPF4e40xQr50qKLoQJi
	3A6KOL1Ig8IIKqQZZjrkSt9/pRl/G4uhMOg2f0VSiRGPKCBXqYVz1by
X-Received: by 2002:a05:622a:251a:b0:532:f124:18dd with SMTP id d75a77b69052e-5359f49891emr329059071cf.11.1792108535894;
        Thu, 15 Oct 2026 16:55:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4db4csm8430526d6.16.2026.10.15.16.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:55:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVIM-00000000Gew-3ViJ;
	Thu, 15 Oct 2026 20:55:34 -0300
Date: Thu, 15 Oct 2026 20:55:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Zhao Qingye <zhao.qingye@sanechips.com.cn>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [RFC PATCH 07/12] iommufd: Add RISC-V IOMMU hardware info type
Message-ID: <20261015235534.GA14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
 <20261015065232.604503-8-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-8-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_165537_219874_16D8D206 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, Oct 15, 2026 at 02:52:27PM +0800, Gong Shuai wrote:
> From: Wu Fei <wu.fei9@sanechips.com.cn>
> 
> Add IOMMU_HW_INFO_TYPE_RISCV and struct iommu_hw_info_riscv, which
> reports the RISC-V IOMMU Capabilities register through
> IOMMU_GET_HW_INFO.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> ---
>  include/uapi/linux/iommufd.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 36e6187bb34b..acfef0338cd1 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -716,6 +716,14 @@ struct iommu_hw_info_amd {
>  	__aligned_u64 efr2;
>  };
>  
> +/**
> + * struct iommu_hw_info_riscv - RISC-V IOMMU device info
> + * @capabilities: Value of RISC-V IOMMU Capabilities register
> + */
> +struct iommu_hw_info_riscv {
> +	__u64 capabilities;
> +};
> +

Same here, spec reference.

Also be careful to always use __aligned_u64, check all the patches.

JAson

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
