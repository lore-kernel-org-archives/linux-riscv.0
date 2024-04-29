Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA97C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NPhvctW9qa+RrA/DKldc84vXc54YefP0jOzDQMbBgRw=; b=SL7ApOdauh23uoXRwFJX6ZosI/
	7PMDxr0GMd95HJiJebLbtKwhkR8gzmEaxmVltUMz8u9cbDMklVhR4RMyFu+VzlUNXatqSQKZp8li7
	fhroge2QOc9USlJeJcE55/8V2zD2WvioOwL3+2dLQrxraStVYPYUfHV/wscrnw2P3S+RJKB/iVLp8
	8X4H7V3a4n5egg3WIQ3EuRFA0uG//C2bYuLPsyZ/aNJpQmP9HW9c8TPdJKXiVv1uLQ8K8Hbl/oviF
	gx2e+fUylf1EaMMboSWp/z0qcc64knLzHPEKy4QUe7oa20gWmWWRrboLyfs+TXwTCX7TjRzmSySRH
	3rMCK8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Y8m-00000004Dem-3Nkm;
	Mon, 29 Apr 2024 21:02:24 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Y8j-00000004Dcj-0Z9F
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 21:02:22 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5dbddee3694so3067127a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714424538; x=1715029338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uDJDJTdqMi/qWILeG2gkRWiCPiQQS9JXQ1eVQSPrTY=;
        b=HGxoVVSZLqDpppmmAd0kmBRYHXOWtL14b7/U363VL27cZrOLo1me2au9r386W2JAmc
         ff4YDRmq+OEKAtMLRvF7AI+O1aPXlO/t/7rhsm4fPu3LcJgk4x/RP2A+mmhu5W2zaI0h
         T/TVwQglVMSLDVgIts7l0JIhP2HQS0nys2aqbbmTVjQIBqhEUUl1XGNyxyejzot90POJ
         aBc8uyYj3Y2pZzQ8SdEbtJ9F7k1JejIetNtMSrvUK9Z1CsiJgG7A/V23b8mdLyk56W0S
         is9TWnrdZovABN2zafTA8oovju1DivQsSqMx3nlZladoICy0burz/yKJiQwRBZXrK3y/
         winw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714424538; x=1715029338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uDJDJTdqMi/qWILeG2gkRWiCPiQQS9JXQ1eVQSPrTY=;
        b=gFNnqeQJ/BZdLC3xHb3ZlMFOlMP5kEqyxGhJ41HvIkxr/AUjWMgLjTfybyhWj/zF7O
         /fdf0nJDnG0s1yNGOpE1UDAvmbwsqq0GL+CXHd/51rpDozBY9XBwij/2t7vj/p3qkvX9
         5B/6JEVktlASvQR2Kq5Bu7O9xwb8alGe7V5+i6mi7n5D6IoL7Giv7W90yAOcMsHLoG7i
         tEJU6fPT5ODNq9F4FYwcbx2aMjCS49FEIujo070VagpAm+hBls6VtkrFi/2rMeN1Jkoj
         If7h2VVN6Y6mHRa+VSapatwHnR6CKRCwWel9iRRJ14dygXaIBzxd9rWWdXEkHxQh62Z6
         ziZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMj4J44BocPcMSbv8w1yc0xHUwzGyEDMc85eeiIo4vYGNy482kqXM+OVeVYvxu+Z/EADeMCdpdD6T1m9SF0QfR4XyIMSDhYVNsxkjmTDIi
X-Gm-Message-State: AOJu0Yy+G9uu45rtncniWR818mxFsWKdKHxvaPmd4zIJXTqyZAIcea2s
	ySM3e5acfj31VrhXIhvHnzbp5xVkfqzCOYBjHs/T3Kd4UxmC9al0XJjeXg8h0Ij0jAuM+di0GnV
	YMg==
X-Google-Smtp-Source: AGHT+IHjxlO7BGwfLpJTaM2K2yepr+Df3RVVAMz1TW/z+nRfFSnOvH5P7k7vUxx/UM3fHPC+zECxCajQyZo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3d84:0:b0:5f4:246c:1406 with SMTP id
 k126-20020a633d84000000b005f4246c1406mr2059pga.3.1714424538307; Mon, 29 Apr
 2024 14:02:18 -0700 (PDT)
