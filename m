Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9C7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C32A610F7
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C32A610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTH4s9tiphSJi47KhfbXSr1TsKeW8czrO+GSaGRUNaA=; b=TT0U4HCSSAjeD/
	wuUxOe+HKYVZ06piEwDXjFlf4eSoPwvxEl7mTilrM8cNS4Ee/CQzfB/TVSHzi5hTexnIViGl5RYBK
	PE6eMWxVIsSPJANuUQdTiUE6NR/0Z2ye117Rkf2vEpbQC2ATEvlUsiFL+rwK1XHa28niRqeVggOXx
	zMYH+WUy1+1p9iZMRtnYJVzFfQFQY/1lIY42JWBMLbzhZIuIH3OoTIfhpUveX96NhmFwMi2aTy127
	BS5d7YLnPLBPWD/u3c7p4v9LjoUsLlMnUehs66IvMkabSnY8JN82WCUrLiFd6OafWz2zqqryjNz6F
	GfPjgDW7YvKPa5HhiKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkG9k-000R3w-7Z; Tue, 09 Nov 2021 01:42:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFlh-000HHW-EE
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 01:17:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id u17so17838665plg.9
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 17:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gT3MUMtIZ0PS90yl0lE9QBzqwoRSMBq2QOt4vNKzTys=;
 b=b13sxWM9K5iisnYPadl4iOffaoys9RijOi3mTsZncT79yh0EYcQ5zP36xW3B53gbfI
 hf38uXQxIRmk/GO8JXWSnV+gRSRIGZYtVYUdIsHAt6HO9GbiW9mBH/HQFPbdGVhmJzAE
 d+5xCaoOiMJhRE25WFHguzeVSIifxnExemfwDQtGBdPF4S9WTr8CvKXghy1m1SqKVnwm
 EERujOqfJ1YA7bmWxiB6FDxmsEbHoK9/PEVJSGjKx5CzfV6eZDPa/bWo0671IUu3X0m3
 XIR3TxcculNhN3pd4DHjS7KL7tM8G3YWRmURA4LG43nJsj/84/En3IvJRGamYai7QoJh
 2EpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gT3MUMtIZ0PS90yl0lE9QBzqwoRSMBq2QOt4vNKzTys=;
 b=PSU+fsFDcixkMWERz+CfDH1VViebzbnqT2urGfmf/4CxEKnrjcc8dsY+u7nqDhHQNH
 HVJMXPbitinD+j7KkPChiirCZNDnZdmzDVf3hhprwuQJhGPdWJkxQFiWlieQtZTb2zM/
 l6aiHIDuXg1TEEHvQiKOS7206LvOJVUZ99no2+Xbbuv1X2VKu62/4Nu6/uvyfJagbG6p
 dZOGTe4UfeUzcuw+v+kzjFVWJlynAlQc+0fL8fR/XnnzegbWOAAi4LIXMGcKbfh5epRQ
 8eMkQxV3Ez68lrO6KqWBxziNKg78HHObtvdTYaiumBWcBTlTvyUW/ui/XqWQN6CYBdJp
 oJBA==
X-Gm-Message-State: AOAM532pmWT7iD/ZA13Rr5StbcQPUxK/Dk12fhv/UaFyeXXXmi0n0/TT
 NnV7EFckW5arccmxwQADU42i7A==
X-Google-Smtp-Source: ABdhPJxdGShKmFpj2IYQOxd+oGtoXe5J3Pj9Ip1XNoCcHBZfb0/9N7iKTadK2twJpq0wRG+MfXG5fA==
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id
 i11-20020a1709026acb00b0014276c3d35fmr3494468plt.89.1636420663931; 
 Mon, 08 Nov 2021 17:17:43 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id q13sm18256433pfj.26.2021.11.08.17.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 17:17:43 -0800 (PST)
Date: Tue, 9 Nov 2021 01:17:39 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
Message-ID: <YYnMM17yXMq8cCTn@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
 <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_171745_595265_22A9D42B 
X-CRM114-Status: GOOD (  23.30  )
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

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
> >   		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
> >   	}
> > +	/*
> > +	 * Make a full copy of the old memslot, the pointer will become stale
> > +	 * when the memslots are re-sorted by update_memslots(), and the old
> > +	 * memslot needs to be referenced after calling update_memslots(), e.g.
> > +	 * to free its resources and for arch specific behavior.  This needs to
> > +	 * happen *after* (re)acquiring slots_arch_lock.
> > +	 */
> > +	slot = id_to_memslot(slots, new->id);
> > +	if (slot) {
> > +		old = *slot;
> > +	} else {
> > +		WARN_ON_ONCE(change != KVM_MR_CREATE);
> > +		memset(&old, 0, sizeof(old));
> > +		old.id = new->id;
> > +		old.as_id = as_id;
> > +	}
> > +
> > +	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> > +	memcpy(&new->arch, &old.arch, sizeof(old.arch));
> 
> Had "new" been zero-initialized completely in __kvm_set_memory_region()
> for safety (so it does not contain stack garbage - I don't mean just the
> new.arch field in the "if (!old.npages)" branch in that function but the
> whole struct) this line would be needed only in the "if (slot)" branch
> above (as Ben said).
> 
> Also, when patch 7 from this series removes this memcpy(),
> kvm_arch_prepare_memory_region() does indeed receive this field
> uninitialized - I know only x86 and ppcHV care
> and kvm_alloc_memslot_metadata() or kvmppc_core_prepare_memory_region_hv()
> then overwrites it unconditionally but it feels a bit wrong.
> 
> I am almost certain that compiler would figure out to only actually
> zero the fields that wouldn't be overwritten immediately anyway.
> 
> But on the other hand, this patch is only a fix for code that's going
> to be replaced anyway so perfection here probably isn't that important.

Yeah, that about sums up my feelings about the existing code.  That said, an
individual memslot isn't _that_ big, and memslot updates without the scalable
implementation are dreadfully slow anyways, so I'm leaning strongly toward your
suggestion of zeroing all of new as part of this fix.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
