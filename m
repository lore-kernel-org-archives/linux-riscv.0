Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9046C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+7pkwhn8wwMfV+aRICcdMsdhSCcfEsRq9HkIcq5Rb4=; b=KjXNHCK/iV6Cd2
	F/rj/0u1yFFCATgzT1dwxC3NLLQfPdMwa5D52K2qBGu+uIjoz5m7pdte7jOt61XvQMkLV0l1aRZTT
	4ALj9x2toyH0lmNdYlfuA7Ag0xwMrd08rvQ2sC4BAuvsWNWutEFbYRfLPBsPG/72m+R06xdbC3OP3
	RklXCgzpqcNEsNpAs4g5ZGiOcSeh5QBpgb/LZd7lha6ZJR7msfCOPvfZzq2HrlYwQyOOBJ2yGB7u9
	2Ay8+3l4vJb3PDQojByq3V8g3t1F8/C7u8ilMfA8yEQJ11x6o0I8RNzDfFs4dWNq7QqwWMj9sWrws
	ogoxQ3benaxuDa6pJ3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzrQ-00000007n3u-4ATf;
	Thu, 08 Aug 2024 09:55:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzqq-00000007mue-159J;
	Thu, 08 Aug 2024 09:54:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E8C0DA7;
	Thu,  8 Aug 2024 02:54:55 -0700 (PDT)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 632F73F6A8;
	Thu,  8 Aug 2024 02:54:23 -0700 (PDT)
Message-ID: <34468ff8-2159-4adb-b680-c6048eecee80@arm.com>
Date: Thu, 8 Aug 2024 10:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
To: Catalin Marinas <catalin.marinas@arm.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-2-seanjc@google.com> <ZrOBg70pCnv7PHyK@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ZrOBg70pCnv7PHyK@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_025432_390574_B041E79D 
X-CRM114-Status: GOOD (  14.05  )
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

On 07/08/2024 15:15, Catalin Marinas wrote:
> On Fri, Jul 26, 2024 at 04:51:10PM -0700, Sean Christopherson wrote:
>> Put the page reference acquired by gfn_to_pfn_prot() if
>> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
>> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
>> can get a page reference to ZONE_DEVICE memory.
>>
>> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/arm64/kvm/guest.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index 11098eb7eb44..e1f0ff08836a 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>  		page = pfn_to_online_page(pfn);
>>  		if (!page) {
>>  			/* Reject ZONE_DEVICE memory */
>> +			kvm_release_pfn_clean(pfn);
>>  			ret = -EFAULT;
>>  			goto out;
>>  		}
> 
> This patch makes sense irrespective of whether the above pfn is a
> ZONE_DEVICE or not. gfn_to_pfn_prot() increased the page refcount via
> GUP, so it must be released before bailing out of this loop.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Yep, as Catalin says, this is an 'obviously' correct fix - the reference
needs releasing before bailing out. The comment there is perhaps
misleading - it's not just ZONE_DEVICE memory that will be rejected, but
this is the case that was in my mind when I wrote it. Although clearly I
wasn't thinking hard enough when writing the code in the first place... ;)

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
