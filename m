Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E45C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BgDkUvMiwFCtxwIDtnJ9Ujhnyuhyi4WDzHxIYKO+0ig=; b=nQtYvCr9w/W7piz3c1E2+Z/rwA
	Q3dMvJ3AXkXQO8DYiaFifhNrArt+EBox79Mib0sxpaHm8BIf5nZyEtYIUUQ6R5pz+ICL7tTWF1yAE
	RDdGeyHZzsATPt/lsopsNS3fjmeTVhpMC07yNYqBiQFPNDReISrULNGhc3iylU1w+mhBZcIVzlCcn
	GCK/1U1afn+8p9DRXtqsg5DjbcWgekqbwqBCrFoCHy7W0vFJ/7jMBpks/ROoVALT9UIhJ3F2PTJwH
	eXxqELQVhH8k6LVqjNYcUkTZRVvloDthjx3WgQiskbaOgzgoCpvvvrbCG0OKWcLoBd4Il/JPHZG3r
	N6X8nppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxaOZ-0046mv-1b;
	Mon, 30 Oct 2023 22:06:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxaOX-0046lp-00
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 22:06:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d99ec34829aso4546198276.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698703558; x=1699308358; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IwVDVsbZSN9+qsHUIXJ8IN4aMaIP7o7r0dMzi80JWo=;
        b=w5dXSfF58XY5WXDH5t9VULsoh77JHLMPwYQuS9pHNJ9mj1JYBQSMXR2qRXrtr2p1V2
         R6kTYvMjiTw/5x3ur8Esbt3DmcTXy1ahXLL6LiAgz7idrKgfqbF7jVRaBii2CRefL3Jj
         UrSDDlxkiGqC6qpOUmIXVGO6Dyr0xRiOUSBq1xXjBiweq6BNTWZbfJTZbGYeTpjJQPcQ
         f9PiyhLleAcFKTVWNceqK8oZ4tKMV8KwkqDCIsHG5b65RG6xl2IsC6T20JSCWR+Z03ft
         0SknfA+919oVXtcKyzZaZNK1ajSTBGB81U1UXY9fUcTvppSxaC4LXcralv3aRG3Dxtnw
         heyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698703558; x=1699308358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IwVDVsbZSN9+qsHUIXJ8IN4aMaIP7o7r0dMzi80JWo=;
        b=pi6STdxXnpMrih0e7AlD51YbjYPD82TeccAUZjm6uE9xm4QOPPDHRMDHwLIqZDYkKh
         Vwm6rHJN3Q9IU3rxfdvXE5wUYmmHZEobllYDZ5v+ZEZKBN++ILpr1K8Btfab7PAkSUyQ
         3kSJirzBPEecUoqzS8Cqm2KyTQ1gXWTzIUtaPEBcQtb91SQoQlDbzM/U54M8I6SorOiv
         ZVN7Gn8A2pv8x5RP8bIhPVuYWzDEJnoFDXbCiU3YLuuUtX9KJiEDOH9NToy3zK5/9V0d
         vWC17cf9z8B0aTcXcQ5gslL9iPis8r1ZHDUgjs/dxf3FIFIKTc8OZQkX63cFODC94mn/
         yuPw==
X-Gm-Message-State: AOJu0Yz0BeR99T44BCAWV81CHld/8cDfxCdTzQxxHOSq/uQ73GzegXqp
	Mg+2MCevyAuGeWTF9AR8youAXtVgwrs=
X-Google-Smtp-Source: AGHT+IEdUnGiaB+HWnyvBXIWgJEvc4p4Jj6o8XAknp5F2BcjElHvOjmW/sQ9BadeZP3HZD1+EeGEwSi+J0Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b108:0:b0:d99:3750:d607 with SMTP id
 g8-20020a25b108000000b00d993750d607mr203752ybj.8.1698703558464; Mon, 30 Oct
 2023 15:05:58 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:05:56 -0700
In-Reply-To: <ZT_ViJOW1p4TN_fI@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-14-seanjc@google.com>
 <ZT9lQ9c7Bik6FIpw@chao-email> <ZT_ViJOW1p4TN_fI@google.com>
Message-ID: <ZUAoxCZJnpPGWjpu@google.com>
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_150601_039718_F1329B61 
X-CRM114-Status: GOOD (  23.67  )
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

On Mon, Oct 30, 2023, Sean Christopherson wrote:
> On Mon, Oct 30, 2023, Chao Gao wrote:
> > On Fri, Oct 27, 2023 at 11:21:55AM -0700, Sean Christopherson wrote:
> > >From: Chao Peng <chao.p.peng@linux.intel.com>
> > >
> > >In confidential computing usages, whether a page is private or shared is
> > >necessary information for KVM to perform operations like page fault
> > >handling, page zapping etc. There are other potential use cases for
> > >per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > >or exec-only, etc.) without having to modify memslots.
> > >
> > >Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> > >userspace to operate on the per-page memory attributes.
> > >  - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> > >    a guest memory range.
> > 
> > >  - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> > >    memory attributes.
> > 
> > This ioctl() is already removed. So, the changelog is out-of-date and needs
> > an update.
> 
> Doh, I lost track of this and the fixup for KVM_CAP_MEMORY_ATTRIBUTES below.
> 
> > >+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> > >+:Architectures: x86
> > >+:Type: vm ioctl
> > >+:Parameters: struct kvm_memory_attributes(in)
> > 
> > 					   ^ add one space here?
> 
> Ah, yeah, that does appear to be the standard.
> > 
> > 
> > >+static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> > >+					  struct kvm_gfn_range *range)
> > >+{
> > >+	/*
> > >+	 * Unconditionally add the range to the invalidation set, regardless of
> > >+	 * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> > >+	 * if KVM supports RWX attributes in the future and the attributes are
> > >+	 * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> > >+	 * adding the range allows KVM to require that MMU invalidations add at
> > >+	 * least one range between begin() and end(), e.g. allows KVM to detect
> > >+	 * bugs where the add() is missed.  Rexlaing the rule *might* be safe,
> > 
> > 					    ^^^^^^^^ Relaxing
> > 
> > >@@ -4640,6 +4850,17 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> > > 	case KVM_CAP_BINARY_STATS_FD:
> > > 	case KVM_CAP_SYSTEM_EVENT_DATA:
> > > 		return 1;
> > >+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > >+	case KVM_CAP_MEMORY_ATTRIBUTES:
> > >+		u64 attrs = kvm_supported_mem_attributes(kvm);
> > >+
> > >+		r = -EFAULT;
> > >+		if (copy_to_user(argp, &attrs, sizeof(attrs)))
> > >+			goto out;
> > >+		r = 0;
> > >+		break;
> > 
> > This cannot work, e.g., no @argp in this function and is fixed by a later commit:
> > 
> > 	fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
> 
> I'll post a fixup patch for all of these, thanks much!

Heh, that was an -ENOCOFFEE.  Fixup patches for a changelog goof and an ephemeral
bug are going to be hard to post.

Paolo, do you want to take care of all of these fixups and typos, or would you
prefer that I start a v14 branch and then hand it off to you at some point?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
