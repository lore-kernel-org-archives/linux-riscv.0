Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB5C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljjHMV7J6IuSSi/fKzlrd841zRnXBAu4KV8/m2Re0qE=; b=NamNXkx/BTOTH+
	a2OI7DWo7NSr0Jlq7rmYXfKnHB2XjOkCQBTDNv643r11rrfxrO8q6ejgIfD6Uso1O6R6NIp+6toDq
	gNWwz067vYvUhMKln2td6D/VyBOL3AnX5pMf6irE3oA5On1D3/JD4MLxMsURHelBVfMDf2DIUTC7s
	AI/SjoyokthnRVnnxJWJs2UBsn15v6F0LsRAlwv25WjSv5JIJvvMf8o/xPw6bEkCFgKmBzHdmcIm0
	So+/JEPL8+Xez2pGij3BFyQWkjUkOzAhlUeYPFijt+CcShLEc6It8F0BsqLyF26PPzoE9o8fyu7d4
	K5qcAIxmfNERdYrvdP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasbW-0000000F1mz-21ZQ;
	Mon, 05 Aug 2024 07:58:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasaz-0000000F1fa-2yPo;
	Mon, 05 Aug 2024 07:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74B89CE0018;
	Mon,  5 Aug 2024 07:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59266C32782;
	Mon,  5 Aug 2024 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722844650;
	bh=Geket5xHj+rV/lTGgYhI+mobx7QxgrRmSJGYSEDRkpk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UBQwR8Dv5k7JtkeG4laWC2Xs0oOnozRLy+3hVYnDYQn2Ed5eCrDNKiqSjdoXT4acx
	 1hPdTL4JDstUhQJJ7lCM7YYqnV4Qh1m6C+CK460q8siGoQwJJKzkWsjMOX4qcfmelz
	 A6Yt57Xlk92ABmDDhigDShW3vM0pnXKBZJdZWOrnwttmRyqlw3hP4oeUm/b5LanIcX
	 fVlLRwpf9c9nuW6b7SobjiC6lu0VN8iuGUvVZHCooHxsAnFt7ePn4zwuEV1kg+BLX4
	 tQQRPbEFjC/HMt7oQ6FPHcOxgz1D3ofgxyEIT69W/KjqEASCYIB1LwhYcesfg0NZf1
	 asOwN60f4YLIQ==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
In-Reply-To: <ZqvNekQAjs-SN-se@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-3-seanjc@google.com> <yq5aikwku25o.fsf@kernel.org>
 <ZqvNekQAjs-SN-se@google.com>
Date: Mon, 05 Aug 2024 13:27:18 +0530
Message-ID: <yq5a5xsftna9.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_005734_126733_0913C9CB 
X-CRM114-Status: GOOD (  18.24  )
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

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
>> > writing guest memory without marking the gfn as dirty in the memslot could
>> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
>> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
>> > and presumably the only use case for copy MTE tags _to_ the guest is when
>> > restoring state on the target.
>> >
>> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>> > ---
>> >  arch/arm64/kvm/guest.c | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> > index e1f0ff08836a..962f985977c2 100644
>> > --- a/arch/arm64/kvm/guest.c
>> > +++ b/arch/arm64/kvm/guest.c
>> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> >  
>> >  	mutex_lock(&kvm->slots_lock);
>> >  
>> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
>> > +		ret = -EBUSY;
>> > +		goto out;
>> > +	}
>> > +
>> >
>> 
>> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?
>
> No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
> relevant.
>


What I meant was, should we consider mte_copy_tags_from_user() as one
that update the page contents (even though it is updating tags) and
use kvm_follow_pfn() with kfp->pin = 1 instead?

Is my understanding correct in that, if we want to look up a pfn/page
from gfn with the intent of updating the page contents, we should use
kfp->pin == 1? 

-aneesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
