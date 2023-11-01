Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB66C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PtdKZ+sDKkt7ieC/RVOKSUs68T8wYfZO4L17JEc86Us=; b=YsHeiECyArNTtHwuAfvL6vpGnV
	Frns2qjfUU2jaU97D0RPMIZraNsKIN9eYncmEa2pdYhJ2ORoRkVYVbSmjzlTO8vLM/B1hS8k3jd85
	5dhD/iP0dPQUEJh/JXYagrZaAbm7Mu3JHV5AYecyp+9V/jhxxHzGoyj7t2Q9Kn0hxWUGUm09BO8tP
	3HLtfztOEy0igwJ4s0oXvsa5dSfcE9nCf577VNWu/t5m+Qf1AsQTDpI3sa0kusBsbfHhRFnsERFoX
	k+QPXK3pic1wG1++eSsHm8vxPMEvxvDcjWjpnSUtivrunEO0nGOPSo994SAOdUhksWb6hYIHsE5Lo
	kwa2nCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyF9D-007t3e-1Z;
	Wed, 01 Nov 2023 17:36:55 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyF9B-007t2m-08
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 17:36:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da03390793fso7108560276.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 10:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698860209; x=1699465009; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5pPv4/g+I3C3eNDgudVhrFstr6S8Xmtwrf0OlljDI=;
        b=fsWpC2RbvONMs14YuuPPJ87cpSMciGnAp3NRcfWv9OyXeXZNvgSWupK0xUpWdyxBGo
         N36noxpgT0QR315yX3qcrTr/jpAvzd38Y4hKG1B7cXvQwPNpDcjZsnMdLTM7Yk2mPRK1
         JK6ldkc2i95VZ1lvxkzRwxnwkdZ+7zQrfhbe3+gc5qJw0u3TDX7WZD34Da1xbDDlergl
         Or/4zGeuB3YBczWd975+NLs/f0dZGC0E2dDkBrvM4MoGUGas+B9oJZlhILEjU98M+Beo
         7Q0dglUyPstrdb6sMJ2wL+BAtbbcbVX/TTN/kXgZ/881m4bNSO4snBvlaj8QSzEUD+Ep
         3nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698860209; x=1699465009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5pPv4/g+I3C3eNDgudVhrFstr6S8Xmtwrf0OlljDI=;
        b=MWxA88vfIrX8Kb9af1xHGSJGxR31xDB1AVcUMYKTZ2ZJ7uowHML5JyJL8ul+3/g9Ub
         iUvR2nbD6NcAnB3xtsLzMiJVmA+zIzeyFUaAKugR3BpqUhcR+UplDM9WBg2QPMufgE2K
         xR91ibWXhu2Ahw9uKjN43u4pZd5iNA9o18SGlkSwNtU8UMGgWyiXFMiE92VoY+2GrIDT
         40pcvLsMazm5+F3b4eeHjkTvuTsVGLdxiGHnaocqUCXjzHXgkQy8JLHSHolZNC40kkoh
         rSzy7toQNXV0KezYwmGN0CngvzVfXj2oXEFTCPG+BlDiv8lBu9ikDLLDKvwZoNpFTQP/
         1zlQ==
X-Gm-Message-State: AOJu0YxVH1aO94FkozWuNuXMzmJICQKmtbsXH7E4ryCbok0Lu7wKzLEV
	Z92X51J0OB95gPlWXJG1cnXhEMyhdQc=
X-Google-Smtp-Source: AGHT+IG/a6Sj0mASs5/8PEJQnR69sSphX+9SHKWYEjRPOLGEF4l6c52AgzjYtmdhHr7JL68mzkGP7JI8NEg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:168c:b0:da0:3e46:8ba5 with SMTP id
 bx12-20020a056902168c00b00da03e468ba5mr304342ybb.8.1698860209654; Wed, 01 Nov
 2023 10:36:49 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:36:48 -0700
In-Reply-To: <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
Message-ID: <ZUKMsOdg3N9wmEzy@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "brauner@kernel.org" <brauner@kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "willy@infradead.org" <willy@infradead.org>, 
	"anup@brainfault.org" <anup@brainfault.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "mic@digikod.net" <mic@digikod.net>, 
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "david@redhat.com" <david@redhat.com>, 
	"tabba@google.com" <tabba@google.com>, "amoorthy@google.com" <amoorthy@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, 
	"yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "qperret@google.com" <qperret@google.com>, 
	"dmatlack@google.com" <dmatlack@google.com>, Yilun Xu <yilun.xu@intel.com>, 
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Wei W Wang <wei.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_103653_101470_B83919FC 
X-CRM114-Status: GOOD (  20.90  )
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

On Wed, Nov 01, 2023, Kai Huang wrote:
> 
> > +7.34 KVM_CAP_MEMORY_FAULT_INFO
> > +------------------------------
> > +
> > +:Architectures: x86
> > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > +
> > +The presence of this capability indicates that KVM_RUN will fill
> > +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
> > +there is a valid memslot but no backing VMA for the corresponding host virtual
> > +address.
> > +
> > +The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
> > +an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
> > +to KVM_EXIT_MEMORY_FAULT.
> 
> IIUC returning -EFAULT or whatever -errno is sort of KVM internal
> implementation.

The errno that is returned to userspace is ABI.  In KVM, it's a _very_ poorly
defined ABI for the vast majority of ioctls(), but it's still technically ABI.
KVM gets away with being cavalier with errno because the vast majority of errors
are considered fatal by userespace, i.e. in most cases, userspace simply doesn't
care about the exact errno.

A good example is KVM_RUN with -EINTR; if KVM were to return something other than
-EINTR on a pending signal or vcpu->run->immediate_exit, userspace would fall over.

> Is it better to relax the validity of kvm_run.memory_fault when
> KVM_RUN returns any -errno?

Not unless there's a need to do so, and if there is then we can update the
documentation accordingly.  If KVM's ABI is that kvm_run.memory_fault is valid
for any errno, then KVM would need to purge kvm_run.exit_reason super early in
KVM_RUN, e.g. to prevent an -EINTR return due to immediate_exit from being
misinterpreted as KVM_EXIT_MEMORY_FAULT.  And purging exit_reason super early is
subtly tricky because KVM's (again, poorly documented) ABI is that *some* exit
reasons are preserved across KVM_RUN with vcpu->run->immediate_exit (or with a
pending signal).

https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com

> [...]
> 
> 
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
> >  /* Max number of entries allowed for each kvm dirty ring */
> >  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
> >  
> > +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > +						 gpa_t gpa, gpa_t size)
> > +{
> > +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> > +	vcpu->run->memory_fault.gpa = gpa;
> > +	vcpu->run->memory_fault.size = size;
> > +
> > +	/* Flags are not (yet) defined or communicated to userspace. */
> > +	vcpu->run->memory_fault.flags = 0;
> > +}
> > +
> 
> KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
> <asm/kvm_host.h>?

I'd prefer to keep it in generic code, as it's highly likely to end up there
sooner than later.  There's a known use case for ARM (exit to userspace on missing
userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.

[*] https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
