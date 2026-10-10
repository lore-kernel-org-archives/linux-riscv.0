Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAECCCA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ic9GRx5i4H9Ma/4209p+dibwxBKl4YstTYnshuU6aAI=; b=yCRYKTGs1J2exz
	Y6d/3s0uDhxItPQrT3kCeV7dchm4cbQlAFhQ6nS5Izub+V8fCcjwQcaFfIjb0emqVIJ0aNOOJv0St
	7L7XY1eAzSX5UhP0P1+qZ6pEob3UfRZXK1+TODUQIHErHEUWnhaDEWFTmErmwBYu4y0YoiKw4lHw0
	5kC/ABhVl7TVt7/yYNY9cEhp/t8XP+y6G2phPQo03mbd2Q97kWT9HQRVHrdjnfEYtAQLBY0M/oeHw
	WIifopwvETaK1gHiROqV0dyipmq33LTAtHlzz5SFp9eG9+nof6T5B757qgZjGumHMJ9uS/IqoFT76
	jeKrG44wjk/zdFi9H+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZ53-00000008Dts-0u37;
	Sat, 10 Oct 2026 15:33:49 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZ50-00000008Dsz-07VB
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 15:33:47 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-398b9f722abso397182a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791646425; x=1792251225; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wozdN+r/GgwZxNj7OpCytBKWiEzKlAUU4sPZrHIAwLY=;
        b=hJSHJMQNz9AIATzIWww85pB3JVVks6yHDZ+REb9REof7XX7V6HtjhBASO9n33NeVlS
         ypfqVe+I0Q3jALYnfHUMe8ohDquSMEnd8OjAax1sd/S2a9xDvj7HORZrLVTCw1lV2vvX
         Gh2jmzYGP7ABtoOuA+HSAbhDiJCqU1EuuTmBxIqbdvjBUwgT+E43/ZxgWCKh9q0IzVrJ
         1kYkxpY0VUTzy7IIZNxs81yIqA9uTXzNV5n7bE6pOfsAMoDFXbxGS7IP1cjFy2g4E7WF
         32wEEiP3H2rvzrDCh3Mp2ChZ3Ob2t5ORvYM0N8aPIixIgGmLiiNH/gIkQYPKfFOwMGx+
         1ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646425; x=1792251225;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wozdN+r/GgwZxNj7OpCytBKWiEzKlAUU4sPZrHIAwLY=;
        b=hL1/ZkdjDYsxDGjj8sg58+N89MC6oY2kZoqvM6YzzZndr4g8Vm6n5P/j2Oa8tKOTBf
         znkW0GSqkfVH2uu1xoaR/kVx73sIzLG5djBVdyuB49BH/AY7a+k6OeKKiFZvQnFBN0wc
         fJQTW0nXso4BuTGPDUs+mEfenI4sBE6wv3mv2cPv0FBFsY+6vAQB73VC+2HCP5MSGwZn
         /yvmrO4iuvyJ1z6DB57Ljcu4aijpfmUI477ShVvjT73QBNOqzVMvIb1YJNjmNyzDvNd8
         IcdJT3r3FViGVt6B2KnzCybyhS2KB9SArVEfZJNjjdY7O92vjq2G4QTkO+taZt3xE+QQ
         FBmg==
X-Forwarded-Encrypted: i=1; AKwUvBzlGaGdI0nYD65Kn5Jmie2kqNsd9B5PSevifcwkr28pgeIfYKV0WxmRSmwg/E/eIu08GFfwxgxjuYgQgg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKXIeReYYQp8NZ2belz20UIdkE4JCmc3uBksIC2cRtuyfFMwQD+
	ntQm56iokVba+jFuOnVWiahh6kqJW1i5GjAJ9vnhaUYJcNuB/MK/YtBw
X-Gm-Gg: AYBFou1kiAB+/ByRrYYHQHgekS6Bz2NsNTwrRo9E6/ZiZcbZwnoLH9rE4LDKJhV+hAK
	1AY0mWhROu+eqVKlqRVY0HCW5tfRhed9FIWOXSYy5py5o1jXHZdZW6oOtMj0xVmV3cFBR/9qGuX
	fldSXIKJSpBKRpwsXNJEZFzFNMxXel2Cr43XOn+W/epFrnTt4Gjt3yUJnCpvVyRgXpPKmAK389Z
	IqNCU4+8IdqfLRgv/jd8D8R37YA6DXgSTbnBaiqoquatziGz2dtKXzeG0d5gM04eYZmTUU+eYk9
	gEF3bdtLpphE2ZJIAWwLDsgm/Sc8v3+8bWCYTjVhUwM7e99R0A+AUiO2QjgHeNBN24Aq2wTljaE
	MnBrZqeGEFvubKrX+EezBd7/+Lcovitl4kMU/k/xaVxySK038oWWvoMtXFaFGFOKXdNC2gxhPEH
	vusxFrnh1QY03xyFF8HsD29GtJ0tAL0InPF94tENCucuuUKTg/Qwuug6MK0vY4uP6rdf14yNlGM
	/C331ROuzSKZvoIiqo=
