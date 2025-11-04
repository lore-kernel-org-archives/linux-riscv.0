Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77400CCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 23:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvsJ1d+FVt4kKylJeIbzSPmyr/iAFfEmtC950PQGshY=; b=P1W8XHhWOc0m6L
	OusOn4+razxDyejOH5nyThGAYoFDIxgU9vys1tQT5ZrfL39ws0PP9BoGXQuVHOBwQymYSAlbcbqWF
	+DV8uHT3KCC9zzZ5oWDg1fohwYCoo5GNvZHCcVT/yzvwg1iqm4m8AvAXlLXDn95pbganOxeouE4Gm
	3S2tDZos3yUo97x/JuC/I8IHSkflZnFZKRpTC+kkt/21NgA8/VZZ+6YGUjcKe3w0kYIfIXrPaGy00
	xunuMfCZsNLsNzufVbXSnS7PJ5VhukpBX/rW2N4cmSwUxNkXJNFYdF/9OBv1hOwvkGXuNnkmXc6ak
	3qOo30E5J/vWQdHW5x4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQlu-0000000Clim-1Jmo;
	Tue, 04 Nov 2025 23:49:06 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQls-0000000CliN-0MMY;
	Tue, 04 Nov 2025 23:49:04 +0000
Message-ID: <0792f0d8-0ce5-4858-baa9-c76154c9fc9b@infradead.org>
Date: Tue, 4 Nov 2025 15:49:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/15] genpt: Add Documentation/ files
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
References: <2-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
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

Hi Jason,

On 11/4/25 10:30 AM, Jason Gunthorpe wrote:
> Add some general description and pull in the kdoc comments from the source
> file to index most of the useful functions.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Tested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/driver-api/generic_pt.rst | 142 ++++++++++++++++++++++++
>  Documentation/driver-api/index.rst      |   1 +
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/driver-api/generic_pt.rst
> 
> diff --git a/Documentation/driver-api/generic_pt.rst b/Documentation/driver-api/generic_pt.rst
> new file mode 100644
> index 00000000000000..210d1229aa1c1f
> --- /dev/null
> +++ b/Documentation/driver-api/generic_pt.rst
> @@ -0,0 +1,142 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================
> +Generic Radix Page Table
> +========================
> +
> +.. kernel-doc:: include/linux/generic_pt/common.h
> +	:doc: Generic Radix Page Table
> +
> +.. kernel-doc:: drivers/iommu/generic_pt/pt_defs.h
> +	:doc: Generic Page Table Language
> +
> +-----
> +Usage
> +-----

See Documentations/doc-guide/sphinx.rst for the usual order
of heading adornments. Section beginning:

* Please stick to this order of heading adornments:

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
