Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD759EEAA7B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 23:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ErVLot+QPk+G/ToY9DZe/5ZvLcQ8kpn4nDcbnq+Jvwc=; b=jrN88U1YhQGPA7j+tuKwvuTeGO
	eOluGHxzeSBd3Ue73eRsgHASvqs9GZhjuTVQ0slEMW90C4wlEgmay2R8ALwcLqb5qNfdBBikWuuW3
	WETl/NsYdlWcgouVwwpPiKMH9OkMUfsBucd4mVat9Gmx83gN+NzHJUk+ifdfcLemNxjfr9XNgJUW7
	iBnj4TwpHae8uJw4PjoInmHYhppIuD3VA/6dnhHP/payektWp+FNW3K+mGAArvY3X28aS6D2rD1xV
	Kg9PkdWd4CVFdzn6mQLHagnj/KXaGf1JAkr5KSjPK1A8uHsL2GwUZMfSLOPsW5h/suwe6ifmUGgYw
	PluCCdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgvcd-009QCt-0y;
	Thu, 14 Sep 2023 23:19:43 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgvcZ-009QAs-0B
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 23:19:40 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7e8bb74b59so1856876276.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694733577; x=1695338377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dPufiPQCtPzWz5WHSfvhHWIcWm8zH/JZg221REQo40=;
        b=bYb5r0XwfeQPzCBy+svXi19tZEnBN1mmeHfN45/Kit3fIIhB7vsXaHV8ZZWnT62txM
         rRtJuxI+52+wQR0rUdbqy5ditVyhZTFodfjHqBYtQAb217M8kos9mYkGpbWXwkFEN++0
         WHZ0+jCZ1buaEX+r+Y8dUVCDgOsvTsIWAiPDRGHb/aroSusSSuQNI1jYqSAEzN3txF9+
         AST8sfAq1EipU4bFYmEiQ9TEG3skd1IeFlw2NnnZU7f8YkBRNQXlpZc7/DgTJE3EJVPG
         m+CHTwmpcIPDKTNeMxGha5Oi+6y7sD4yqHk3ATsM3COmdRb1aouuynGDmpad8lfj2BIp
         ugVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694733577; x=1695338377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dPufiPQCtPzWz5WHSfvhHWIcWm8zH/JZg221REQo40=;
        b=N9jIU/PahxrcDJK+wtPVvN+SdKoRfHb+75l9hIMTAWeVmeiq8wBRvH26aKRsctM/2J
         +CeI98vDX7pqZVkzYYHgKJqysDeVk4A/FgVeOS7//8jllJO0i04BusVoNeeDhFN7Y+7f
         4svwCpLJYHHOw2UhvtHt2hGSye9Rbp5V4gnduU7/H+GZgve3QoP0jl716TpVbRwcqupA
         hofmDpLs8+j6OIWhcnWI35NDv10z4zgVFLkK1xX8AICCoIpF5uYz7CiO7o6jU/RCw5AN
         qqvLWGvnCm/Ot/jaXuWDqjbtbcSqt354YXWjN+vcUVo5D1SHUzVFRRKz/8q/zhXyp5he
         H6Ug==
X-Gm-Message-State: AOJu0YzIn/pdRgmeLXtRxe0TeFjyn5cIrZYDIzA8lJnlKBLsusUfEsWk
	Qm+wIlKjdDvHKd4sASKc7Xb7Qq4f2U34lgza0Q==
X-Google-Smtp-Source: AGHT+IGXEzZPfzBJslkSHoMTui4zDBSgnXtUGummxt07D80J/zY1rCAlKy2IgGo0zSECxNr/ULgwmLbLuPQoPz0S1A==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:aa83:0:b0:d77:984e:c770 with SMTP
 id t3-20020a25aa83000000b00d77984ec770mr158034ybi.5.1694733576882; Thu, 14
 Sep 2023 16:19:36 -0700 (PDT)
Date: Thu, 14 Sep 2023 23:19:34 +0000
In-Reply-To: <ZQNN2AyDJ8dF0/6D@google.com>
Mime-Version: 1.0
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
 <ZQNN2AyDJ8dF0/6D@google.com>
