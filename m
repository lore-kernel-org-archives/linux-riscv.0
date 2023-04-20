Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E944EC77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=erWR4ZfOOJyb33sYzinjYHwZEiSRqJqB6xjiS+BGVwI=; b=t1fBrncSmzlNhhmXT32VvJ1QhJ
	OCis78KuJUynaKYSpdEBUGNeTCrwonpK28MK0yH3gAwhNQguxX02xUcN8Rj54U52fNxXuvop/xQb7
	yuYaVxc1xzo05KQGvsFkCDQ3U0QzO7b15zUtCUHhpZIqq6lGudMzg7obe9T5XHDaM/UMjAWZ0u7ck
	kL0JwACW3uQdOnpR/10BQzOGa2HmRfA6Qtctsla29D1QlTqxOX1VeEyKb0iCPhvcfifGWrCpmsrbI
	k6Qj4NuoLn44LGr0rJcdXOMYfpAK+LTz8zyqojiQEQDWI/Ncoes+VJOT6H32bWvABizpvDAZ3J8v1
	KkhBvpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppXB7-008Y04-11;
	Thu, 20 Apr 2023 16:30:37 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppXB2-008XxD-1M
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 16:30:35 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1a52649285bso8930025ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682008231; x=1684600231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iuRee1QypTQZKXl0Ba92BIJVB1syFZT2hDTjYd+QOu0=;
        b=xsdAX4QP18io7Q14j+sXDfKxXWzCBe26O67EEA66IxfIS/8q2flLf9bLpR4Ty2pCSg
         SWEzc7bfmxxWoDPY3ZAeQnylHRhvU2dunlBCLpk5wasFsFVxROxVvFn1UYeuv+w3AyPw
         geWJT6S9CU69DZyFzIkS6eaz87U/r9Arw28+RfRnOiwVk8SCG0YVWtXIF6+DGOUwwmBO
         i3ysWcWrHB2oO0Y99eIgGUqJZVy/+1bYFJTczZfYFaafqiXAjoX+0D9ml3VR9KqkR3vB
         Zj0m/1JdP41uNpNyDFv6R0a5aVt539CPhUroGtVNGUjeGi2UCaxG8H1u85tL6+EDZhgC
         xhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682008231; x=1684600231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuRee1QypTQZKXl0Ba92BIJVB1syFZT2hDTjYd+QOu0=;
        b=XBJn29LgSj46+KkskTHrsihYrj1xpwxtMlUx2qRzCb8+n6Is2hc7bAQJkCDKalCDyL
         U/6X01NDalJ9zfZGOb6VHx/w7nmsGkAyr932wf53l2n6lpiNha+qFTTGqgWdJSWd+pWO
         CTf7t/WjE8TVMAuw9yJ2gWVjssiF1XnMLPvdm9yRUAg/n3BagHUw8hyPG8+J39ON/ZfF
         /kcbjvi2cPnqJg78sNDIz/Upa2nfcITVEUbObq716Z9QXbcsMUVRih4tDOc4ilXjsJ2v
         OqffgSPWMrx4J5izqMEft8d7ZuBYid57wc94aS0zMx+BLLYh4j93kDMN2q2Vp+xdyE06
         UTCg==
X-Gm-Message-State: AAQBX9fnVPa0JYJtYUGf/i0wqYkd4VwzpVALT+N7xNWUi/sGl16jelO1
	P9Gd5rSqX3gu4mYemB1xan+R4inZdn8=
X-Google-Smtp-Source: AKy350bG5XxutuL1YWXYB6O6lYpygFxMjScQrACRWWOAwwrWocyrTBgqNbf4ffJRIfKXzMJNG2svVwTCXq0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ab89:b0:1a6:8d3b:85e7 with SMTP id
 f9-20020a170902ab8900b001a68d3b85e7mr779019plr.3.1682008230658; Thu, 20 Apr
 2023 09:30:30 -0700 (PDT)
Date: Thu, 20 Apr 2023 09:30:29 -0700
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
Mime-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <ZEFopfs5Ij/AIkee@google.com>
Subject: Re: [RFC 00/48] RISC-V CoVE support
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	"=?iso-8859-1?Q?Bj=F6rn_T=F6pel?=" <bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_093032_459624_E4AB1A0D 
X-CRM114-Status: GOOD (  23.84  )
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

On Wed, Apr 19, 2023, Atish Patra wrote:
> 2. Lazy gstage page allocation vs upfront allocation with page pool.
> Currently, all gstage mappings happen at runtime during the fault. This is expensive
> as we need to convert that page to confidential memory as well. A page pool framework
> may be a better choice which can hold all the confidential pages which can be
> pre-allocated upfront. A generic page pool infrastructure may benefit other CC solutions ?

I'm sorry, what?  Do y'all really not pay any attention to what is happening
outside of the RISC-V world?

We, where "we" is KVM x86 and ARM, with folks contributing from 5+ companines,
have been working on this problem for going on three *years*.  And that's just
from the first public posting[1], there have been discussions about how to approach
this for even longer.  There have been multiple related presentations at KVM Forum,
something like 4 or 5 just at KVM Forum 2022 alone.

Patch 1 says "This patch is based on pkvm patches", so clearly you are at least
aware that there is other work going on in this space.

