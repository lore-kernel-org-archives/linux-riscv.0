Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9051AC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 02:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHfikpXp/IG6oOxs6+icU2cXyot8tmaDuIO/vequfsg=; b=xuK6SWMp7UEnweZdyQ3Ml6OitE
	Mj/BFolOICbDd45IRKLQ6yqKCtbAUa7NsRlvg+MhxjVTQeoEB+O7YtZFTnYtouYtERCnDK7e/5PcB
	fxf2AiumVRv+Dyx6Jw+2SoXNr7JuagnYb0n+Di2uccyLQpyHSWDetSZsOgOvXUrbJd9VWfmeua0fu
	c8jZMCStoHpzCPZg3huNrbSxvRxWcSSHVp7PDzS1iyeHtAyYv1K84/TmyJ3fhQSYqft7k03FLDYB3
	QdBeBdj3zg4GjVs68UsBDwsYvlMCvSer8k1aRjol0JMGfnIjxdOq0dP6xUl6SK9hPwBnsGiIe9LK8
	f96IPsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2M88-0000000BCwK-1hK0;
	Thu, 02 May 2024 02:25:04 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2M85-0000000BCuX-2LKo
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 02:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714616701; x=1746152701;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jpSeGAw3fd3r1otijxAAN8h2zXrCijx9qZbvcF0BXXo=;
  b=GaVjSVDyZS26mmcJ+nv4ms1kN2K3mfhBwq53HB6kDcMfA13DNz5rAbmf
   XdI7axsMH0MNCkYY/ri2L/dqgQMy5z3Zq8mcBKNMlR3U75UNXzLyV7phA
   mnaSylIfgWFhvU7avEVDasdywbSMFWJv8hrpgEeJr0rRBr1IN2mAujk2z
   SUj/Aex08SQmOPZ6S4YxQlH958eWzfWwCWww7tU+joUwoy6/JU4iLO2il
   gLbgDslhDCgRIh2kkeVJ2QhSF1skNm/Jag2qgHijpWwuQ8si5nBo86maX
   QtkSh7wLYqhYTcIpm4srKrL0q6kh8chIH06T+lyOX1yLGh1g9u4AtFfnX
   w==;
X-CSE-ConnectionGUID: pdWMfxbUSXWW1NQkX5Ih+A==
X-CSE-MsgGUID: QtCiZBsGRjW72NdmjrDaBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10230000"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10230000"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 19:25:00 -0700
X-CSE-ConnectionGUID: bBj1T5ZZTtSmAr7cLpiTxQ==
X-CSE-MsgGUID: 4FL4oJo5TpWw3ZKRJrJjPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31650464"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2024 19:24:56 -0700
Message-ID: <3972c041-d5dd-4b02-9a0d-4541f7adc6d0@linux.intel.com>
Date: Thu, 2 May 2024 10:23:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <aa5592da66fe72acd4d4730f544882042e7b5293.1714494653.git.tjeznach@rivosinc.com>
 <6b4a4dc0-ac9e-43cd-bd84-447df2370dde@linux.intel.com>
 <20240501142037.GC1723318@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240501142037.GC1723318@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_192501_726731_4DCA9887 
X-CRM114-Status: GOOD (  23.18  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 5/1/24 10:20 PM, Jason Gunthorpe wrote:
> On Wed, May 01, 2024 at 06:26:20PM +0800, Baolu Lu wrote:
>> On 2024/5/1 4:01, Tomasz Jeznach wrote:
>>> +static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>>> +{
>>> +	u64 ddtp;
>>> +
>>> +	/*
>>> +	 * Make sure the IOMMU is switched off or in pass-through mode during regular
>>> +	 * boot flow and disable translation when we boot into a kexec kernel and the
>>> +	 * previous kernel left them enabled.
>>> +	 */
>>> +	ddtp = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
>>> +	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
>>> +		return -EBUSY;
>>> +
>>> +	if (FIELD_GET(RISCV_IOMMU_DDTP_MODE, ddtp) > RISCV_IOMMU_DDTP_MODE_BARE) {
>>> +		if (!is_kdump_kernel())
>> Is kdump supported for RISC-V architectures?  If so, the documentation
>> in Documentation/admin-guide/kdump/kdump.rst might need an update.
>>
>> There is a possibility of ongoing DMAs during the boot process of the
>> kdump capture kernel because there's a small chance of legacy DMA setups
>> targeting any memory location. Kdump typically allows these ongoing DMA
>> transfers to complete, assuming they were intended for valid memory
>> regions.
>>
>> The IOMMU subsystem implements a default domain deferred attachment
>> mechanism for this. In the kdump capture kernel, the whole device
>> context tables are copied from the original kernel and will be
>> overridden once the device driver calls the kernel DMA interface for the
>> first time. This assumes that all old DMA transfers are completed after
>> the driver's takeover.
>>
>> Will you consider this for RISC-V architecture as well?
> It seems we decided not to do that mess in ARM..
> 
> New architectures doing kdump should put the iommu in a full blocking
> state before handing over the next kernel, and this implies that
> devices drivers need to cleanly suspend their DMAs before going into
> the next kernel.

Glad to hear that. :-)

With the above consideration, the driver should consider it an error
case where the iommu is not in the blocking state, and it's in the kdump
kernel, right?

If so, probably the iommu driver should always return failure when the
iommu is not in the blocking state. However, the RISC-V's logic is:

  - if this is a kdump kernel, just disable iommu;
  - otherwise, failure case.

This logic seems problematic.

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
