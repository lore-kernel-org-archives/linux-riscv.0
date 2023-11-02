Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E89C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uEXw7IR7WlLfkxM6ojpPU92FGHLCqIzimZKKRYo9l5c=; b=id24/kdv3UmKpGIBfzySZgoL4m
	G6phRCEAiRZ1ry44TgcuJ6vrxGrRyh8+b2tIgg7fBd1QbCes7vKg8s611IkZOwW3+FX7HDVvhxq3c
	oTXbpy/ZztA5TABAGgcuHpDOYgHyfttFIJ+LIYv8qPaq/NJ8Ie7NS1/ZxaLhyZ7U2yEievmBSQth7
	U2w3K01B2WqPeRssYb0212KXz8PM5LrP9wgkr72K2e5HL3v77AXLriPFmEgUzkMVHY23CU8Rx3SwA
	i1KItMUPIPEqiDWw8Om/TU+lszqNnZoNpm8xUxV9dz1ZWzaVxM0VPlx/qsvMhuv0agDmrBzRpgkSM
	yG5ynZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZzH-009nxE-2l;
	Thu, 02 Nov 2023 15:52:03 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZzD-009nvB-33
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:52:02 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc29f3afe0so9031855ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698940317; x=1699545117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3KS4TORQ08dXaJsqxd4Pb+jR6Q6AdhcH6h0cpJ7xRs=;
        b=bgvWx/KDd6p3mFuFoGgkySCNIqF83NgcrE1w+1A3HBrRf5m2H5m8tJlEDr82fUMa+U
         DbNT7IFWifN66Hljpea7RTmg38DX53ayN4kCZXzJMBHVyUseDEr4Z3NqU/jvrfZEAX7s
         LLXuMPIhOZCiIfOsxZmOhmUgPlN31+do1RXT111WsKAYPbV9c31n9l3CwPbdZYgAld9Y
         XSrDCwJiEE8ZR6K0lnEBWzdyF4dBg26dhrlcZKCK/DyouHr37L6biapQavlgfBFTSBuc
         snCQEQ1uF4yrzxBZtsN8NiHpfRA2+TmFLahTI2LmiWiFWLqTYAsTpektE8VWJ2Rqv0z5
         SAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940317; x=1699545117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3KS4TORQ08dXaJsqxd4Pb+jR6Q6AdhcH6h0cpJ7xRs=;
        b=G9sJlFPlPwkIFRw5g81WlriCgCUXJc7vXagCK8AxWduILcj+G31/eJ7JZXduf97RJB
         kOg7uLPGKyi6vMRXkuTtbNnwjibcGECbTxuIy2CaI2C4Gz6DdFnI5xYn+n57dDUcyZp5
         T2TOCK4VHiX4zL/Q5ndndX61+0wUiJuyLLNpr3QX6rOK4nknf9ohBuPVCsUkPoI6ZxIn
         E84pNzuTsyT/RO2Wzy30BNROUi2S73lD02WJ6bndgHp2qOhPCW7Crc+YY40o6KtuKaso
         BuVMFzAIiDS0+LNWmX68+B3dh1R3q+wWH5YQS3QGYkVAX1MLC+v24ANL/u//+LExx2xT
         tqeQ==
X-Gm-Message-State: AOJu0YwvQnIiE8K0ToMQJ09fhU5evcHZf0MvPPkEsT8JSQkDhZddG0j6
	s4udYPHjT1fWeoPY2fj8HGamyD+mnuA=
X-Google-Smtp-Source: AGHT+IFDcwl4s8UdqmTM5rWncqnvjP5M1c0a+jaZEj3IxvzEAcY13jClAPWsClQownnFGH/6j2HG46oUm7Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:efd1:b0:1c6:2b9d:570b with SMTP id
 ja17-20020a170902efd100b001c62b9d570bmr344133plb.7.1698940317130; Thu, 02 Nov
 2023 08:51:57 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:51:55 -0700
In-Reply-To: <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Message-ID: <ZUPFmwWjPFlXRlPi@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Kai Huang <kai.huang@intel.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"brauner@kernel.org" <brauner@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "willy@infradead.org" <willy@infradead.org>, 
	"anup@brainfault.org" <anup@brainfault.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
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
X-CRM114-CacheID: sfid-20231102_085159_986366_47C75557 
X-CRM114-Status: GOOD (  18.86  )
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

On Thu, Nov 02, 2023, Xiaoyao Li wrote:
> On 11/2/2023 1:36 AM, Sean Christopherson wrote:
> > > KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
> > > <asm/kvm_host.h>?
> > I'd prefer to keep it in generic code, as it's highly likely to end up there
> > sooner than later.  There's a known use case for ARM (exit to userspace on missing
> > userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.
> > 
> > [*]https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com
> 
> I wonder how this CAP is supposed to be checked in userspace, for guest
> memfd case? 

It's basically useless for guest_memfd.

> 	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO) &&
> 	    run->exit_reason == KVM_EXIT_MEMORY_FAULT)
> 		abort("unexpected KVM_EXIT_MEMORY_FAULT");
> 
> In my implementation of QEMU patches, I find it's unnecessary. When
> userspace gets an exit with KVM_EXIT_MEMORY_FAULT, it implies
> "KVM_CAP_MEMORY_FAULT_INFO".
> 
> So I don't see how it is necessary in this series. Whether it's necessary or
> not for [*], I don't have the answer but we can leave the discussion to that
> patch series.

It's not strictly necessary there either.

However, Oliver felt (and presumably still feels) quite strongly, and I agree,
that neither reporting extra information shouldn't be tightly coupled to
KVM_CAP_EXIT_ON_MISSING or KVM_CAP_GUEST_MEMFD.

E.g. if userspace develops a "standalone" use case for KVM_CAP_MEMORY_FAULT_INFO,
userspace should be able to check for support without having to take a dependency
on KVM_CAP_GUEST_MEMFD, especially since because KVM_CAP_GUEST_MEMFD may not be
supported, i.e. userspace should be able to do:

	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO))
		abort("KVM_CAP_MEMORY_FAULT_INFO required for fancy feature XYZ");



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