At a very quick glance, this series is suffers from all of the same flaws that SNP,
TDX, and pKVM have encountered.  E.g. assuming guest memory is backed by struct page
memory, relying on pinning to solve all problems (hint, it doesn't), and so on and
so forth.

And to make things worse, this series is riddled with bugs.  E.g. patch 19 alone
manages to squeeze in multiple fatal bugs in five new lines of code: deadlock due
to not releasing mmap_lock on failure, failure to correcty handle MOVE, failure to
handle DELETE at all, failure to honor (or reject) READONLY, and probably several
others.

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 4b0f09e..63889d9 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -499,6 +499,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,

        mmap_read_lock(current->mm);

+       if (is_cove_vm(kvm)) {
+               ret = kvm_riscv_cove_vm_add_memreg(kvm, base_gpa, size);
+               if (ret)
+                       return ret;
+       }
        /*
         * A memory region could potentially cover multiple VMAs, and
         * any holes between them, so iterate over all of them to find

I get that this is an RFC, but for a series of this size, operating in an area that
is under heavy development by multiple other architectures, to have a diffstat that
shows _zero_ changes to common KVM is simply unacceptable.

Please, go look at restrictedmem[2] and work on building CoVE support on top of
that.  If the current proposal doesn't fit CoVE's needs, then we need to know _before_
all of that code gets merged.

[1] https://lore.kernel.org/linux-mm/20200522125214.31348-1-kirill.shutemov@linux.intel.com
[2] https://lkml.kernel.org/r/20221202061347.1070246-1-chao.p.peng%40linux.intel.com

> arch/riscv/Kbuild                       |    2 +
> arch/riscv/Kconfig                      |   27 +
> arch/riscv/cove/Makefile                |    2 +
> arch/riscv/cove/core.c                  |   40 +
> arch/riscv/cove/cove_guest_sbi.c        |  109 +++
> arch/riscv/include/asm/cove.h           |   27 +
> arch/riscv/include/asm/covg_sbi.h       |   38 +
> arch/riscv/include/asm/csr.h            |    2 +
> arch/riscv/include/asm/kvm_cove.h       |  206 +++++
> arch/riscv/include/asm/kvm_cove_sbi.h   |  101 +++
> arch/riscv/include/asm/kvm_host.h       |   10 +-
> arch/riscv/include/asm/kvm_vcpu_sbi.h   |    3 +
> arch/riscv/include/asm/mem_encrypt.h    |   26 +
> arch/riscv/include/asm/sbi.h            |  107 +++
> arch/riscv/include/uapi/asm/kvm.h       |   17 +
> arch/riscv/kernel/irq.c                 |   12 +
> arch/riscv/kernel/setup.c               |    2 +
> arch/riscv/kvm/Makefile                 |    1 +
> arch/riscv/kvm/aia.c                    |  101 ++-
> arch/riscv/kvm/aia_device.c             |   41 +-
> arch/riscv/kvm/aia_imsic.c              |  127 ++-
> arch/riscv/kvm/cove.c                   | 1005 +++++++++++++++++++++++
> arch/riscv/kvm/cove_sbi.c               |  490 +++++++++++
> arch/riscv/kvm/main.c                   |   30 +-
> arch/riscv/kvm/mmu.c                    |   45 +-
> arch/riscv/kvm/tlb.c                    |   11 +-
> arch/riscv/kvm/vcpu.c                   |   69 +-
> arch/riscv/kvm/vcpu_exit.c              |   34 +-
> arch/riscv/kvm/vcpu_insn.c              |  115 ++-
> arch/riscv/kvm/vcpu_sbi.c               |   16 +
> arch/riscv/kvm/vcpu_sbi_covg.c          |  232 ++++++
> arch/riscv/kvm/vcpu_timer.c             |   26 +-
> arch/riscv/kvm/vm.c                     |   34 +-
> arch/riscv/kvm/vmid.c                   |   17 +-
> arch/riscv/mm/Makefile                  |    3 +
> arch/riscv/mm/init.c                    |   17 +-
> arch/riscv/mm/ioremap.c                 |   45 +
> arch/riscv/mm/mem_encrypt.c             |   61 ++
> drivers/tty/hvc/hvc_riscv_sbi.c         |    5 +
> drivers/tty/serial/earlycon-riscv-sbi.c |   51 +-
> include/uapi/linux/kvm.h                |    8 +
> mm/vmalloc.c                            |   16 +
> 42 files changed, 3222 insertions(+), 109 deletions(-)
> create mode 100644 arch/riscv/cove/Makefile
> create mode 100644 arch/riscv/cove/core.c
> create mode 100644 arch/riscv/cove/cove_guest_sbi.c
> create mode 100644 arch/riscv/include/asm/cove.h
> create mode 100644 arch/riscv/include/asm/covg_sbi.h
> create mode 100644 arch/riscv/include/asm/kvm_cove.h
> create mode 100644 arch/riscv/include/asm/kvm_cove_sbi.h
> create mode 100644 arch/riscv/include/asm/mem_encrypt.h
> create mode 100644 arch/riscv/kvm/cove.c
> create mode 100644 arch/riscv/kvm/cove_sbi.c
> create mode 100644 arch/riscv/kvm/vcpu_sbi_covg.c
> create mode 100644 arch/riscv/mm/ioremap.c
> create mode 100644 arch/riscv/mm/mem_encrypt.c
> 
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
