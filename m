Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B90AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VKCp1P1Y2fRk4FLFAtIxRZD7iERobGjHksdyLJyOE6A=; b=XPRL50I0JlPXYAQBNbIDTKlcKe
	V0qsJ1fHCTPTb90fE+cAn9wg8yP4f4xnWuoE7LGGcryNrwio7J32JPln2EUmvtMhu+unXbz6k5O/h
	Kbd/mD7BVUwrJOGyKo9XMXIproc9JU0YvN0qxzOtUuCd90/zzLA4RPYy1m3F32p2v6QjaaIKkr/Xb
	KjiDBE9gPEv19WPxd1gjdR+3H7UZCyyPyjObvQNDD3oDEpuUsfOUkLB6uB/oRRdg0/VnOajOCPQ+0
	jhE0CNvfo35vhCwt/Y1DiZnNuof4i7NZwftvgcQ4kI05wbhVyuq1tAdJbkazUiHsKHG6CPCnGFr7O
	HIaIwxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZsV-009mMQ-1f;
	Thu, 02 Nov 2023 15:45:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZsR-009mIT-1k
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:45:01 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b31e000e97so15951787b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698939894; x=1699544694; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWop9ChiDn+5U1d7ZFSKgT7XQaKJkOCdphsca+5hdRc=;
        b=EKwjozqvKdIhfQur0rp4fEtnEGvkJHeYASlL78sybgGXw4FR9EyBokFMFDn/51ynP+
         L/NkTXH9THaBAct1/FwVznCoqsB0jdpeyhHTiyaypSjFdnYfOK1Cj8E94vLtyKHBcGn5
         0zZzu2N7s30gK6tx31Thuo21WO+o1caqAD3WWKZQU/f8and09yagr6ER+YOubXaMcu0A
         UmBtf+eNeP1uzT9KjhazYqgfHkUasON8r7nor/xIs/d9Zt9ryqaaui0NEynzJnk77UxS
         I710kYlQ/7caVh0oMbZjl2TgaGoazRQLVemNZ93njCdPFajTKuyV8V3vaUotmOcgWYnM
         WDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698939894; x=1699544694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWop9ChiDn+5U1d7ZFSKgT7XQaKJkOCdphsca+5hdRc=;
        b=s50bEVD8r477XzI/3TAEZRgSBM3Wtkzba0UEFFroZFp85fZ/WOQf8HHViPLq2XT/oz
         aelgJtuZ66kfqb5QbSTbxJOlFYtOMgic9xUsxl8zCn1reS/SCIwF+Qp5Yv19n50ttPzJ
         vm4ccjyZ3mhaCrCHG1yTgllHADy3I7k4jViYuQPCZWioOiQnWkWQ/qfvQ5O67XUKRs6/
         eR+OQJLbg87L7lX+VTQiyJcx3h4FpvddFZwKJVrpGFBtzR/xAWRlt7j8xJ1y3FJjlsVL
         r6oeHY44KFPCVCPo/gVKv46bwWT+Xgio8KRjUUbd0fB9oydYX/uHNbqKY02Z66LUGBwl
         8a2w==
X-Gm-Message-State: AOJu0YwI5XzsWed2qvdZ/K+va7QpOuo8VwebHbyMIySJdFMPXNicxbkq
	dnHSIkE2qFlQv5fpaMxCdU+cXsHo1so=
X-Google-Smtp-Source: AGHT+IEDx2fXN1mZpC4wdLenC0gEZqGHeyYGeZi/NHNboFx849UKp0hRFulm5OGynaHR+kwHxlTzuAC9hXU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d785:0:b0:59b:c811:a709 with SMTP id
 z127-20020a0dd785000000b0059bc811a709mr3270ywd.0.1698939893755; Thu, 02 Nov
 2023 08:44:53 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:44:52 -0700
In-Reply-To: <496b78bb-ad12-4eed-a62c-8c2fd725ec61@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
 <32cb71700aedcbd1f65276cf44a601760ffc364b.camel@intel.com> <496b78bb-ad12-4eed-a62c-8c2fd725ec61@redhat.com>
Message-ID: <ZUPD9NWF4eOXqeiA@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kai Huang <kai.huang@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "mic@digikod.net" <mic@digikod.net>, 
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "david@redhat.com" <david@redhat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "amoorthy@google.com" <amoorthy@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "tabba@google.com" <tabba@google.com>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, Vishal Annapurve <vannapurve@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, 
	"willy@infradead.org" <willy@infradead.org>, "dmatlack@google.com" <dmatlack@google.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, 
	"yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, Yilun Xu <yilun.xu@intel.com>, 
	"qperret@google.com" <qperret@google.com>, "brauner@kernel.org" <brauner@kernel.org>, 
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Wei W Wang <wei.w.wang@intel.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_084459_580628_CA817A63 
X-CRM114-Status: GOOD (  14.25  )
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

On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> On 11/2/23 10:35, Huang, Kai wrote:
> > IIUC KVM can already handle the case of poisoned
> > page by sending signal to user app:
> > 
> > 	static int kvm_handle_error_pfn(struct kvm_vcpu *vcpu, 			struct
> > kvm_page_fault *fault)                                               	{
> > 		...
> > 
> >        		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> >               		kvm_send_hwpoison_signal(fault->slot, fault->gfn);

No, this doesn't work, because that signals the host virtual address

	unsigned long hva = gfn_to_hva_memslot(slot, gfn);

	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva, PAGE_SHIFT, current);

which is the *shared* page.

> >                 	return RET_PF_RETRY;
> > 	}
> > 	}
> 
> EHWPOISON is not implemented by this series, so it should be left out of the
> documentation.

EHWPOISON *is* implemented.  kvm_gmem_get_pfn() returns -EWPOISON as appropriate,
and kvm_faultin_pfn() returns that directly without going through kvm_handle_error_pfn().

  kvm_faultin_pfn_private()
  |
  |-> kvm_gmem_get_pfn()
      |
      |-> if (folio_test_hwpoison(folio)) {
		r = -EHWPOISON;
		goto out_unlock;
	  }

          |
          |-> 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
			     &max_order);
		if (r) {
			kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
			return r;
		}

		|
		|-> ret = __kvm_faultin_pfn(vcpu, fault);
		    if (ret != RET_PF_CONTINUE)
			    return ret;

		    if (unlikely(is_error_pfn(fault->pfn)))
			    return kvm_handle_error_pfn(vcpu, fault);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
