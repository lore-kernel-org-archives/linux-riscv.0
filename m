Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9ECC27C7A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48t6xnPspJ0Mkei+Oo3NFOPMSRxNiOUT//fyJhWYvMw=; b=ERSMlhB/LY1nGW
	jjLwLFRng3Qcg5+OoxnMwM9qlkYDD1f+kVauR/M4DQSe8U97uewbYejuvUbQeFFCILV93PvVLvZi6
	/KAPJGCToOXOZUJE3njLKJia6dyfbCiFb7rhtTlsTMo8uF1egcw8YEozdG4SzG35KgpgHGT/tV3P+
	t0Qg/rsFCSQqJ2oFFxSCxY3Y5Dm7RxCEQzTf/UO5rH0l08eDugur8hKQDkJ2J3HFWZrrMxbvx4EoG
	HERg+nxPkVmeuOFo2SmZ2V7ZQid90S9wtU6rNhG8Tt5zNdcAxSLSzze/TuLT3FFGrgnIGdzmxRg+l
	zmE4flrbzKMW3GdWbtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZJu-005wGb-0c;
	Thu, 17 Aug 2023 09:29:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZJq-005wFS-0C;
	Thu, 17 Aug 2023 09:29:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BED1661D4;
	Thu, 17 Aug 2023 09:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAD2C433C7;
	Thu, 17 Aug 2023 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692264568;
	bh=P4Sp+VqUPcqI98k0LUu6HacGUKj+uHSgw7K7aWCb3k0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+zYTe9UDF16wP55sTzt+DzGXrWWyu3oY8QF11Gft1JI/tmxvtFEXbtzd0EuHXfBL
	 5MC7tmMiCNFj6YaWcEiak6GLPjmrNiCI/TnQqG01d/+uqGGOYC6tNi+X7ILYxEue0n
	 pfX4YT3XQPt6aNdLhs3RYger0xbLcWjoyfYkZCvsSyUKaSnLjTXZ9rPHiujhdNpxzl
	 2hoAdivaRbwMKK6PyWvXHHNiRjpHf2y+Pec6dwRJlKimbIuUBRLCxCDYAg6m/1P1b2
	 5v4E9wojAJCLauOhLoS73p8UZOnO38263A6U6MVFTXvciUaFbBkdRFG4tzAJgrp/Hr
	 odQW5fyOYiEww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1qWZJl-005dbe-IC;
	Thu, 17 Aug 2023 10:29:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Reiji Watanabe <reijiw@google.com>,
	kvmarm@lists.linux.dev,
	Jing Zhang <jingzhangos@google.com>,
	kvm-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Colton Lewis <coltonlewis@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Matlack <dmatlack@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
Date: Thu, 17 Aug 2023 10:29:21 +0100
Message-Id: <169226452281.2753740.2247650864841184971.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
References: <20230811045127.3308641-1-rananta@google.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, rananta@google.com, pbonzini@redhat.com, reijiw@google.com, kvmarm@lists.linux.dev, jingzhangos@google.com, kvm-riscv@lists.infradead.org, linux-mips@vger.kernel.org, anup@brainfault.org, coltonlewis@google.com, tabba@google.com, kvm@vger.kernel.org, chenhuacai@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmatlack@google.com, seanjc@google.com, yuzenghui@huawei.com, linux-riscv@lists.infradead.org, atishp@atishpatra.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_022930_186148_0B308ABD 
X-CRM114-Status: GOOD (  12.17  )
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

On Fri, 11 Aug 2023 04:51:13 +0000, Raghavendra Rao Ananta wrote:
> In certain code paths, KVM/ARM currently invalidates the entire VM's
> page-tables instead of just invalidating a necessary range. For example,
> when collapsing a table PTE to a block PTE, instead of iterating over
> each PTE and flushing them, KVM uses 'vmalls12e1is' TLBI operation to
> flush all the entries. This is inefficient since the guest would have
> to refill the TLBs again, even for the addresses that aren't covered
> by the table entry. The performance impact would scale poorly if many
> addresses in the VM is going through this remapping.
> 
> [...]

Applied to next, thanks!

[01/14] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
        commit: a1342c8027288e345cc5fd16c6800f9d4eb788ed
[02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
        commit: cfb0c08e80120928dda1e951718be135abd49bae
[03/14] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
        commit: 32121c813818a87ba7565b3afce93a9cc3610a22
[04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
        commit: eddd21481011008792f4e647a5244f6e15970abc
[05/14] KVM: Allow range-based TLB invalidation from common code
        commit: d4788996051e3c07fadc6d9b214073fcf78810a8
[06/14] KVM: Move kvm_arch_flush_remote_tlbs_memslot() to common code
        commit: 619b5072443c05cf18c31b2c0320cdb42396d411
[07/14] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
        commit: 360839027a6e4c022e8cbaa373dd747185f1e0a5
[08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
        commit: 4d73a9c13aaa78b149ac04b02f0ee7973f233bfa
[09/14] KVM: arm64: Implement __kvm_tlb_flush_vmid_range()
        commit: 6354d15052ec88273c24beae4c99e31c3d3889b6
[10/14] KVM: arm64: Define kvm_tlb_flush_vmid_range()
        commit: 117940aa6e5f8308f1529e1313660980f1dae771
[11/14] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
        commit: c42b6f0b1cde4dd19e6b5dd052e67b87cc331b01
[12/14] KVM: arm64: Flush only the memslot after write-protect
        commit: 3756b6f2bb3a242fef0867b39a23607f5aeca138
[13/14] KVM: arm64: Invalidate the table entries upon a range
        commit: defc8cc7abf0fcee8d73e440ee02827348d060e0
[14/14] KVM: arm64: Use TLBI range-based instructions for unmap
        commit: 7657ea920c54218f123ddc1b572821695b669c13

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
