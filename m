Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF831C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9ls++QMWLPFZvvt5/HJn6QaafKqehS5O/IXYLs/RwQ=; b=QF7XrirfU1a6en
	5VZae1biS7c4Ze+zAjHI0i9n7jPUA+Oc6jfEXpg/wJ04faoX8oAFBs0M+U6Bo2BPFMZndbNF7i5MY
	c1WMbbcnFKfuEABRhnUtjPf4hBl5UNJl/3UaWDbfjctP02f7RFYUXCHvTuJ62RuFESu3iFvNRtV61
	8SRYjB5z2MV+3aOh+NWkiJT88X+kjTuXJkNoW358LIHbZcv1rJxRbup3ZHNcEYxEAQm7D9bFmoMFq
	Z+c/mMjlfPVjkQZ/Go7it3N3jVn5mTMzGMVeZx/vI3y64XOdP0oIOmDnsCmxMrivbAAbbwaNFpTAM
	WMfDglXSWQfEedIBQ00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vnz-00D4qL-G2; Wed, 21 Dec 2022 09:54:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vnE-00D4V6-C4; Wed, 21 Dec 2022 09:53:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E543A2F4;
	Wed, 21 Dec 2022 01:54:18 -0800 (PST)
Received: from [10.57.44.6] (unknown [10.57.44.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C57AE3F71E;
	Wed, 21 Dec 2022 01:53:33 -0800 (PST)
Message-ID: <43780b8b-d358-ba8f-a4af-06165dbbf18a@arm.com>
Date: Wed, 21 Dec 2022 10:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/5] cacheinfo: Use RISC-V's init_cache_level() as
 generic OF implementation
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, palmer@rivosinc.com,
 Ionela.Voinescu@arm.com, Conor Dooley <conor.dooley@microchip.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Gavin Shan <gshan@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org
References: <20221209103130.572196-1-pierre.gondois@arm.com>
 <20221209103130.572196-2-pierre.gondois@arm.com>
 <20221220233912.GA1193943-robh@kernel.org>
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20221220233912.GA1193943-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_015344_601245_A136F3CA 
X-CRM114-Status: GOOD (  20.84  )
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

Hello Rob,

On 12/21/22 00:39, Rob Herring wrote:
> On Fri, Dec 09, 2022 at 11:31:23AM +0100, Pierre Gondois wrote:
>> RISC-V's implementation of init_of_cache_level() is following
>> the Devicetree Specification v0.3 regarding caches, cf.:
>> - s3.7.3 'Internal (L1) Cache Properties'
>> - s3.8 'Multi-level and Shared Cache Nodes'
>>
>> Allow reusing the implementation by moving it.
>>
>> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>   arch/riscv/kernel/cacheinfo.c | 39 +------------------------------
>>   drivers/base/cacheinfo.c      | 44 +++++++++++++++++++++++++++++++++++
>>   include/linux/cacheinfo.h     |  1 +
>>   3 files changed, 46 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
>> index 90deabfe63ea..440a3df5944c 100644
>> --- a/arch/riscv/kernel/cacheinfo.c
>> +++ b/arch/riscv/kernel/cacheinfo.c
>> @@ -115,44 +115,7 @@ static void fill_cacheinfo(struct cacheinfo **this_leaf,
>>   
>>   int init_cache_level(unsigned int cpu)
>>   {
>> -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>> -	struct device_node *np = of_cpu_device_node_get(cpu);
>> -	struct device_node *prev = NULL;
>> -	int levels = 0, leaves = 0, level;
>> -
>> -	if (of_property_read_bool(np, "cache-size"))
>> -		++leaves;
>> -	if (of_property_read_bool(np, "i-cache-size"))
>> -		++leaves;
>> -	if (of_property_read_bool(np, "d-cache-size"))
>> -		++leaves;
>> -	if (leaves > 0)
>> -		levels = 1;
>> -
>> -	prev = np;
>> -	while ((np = of_find_next_cache_node(np))) {
>> -		of_node_put(prev);
>> -		prev = np;
>> -		if (!of_device_is_compatible(np, "cache"))
>> -			break;
>> -		if (of_property_read_u32(np, "cache-level", &level))
>> -			break;
>> -		if (level <= levels)
>> -			break;
>> -		if (of_property_read_bool(np, "cache-size"))
>> -			++leaves;
>> -		if (of_property_read_bool(np, "i-cache-size"))
>> -			++leaves;
>> -		if (of_property_read_bool(np, "d-cache-size"))
>> -			++leaves;
>> -		levels = level;
>> -	}
>> -
>> -	of_node_put(np);
>> -	this_cpu_ci->num_levels = levels;
>> -	this_cpu_ci->num_leaves = leaves;
>> -
>> -	return 0;
>> +	return init_of_cache_level(cpu);
> 
> Not in this patch, but in patch 5, shouldn't riscv init_cache_level() be
> removed? The topology code already called init_of_cache_level() and
> RiscV has nothing architectural to add/change. IOW, init_cache_level()
> should only do architecture defined init, and not anything DT or ACPI
> related (unless those are non-standard).
> 
> Rob

I think you are right. Just to re-phrase your point:
init_of_cache_level() is called through this path:
init_cpu_topology()
\-fetch_cache_info()
   \-init_of_cache_level()

If there is missing information in the DT and it's not possible to create the
cacheinfo, then the arch specific implementation i.e. init_cache_level() is
called through:
update_siblings_masks() | cacheinfo_cpu_online()
\-detect_cache_attributes()
   \-init_cache_level()

This is useful for arm to call init_cache_level() since it is possible
to extract some information from some registers. For RISC-V, if
init_of_cache_level() fails, then init_cache_level() will fail again.
So removing RISC-V's init_cache_level() makes sense.

Regards,
Pierre


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
