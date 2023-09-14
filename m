Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946A0EEAA62
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YXP9DtVGcXGqMpQD1JccI7oU0CtDM69Us8aTFGZFP9E=; b=BalG7IjDR/qtCpjwgX/vXHgkLx
	+Fgd5vUKAMxKWTD4GpCyGK/5P4oHRbwvsEkjhBHgxtcJWlmpPcpduoknKo7nx1TLNh38bOOc0Fsv7
	iEGO93Ig5YmoNp459Fm1zF0FWSUrt5vYfOmgu7hznerQaarAyVlcUxtdAalfN5lRRkjrykLA3oNWR
	Fz00gRSNBl4vVBr49Wfivuk7Dx9zsli3JpxbCq9fNRoprAptg2NfPE5+7UJhGe1MydiAF8DZCMTBf
	WeoUmBzF5SxXVLsd+RXBQt/enfrP8MxVGlcWJV0+T8UCrv46RKr5aVnxhCw7hoRRZXPVaISliUEWj
	iy4Mgwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrlG-0098sQ-2m;
	Thu, 14 Sep 2023 19:12:22 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrlD-0098q0-1R
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 19:12:20 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d818fb959f4so1324249276.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694718736; x=1695323536; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYBWSie1WcKieNCkM5oJg6niwnE6sJx6iHmmYDkBNI4=;
        b=ICEhhwa283lfBEiqk5qreh+SBa2UgkFjALQF5bQIiWFvMn6ILMHYYYesEwbBQomnP4
         x/iP36NJe6gg+vOeUGGA7CEFiUi8pLzkakUne3JLDBgR0aDSsd5v+SmwlLSAejfgZ6MX
         c9/ZVVkiamwGTWh0vf5wiM7SPQTqhlBj81kx+X/4yQtc1NsU7V7U9SIU/+ICMzOsKB20
         o7q6F3KkSVb60Ut1n1uvc9Ih1z6d82iTga16MWJeCab9AAdtVXNaLXxBGwiEdYEekXC7
         EvXuvHjEgBDEIFlXoROKDIbD5TsAOCjVntxestc9vSMHr0z9LbjS9F5S/DRUhP0s0J1S
         0Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694718736; x=1695323536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYBWSie1WcKieNCkM5oJg6niwnE6sJx6iHmmYDkBNI4=;
        b=WfJu8/AFSjZc598dcbwK+50LGmXAlARIInDZT9hUEPu05aaMQWrBXYQbkjzv3/AwLv
         NerkfoMsCtZNS+jxgmwdzJM7Tcwyr2RfdoEPqzpRZj+JQeFr28FX/f5xHlJfxmECkuL5
         HL+PrdCiEd0vqorzYTacdaJXYub4BORvFNUSAxnqZUrvYp81h7xE4yIGzra/SVwINN5q
         ib6GJz9TJ7FOl3RAZ++pyDmds3PKagUcgVyNU+zW9edFGWcsrSNteC8AnvOhBO01bgTS
         wTHq1+Zdx3ejg4TDJgTdRCJBkVwuiZMn79VMUS42ArbNCMPscstlI3qa3xidB9Yjmu1s
         hFFA==
X-Gm-Message-State: AOJu0YwPbgDmYSXxjlwMEj4rk1ZLSmDoWorPCEHwZDfotMhezJs+m5m6
	Mi/OWKZBwK+bjlmt+x2EldWK+B4q9GY=
X-Google-Smtp-Source: AGHT+IEbiNaBi+bbmiwHYIoXYm8wvREABvNIqLAChDCxgGMZnU/PhXOjKBEoc76witsZv+IRa9HvnC8Otog=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:bc7:0:b0:d77:fb4e:d85e with SMTP id
 190-20020a250bc7000000b00d77fb4ed85emr138869ybl.6.1694718735743; Thu, 14 Sep
 2023 12:12:15 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:12:14 -0700
In-Reply-To: <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Mime-Version: 1.0
References: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com> <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Message-ID: <ZQNbDt6vqwC4gZmi@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Ackerley Tng <ackerleytng@google.com>, pbonzini@redhat.com, maz@kernel.org, 
	oliver.upton@linux.dev, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, willy@infradead.org, akpm@linux-foundation.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20230914_121219_490162_60258478 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, Aug 28, 2023, Elliot Berman wrote:
> I had a 3rd question that's related to how to wire the gmem up to a virtual
> machine:
> 
> I learned of a usecase to implement copy-on-write for gmem. The premise
> would be to have a "golden copy" of the memory that multiple virtual
> machines can map in as RO. If a virtual machine tries to write to those
> pages, they get copied to a virtual machine-specific page that isn't shared
> with other VMs. How do we track those pages?

The answer is going to be gunyah specific, because gmem itself isn't designed to
provide a virtualization layer ("virtual" in the virtual memory sense, not in the
virtual machine sense).  Like any other CoW implementation, the RO page would need
to be copied to a different physical page, and whatever layer translates gfns
to physical pages would need to be updated.  E.g. in gmem terms, allocate a new
gmem page/instance and update the gfn=>gmem[offset] translation in KVM/gunyah.

For VMA-based memory, that translation happens in the primary MMU, and is largely
transparent to KVM (or any other secondary MMU).  E.g. the primary MMU works with
the backing store (if necessary) to allocate a new page and do the copy, notifies
secondary MMUs, zaps the old PTE(s), and then installs the new PTE(s).  KVM/gunyah
just needs to react to the mmu_notifier event, e.g. zap secondary MMU PTEs, and
then KVM/gunyah naturally gets the new, writable page/PTE when following the host
virtual address, e.g. via gup().

The downside of eliminating the middle-man (primary MMU) from gmem is that the
"owner" (KVM or gunyah) is now responsible for these types of operations.  For some
things, e.g. page migration, it's actually easier in some ways, but for CoW it's
quite a bit more work for KVM/gunyah because KVM/gunyah now needs to do things
that were previously handled by the primary MMU.

In KVM, assuming no additional support in KVM, doing CoW would mean modifying
memslots to redirect the gfn from the RO page to the writable page.  For a variety
of reasons, that would be _extremely_ expensive in KVM, but still possible.  If
there were a strong use case for supporting CoW with KVM+gmem, then I suspect that
we'd probably implement new KVM uAPI of some form to provide reasonable performance.

But I highly doubt we'll ever do that, because one of core tenets of KVM+gmem is
to isolate guest memory from the rest of the world, and especially from host
userspace, and that just doesn't mesh well with CoW'd memory being shared across
multiple VMs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
