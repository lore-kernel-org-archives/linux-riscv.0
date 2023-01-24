Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB7C54E94
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnT5LBTt9m/CS6FRuOdu1NDTEFY3kOKpe5lR7ymifr0=; b=LrdJuT81uA9o20
	J9s3i1WqblWracq2M0jr/de7+ssS8QJ0aX9Siykg3ONdivkis/Nr8vOYG7ry8ohQh0WF/bzc40XDs
	v+lwjfoEDgoiyVH9Z2JFT8i5Peu7ZtRsBZcSNXKOxtX9Lw4Ln0rF5pPxjSHEABGd4+dtZna8f7B07
	yu+dSsQ+rVRAkm477X/IY+YX72iN0ZI/yIsd4fGWuy++3We09DpIRSkwps/CcA9IwZ/EmPySwKgyd
	YUG9bicZivBro0W29J8I1D0QUMNNoAWEQVKi7w2S8rJnFmV7Y0eBBPvAgaW88f73eFoSS0rpLn5br
	XfD2D/EsOLqiDw0gEFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKMvm-004nLO-2S; Tue, 24 Jan 2023 17:17:58 +0000
Received: from out2.migadu.com ([188.165.223.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKMva-004nGn-6v; Tue, 24 Jan 2023 17:17:47 +0000
Date: Tue, 24 Jan 2023 17:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1674580662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GXyW90IOjnXJvIfMtjFFfhTG4Pl/WIRVVHctvw+l3qI=;
	b=b3syj6I9kUIPksw9zSGRrhxPXAmMEZkQmhx+mXT+MrQl4aIrYCXkgsuSj22vzS/C5c2dJ4
	Zky5SMa1QnMvd5iE8GqhFTc26az6rzVKeq0SARVDo3SkdoTamaRZ/ugvM0qzMqxRPHIFIf
	UYIqetKi0gix/Ay/grdqiC6hRE2jAdY=
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
Subject: Re: [PATCH 6/7] KVM: Allow range-based TLB invalidation from common
 code
Message-ID: <Y9ASsTwZlZDxx5pv@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-7-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119173559.2517103-7-dmatlack@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_091746_415367_EF9564FC 
X-CRM114-Status: UNSURE (   7.79  )
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

On Thu, Jan 19, 2023 at 09:35:58AM -0800, David Matlack wrote:
> Make kvm_flush_remote_tlbs_range() visible in common code and create a
> default implementation that just invalidates the whole TLB.
> 
> This paves the way for several future cleanups:
>  - Introduction of range-based TLBI on ARM.

nit: this is definitely a new feature, not a cleanup :)

--
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
