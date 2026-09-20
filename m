Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E1C982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+fCIvegdEw70x/BySxqpYd8C0U+KnMUIcWEH22f8ec=; b=UGD6bk88kCGuze
	14u64+Y/hJsXfHvGPKAXBKg7TAjz0dDrmC38RRMznsfc/X0R+fvgcOJ9TMArLkr4UwWlFmNbmagnM
	pSP1Mr+OeLHnZiijl9Ts7IOvmSi9gKTqDvXPFSAohMvj7YuYXbFvmZuDx7mzFet4N13zHr7q8tJUs
	7/8N38BJLiy9MX62DSTEhvjCB8gFuKWEbgLSAhVvo9V+3nJA8Xv+LXrg6wFSMJoqVta7kyrKJCoyr
	tZ8oJw5QrUB99jsGl507ZDQMiUzUfT02t6TLTsFO0Hzp7CT0HvNYVnNdT8fZOCSveUjtdbwSOb+ay
	+CuWvvk0uvKIBdjUAzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CTr-0000000H4jm-0SsW;
	Sun, 20 Sep 2026 08:00:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CTp-0000000H4jJ-1Cup
	for linux-riscv@bombadil.infradead.org;
	Sun, 20 Sep 2026 08:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=; b=RqPpf1Mbl8hpBVfac0fgX/4uqW
	SwUjMuzm1O+60N9yTLa6cum59+awjcmkknw16awzjhl85OSuvJwcTo0Ue7Ij1atmBTZT/XKVSxTpv
	36jiIsFvjhvPyURfr6C1u6mCOMKjXw5LQg8PPCJp6kX1haxrnjeKa1CAjav1aZm5nPmg79zpfqoHb
	upCz+aNbE55PmcNAzEp14Yiwo1aPtQnqapxVJBi6iHCAztsx7XCpTs92oUDNHsK444Eu79Ow2DKFC
	vEfDGrtQnhIFRLdnbFbq/w1QouiXW4nr66yFC17fo1QlEL7ZeLZfne4dAruJM+jx2ajfFRaW7ENJB
	4lnQt5FQ==;
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8CTm-0000000BGJN-192B
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 08:00:56 +0000
Received: by mail-pj2-x06.google.com with SMTP id d9443c01a7336-2d74bbdc61fso2160695ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789891251; x=1790496051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=UEe7jbfthxw2A+D6/MgwTFOk0tiTKD42Yr43bITfe/EgKyLe1p4WMvte6tMuG4FkFH
         XHMWRBojJzRPQb172aRuGl2WTA5J7WKjOXe7929R+IuC6Oys+8O6iL3AatTA1kd+g4E7
         /BUe8/CwCXzKZ2sjQYgusn60JDnMp0c0MdH82S7qypUDsTpt0iS9gNlu9++RpOUQqc5M
         i8mTqbVTXm4v/MqkSi0lCxHFAhvcx4yhJVCUjlg5/f30S00eVmmOWFMfhwLJkAg3cwwD
         1klFNkzXXlRON9n9M4sNZ6T6OXDzzvdd4UYun0wxdCNEsDhrffausGjA2XS3bL8g0AcO
         CKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891251; x=1790496051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=j0EaPqQ15LYJMrW2fkl6QGg5r3nSISnoHsBgqAoFuXTzP8Pu1ZQp5U+hStsEL/1Q8d
         Aif3vtthoafZCM/ZjqyyxcAfBn+5KiMipIAJkmgfKgkoME4DuUa8fH+L8ntbhJcXo3sr
         rFDgIrikDOWav7hX9kiI2x4ru+m5awcziY1e3XBy80DhxWv73+WkznBG2xb6DHUB4VAP
         wLpqGxyUFSTif+ZUVUxc4ISyKvqwRrmuh00+piOL0yF2tDslYHcURWb9SlgtRJdMxVFF
         XVd3VrXPkk4fLRJzyC3oiXvgVN3yrXaz7deikLSKFuiUOCrEwYeXXzauyK/bdejFn0+6
         kbBg==
X-Forwarded-Encrypted: i=1; AKwUvByJyEhIQvsJlMSPky8jhni1z0ZtUwM44v2SuI2ql6YeSrPD4Egr0z35zAf38ZTQSPALYIusxEMnfwL0Iw==@lists.infradead.org
X-Gm-Message-State: AFuF++lqXycPcl9ziKcFPVHFxVRvtmmh332qfskHZEm+HFeE4kmKJvic
	qEyQFmDdKrR6qVTm5adNce/Smh2faemxubb4jNfwAWNTzG/wpi9t+urS
