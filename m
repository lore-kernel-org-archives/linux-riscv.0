Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBE1C10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IERJwOOSy9LC8M+2ikoYKrzBYv+0JvuTHgKnfYmC1mU=; b=uSdJYVKHgakro0iIB8XM5yPemR
	9Zlwrn1DR9GPvnofvq1cMwZHtyXRReSGoFbH5YDekzwf0O6eZ4fTNT3VN6git0bI/jeb/fm7HL/09
	+4hm/gAs7tKSFUQnMTBpGtRqI1FlXy7t58HKGgN23e3TKjbteWdsmELx+N/42imaV07FNeUhMZ4dn
	xy4jZsHSGxWbyTMps33+nXipPE9BnvPLBGpwIHoTNwMKp8EogsikIoVloKSSHgDK0dSptVt642lAx
	YVS431NsHTZq0NuCQk9dmpxNrjfNYBTPHJfOHI/q6oDm0QhI1h+03eHeBdlVjZlFU9t53jOOdDs3y
	CUPRoKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26mM-000000092cT-04EW;
	Wed, 01 May 2024 10:01:34 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26mI-000000092bu-3jT7
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 10:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714557691; x=1746093691;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hd8WBmznF8s3GFca7bl23FfAapWO49hb4n7ZJcgVZX8=;
  b=EqXHmuUQewBr1CIw+wMtgq5odApLab3Rtct3jNk48aboMVia2gXZGfjK
   DTsOgI2f8IWNn9p3K5/UldswIBPcF2poCThsdSyXtnpyQBPt6/jNIsMGC
   +8toWs/jIU0Uyqif9hlpr0a/ck/Nez9tRqbfULQdtfLemqhslUC8CnkgB
   xMWTScktPzoRiFnvcpPhi56UU9zMGpRMdq4OlCS7Vy2WrYMUzhiKL3uEb
   wsbImQb/OR4L7FJAD3sC7hCzLvczz18oUNzeVLClKDONXxgx1BHf2xGbt
   bYCpWi+I3lvLRsoXDUzBMKX9VVtDOYb6Ts55WIKAbvBYASX717y4VnXSo
   A==;
X-CSE-ConnectionGUID: S9va6rYXR+62qBxErWH+ng==
X-CSE-MsgGUID: 9D2e9rOXSgSErWiPkKEJug==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10155824"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="10155824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 03:01:29 -0700
X-CSE-ConnectionGUID: udJhc1hNT0e0Cs8MdxtM1Q==
X-CSE-MsgGUID: Hg8wu7WfTWWT6SwKQNXnkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="27230625"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.225.176]) ([10.124.225.176])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 03:01:25 -0700
Message-ID: <57678928-4557-4975-ae23-7e11904e5302@linux.intel.com>
Date: Wed, 1 May 2024 18:01:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] iommu/riscv: Add RISC-V IOMMU PCIe device driver
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <3a04bd180fd510cb90e8d8dba5fb60f207e5e83f.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3a04bd180fd510cb90e8d8dba5fb60f207e5e83f.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_030131_139329_61E79466 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024/5/1 4:01, Tomasz Jeznach wrote:
> Introduce device driver for PCIe implementation
> of RISC-V IOMMU architected hardware.
> 
> IOMMU hardware and system support for MSI or MSI-X is
> required by this implementation.
> 
> Vendor and device identifiers used in this patch
> matches QEMU implementation of the RISC-V IOMMU PCIe
> device, from Rivos VID (0x1efd) range allocated by the PCI-SIG.
> 
> MAINTAINERS | added iommu-pci.c already covered by matching pattern.
> 
> Link:https://lore.kernel.org/qemu-devel/20240307160319.675044-1-dbarboza@ventanamicro.com/
> Co-developed-by: Nick Kossifidis<mick@ics.forth.gr>
> Signed-off-by: Nick Kossifidis<mick@ics.forth.gr>
> Signed-off-by: Tomasz Jeznach<tjeznach@rivosinc.com>
> ---
>   drivers/iommu/riscv/Kconfig     |   5 ++
>   drivers/iommu/riscv/Makefile    |   1 +
>   drivers/iommu/riscv/iommu-pci.c | 119 ++++++++++++++++++++++++++++++++
>   3 files changed, 125 insertions(+)
>   create mode 100644 drivers/iommu/riscv/iommu-pci.c

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
