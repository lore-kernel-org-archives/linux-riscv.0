Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A24CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 05:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PbbQSvRiUnwsZErULmGvvZpo2mSO8VfPpaPM9q6gaXI=; b=lV1bzdv6j30qcr
	TofGxf4ClBFrloGPTKPyUl6M+CWuDUYrqXVP9jrdpDFQDqMRbdi7AJLsg3BXKtyS3fTe/ZAbVpoiF
	el4HiAyOB/5Rz34nUzUzWXsWVt2TwTjGJdrdlOMi1xFqqVMiGzJrxnnanyDfO6KIT8443tvXiHBrf
	+rxACHBqKfF0DCW6763fZxsJp7KuyTkfieq4JowE6W4ZWEE/DTy450aRKbV37OTFjoggyby/foy+2
	braIRMnPJrYutVZNe8jSRmdQWCj1CvKa6CqG5arP2MjafpNhPxXNiYoxqNt/Kn022u9eJGWu4yhIk
	kRalazN2+fzeild5pkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuSV-00000004qcm-0sCY;
	Fri, 30 Aug 2024 05:46:07 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMk-00000004fjC-11ul
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:11 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e11cdb464f2so2299371276.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992564; x=1725597364; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RRTA1H5OtG+8qgMxGB5BU8t5Dbb6+roBouJjwlrdgk=;
        b=g/cY6GNfHjQGU82xxjE/xY2qz4eNPQw+RBMEPkZnbQ6xOJlm7Vwg4GrxQneZfkzbSf
         8aBxFiWrE8dad7REJpVHqnwFj7O1kv+5pGu93P6iEkkLxQdb2bEeTKfYgA1E0YRe5IcQ
         +PNPDwaiV892CMi+lnP7mT9QJWg5bE4CA+Ut7OUn/simwm2F9H9tqfqBrhrOMqwsMycj
         z/XqgFEHy7zrVf9bjrQ46UWVnJs/PeOhHZZ2wMPyhNFNM458S4c4ORZd2him3oEizVpW
         OJ7gHnCG/U9hVrhnGorJHPpKGI0e+nBHiseHMnq9id/S7pu1W3FI2Kq6r0rxJ6e3qBP5
         HO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992564; x=1725597364;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RRTA1H5OtG+8qgMxGB5BU8t5Dbb6+roBouJjwlrdgk=;
        b=QPhFcdH2S8MefwvUmnDbEXJiXLJ29I3X+MPg9A1suGy3mVLVhpOHSV6s1H6Cq2E4D9
         e9EdEZZLdN1gr/7LhL4OOXhx45aMdUYvs52oWeAImATXMrgXIMzvKlHmn4bbMf2EXe2t
         YvmoxGE3ZoW6Q5APcNQgE96dV8wvp6YqMQNOJ0306fMlz0n5sRnjTWWWXilfKUCkHCYP
         RIYvvANGp6sW9jLfAIjw16NugqWiFBNUiL75edGHtEMQmh/6H/InCluivSAHGEItK6dP
         0yJitIi2+fk3PhHYips9LensRuZxMdS/FClfxexGbFWi87f7Sn4EARg9C5dOIfbXGPJN
         dzqg==
X-Forwarded-Encrypted: i=1; AJvYcCVE8UIIL2fNEO4hm8JSfPJzYhRrJxoxcYzqMobyrEP9n8Skp5Nh64zLz0Yiq6AQe1QvFj1flTuI/O1fIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwOiSx4hJsK/0t8ndtLxx6CvLKRRjkhK9R8PhPwT2iGPT6UvQ
	DrgzkJa/mrD4bpN4NWZ37kGFbFR585yTHRzwnfPDquNNnj5ozM0Gq5bUJAzS8VdCEKB8fr3yHCj
	l7Q==
X-Google-Smtp-Source: AGHT+IG+hqynsJ7hdgdKV9gAtkROKS2qGVXayEmYSbfKtO5Jo9FgRfejcOxvLz+XMdzoh9wRJFEwtKQxRPs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:278a:0:b0:e0b:a712:2ceb with SMTP id
 3f1490d57ef6-e1a79ff35c5mr30969276.5.1724992564279; Thu, 29 Aug 2024 21:36:04
 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:50 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-1-seanjc@google.com>
