Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F2BC021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n0vbRGg6u1bGJYt+j1IgmYnfd2UWZJz4RwcLCLE9jL8=; b=ia9u74kC+0mwXLPiTY7zN9aCye
	jW09JS2jpZraaQf50NZi9YMLeaL2sSO/H76oiG08L1NbxGF2W0nx2p67sccOg58MpHyk7IEvlKkV3
	1wQ7l07xUfwgDO1NE4b/DeYAYIBRIC+wpfGiwGsJiHwepEKRgNaUS23OL3dggZiupNEwicfialUIS
	aew2T3gLcFviq0MslOc8q/japWHiBrrPi1JRduex2K1ngYkDvCO5eV/yV1cAdZvGKVv7PN9t8eeu8
	/YwLk20YXPGmVeDjNNJTJ3rbnEa5AD2k+0y4KKmOwjNnPurmvQ8FXg2YSFQmkLjhEwXGpQG3cpWNI
	XO5yUnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzk-00000000Jkl-3xU1;
	Tue, 25 Feb 2025 16:41:20 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw2B-0000000HXrq-0J1H
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 14:35:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc1a70935fso11879973a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740494142; x=1741098942; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
        b=S9kfpvdNGpzyzi3j8R6RiHsIS3qNbJzRjEC3VVt6zCOkmyZF8ocM2Av+nhSICpb3T8
         GT8VeRUR9XyMCKFY9e1k41t2gFscKLJqwpWh6Ap4bdFRuFuk4Ed5DasZGJAUF1hBq/4X
         OjO0faTNHKHygp5zYjMPFaXoSVHbnLlltWEmaMroYgTuxclxJQ7L6IwjgCWSMjORylOq
         t5e5bdP2NTAz2/NXzIQqC4U+ADhn44G56vzVuJp3kw1xEm8xMCICDyPuIvb+9ZudaMlD
         7WBqXC3Pm6WSQwdnrsBe2gbj7Wf/Gw1VuwRjZu5MCvPQeAYKaMQsWGSncmv05xa9FSC3
         6L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494142; x=1741098942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
        b=vRyVk5fh4JxhfKWc1d2NRf4j+S5jCE8vDPyhaKg8lkgeKEVOBGHbMatnn0KmTB10bX
         hZezweLi46p6GutKf3WraA4GmEJwEW042Bh+kOJ2QgGh2AppiPZXRaJC6HGo0eq3LA0u
         1B+2o+AUkwzw4c9uAnM45gtDuBQNnlF93Y+XVhqqYvy8UALndNXc8G5MKlr/S2Jk+fLN
         +Jxs/XG9zMlriaJXRjy+wmflGumXXsSFH0+X5t3pbbYblr8Xc8PDwc15ZSbACU8chzfl
         fYKSlWcCVRypFW/TU+G1ai/zPalC2OPqMlr839t8ww1zaF/jml/+ZRN58uZ2CkaqWJDk
         5OLw==
X-Forwarded-Encrypted: i=1; AJvYcCW06ZVGvmK/UTvcg0HEF5F8BTIKkQmFL2E/xH840wo9mHBylZbA6z9wckKtbQ3lhonJXiRxeMFRDO5iQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNovchNSEic0gR3ELjcC7IiJ9Pb/RSpYqxSWEDWtRI4PBebgzL
	AiVjGTsbo96kEpPJP5IChMhOZMaWDUnh7UH2UWaK7AUWefiDz3r5efbfzXbXXw0S7Usxxstdx3+
	IHQ==
X-Google-Smtp-Source: AGHT+IFXh/XOoHWCgjyYmqDQFrw6VQ+lwV1XpaGwsHvB9OE+S78BXcvOxN0p4LNeKFLBgsLwKA4Y+N0kitA=
X-Received: from pjbdj6.prod.google.com ([2002:a17:90a:d2c6:b0:2fa:1fac:269c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8e:b0:2ee:c9b6:c26a
 with SMTP id 98e67ed59e1d1-2fe68ada3bemr5889698a91.11.1740494141828; Tue, 25
 Feb 2025 06:35:41 -0800 (PST)
Date: Tue, 25 Feb 2025 06:35:40 -0800
In-Reply-To: <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-4-seanjc@google.com>
 <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
Message-ID: <Z73U38mSuk_tOpqT@google.com>
Subject: Re: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063543_118895_D6259AAC 
X-CRM114-Status: GOOD (  22.39  )
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

On Tue, Feb 25, 2025, Yan Zhao wrote:
> On Mon, Feb 24, 2025 at 03:55:38PM -0800, Sean Christopherson wrote:
> > After freeing a vCPU, assert that it is no longer reachable, and that
> > kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
> > While KVM obviously shouldn't be attempting to access a freed vCPU, it's
> > all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
> > kvm_flush_remote_tlbs().
> > 
> > Alternatively, KVM could short-circuit problematic paths if the VM's
> > refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
> > could try disallow making global requests during teardown.  But given that
> > deleting the vCPU from the array Just Works, adding logic to the requests
> > path is unnecessary, and trying to make requests illegal during teardown
> > would be a fool's errand.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  virt/kvm/kvm_main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 201c14ff476f..991e8111e88b 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		kvm_vcpu_destroy(vcpu);
> >  		xa_erase(&kvm->vcpu_array, i);
> > +
> > +		/*
> > +		 * Assert that the vCPU isn't visible in any way, to ensure KVM
> > +		 * doesn't trigger a use-after-free if destroying vCPUs results
> > +		 * in VM-wide request, e.g. to flush remote TLBs when tearing
> > +		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
> > +		 */
> > +		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
> As xa_erase() says "After this function returns, loading from @index will return
> %NULL", is this checking of xa_load() necessary?

None of this is "necessary".  My goal with the assert is to (a) document that KVM
relies the vCPU to be NULL/unreachable and (b) to help ensure that doesn't change
in the future.  Checking xa_load() is mostly about (a).

That said, I agree checking xa_load() is more than a bit gratuitous.  I have no
objection to checking only kvm_get_vcpu().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