Date: Mon, 29 Apr 2024 13:45:21 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <171442343194.161918.3828509492626949358.b4-ty@google.com>
Subject: Re: [PATCH 00/18] KVM: selftests: Clean up x86's DT initialization
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_140221_186565_893F01FE 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On Thu, 14 Mar 2024 16:26:19 -0700, Sean Christopherson wrote:
> The vast majority of this series is x86 specific, and aims to clean up the
> core library's handling of descriptor tables and segments.  Currently, the
> library (a) waits until vCPUs are created to allocate per-VM assets, and
> (b) forces tests to opt-in to allocate the structures needed to handler
> exceptions, which has result in some rather odd tests, and makes it
> unnecessarily difficult to debug unexpected exceptions.
> 
> [...]

Applied to kvm-x86 selftests_utils (I had already pushed stuff to "selftests",
so the name is less than awesome).

Other KVM maintainers, I also created tags/kvm-x86-selftests-utils if you want
to pull this into your tree to avoid later merge conflicts with the
kvm_util_base.h => kvm_util.h rename.  I don't expect to push anything else to
the branch, but never say never. 

Note, this branch+tag also has the _GNU_SOURCE change, and the global pseudo-RNG
series ("thank yous" incoming), i.e. it's hopefuly a one stop shop for all your
6.10 selftests needs!

[01/18] Revert "kvm: selftests: move base kvm_util.h declarations to kvm_util_base.h"
        https://github.com/kvm-x86/linux/commit/2b7deea3ec7c
[02/18] KVM: sefltests: Add kvm_util_types.h to hold common types, e.g. vm_vaddr_t
        https://github.com/kvm-x86/linux/commit/f54884f93898
[03/18] KVM: selftests: Move GDT, IDT, and TSS fields to x86's kvm_vm_arch
        https://github.com/kvm-x86/linux/commit/3a085fbf8228
[04/18] KVM: selftests: Fix off-by-one initialization of GDT limit
        https://github.com/kvm-x86/linux/commit/0d95817e0753
[05/18] KVM: selftests: Move platform_info_test's main assert into guest code
        https://github.com/kvm-x86/linux/commit/53635ec253c0
[06/18] KVM: selftests: Rework platform_info_test to actually verify #GP
        https://github.com/kvm-x86/linux/commit/dec79eab2b48
[07/18] KVM: selftests: Explicitly clobber the IDT in the "delete memslot" testcase
        https://github.com/kvm-x86/linux/commit/61c3cffd4cbf
[08/18] KVM: selftests: Move x86's descriptor table helpers "up" in processor.c
        https://github.com/kvm-x86/linux/commit/b62c32c532cd
[09/18] KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
        https://github.com/kvm-x86/linux/commit/d8c63805e4e5
[10/18] KVM: selftests: Init IDT and exception handlers for all VMs/vCPUs on x86
        https://github.com/kvm-x86/linux/commit/c1b9793b45d5
[11/18] KVM: selftests: Map x86's exception_handlers at VM creation, not vCPU setup
        https://github.com/kvm-x86/linux/commit/44c93b277269
[12/18] KVM: selftests: Allocate x86's GDT during VM creation
        https://github.com/kvm-x86/linux/commit/2a511ca99493
[13/18] KVM: selftests: Drop superfluous switch() on vm->mode in vcpu_init_sregs()
        https://github.com/kvm-x86/linux/commit/1051e29cb915
[14/18] KVM: selftests: Fold x86's descriptor tables helpers into vcpu_init_sregs()
        https://github.com/kvm-x86/linux/commit/23ef21f58cf8
[15/18] KVM: selftests: Allocate x86's TSS at VM creation
        https://github.com/kvm-x86/linux/commit/a2834e6e0b98
[16/18] KVM: selftests: Add macro for TSS selector, rename up code/data macros
        https://github.com/kvm-x86/linux/commit/f18ef97fc602
[17/18] KVM: selftests: Init x86's segments during VM creation
        https://github.com/kvm-x86/linux/commit/0f53a0245068
[18/18] KVM: selftests: Drop @selector from segment helpers
        https://github.com/kvm-x86/linux/commit/b093f87fd195

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
