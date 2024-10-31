Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF765D767FA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QC9yXVgmV3wmLK8IRZkRNUZQueTp4oSoEgvI+V+l9G0=; b=qlvKLz/73Hj5bO8Q4FUzMHnPyp
	Kg9K3vW0UoTUG/cCErP/I8SR3jt0W5+QE2WM8St0ASfSYNtSADVuM0H7b/HaeIWDbIUxvl0ouBktV
	CP6Zc8+gM2AayrMQ+CKX4kRWpq8Rv96Sv8WOBMHj8K2GULLhJcCzQqG5J8kwMe6gE1aG+4zRzPrlS
	l0FRhJ7mgiWERaRZyzAnyGn9K14pYKT8DKw600IxNTiQrL0hHmSqkf30W5Gw508djyRPT3dsEF7hL
	uwMev5mYVZ9qJzEYC5Qs42nByohJoLV6Ex/ij/+MjJ6U34SAKhFNMfP/4DyTB+GHYnZfMwRXySCV8
	O7XgWNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bLw-00000004iyk-26qr;
	Thu, 31 Oct 2024 20:01:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bJ2-00000004iMV-2t5t
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 19:58:10 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2cc47ce63so1259137a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 12:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730404687; x=1731009487; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RD5TkR246EsKLWEa1qebyIvoAMqqwjYwsx4rtMlmzqs=;
        b=KWa/P8bTjur3oK4KzeFhjYytIhcaImQMqy1Mbv5V6J0cYKLCAAFP613ANBuMX8OcyV
         rzh43bXbGtLNfK1FS08+Z+b93WLYcQbsoRMymkyCTXrVnt7aVWLBWdgL8OAvG/16Oc5S
         i5uV65a9KsfiFaU72m4o8bFJokdHmAyCxvlOjasQp/G7oIFX7A/OLZV4q3kSNnJTzVpZ
         mSHuQVS840jYOuWHxBjYb4OlKnK0IZK7wAjbOiy5fPshnj1GkezDHDkex72LEZAocs2t
         OGiZkf6EOhjzA5KQRl9WYZytRFiK/L4zbaXnJyHgkK48ibyRglaXi62A3qIpTPqeK0V+
         +lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404687; x=1731009487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RD5TkR246EsKLWEa1qebyIvoAMqqwjYwsx4rtMlmzqs=;
        b=Sajdgt6OC01EkC4dKbjvNSlbww/38QuVEPWKmpr4jMSPOjrZsr6UX749v/4mcgduFj
         DZc7hXggCqBuB7LxgRXiYL+eB2My4LkjqDTUAH+yEW5QaA/6mhHNPqlZmDPUxhcYRkF2
         URcTQq5JcC3BJj+/ACBf7w7OKub0nLb8C6cNqM9Tc1DIjOCwAi2ChNMixts5MCTrNsF4
         BvWUOiBRdWP6NdurcktcavIX1Hnblf6f6y3xaMQXSrhky0dmOXJZzPIxJCBH5moN2mD9
         x011icSd6x56Uhp765wxqJUSqPHOrnsXjlw5Qsb1ELSDud1Of07udRFY6ThOaaSW+JSJ
         qdcw==
X-Forwarded-Encrypted: i=1; AJvYcCUAz3kfoFxa3xlOe2ATIGxxzuG3oCwG5qfm5ei/sCStneAxzzSKWZPvtlFMsW4rBkmkn1sHozSmQckb/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YymaI//TuVLqIksvfGG7n24zi2918KorCoLqMb65THr/cNlVAfa
	Ir6NexHPGkT7y+BQI/JJhsJdI6RdqLdYRm9AxHx9d3RydLwHYuf5lW6e5cFByy63RHrbtMJqU5o
	ZXQ==
X-Google-Smtp-Source: AGHT+IF7vPMCnsf289NsrnjjyCJ2jg68bo1NjMnBqv1ndlVw/EyDldgRRbbWWMUr551ln7/BYp8yDv7S73k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:2c4a:b0:2e2:d3dc:d3ca with SMTP id
 98e67ed59e1d1-2e8f0d4bd47mr35478a91.0.1730404686850; Thu, 31 Oct 2024
 12:58:06 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:51:56 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <173039503553.1508387.3074658713815866060.b4-ty@google.com>
Subject: Re: [PATCH v3 00/14] KVM: selftests: Morph max_guest_mem to mmu_stress
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_125808_738600_0FCD6942 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, 09 Oct 2024 08:49:39 -0700, Sean Christopherson wrote:
> The main purpose of this series is to convert the max_guest_memory_test
> into a more generic mmu_stress_test.  The basic gist of the "conversion"
> is to have the test do mprotect() on guest memory while vCPUs are
> accessing said memory, e.g. to verify KVM and mmu_notifiers are working
> as intended.
> 
> Patches 1-4 are a somewhat unexpected side quest.  The original plan was
> that patch 3 would be a single patch, but things snowballed.
> 
> [...]

Applied to kvm-x86 selftests, with the typo fixup pointed out by James.  Thanks!

[01/14] KVM: Move KVM_REG_SIZE() definition to common uAPI header
        https://github.com/kvm-x86/linux/commit/5e07fd0bf516
[02/14] KVM: selftests: Disable strict aliasing
        https://github.com/kvm-x86/linux/commit/d1ce2bcd8d2e
[03/14] KVM: selftests: Return a value from vcpu_get_reg() instead of using an out-param
        https://github.com/kvm-x86/linux/commit/5c6c7b71a45c
[04/14] KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
        https://github.com/kvm-x86/linux/commit/6aa2df3eb90b
[05/14] KVM: selftests: Check for a potential unhandled exception iff KVM_RUN succeeded
        https://github.com/kvm-x86/linux/commit/be9f2746d20b
[06/14] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
        https://github.com/kvm-x86/linux/commit/06694f27cfcc
[07/14] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
        https://github.com/kvm-x86/linux/commit/8556ce365a07
[08/14] KVM: selftests: Compute number of extra pages needed in mmu_stress_test
        https://github.com/kvm-x86/linux/commit/c7b7876ac5d4
[09/14] KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
        https://github.com/kvm-x86/linux/commit/a657856469e1
[10/14] KVM: selftests: Enable mmu_stress_test on arm64
        https://github.com/kvm-x86/linux/commit/1e53cde06102
[11/14] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
        https://github.com/kvm-x86/linux/commit/8630563012b9
[12/14] KVM: selftests: Precisely limit the number of guest loops in mmu_stress_test
        https://github.com/kvm-x86/linux/commit/3d4585c220dc
[13/14] KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
        https://github.com/kvm-x86/linux/commit/eaafeebca75a
[14/14] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
        https://github.com/kvm-x86/linux/commit/a3cd5c187742

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
