Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B699C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 03:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNVlvQdrXrYN1Ii1FDMvSZP0ngIMFhqZnTy5xJWftkE=; b=Ouy3OV/2mVtGsA
	w07RHZ+EGMf45UZqLwXbuyluv2yXhGHpKTIXolI0P9qCnpbL/HI/Sdigd/COb9A4n0C6ye5QnPcQq
	2iewP04+5Nk1O2gFA/9/vKA124bz7EH2yT3RB47d4bFon7hoFoO+nDrfU8I9qnqNTTELt7LfhuJwM
	Ab2kCUsYxjMvg7iw8FiwHIzyXRTZOYlkafvWIvq2Dikwr8fvAnlKxU/4pMCnG2uxsW6kyBjhNfK7a
	s3wIUx3DG6iBJ/XDSbnl3WDhkJgY4EhaL8yxDeb9dgbi2XSCTKYxs+NfuEzlBsGp2HmWykLhzjJkS
	Wbun+bEt0R9/s8u/Uftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOV63-008z4w-28;
	Wed, 26 Jul 2023 03:21:55 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOV60-008z3O-2e
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 03:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690341712; x=1721877712;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=41wbTtODPkpjnhNbDqWe3jLLGDqh9EzgVAF8fhApyhM=;
  b=ih+GrQqmevXi2S0rhGl81jvNcilswR4YQhmpP8w0PTbGQ5ghllsEpHdv
   hy7yvG5kB12fZvSw+qMacbzNg1znNRWI8V3Jabr5NJlev7PbExqw/dCR6
   mNDEu2fUnycf3fjdocHfqzLJJMZzjoui3yWd5jvRpmwoPZWTArnY+uyBW
   KQS2hunqgy4WpaZjXq7TTO3pKgAtl5ce39CFkKiuZQy4XMLGTcQFAftC9
   LHUf8rDsIGDa3q7xtCGFsMLRDro4XAvNUiFmjxm2IZdKa0OQJDq23xFp2
   s+ogSdUMxnZOzKgf4x/EmwO9Gp8QHpxt5PV1yNXGjJR17TsznrYI13IQO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371513243"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371513243"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726345744"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="726345744"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.208.129]) ([10.254.208.129])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:21:36 -0700
Message-ID: <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
Date: Wed, 26 Jul 2023 11:21:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: baolu.lu@linux.intel.com, Tomasz Jeznach <tjeznach@rivosinc.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux@rivosinc.com, linux-kernel@vger.kernel.org,
 Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
To: Zong Li <zong.li@sifive.com>, Anup Patel <apatel@ventanamicro.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0r=2eqpy9wLjVt1U0J7=LpnJLcKV7N9d90jvCss=7+Fzg@mail.gmail.com>
 <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_202152_979790_A7DE558D 
X-CRM114-Status: GOOD (  22.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023/7/24 21:23, Zong Li wrote:
>>>>> In RISC-V IOMMU, certain devices can be set to bypass mode when the
>>>>> IOMMU is in translation mode. To identify the devices that require
>>>>> bypass mode by default, does it be sensible to add a property to
>>>>> indicate this behavior?
>>>> Bypass mode for a device is a property of that device (similar to dma-coherent)
>>>> and not of the IOMMU. Other architectures (ARM and x86) never added such
>>>> a device property for bypass mode so I guess it is NOT ADVISABLE to do it.
>>>>
>>>> If this is REALLY required then we can do something similar to the QCOM
>>>> SMMU driver where they have a whitelist of devices which are allowed to
>>>> be in bypass mode (i.e. IOMMU_DOMAIN_IDENTITY) based their device
>>>> compatible string and any device outside this whitelist is blocked by default.
>>>>
>>> I have considered that adding the property of bypass mode to that
>>> device would be more appropriate. However, if we want to define this
>>> property for the device, it might need to go through the generic IOMMU
>>> dt-bindings, but I'm not sure if other IOMMU devices need this. I am
>>> bringing up this topic here because I would like to explore if there
>>> are any solutions on the IOMMU side, such as a property that indicates
>>> the phandle of devices wishing to set bypass mode, somewhat similar to
>>> the whitelist you mentioned earlier. Do you think we should address
>>> this? After all, this is a case of RISC-V IOMMU supported.
>> Bypass mode is a common feature across IOMMUs. Other IOMMUs don't
>> have a special property for bypass mode at device-level or at IOMMU level,
>> which clearly indicates that defining a RISC-V specific property is not the
>> right way to go.
>>
>> The real question is how do we set IOMMU_DOMAIN_IDENTITY (i.e.
>> bypass/identity domain) as the default domain for certain devices ?
>>
>> One possible option is to implement def_domain_type() IOMMU operation
>> for RISC-V IOMMU which will return IOMMU_DOMAIN_IDENTITY for
>> certain devices based on compatible string matching (i.e. whitelist of
>> devices). As an example, refer qcom_smmu_def_domain_type()
>> of drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>
> That is indeed one way to approach it, and we can modify the
> compatible string when we want to change the mode. However, it would
> be preferable to explore a more flexible approach to achieve this
> goal. By doing so, we can avoid hard coding anything in the driver or
> having to rebuild the kernel  whenever we want to change the mode for
> certain devices. While I have considered extending a cell in the
> 'iommus' property to indicate a device's desire to set bypass mode, it
> doesn't comply with the iommu documentation and could lead to
> ambiguous definitions.

Hard coding the matching strings in the iommu driver is definitely not a
preferable way. A feasible solution from current code's point of view is
that platform opt-in the device's special requirements through DT or
ACPI. And in the def_domain_type callback, let the iommu core know that,
hence it can allocate a right type of domain for the device.

Thoughts?

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
