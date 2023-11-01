Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE3EC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGgI2mi/ysYgEpIviajLpHBe5hrf8CMAL45TAic5sSw=; b=gITrgPj++wl8Ad
	Fj/jNmp3UsJGuDCxcPBhsHq4zbkbDr1RjsVqPcgQu94lVldA++3gshd9Bp1jkHKZbyiTabQcbUz37
	dpt/7+3fQm8XbRgDwDTPM0odwthDxwky3YGXoMcxQfs5iVKkWe7ohtJsq5ZUOjVhAst4mJrxqwDiK
	8tWSC8l5VboKnJ6xHp0RKFim2VARhwFUCRxpvrhUavW4AKd8tgHJ4geTAa6teu+Y5xWSGIQBboSwe
	uaUX+rucpsLJjbxZ6IqKfbzSBZuUZkwhEfKl1kj3ZAsYs8pxkedD33mVElwUWogl9+VPtKahg82DD
	bYIzS6Tm10Ktc5o0w/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy5bo-006o65-1P;
	Wed, 01 Nov 2023 07:25:48 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy5bi-006o47-1q;
	Wed, 01 Nov 2023 07:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698823542; x=1730359542;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qWRVoltW9FVs6NYX3CWyFfOjxesJ7ml8CJp5xBKO3/4=;
  b=Y5Nq997gQF5kfHd/I1WmSaL8NYQy6m9jij3t/4M5K7FSEwhzd3aFEtl+
   4HkH9RbdXDWI8DOXUOuxIEMzPpKJ1uL0wrj+cF/BXZQCa2SpWlrO0VyZS
   CZwu9Pntmcptb5tDoQpY2hYBHbhJF7GkRSGuq3sW2usLU6cNSlsTzgo1A
   o/2dI1/tydX5UOmUyQj4axMThXQ4SHdRBz29Jenb4pQS7apbu6Ms9UJtg
   KCBgEkDIwDbPdgXztnd+Hn78nQDCFBLuWHjSENHA1UJxRrUGeAPxzi7CL
   H7bg0AMWurZOrb8VkCpoYGX3aoH3zz+apjWYOJph2wECbtwPK3VUUZ6U9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392307407"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="392307407"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="8964294"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:25:26 -0700
Message-ID: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
Date: Wed, 1 Nov 2023 15:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
Content-Language: en-US
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
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ZUEML6oJXDCFJ9fg@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_002542_677517_0E5DFA8C 
X-CRM114-Status: GOOD (  16.55  )
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

On 10/31/2023 10:16 PM, Sean Christopherson wrote:
> On Tue, Oct 31, 2023, Xiaoyao Li wrote:
>> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
>>> Extended guest_memfd to allow backing guest memory with transparent
>>> hugepages. Require userspace to opt-in via a flag even though there's no
>>> known/anticipated use case for forcing small pages as THP is optional,
>>> i.e. to avoid ending up in a situation where userspace is unaware that
>>> KVM can't provide hugepages.
>>
>> Personally, it seems not so "transparent" if requiring userspace to opt-in.
>>
>> People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
>> support, or check is the sysfs of transparent hugepage exists; 2)get the
>> maximum support hugepage size 3) ensure the size satisfies the alignment;
>> before opt-in it.
>>
>> Even simpler, userspace can blindly try to create guest memfd with
>> transparent hugapage flag. If getting error, fallback to create without the
>> transparent hugepage flag.
>>
>> However, it doesn't look transparent to me.
> 
> The "transparent" part is referring to the underlying kernel mechanism, it's not
> saying anything about the API.  The "transparent" part of THP is that the kernel
> doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
> (mostly) transparent to userspace.
> 
> Paolo also isn't the biggest fan[*], but there are also downsides to always
> allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
> and there's precedent in the form of MADV_HUGEPAGE.
> 
> [*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com

But it's different than MADV_HUGEPAGE, in a way. Per my understanding, 
the failure of MADV_HUGEPAGE is not fatal, user space can ignore it and 
continue.

However, the failure of KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is fatal, which 
leads to failure of guest memfd creation.

For current implementation, I think maybe 
KVM_GUEST_MEMFD_DESIRE_HUGEPAGE fits better than 
KVM_GUEST_MEMFD_ALLOW_HUGEPAGE? or maybe *PREFER*?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