Message-ID: <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	willy@infradead.org, akpm@linux-foundation.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_161939_137134_887C821B 
X-CRM114-Status: GOOD (  40.62  )
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

> On Mon, Aug 28, 2023, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
>> >> be independent of the refcounting method. What do you think?
>> >
>> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
>> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
>> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
>> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
>> > objects per HKID too.
>> >
>> > The current SEV use case is for the migration helper, where two KVM objects share
>> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
>> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
>> > that means multiple struct kvm objects being associated with a single HKID.
>> >
>> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
>> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
>> > machine has been destroyed.
>> >
>> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
>> > but not always, is associated 1:1 with a virtual machine.
>> >
>> > And FWIW, stashing the pointer without holding a reference would not be a complete
>> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
>> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
>> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
>> > check.
>> 
>> I agree that inode (physical memory) is coupled to the virtual machine
>> as a more generic concept.
>> 
>> I was hoping that in the absence of CC hardware providing a HKID/ASID,
>> the struct kvm pointer could act as a representation of the "virtual
>> machine". You're definitely right that KVM could reuse a pointer and so
>> that idea doesn't stand.
>> 
>> I thought about generating UUIDs to represent "virtual machines" in the
>> absence of CC hardware, and this UUID could be transferred during
>> intra-host migration, but this still doesn't take host userspace out of
>> the TCB. A malicious host VMM could just use the migration ioctl to copy
>> the UUID to a malicious dumper VM, which would then pass checks with a
>> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
>> because the memory is encrypted; with UUIDs there's no memory
>> encryption.
>
> I don't understand what problem you're trying to solve.  I don't see a need to
> provide a single concrete representation/definition of a "virtual machine".  E.g.
> there's no need for a formal definition to securely perform intrahost migration,
> KVM just needs to ensure that the migration doesn't compromise guest security,
> functionality, etc.
>
> That gets a lot more complex if the target KVM instance (module, not "struct kvm")
> is a different KVM, e.g. when migrating to a different host.  Then there needs to
> be a way to attest that the target is trusted and whatnot, but that still doesn't
> require there to be a formal definition of a "virtual machine".
>
>> Circling back to the original topic, was associating the file with
>> struct kvm at gmem file creation time meant to constrain the use of the
>> gmem file to one struct kvm, or one virtual machine, or something else?
>
> It's meant to keep things as simple as possible (relatively speaking).  A 1:1
> association between a KVM instance and a gmem instance means we don't have to
> worry about the edge cases and oddities I pointed out earlier in this thread.
>

I looked through this thread again and re-read the edge cases and
oddities that was pointed out earlier (last paragraph at [1]) and I
think I understand better, and I have just one last clarification.

It was previously mentioned that binding on creation time simplifies the
lifecycle of memory:

"(a) prevent a different VM from *ever* binding to the gmem instance" [1]

Does this actually mean

"prevent a different struct kvm from *ever* binding to this gmem file"

?

If so, then binding on creation

+ Makes the gmem *file* (and just not the bindings xarray) the binding
  between struct kvm and the file.
+ Simplifies the KVM-userspace contract to "this gmem file can only be
  used with this struct kvm"

Binding on creation doesn't offer any way to block the contents of the
inode from being used with another "virtual machine" though, since we
can have more than one gmem file pointing to the same inode, and the
other gmem file is associated with another struct kvm. (And a strut kvm
isn't associated 1:1 with a virtual machine [2])

The point about an inode needing to be coupled to a virtual machine as a
thing [2] led me to try to find a single concrete representation of a
"virtual machine".

Is locking inode contents to a "virtual machine" outside the scope of
gmem? If so, then it is fine to bind on creation time, use a VM ioctl
over a system ioctl, and the method of refcounting in gmem v12 is okay.

[1] https://lore.kernel.org/lkml/ZNKv9ul2I7A4V7IF@google.com/
[2] https://lore.kernel.org/lkml/ZOO782YGRY0YMuPu@google.com/

> <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
