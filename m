Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E5FC54E94
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cS7HFU2p34zA5FaGeRtq1tYuJuVEhfuGx3fWKqsEHY0=; b=FGDKDunuSa1Vn1
	Vph7F6KX4RU4AQu0p6uAMFI80WZ23QiUa4MxiZb95g53oTG8U/xip4cD/rZDiTGb5vp0CPDIU0OjL
	PUZW/HRi8fdTCTPOr3l3nmLCnqajD13Xax1US3unNjpepxIz30VYP0flJnTak18DBgpFik3Tv0zO1
	3OmcCIy2wVGcQFovPqrkyHbTztPYO5MU0LVa9tm/OnM5819e7tkjnrst9C9AciCb9sUKOiDtmXUjY
	IZMzf5S2TIsd9B68CHCwMUUVI7ZfYEbWGGJYdaivKBksmGFqha/2ncQslbh6sYE3jXgirrd1vANqY
	ZRn0CU8UO1fL90Y5w4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKMvN-004nDt-8F; Tue, 24 Jan 2023 17:17:33 +0000
Received: from out-83.mta0.migadu.com ([91.218.175.83])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKMvC-004n9B-Jk
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 17:17:24 +0000
Date: Tue, 24 Jan 2023 17:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1674580638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIEASO5qPs55lTPiWLXCZgFc1uWbFeBJE6bZJxvRUc0=;
	b=pHL003ov1XfnmIFlNayK1LaKatLGFuHSsS50iKWIk9FUm7eZ3+Hh4zvnZo0gD4kA+Ikrly
	jgan9mv2Uos5m1WyH5cRwTLVHswqpM8wNprQ67Jyt6Jw1juH3/vuLsyhSdzSnnXDYt8ofY
	ju2OUJ7yTEO4EIJpNHPVHxdHb1S591c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [PATCH 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
Message-ID: <Y9ASmOvJutgGLVnT@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-3-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119173559.2517103-3-dmatlack@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_091722_807189_767251A8 
X-CRM114-Status: GOOD (  15.15  )
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

Hi David,

On Thu, Jan 19, 2023 at 09:35:54AM -0800, David Matlack wrote:
> Use kvm_arch_flush_remote_tlbs() instead of
> CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> problem, allowing architecture-specific code to provide a non-IPI
> implementation of remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
> two mechanisms.
> 
> Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but (I assume) that is a small cost in comparison to flushing
> remote TLBs.

A fair assumption indeed. The real pile up occurs on the DSB subsequent
to the TLBI.

> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/Kconfig            | 1 -
>  arch/arm64/kvm/mmu.c              | 6 +++---
>  virt/kvm/kvm_main.c               | 2 --
>  4 files changed, 6 insertions(+), 6 deletions(-)

I think you're missing the diff that actually drops the Kconfig opton
from virt/kvm/Kconfig.

--
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