X-Received: by 2002:a17:90b:3b48:b0:3ab:22b5:3bdd with SMTP id 98e67ed59e1d1-3ab3ae77cecmr4773108a91.45.1791646424758;
        Sat, 10 Oct 2026 08:33:44 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.56.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab338676besm4966303a91.1.2026.10.10.08.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 08:33:44 -0700 (PDT)
Message-ID: <1f9158d3-fb05-4100-9e7b-9519a62d089d@gmail.com>
Date: Sat, 10 Oct 2026 23:33:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] iommu/riscv: Add guest IMSIC GPA mapping helpers
To: fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
 guoren@kernel.org, iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca,
 joro@8bytes.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 tomasz.jeznach@linux.dev, will@kernel.org, zong.li@sifive.com
References: <202610090853.6998rsRH081065@mse-db.zte.com.cn>
 <20261010111837.15424-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261010111837.15424-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_083346_142014_6E14414E 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Fangyu,

On 10/10/2026 7:18 PM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>>
>>> IOMMU implementations without the MSI_FLAT capability translate MSI
>>> writes through the second-stage page table, so IRQ forwarding on them
>>> will need guest IMSIC pages mapped into the second-stage domain.
>>>
>>> Add an xarray to the MSI table that tracks the HPA installed for each
>>> mapped guest IMSIC GPA, and two helpers for use with the MSI table lock
>>> held: riscv_iommu_msi_table_map_gpa() installs the initial 4 KiB
>>> mapping, and riscv_iommu_msi_table_replace_gpa_leaf() atomically swaps
>>> the leaf PTE's PFN when a vCPU's VS-file host page moves, rejecting
>>> leaves that do not map the expected old HPA.
>>>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> ---
>>>  drivers/iommu/riscv/iommu.c | 94 +++++++++++++++++++++++++++++++++++++
>>>  drivers/iommu/riscv/iommu.h | 12 +++++
>>>  2 files changed, 106 insertions(+)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index e2e77469ea3c..48fc57d6409c 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -24,6 +24,7 @@
>>>  #include <linux/moduleparam.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/pci.h>
>>> +#include <linux/pgtable.h>
>>>  #include <linux/generic_pt/iommu.h>
>>>
>>>  #include "../dma-iommu.h"
>>> @@ -1217,6 +1218,92 @@ void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
>>>  	riscv_iommu_iotlb_inval(domain, &gather);
>>>  }
>>>
>>> +int riscv_iommu_msi_table_map_gpa(struct riscv_iommu_msi_table *msi_table,
>>> +				  dma_addr_t gpa, phys_addr_t hpa)
>>> +{
>>> +	struct riscv_iommu_domain *domain =
>>> +		container_of(msi_table, struct riscv_iommu_domain, msi_table);
>>> +	const int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>>> +
>>> +	/* Guest IMSIC GPA mapping only exists in second-stage translations. */
>>> +	if (!domain->gscid)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	return iommu_map(&domain->domain, gpa, hpa, IMSIC_MMIO_PAGE_SZ, prot,
>>> +			 GFP_ATOMIC);
>>> +}
>>> +
>>> +int riscv_iommu_msi_table_replace_gpa_leaf(struct riscv_iommu_msi_table *msi_table,
>>> +					   dma_addr_t gpa, phys_addr_t old_hpa,
>>> +					   phys_addr_t new_hpa)
>>
>>
>>This might fit better inside generic_pt rather than in the driver,
>>since it walks the page tables on its own and duplicates things
>>the library already owns, like the per-level index widths, the
>>x4 root size, and the PTE layout.
>>
>>I recently tried something very similar, and doing this inside
>>generic_pt turned out to be quite feasible (only a quick experiment,
>>not cleaned up for posting).
>>
> 
> Hi Shuai,
> 
> Thanks for the review. I agree the driver shouldn't carry format
> knowledge that belongs to the library, but I think this particular
> operation doesn't fit generic_pt.
> 
> This is not a generic page-table operation. It is a special
> requirement of RISC-V IOMMU IRQ forwarding (irqbypass) on
> implementations without an MSI page table: the guest IMSIC GPA
> must be mapped into the second-stage domain, and when a vCPU's
> VS-file host page migrates, its leaf must be replaced atomically.

To be clear, I also meant updating the leaf in place,
not unmap + map.

> Because a device may write an MSI at any moment, unmap + map
> would fault. This operation is driven by the IRQ forwarding
> state machine, and because I don't see another generic_pt format
> sharing this flow, I think these helpers would be better placed
> outside generic_pt. I plan to move them into iommu-ir.c so the
> feature-scoped code stays together.

I'm fine with keeping it out of generic_pt. Respect your design.

Thanks,
Shuai

> 
> Thanks,
> Fangyu
> 
>>Thanks,
>>Shuai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
