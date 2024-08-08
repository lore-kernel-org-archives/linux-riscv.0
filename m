Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916D5C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Em+YnfKKiT0ny3X+14TEPwkxyrfFd+dAncajULwXBXo=; b=jGiHcoVaBkxuda
	Cg9SBVMkuSWnnlgWtuk4xYReAqJKiSe/i/8TF3Sn5Ba/aKj+2Dx9Hpv79KxIXM3H1U6B6U7rhKTo8
	bcUlGxxWxSiPt9PdHzdKAWJG9tlr5VwwpnlbAQ1o9cRGKamdZfT5EctRLn5DxBW85sh7anIwLfL36
	QtEP+4yWUiGj+kaOyo2yPlTTE9IIAzPXAXj8dNtQwMxAEhUmzkFIkscNJQGoJoe7gHLUo8E1X32mp
	TmcXPzN1maOYqfGLdDXv5UnbUhtBGuzQ/pOwiwkkw31cFTY56yqn9e3CxsblmMh6x3hXDt7jyDEWt
	n7GKMO21mlflCd8xGxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzry-00000007nEi-2l5W;
	Thu, 08 Aug 2024 09:55:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzqu-00000007mvY-1yAt;
	Thu, 08 Aug 2024 09:54:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA0441042;
	Thu,  8 Aug 2024 02:55:01 -0700 (PDT)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A95173F6A8;
	Thu,  8 Aug 2024 02:54:29 -0700 (PDT)
Message-ID: <fbcbd4da-cab5-420e-b8b6-bf04e27bf69c@arm.com>
Date: Thu, 8 Aug 2024 10:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
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
 <20240726235234.228822-3-seanjc@google.com> <ZrOfB8bOdSJVcWFr@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ZrOfB8bOdSJVcWFr@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_025436_590233_177625F0 
X-CRM114-Status: GOOD (  17.00  )
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

On 07/08/2024 17:21, Catalin Marinas wrote:
> On Fri, Jul 26, 2024 at 04:51:11PM -0700, Sean Christopherson wrote:
>> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
>> writing guest memory without marking the gfn as dirty in the memslot could
>> result in userspace failing to migrate the updated page.  Ideally (maybe?),
>> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
>> and presumably the only use case for copy MTE tags _to_ the guest is when
>> restoring state on the target.
>>
>> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/arm64/kvm/guest.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index e1f0ff08836a..962f985977c2 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>  
>>  	mutex_lock(&kvm->slots_lock);
>>  
>> +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
>> +		ret = -EBUSY;
>> +		goto out;
>> +	}
> 
> There are ways to actually log the page dirtying but I don't think
> it's worth it. AFAICT, reading the tags still works and that's what's
> used during migration (on the VM where dirty tracking takes place).
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Looks sensible to me - my initial thought was "why would a VMM do
that?". But it would make sense to actually return a failure rather than
letting the VMM shoot itself in the foot.

If there's actually a use-case then we could look at making the dirty
tracking work, but I'm not convinced there is a good reason.

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
