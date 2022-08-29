Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27583ECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPkhmnsj+ejgt31CDh05n0RysApL/IfxQbJ1BbgwDEI=; b=aPpSDC6jFhJHcg
	GjCleW41Kw2Bm4MQgIAbY8o6zD49IjYi0Q03nm60XKgeR1Tkup4y3FGOHUMMVdc17+1Hs5deAsqY4
	qcvMS7QiGbxQFkxVpPNgercMBS8ekKDyZHKXPEW8Fc0aKMevaIzqS++AxbqI/kMMAN8HMN285g6Hs
	TZLQLv6e7imdqmdjjwqaBRNSGw7Pjt6IAaRVigqP2mi4g+AWT98IgrNhx2uKh7wM/kTSzWIcwgAiB
	bZszjUhPJj+G42yThsO/ncPkiMkgYXKQi0Y2BI5k5b51nNvjBgR4G7aoow+1rQ6mT3Utw4Sa0qNOz
	5EYSRm+AHMhcGGdFTlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSheX-00Bl8I-JK; Mon, 29 Aug 2022 16:30:21 +0000
Received: from out0.migadu.com ([2001:41d0:2:267::])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShUP-00Bgvn-Cj; Mon, 29 Aug 2022 16:19:54 +0000
Date: Mon, 29 Aug 2022 18:19:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661789984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URd452JoMFM9JD7pYWX5aoZrRYft8Gac0hRTpx4CpB4=;
	b=cmAaq27a2rEDvaFF7eIf/c+iEhVwMjmtSQo0G1Xqa4rr5PmoDkzJisJPTaorWXIbYYuMsN
	+N8RcRi9Mq5LOv6cPDYQyYshMhIlPtfYGzLct3XwxIvDIbi8Tvjjnjp38np47QcYF+a9Up
	7KTvlcfUB1wBgeGX6fRshWbeb0i2X2I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v5 5/7] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
Message-ID: <20220829161941.c5bd6azxv7jzpwq2@kamzik>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-6-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825232522.3997340-6-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_091953_610518_5FFBCCC5 
X-CRM114-Status: GOOD (  12.11  )
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

On Thu, Aug 25, 2022 at 11:25:20PM +0000, Sean Christopherson wrote:
> Fix a mostly-theoretical bug where ARM's ucall MMIO setup could result in
> different VMs stomping on each other by cloberring the global pointer.
> 
> Fix the most obvious issue by saving the MMIO gpa into the VM.
> 
> A more subtle bug is that creating VMs in parallel (on multiple tasks)
> could result in a VM using the wrong address.  Synchronizing a global to
> a guest effectively snapshots the value on a per-VM basis, i.e. the
> "global" is already prepped to work with multiple VMs, but setting the
> global in the host is not thread-safe.  To fix that bug, add
> write_guest_global() to allow stuffing a VM's copy of a "global" without
> modifying the host value.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 15 +++++++++++++++
>  .../testing/selftests/kvm/lib/aarch64/ucall.c | 19 ++++++++++++++-----
>  2 files changed, 29 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
