Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EACCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdVD7ciVGjT6DtxYxvHoVlPPhEGEGHmIM1AwCz5R/ls=; b=boHMMnrPvxYHGV
	9+5O9CuhR4aUNNHJYycVifQWrTKn3h/X85vvHYxdIpK/JWMNEoVren3QjJuuC4qUQQD+DQhEq9Bs4
	i+Je/eop1jY8XA6gUR5MfuqqKLGip5HAVfOVvERWfFaPaiWUsMAm2xtQYBNwVCqVcnrdho3WHSN5A
	5SwVXB5OFvduCW23LBNDv2JcyzBV+HsxdGPGtLIZtDomUfJslpugG4T0134TdZfGG7kPl+SjbZtSu
	4d/epQxtVNLoPl0n9uxw1JVaUqAR08Thb3qncmalIIOJf5TTR0Vy5OlVBaHJ77WEJgZjfLC/3PDWq
	n1Dir1k75aiMigJbYEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGM8P-0000000CRWq-1CvT;
	Tue, 04 Nov 2025 18:52:01 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGM8L-0000000CRWY-1kO9;
	Tue, 04 Nov 2025 18:51:57 +0000
Message-ID: <7112b077-d19d-4b85-b2e0-8700dd2951e9@infradead.org>
Date: Tue, 4 Nov 2025 10:51:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/15] iommupt: Add the AMD IOMMU v1 page table format
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 Samiullah Khawaja <skhawaja@google.com>, Vasant Hegde <vasant.hegde@amd.com>
References: <4-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
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



On 11/4/25 10:30 AM, Jason Gunthorpe wrote:
> diff --git a/drivers/iommu/generic_pt/Kconfig b/drivers/iommu/generic_pt/Kconfig
> index a81dfdd72ca016..cbdad222923b26 100644
> --- a/drivers/iommu/generic_pt/Kconfig
> +++ b/drivers/iommu/generic_pt/Kconfig
> @@ -30,4 +30,16 @@ config IOMMU_PT
>  	  related to struct iommu_domain using GENERIC_PT. It provides a single
>  	  implementation of the page table operations that can be shared by
>  	  multiple drivers.
> +
> +if IOMMU_PT
> +config IOMMU_PT_AMDV1
> +	tristate "IOMMU page table for 64-bit AMD IOMMU v1"
> +	depends on !GENERIC_ATOMIC64 # for cmpxchg64
> +	help
> +	  iommu_domain implementation for the AMD v1 page table. AMDv1 is the
> +	  "host" page table. It supports granular page sizes of almost every
> +	  power of 2 and decodes an full 64-bit IOVA space.

	                         a full
or

	                         the full

> +
> +	  Selected automatically by an IOMMU driver that uses this format.
> +endif


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
