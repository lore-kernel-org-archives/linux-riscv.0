Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1035C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05+jl+WvkNDIlWLwcg9pA+u6Ta62D98w/T/tO+YfWqE=; b=hB1r1sZUHMyg4m
	ZkUZLQNEHOtDFMnEwUvx4x5fk2BZ0QzIVpFIjYQl/BJqYgnXQt8rmxHvu7k8g4x1yAoA8zc1WWV3b
	RZcikhqUTNXelH67TQh2qYY+r6ohAK+My3ADxaZd82y3lzUaS1JdqfOaN3niM2U2MlF7/iohm6RO0
	e8tg7tMHt42gcOGzy+tya2lLyyOPC6HpODnOnulSmABTpOjaWkGQUbK5epKK0DBvqynGehT9DsIHt
	FSSev5nhu6u9gz0XCMIKS1MEQDXbf7Q8vQHhVXlkJG5lbj4q07uofKc8wsCiK4K3s0dHNgETN8vWk
	WSswCSChjQDzFhywdatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priqN-004VOV-09;
	Wed, 26 Apr 2023 17:22:15 +0000
Received: from out-16.mta1.migadu.com ([2001:41d0:203:375::10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priqJ-004VNN-3C
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:22:13 +0000
Date: Wed, 26 Apr 2023 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1682529725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLWhzFr0IaFOP7oGWZVxeoPyLpaGebSmTPqngfIpZG0=;
	b=fX1xUvV2g81JM+0ABsdRcIjDsB/4E25/qjtfu0mosg0PvfMF9EHtEmDRZTz3iFWTYkK0dA
	19FAfDwYGMolyePLVnuvhqZX1xWo1FbUgjHuNPt4/BF+tVLHSMDVjtXDd0o5kYB6/qHrji
	BF94HvG+MfWGhmnvQOaFbIcWpIUF+yQ=
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
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eric Farman <farman@linux.ibm.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
Message-ID: <ZEldtrUVBgmlrFOl@linux.dev>
References: <20230306190156.434452-1-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_102212_471761_9ACA4742 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 06, 2023 at 11:01:52AM -0800, David Matlack wrote:
> This series refactors the KVM stats macros to reduce duplication and
> adds the support for choosing custom names for stats.
> 
> Custom name makes it possible to decouple the userspace-visible stat
> names from their internal representation in C. This can allow future
> commits to refactor the various stats structs without impacting
> userspace tools that read KVM stats.
> 
> This also allows stats to be stored in data structures such as arrays,
> without needing unions to access specific stats. Case in point, the last
> patch in this series removes the pages_{4k,2m,1g} union, which is a
> useful cleanup to prepare for sharing paging code across architectures
> [1].
> 
> And for full transparency, another motivation for this series it that at
> Google we have several out-of-tree stats that use arrays. Custom name
> support is something we added internally and it reduces our technical
> debt to get the support merged upstream.

For the series:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
