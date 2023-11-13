Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD11C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 03:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDAcMIDmtNKtXPjn2335F86wgVQxZFS77i5eNpSz69Y=; b=gQhJ4kvSmcOn7+
	WjIqzlvNBcnHeIf6YzD8JyIRRP5Y6tZ7c8vXQAwuvQQY6B1QMbwQh3yG/GAMNUoMp9igjfaJijEpz
	8Z5M2Lmqr5SMsW+8A5QX2AW6o1ddSexmvoTE4tys4+2x1Wi1IjDmyKxpNRTqETZcSq3fNIq5baTQw
	DW8DHli5W+V62pLV66ZBNoW0zVukOzWWMMDGsNbAmvFrpldivYXDK/AjRJrqTUzxX6D93Ay/KUV1P
	qNr0JvHkmxK8oGCJSgZNkjsPBuBYvtZw2Kwu04EnWFfOsjPHTE2zh+Ar096VRTnzIQ7sO0vsSlx1w
	S2M5G+nvdpLymFvZFqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2NlV-00D8oX-0N;
	Mon, 13 Nov 2023 03:37:33 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2NlR-00D8mu-0p;
	Mon, 13 Nov 2023 03:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699846649; x=1731382649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y+d5ffj+cXty8WEYU0vUgR9r7fyajtAWyyGi3xYe0Go=;
  b=OvC2Q5UYyVbg/SjcbJazgPKEcGKhOLPvaEOop6OMGXY8j0+BWLukP0CN
   HK70OKicVk9XsoeyDX25xzz8Z+GfPBW9aPEHOe6crUzKBMoO7G7LZvUiy
   p5mao9yhJp/JGxzdq2fFkCD1NyhkJfgf9+LaXXzvpPMqiKEuxpREhIoXQ
   lTzHJNn1EXCO9qf6C6SwOaUd2xruDiOUr89rWlJZoRffblYOQeg8r/DDt
   rbS7CJGo5qaKDhafA26lpcFiBhqFGfqZK5+OEXlq+wT8V1PN8vscF5X3W
   AiRJeCaipOyAWvhpFTp61uAVCfxEL7//grc3m92OzW5Hi1bpGf2LIDZp7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421469899"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="421469899"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 19:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="764228152"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="764228152"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.6.77]) ([10.93.6.77])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 19:37:09 -0800
Message-ID: <b897d2ac-8a07-40a7-af59-dd746c56081e@intel.com>
Date: Mon, 13 Nov 2023 11:37:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>,
 David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-16-pbonzini@redhat.com>
 <956d8ee3-8b63-4a2d-b0c4-c0d3d74a0f6f@intel.com>
 <ZU51A3U6E3aZXayC@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ZU51A3U6E3aZXayC@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_193729_308785_1F7A1415 
X-CRM114-Status: GOOD (  21.02  )
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

On 11/11/2023 2:22 AM, Sean Christopherson wrote:
> On Fri, Nov 10, 2023, Xiaoyao Li wrote:
>> On 11/6/2023 12:30 AM, Paolo Bonzini wrote:
>>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>>> index 68a144cb7dbc..a6de526c0426 100644
>>> --- a/include/linux/kvm_host.h
>>> +++ b/include/linux/kvm_host.h
>>> @@ -589,8 +589,20 @@ struct kvm_memory_slot {
>>>    	u32 flags;
>>>    	short id;
>>>    	u16 as_id;
>>> +
>>> +#ifdef CONFIG_KVM_PRIVATE_MEM
>>> +	struct {
>>> +		struct file __rcu *file;
>>> +		pgoff_t pgoff;
>>> +	} gmem;
>>> +#endif
>>>    };
>>> +static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
>>> +{
>>> +	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
>>> +}
>>> +
>>
>> maybe we can move this block and ...
>>
>> <snip>
>>
>>> @@ -2355,6 +2379,30 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>>>    					struct kvm_gfn_range *range);
>>>    bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>>>    					 struct kvm_gfn_range *range);
>>> +
>>> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>> +{
>>> +	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
>>> +	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>> +}
>>> +#else
>>> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>> +{
>>> +	return false;
>>> +}
>>>    #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
>>
>> this block to Patch 18?
> 
> It would work, but my vote is to keep them here to minimize the changes to common
> KVM code in the x86 enabling.  It's not a strong preference though.  Of course,
> at this point, fiddling with this sort of thing is probably a bad idea in terms
> of landing guest_memfd.

Indeed. It's OK then.

>>> @@ -4844,6 +4875,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>>>    #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>>>    	case KVM_CAP_MEMORY_ATTRIBUTES:
>>>    		return kvm_supported_mem_attributes(kvm);
>>> +#endif
>>> +#ifdef CONFIG_KVM_PRIVATE_MEM
>>> +	case KVM_CAP_GUEST_MEMFD:
>>> +		return !kvm || kvm_arch_has_private_mem(kvm);
>>>    #endif
>>>    	default:
>>>    		break;
>>> @@ -5277,6 +5312,18 @@ static long kvm_vm_ioctl(struct file *filp,
>>>    	case KVM_GET_STATS_FD:
>>>    		r = kvm_vm_ioctl_get_stats_fd(kvm);
>>>    		break;
>>> +#ifdef CONFIG_KVM_PRIVATE_MEM
>>> +	case KVM_CREATE_GUEST_MEMFD: {
>>> +		struct kvm_create_guest_memfd guest_memfd;
>>
>> Do we need a guard of below?
>>
>> 		r = -EINVAL;
>> 		if (!kvm_arch_has_private_mem(kvm))
>> 			goto out;
> 
> Argh, yeah, that's weird since KVM_CAP_GUEST_MEMFD says "not supported" if the
> VM doesn't support private memory.
> 
> Enforcing that would break guest_memfd_test.c though.  And having to create a
> "special" VM just to test basic guest_memfd functionality would be quite
> annoying.
> 
> So my vote is to do:
> 
> 	case KVM_CAP_GUEST_MEMFD:
> 		return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM);

I'm fine with it.

> There's no harm to KVM if userspace creates a file it can't use, and at some
> point KVM will hopefully support guest_memfd irrespective of private memory.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
