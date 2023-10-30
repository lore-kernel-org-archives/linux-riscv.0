Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD420C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=evQL3N+B56djeldI/bt6zp+lefebB6m/LcqvPv2Dorw=; b=GWXeNJBDp/sBSksgrm+9gC6q1Y
	Lqco7IQewqZaDAtDs6QgRZIWD5JjwHQ18hnn43S5kppZ1QvsQx5aT/X+G4jMC6YI46K5rke0Qd8H6
	VMN0bmzPpW4hGbLBax5YHhf4f1ERfFUywMY4HaAl5L9iUMGe2zJWzQe7wQR37BwbncWfQLxTMap0M
	YJ2hogVtsswINf1DApJ8+irO1isbYzVYMXnxkSzZNXcuHoRHjNsIp2zItMBy7vm95G8BqCS1Ey+6x
	F5hWb0uJMAz37qYfi17858DOOhagyX8mr/8d8KrJGGWZSaAUYrUzNr/WKB/Z0pZn6plbqxK8mQ4E0
	10znXqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxaUa-0047er-2x;
	Mon, 30 Oct 2023 22:12:16 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxaUX-0047d9-2l
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 22:12:15 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6b2018a11e2so5038137b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698703932; x=1699308732; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8DEvtikhnQyn+T5K55cZjm1cs6/IKtx/WCyiBBil5U=;
        b=F/siSCEIdYnFxGTDeSbz/y5gnYv4X51buZ9WzLV9O0LAUBVDkxXXYS1THKF6HlsxSv
         QG1IsiUiE4zzQ04R1cMT0Ib7grVRuC8E6ciSsypgaHoPAdLH53Za1LCF54piEqfgGF/4
         s+VMxb0FawY3UvE7lvhrdrTj6HFcmxxdvueHeokG2b60qifwYZ3KbqvoCz2CZccGSU49
         n898xozT6+vJsHAGvopQseuBjSwXApfdPGtb0R+Ax6XKX0esq3eTbd240AnKxXwchMRJ
         oQ7+7yNMChcdQF7WnadPdVE28b5RcQ91XrEeZvRvw1a5HA/+eBHqxvyBtLtvDvuW82T2
         6X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698703932; x=1699308732;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8DEvtikhnQyn+T5K55cZjm1cs6/IKtx/WCyiBBil5U=;
        b=k4Yw2mzpijvp/Dq60D7IbG15Q0KZ59Huo3rckersdZq3tE825CTdcnhegLmXXkVeSE
         P/34VEYoDfXKUyA7Sugv0B+GUB3n/ZfPUu49NlQExjtcUjuZ/orumhLme+szPbYy4wJe
         SPkYAB7yARWtaHlFNGAa5tZS3s1Jw8ldlE5npmlh//4IZyJfL/Q6hjAAUssBF6OXeSRb
         Ie0Vl6J9A1u3FmMBTAn9E78oc5o0Djp1LTmh+aPUdwMxWkN4kSNP6Zj+F5DEhSzrrWaz
         QtC0wMPlrCc+8FBgK86KXw17RSlW84Y17aEngYhdlPVXJnZIf14A004V5hs4WR9bg4BN
         1lGg==
X-Gm-Message-State: AOJu0Yy5n/GrRDQqb2Gz9wyB4VzEl/zWSPgELstJgghDW9j7p2MKunmm
	nizUEAFXOVKhxtNY9zQuWI/fZPtYZW4=
X-Google-Smtp-Source: AGHT+IGGcxVYGAYGv3uCrE8wHX1TR4p8IURd9gUNgfJNwa+fo9vdIR8HGGPD/6eLST5HVrX+Zf4WM1nECms=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1755:b0:68e:24fe:d9a with SMTP id
 j21-20020a056a00175500b0068e24fe0d9amr205380pfc.2.1698703932137; Mon, 30 Oct
 2023 15:12:12 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:12:10 -0700
In-Reply-To: <ZUARTvhpChFSGF9s@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com> <ZUARTvhpChFSGF9s@google.com>
Message-ID: <ZUAqOn_zjvM4hukK@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20231030_151213_898004_82BF89D4 
X-CRM114-Status: GOOD (  16.24  )
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
> On Mon, Oct 30, 2023, Paolo Bonzini wrote:
> > On 10/27/23 20:21, Sean Christopherson wrote:
> > > 
> > > +		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> > > +			size = sizeof(struct kvm_userspace_memory_region);
> > 
> > This also needs a memset(&mem, 0, sizeof(mem)), otherwise the out-of-bounds
> > access of the commit message becomes a kernel stack read.
> 
> Ouch.  There's some irony.  Might be worth doing memset(&mem, -1, sizeof(mem))
> though as '0' is a valid file descriptor and a valid file offset.
> 
> > Probably worth adding a check on valid flags here.
> 
> Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> what if we:
> 
>   1. Acquire/release slots_lock in __kvm_set_memory_region()

Gah, this won't work with x86's usage, which acquire slots_lock quite far away
from __kvm_set_memory_region() in several places.  The rest of the idea still
works, kvm_vm_ioctl_set_memory_region() will just need to take slots_lock manually.

>   2. Call kvm_set_memory_region() from x86 code for the internal memslots
>   3. Disallow *any* flags for internal memslots
>   4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
>   5. Pass @ioctl to kvm_vm_ioctl_set_memory_region() and allow KVM_MEM_PRIVATE
>      only for KVM_SET_USER_MEMORY_REGION2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