Subject: [PATCH v4 00/10] KVM: Register cpuhp/syscore callbacks when enabling virt
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_213606_298586_17418DC2 
X-CRM114-Status: GOOD (  14.08  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Register KVM's cpuhp and syscore callbacks when enabling virtualization in
hardware, as the sole purpose of said callbacks is to disable and re-enable
virtualization as needed.

The primary motivation for this series is to simplify dealing with enabling
virtualization for Intel's TDX, which needs to enable virtualization
when kvm-intel.ko is loaded, i.e. long before the first VM is created.

That said, this is a nice cleanup on its own.  By registering the callbacks
on-demand, the callbacks themselves don't need to check kvm_usage_count,
because their very existence implies a non-zero count.

Patch 1 (re)adds a dedicated lock for kvm_usage_count.  Hopefully it's a
temporary lock, as we can likely fix the cpus_read_lock() vs. kvm_lock mess
for good by switching vm_list to an (S)RCU-protected list.

v4:
 - Collect more reviews.
 - Fix documentation for kvm_usage_lock. [Kai]
 - Add a blurb in locking.rst to call out that cpus_read_lock() vs kvm_lock is
   a general problem.
 - Add a paragraph in the locking patch to suggest switching vm_list to an
   (S)RCU-protected list, so that walkers don't need to take kvm_lock.
 - Add an example call chain for the other cpus_read_lock() vs kvm_lock issues
   that are lurking.
 - Enable the module param by default from the get-go. [Paolo]
 - Rename even more APIs/symbols (all of 'em I could find). [Paolo]
 - Clarify that it's the 0=>1 VM creation that's problematic, not simply the
   creation of the very first VM. [Paolo]
 - Document enable_virt_at_load, and call out the (dis)advantages of enabling
   virtualization when KVM is loaded.
 - Drop the WARN on kvm_usage_count being elevated at the end of
   kvm_uninit_virtualization(), as it's annoyingly difficult to keep the WARN
   and still allow arch code (i.e. TDX) to enable virtualization during setup.

v3:
 - https://lore.kernel.org/all/20240608000639.3295768-1-seanjc@google.com
 - Collect reviews/acks.
 - Switch to kvm_usage_lock in a dedicated patch, Cc'd for stable@. [Chao]
 - Enable virt at load by default. [Chao]
 - Add comments to document how kvm_arch_{en,dis}able_virtualization() fit
   into the overall flow. [Kai]

v2:
 - https://lore.kernel.org/all/20240522022827.1690416-1-seanjc@google.com
 - Use a dedicated mutex to avoid lock inversion issues between kvm_lock and
   the cpuhp lock.
 - Register emergency disable callbacks on-demand. [Kai]
 - Drop an unintended s/junk/ign rename. [Kai]
 - Decrement kvm_usage_count on failure. [Chao]

v1: https://lore.kernel.org/all/20240425233951.3344485-1-seanjc@google.com

Sean Christopherson (10):
  KVM: Use dedicated mutex to protect kvm_usage_count to avoid deadlock
  KVM: Register cpuhp and syscore callbacks when enabling hardware
  KVM: Rename symbols related to enabling virtualization hardware
  KVM: Rename arch hooks related to per-CPU virtualization enabling
  KVM: MIPS: Rename virtualization {en,dis}abling APIs to match common
    KVM
  KVM: x86: Rename virtualization {en,dis}abling APIs to match common
    KVM
  KVM: Add a module param to allow enabling virtualization when KVM is
    loaded
  KVM: Add arch hooks for enabling/disabling virtualization
  x86/reboot: Unconditionally define cpu_emergency_virt_cb typedef
  KVM: x86: Register "emergency disable" callbacks when virt is enabled

 .../admin-guide/kernel-parameters.txt         |  17 ++
 Documentation/virt/kvm/locking.rst            |  31 +-
 arch/arm64/kvm/arm.c                          |   6 +-
 arch/loongarch/kvm/main.c                     |   4 +-
 arch/mips/include/asm/kvm_host.h              |   4 +-
 arch/mips/kvm/mips.c                          |   8 +-
 arch/mips/kvm/vz.c                            |   8 +-
 arch/riscv/kvm/main.c                         |   4 +-
 arch/x86/include/asm/kvm-x86-ops.h            |   4 +-
 arch/x86/include/asm/kvm_host.h               |   7 +-
 arch/x86/include/asm/reboot.h                 |   2 +-
 arch/x86/kvm/svm/svm.c                        |  19 +-
 arch/x86/kvm/vmx/main.c                       |   6 +-
 arch/x86/kvm/vmx/vmx.c                        |  10 +-
 arch/x86/kvm/vmx/x86_ops.h                    |   5 +-
 arch/x86/kvm/x86.c                            |  26 +-
 include/linux/kvm_host.h                      |  18 +-
 virt/kvm/kvm_main.c                           | 270 +++++++++---------
 18 files changed, 251 insertions(+), 198 deletions(-)


base-commit: 15e1c3d65975524c5c792fcd59f7d89f00402261
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
