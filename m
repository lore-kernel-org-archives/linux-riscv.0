Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460BAC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPhESWE2yEeDbX7f3a/7uDEhKOgO9wXATgKAXYr6Lhk=; b=eMoAeqccbA0VNJUH2bgw0H1D3v
	1BloTZWLaoNjOwWlgksDHBV8bR4Bphi6Cxh17jDs/kas3p+Vyqmds/1bC3FJQlXTTyoILFn0l4/uq
	mpUz/tjzLMLUMmhWbDYfQjpJM2Mv5oFJrUTGZbs42MNfBgf6Fmuc/FLvhab1ZKF2dNM/dRumH20YY
	DxPe4PI2Lgu3wZyuWq89ABkIt5hN9LfaxMsRheRB1K6PQaB3/pCRhNicW/ghxUwW1mJGOaYbmPD17
	mPN1jcKzhbeL8EUZMEfWd4lNnXoY0qHrGicwqY29ETGcQbjBqJq1LbpAlNousWs11nrBjdVQzABQN
	rQnmYCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s27AW-000000095gd-3gqk;
	Wed, 01 May 2024 10:26:32 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s27AT-000000095gB-3nCD
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 10:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714559190; x=1746095190;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hRqr/qAUxYcdjP0X9isvAXR0Vq1bW+ytdwQxX41DL7c=;
  b=Q6dzy4gKIL06LUobXH/O1k+L3UAmVLscHbHH2s7HebnH4dAy+BUQMluF
   JwW1HMSHIn4MyIiPBCtHVZM1Dr1tB87G3540GDdE+Qoc1w8FtXcPEGO3r
   Q2FhA5ZVMJCfxGoVMj6LZEp6Zu2xN8+hNs1VJ/tjK0qBuzQvbk6HBwY6I
   +ukV/AQJKkrnJwSg/huYtKyGUmWlH404tzQeIYSazdWpwQ2nR+a0nbG/H
   iRvZH0LlgOZ1jjk1bCrBnelRu854rqrINPwnGLvV0KDi8f2Hbeu6yY5rq
   +xskrnC+SXi4YEwd+i1jck9TR5qmElRAMNrrm3j0/vOkbC8chxj7L1wbg
   A==;
X-CSE-ConnectionGUID: ja39K77pQHSJm6A0aQ4LXA==
X-CSE-MsgGUID: 3c2qgnseSSuCgRerGwNleQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="35674155"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="35674155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 03:26:28 -0700
X-CSE-ConnectionGUID: mM4xqKTwTRanVLvaULU3dg==
X-CSE-MsgGUID: 2a2bdGMyS6Sr14FLZPSgCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="64237676"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.225.176]) ([10.124.225.176])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 03:26:23 -0700
Message-ID: <6b4a4dc0-ac9e-43cd-bd84-447df2370dde@linux.intel.com>
Date: Wed, 1 May 2024 18:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <aa5592da66fe72acd4d4730f544882042e7b5293.1714494653.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aa5592da66fe72acd4d4730f544882042e7b5293.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_032630_122730_B2DBC641 
X-CRM114-Status: GOOD (  18.16  )
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
> +static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
> +{
> +	u64 ddtp;
> +
> +	/*
> +	 * Make sure the IOMMU is switched off or in pass-through mode during regular
> +	 * boot flow and disable translation when we boot into a kexec kernel and the
> +	 * previous kernel left them enabled.
> +	 */
> +	ddtp = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
> +	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
> +		return -EBUSY;
> +
> +	if (FIELD_GET(RISCV_IOMMU_DDTP_MODE, ddtp) > RISCV_IOMMU_DDTP_MODE_BARE) {
> +		if (!is_kdump_kernel())

Is kdump supported for RISC-V architectures?  If so, the documentation
in Documentation/admin-guide/kdump/kdump.rst might need an update.

There is a possibility of ongoing DMAs during the boot process of the
kdump capture kernel because there's a small chance of legacy DMA setups
targeting any memory location. Kdump typically allows these ongoing DMA
transfers to complete, assuming they were intended for valid memory
regions.

The IOMMU subsystem implements a default domain deferred attachment
mechanism for this. In the kdump capture kernel, the whole device
context tables are copied from the original kernel and will be
overridden once the device driver calls the kernel DMA interface for the
first time. This assumes that all old DMA transfers are completed after
the driver's takeover.

Will you consider this for RISC-V architecture as well?

> +			return -EBUSY;
> +		riscv_iommu_disable(iommu);
> +	}
> +
> +	/* Configure accesses to in-memory data structures for CPU-native byte order. */
> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) != !!(iommu->fctl & RISCV_IOMMU_FCTL_BE)) {
> +		if (!(iommu->caps & RISCV_IOMMU_CAP_END))
> +			return -EINVAL;
> +		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL,
> +				   iommu->fctl ^ RISCV_IOMMU_FCTL_BE);
> +		iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
> +		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) != !!(iommu->fctl & RISCV_IOMMU_FCTL_BE))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