X-Gm-Gg: AYBFou1hMBm0SFDvitX4CyHi9axJoh0KTPoGv+GQWLVAjkeWDkKY9RpiHojyoNiLwOx
	CdiWSEZvx3nYJ6X6MJfZ15RW/8dJ+bZ1uGyLBR/HIB/j97OBo8J29SfxTUrIOWg/YCOqkuYdEYi
	5m0KRpBit4Y9jB/J6QVwMoHZLaZGj3iCMUgy5QBvL/xQdAW6XfW/B7UPlLzvBrM2Z8oUDzSrFMP
	WhRayyjA+i3EPpTW7+rff7k0panihTcC3hB3wZbrjQ3a127JRz/wTeIVp2mS0Xhs5VYtKmYsz1X
	e7M0+5je9VhJr+g5JcBPloDbaocMBNvxz+KA6b0PDIKIM0nLx1yI+639hRXOSBeplngypA/t976
	HsobjpuxktEIyyngNjGQUlvC599WcZTMJJjBNrO3yc7reC7VlXHj3XGmJBc6UHbofAHALeCWE8S
	8ey/aAa1baL0G/SeM6MQNn3tuzTZ1iHnw+PFt2gx+8xeAKUm6S9sJnq6bxR3B1KOsqjRoUAFKdd
	Ebz8w==
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr2402815a91.29.1789891251509;
        Sun, 20 Sep 2026 01:00:51 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm7876986a91.11.2026.09.20.01.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 01:00:49 -0700 (PDT)
Message-ID: <32b00102-0961-49e3-b780-74d6db182809@gmail.com>
Date: Sun, 20 Sep 2026 16:00:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, m.szyprowski@samsung.com,
 mark.rutland@arm.com, kernel@xen0n.name, alex@ghiti.fr, hpa@zytor.com,
 ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
 <aq41nFRPtRWTQ7cK@kernel.org> <aq9UGXeqmCfuPHdD@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aq9UGXeqmCfuPHdD@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_090054_555922_96DC7FDC 
X-CRM114-Status: GOOD (  17.34  )
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



On 9/20/26 11:33, Baoquan He wrote:
> On 09/19/26 at 10:11am, Mike Rapoport wrote:
>> On Fri, Sep 18, 2026 at 04:08:10PM +0800, Baoquan He wrote:
>>> On 09/02/26 at 03:31pm, Wandun Chen wrote:
> ...snip... 
>>>> +/**
>>>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>>>> + * @base: the base phys addr of the region
>>>> + * @size: the size of the region
>>>> + *
>>>> + * Mark the region as not to be included in crash dumps.
>>>> + *
>>>> + * Return: 0 on success, -errno on failure.
>>>> + */
>>>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>>>       ~~~~~~~~~~~~~~^
>>> Is it impossible to use at runtime even thought it claims to be generic?
>>
>> This should only happen at boot.
>>
>> Allowing modifications of memblock properties in runtime is a can of worms
>> I don't want to open.
> 
> Thank you. This is why I said this can't be claimed as a generic way to
> mark memory region as no dump. The generic way I'd like to see is
> at any time of system we can mark any unwanted memory region as no dump.
> And it won't impact the behaviour of the current system.

Thanks Mike for the explanation and Baoquan for the suggestion.
I'll drop the "generic" related description in the next version.


Baoquan, by the way, patch 2 is still awaiting review. It rewrites
the riscv side of the code that patch 3 (which you've acked) then
folds into the weak defaults, if you could take a look at it too,
that would be very helpful.

Best regards,
Wandun


> 
>>  
>>>> +{
>>>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>>>> +				    MEMBLOCK_NODUMP);
>>>> +}
>>>> +
>>>>  static bool should_skip_region(struct memblock_type *type,
>>>>  			       struct memblock_region *m,
>>>>  			       int nid, int flags)
>>>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>>>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>>>  };
>>>>  
>>>>  static int memblock_debug_show(struct seq_file *m, void *private)
>>>> -- 
>>>> 2.43.0
>>>>
>>
>> -- 
>> Sincerely yours,
>> Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
