Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C21BC38159
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j9pjuKcYyXzmpDom+T0Rm4rhqbJMzOHKF6bykRDrZM=; b=0WBx1iP7dnKYb8
	+RpBQ82gjZV7TXdD062eYTow7fEa4MdgAzr7jZpfmFT6uforXoy0srL4r9f9vbusKD8snGezc1WG+
	Isx7UDyHkdfBoCKCif4xGnG9TsQzlWDP5e+tUR9haVz+pJ7qtS+/SlBW9UPMJC9+UoY/wrM3WD2e7
	o52Qjfrv4uc4IvTlBoXd3/RMbPoSdUfMcv3TJbYKol6YBDDSbZIl31eCs5Tq3zpTmUhnhuadTPhn2
	7VSGgjWdbtUoTi7BOlDgl+Kuu+7TFM8/2OQZi3IpLuJVWxWlMMsaNbi00vbT9AJzchA94E4GDEUmI
	dVe0+lm7eaQcXSK40c7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9Bn-001Hfv-HO; Wed, 18 Jan 2023 14:13:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI9Bc-001HeL-HI; Wed, 18 Jan 2023 14:13:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8D811477;
	Wed, 18 Jan 2023 06:13:44 -0800 (PST)
Received: from [172.27.249.134] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D53273F67D;
	Wed, 18 Jan 2023 06:12:48 -0800 (PST)
Message-ID: <8ee7192d-f32d-5e33-e57e-1bbc2a0e37f6@arm.com>
Date: Wed, 18 Jan 2023 15:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/6] arch_topology: Build cacheinfo from primary CPU
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Len Brown <lenb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-acpi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Will Deacon <will@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Conor Dooley <conor.dooley@microchip.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-riscv@lists.infradead.org
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <167404285593.885445.6219705651301997538.b4-ty@arm.com>
 <20230118120731.jgsq4l7htwizlsp5@bogus>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20230118120731.jgsq4l7htwizlsp5@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_061308_717456_7D0A0355 
X-CRM114-Status: GOOD (  17.98  )
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


On 1/18/23 13:07, Sudeep Holla wrote:
> On Wed, Jan 18, 2023 at 11:55:59AM +0000, Sudeep Holla wrote:
>> On Wed, 4 Jan 2023 19:30:23 +0100, Pierre Gondois wrote:
>>> v2:
>>>   - Applied renaming/formatting comments from v1.
>>>   - Check CACHE_TYPE_VALID flag in pppt.c.
>>> v3:
>>>   - Applied Sudeep's suggestions (for patch 5/5):
>>>     - Renaming allocate_cache_info() -> fecth_cache_info()
>>>     - Updated error message
>>>     - Extract an inline allocate_cache_info() function
>>>   - Re-run checkpatch with --strict option
>>> v4:
>>>   - Remove RISC-V's implementation of init_cache_level() as not
>>>     necessary.
>>>   - Add patch: 'cacheinfo: Check 'cache-unified' property to count
>>>     cache leaves' to increase the number of leaves at a cache level
>>>     when no cache-size property is found.
>>>   - In cacheinfo: Use RISC-V's init_cache_level() [...],
>>>     make 'levels', 'leaves' and 'level' unsigned int to match
>>>     of_property_read_u32()'s parameters signedness.
>>>
>>> [...]
>>
>> Applied to sudeep.holla/linux (for-next/cacheinfo), thanks!
>>
> 
> I pushed the changes and then noticed some build warning report by
> kbuild posted only to you and one list(missing this list). Please post the
> fix if required on top of my for-next/cacheinfo so that it can be added
> on the top. Sorry for missing that.
> 

Hi Sudeep,
I think the reported issue can be ignored, the 'levels' and 'split_levels'
variables are initialized when used. If necessary, it is straightforward
to fix the warning.
Regards,
Pierre


The reported issue:
--- Start ---

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

    drivers/base/cacheinfo.c: In function 'fetch_cache_info':
>> drivers/base/cacheinfo.c:440:50: warning: 'levels' is used uninitialized [-Wuninitialized]
      440 |                 this_cpu_ci->num_leaves = levels + split_levels;
          |                                           ~~~~~~~^~~~~~~~~~~~~~
    drivers/base/cacheinfo.c:420:22: note: 'levels' was declared here
      420 |         unsigned int levels, split_levels;
          |                      ^~~~~~
>> drivers/base/cacheinfo.c:440:50: warning: 'split_levels' is used uninitialized [-Wuninitialized]
      440 |                 this_cpu_ci->num_leaves = levels + split_levels;
          |                                           ~~~~~~~^~~~~~~~~~~~~~
    drivers/base/cacheinfo.c:420:30: note: 'split_levels' was declared here
      420 |         unsigned int levels, split_levels;
          |                              ^~~~~~~~~~~~


vim +/levels +440 drivers/base/cacheinfo.c

    416	
    417	int fetch_cache_info(unsigned int cpu)
    418	{
    419		struct cpu_cacheinfo *this_cpu_ci;
    420		unsigned int levels, split_levels;
    421		int ret;
    422	
    423		if (acpi_disabled) {
    424			ret = init_of_cache_level(cpu);
    425			if (ret < 0)
    426				return ret;
    427		} else {
    428			ret = acpi_get_cache_info(cpu, &levels, &split_levels);
    429			if (ret < 0)
    430				return ret;
    431	
    432			this_cpu_ci = get_cpu_cacheinfo(cpu);
    433			this_cpu_ci->num_levels = levels;
    434			/*
    435			 * This assumes that:
    436			 * - there cannot be any split caches (data/instruction)
    437			 *   above a unified cache
    438			 * - data/instruction caches come by pair
    439			 */
  > 440			this_cpu_ci->num_leaves = levels + split_levels;
    441		}
    442		if (!cache_leaves(cpu))
    443			return -ENOENT;
    444	
    445		return allocate_cache_info(cpu);
    446	}
    447	

--- End ---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
